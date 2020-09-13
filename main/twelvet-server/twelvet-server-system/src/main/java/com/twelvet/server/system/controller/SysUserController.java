package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysUser;
import com.twelvet.api.system.model.UserInfo;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.domain.R;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.framework.utils.TWTUtils;
import com.twelvet.server.system.service.ISysPermissionService;
import com.twelvet.server.system.service.ISysUserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 用户信息
 */
@RestController
@RequestMapping("/user")
public class SysUserController extends TWTController {

    private final ISysUserService userService;

    private final ISysPermissionService permissionService;

    public SysUserController(ISysUserService userService, ISysPermissionService permissionService) {
        this.userService = userService;
        this.permissionService = permissionService;
    }

    /**
     * 获取当前用户信息
     */
    @GetMapping("/info/{username}")
    public R<UserInfo> info(@PathVariable("username") String username) {
        SysUser sysUser = userService.selectUserByUserName(username);

        if (TWTUtils.isEmpty(sysUser))
        {
            return R.fail("用户名或密码错误");
        }

        // 角色集合
        Set<String> roles = permissionService.getRolePermission(sysUser.getUserId());
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(sysUser.getUserId());
        UserInfo sysUserVo = new UserInfo();
        sysUserVo.setSysUser(sysUser);
        sysUserVo.setRoles(roles);
        sysUserVo.setPermissions(permissions);
        return R.ok(sysUserVo);
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/getInfo")
    public AjaxResult getInfo()
    {
        Long userId = SecurityUtils.getLoginUser().getUserId();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(userId);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(userId);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", userService.selectUserById(userId));
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    @GetMapping("/demo")
    public AjaxResult demo(){
        return AjaxResult.success();
    }

}
