package com.twelvet.security.config;

import com.twelvet.framework.security.constans.CacheConstants;
import com.twelvet.framework.security.constans.SecurityConstants;
import com.twelvet.framework.security.domain.LoginUser;
import com.twelvet.framework.security.service.RedisClientDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.error.WebResponseExceptionTranslator;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.redis.RedisTokenStore;

import javax.sql.DataSource;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 认证服务配置
 */
@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {

    /**
     * 用户信息认证管理器
     */
    @Autowired
    private AuthenticationManager authenticationManager;

    /**
     * 数据源
     */
    @Autowired
    private DataSource dataSource;

    /**
     * Redis工厂
     */
    @Autowired
    private RedisConnectionFactory redisConnectionFactory;

    /**
     * 自定义用户信息
     */
    @Autowired
    private UserDetailsService userDetailsService;

    /**
     * 自定义认证失败处理
     */
    @Autowired
    private WebResponseExceptionTranslator<OAuth2Exception> customWebResponseExceptionTranslator;

    /**
     * 获取ResourceServer信息(使用Redis缓存信息)
     *
     * @return RedisClientDetailsService
     */
    public RedisClientDetailsService redisClientDetails() {
        return new RedisClientDetailsService(dataSource);
    }

    /**
     * Token储存(使用Redis实现)
     *
     * @return TokenStore
     */
    @Bean
    public TokenStore tokenStore() {
        RedisTokenStore tokenStore = new RedisTokenStore(redisConnectionFactory);
        tokenStore.setPrefix(CacheConstants.OAUTH_ACCESS);
        return tokenStore;
    }

    /**
     * 配置客户端信息
     *
     * @param clients clients
     * @throws Exception Exception
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.withClientDetails(redisClientDetails());
    }

    /**
     * 自定义生成令牌
     */
    @Bean
    public TokenEnhancer tokenEnhancer() {
        return (accessToken, authentication) -> {
            if (accessToken instanceof DefaultOAuth2AccessToken) {
                LoginUser user = (LoginUser) authentication.getUserAuthentication().getPrincipal();
                Map<String, Object> additionalInformation = new LinkedHashMap<>();
                additionalInformation.put("code", HttpStatus.OK.value());
                additionalInformation.put(SecurityConstants.DETAILS_USER_ID, user.getUserId());
                additionalInformation.put(SecurityConstants.DETAILS_USERNAME, user.getUsername());
                ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInformation);
            }
            return accessToken;
        };
    }

    /**
     * 定义授权和令牌端点以及令牌服务
     *
     * @param endpoints endpoints
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        endpoints
                // 请求方式
                .allowedTokenEndpointRequestMethods(HttpMethod.GET, HttpMethod.POST)
                // 指定token存储位置
                .tokenStore(tokenStore())
                // 自定义账号密码登录（Oauth2密码模式需要）
                .userDetailsService(userDetailsService)
                // 指定认证管理器
                .authenticationManager(authenticationManager)
                // 是否重复使用 refresh_token
                .reuseRefreshTokens(false)
                // 增强access_token信息
                .tokenEnhancer(tokenEnhancer())
                // 自定义异常处理
                .exceptionTranslator(customWebResponseExceptionTranslator);
    }

    /**
     * 配置Oauth2安全
     *
     * @param oauthServer oauthServer
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer oauthServer) {
        oauthServer.allowFormAuthenticationForClients().checkTokenAccess("permitAll()");
    }

}
