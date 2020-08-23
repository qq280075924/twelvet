package com.twelvet.security.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;
import org.springframework.security.oauth2.provider.error.WebResponseExceptionTranslator;
import org.springframework.stereotype.Component;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 自定义登录异常处理
 */
@Component
public class CustomWebResponseExceptionTranslator implements WebResponseExceptionTranslator<OAuth2Exception>
{
    @Override
    public ResponseEntity<OAuth2Exception> translate(Exception e)
    {
        OAuth2Exception oAuth2Exception = (OAuth2Exception) e;
        return ResponseEntity.status(
                oAuth2Exception.getHttpErrorCode())
                .body(
                        new CustomOauth2Exception(oAuth2Exception.getMessage())
        );
    }
}
