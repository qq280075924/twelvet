/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : twelvet

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 18/10/2020 11:57:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'twelvet', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------
INSERT INTO `sys_login_info` VALUES (16, 'admin', '172.18.71.1', '1', '登录成功', '2020-10-07 16:51:00');
INSERT INTO `sys_login_info` VALUES (17, 'admin', '172.18.71.1', '1', '登录成功', '2020-10-07 17:52:22');
INSERT INTO `sys_login_info` VALUES (18, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-07 22:39:03');
INSERT INTO `sys_login_info` VALUES (21, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-08 16:53:09');
INSERT INTO `sys_login_info` VALUES (22, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-08 22:08:59');
INSERT INTO `sys_login_info` VALUES (23, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-10 23:09:58');
INSERT INTO `sys_login_info` VALUES (24, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-10 23:28:52');
INSERT INTO `sys_login_info` VALUES (25, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-11 00:26:11');
INSERT INTO `sys_login_info` VALUES (26, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-12 21:46:52');
INSERT INTO `sys_login_info` VALUES (27, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-12 22:51:18');
INSERT INTO `sys_login_info` VALUES (28, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-13 21:01:00');
INSERT INTO `sys_login_info` VALUES (29, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-13 22:10:37');
INSERT INTO `sys_login_info` VALUES (30, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-13 23:34:04');
INSERT INTO `sys_login_info` VALUES (31, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-14 21:18:25');
INSERT INTO `sys_login_info` VALUES (32, 'admin', '172.18.71.1', NULL, '登录成功', '2020-10-14 22:56:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` tinyint(1) NULL DEFAULT 1 COMMENT '是否为外链（1是 0否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` tinyint(1) NULL DEFAULT 0 COMMENT '菜单状态（1显示 0隐藏）',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '菜单状态（1正常 0停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1061 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 0, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-14 21:41:37', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 0, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 0, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-03 21:05:06', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'TwelveT', 0, 4, 'https://www.twelvet.com', NULL, 1, 'M', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-11 00:42:14', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 0, 'C', 1, 1, 'system:user:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 0, 'C', 1, 1, 'system:role:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 0, 'C', 1, 1, 'system:menu:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 0, 'C', 1, 1, 'system:dept:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 0, 'C', 1, 1, 'system:post:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 0, 'C', 1, 1, 'system:dict:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 0, 'C', 1, 1, 'system:config:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 0, 'C', 1, 1, 'system:notice:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 0, 'C', 1, 1, '', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 0, 'C', 1, 1, 'monitor:online:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 0, 'C', 1, 1, 'monitor:job:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 0, 'C', 1, 1, 'monitor:druid:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 0, 'C', 1, 1, 'monitor:server:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 0, 'C', 1, 1, 'tool:build:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-03 21:55:04', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 0, 'C', 1, 1, 'tool:gen:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 0, 'C', 1, 1, 'tool:swagger:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 0, 'C', 1, 1, 'monitor:operlog:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 0, 'C', 1, 1, 'monitor:logininfor:list', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 0, 'F', 1, 1, 'system:user:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 0, 'F', 1, 1, 'system:user:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 0, 'F', 1, 1, 'system:user:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 0, 'F', 1, 1, 'system:user:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 0, 'F', 1, 1, 'system:user:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 0, 'F', 1, 1, 'system:user:import', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 0, 'F', 1, 1, 'system:user:resetPwd', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 0, 'F', 1, 1, 'system:role:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 0, 'F', 1, 1, 'system:role:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 0, 'F', 1, 1, 'system:role:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 0, 'F', 1, 1, 'system:role:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 0, 'F', 1, 1, 'system:role:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 0, 'F', 1, 1, 'system:menu:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 0, 'F', 1, 1, 'system:menu:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 0, 'F', 1, 1, 'system:menu:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 0, 'F', 1, 1, 'system:menu:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 0, 'F', 1, 1, 'system:dept:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 0, 'F', 1, 1, 'system:dept:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 0, 'F', 1, 1, 'system:dept:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 0, 'F', 1, 1, 'system:dept:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 0, 'F', 1, 1, 'system:post:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 0, 'F', 1, 1, 'system:post:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 0, 'F', 1, 1, 'system:post:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 0, 'F', 1, 1, 'system:post:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 0, 'F', 1, 1, 'system:post:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 0, 'F', 1, 1, 'system:dict:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 0, 'F', 1, 1, 'system:dict:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 0, 'F', 1, 1, 'system:dict:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 0, 'F', 1, 1, 'system:dict:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 0, 'F', 1, 1, 'system:dict:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 0, 'F', 1, 1, 'system:config:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 0, 'F', 1, 1, 'system:config:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 0, 'F', 1, 1, 'system:config:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 0, 'F', 1, 1, 'system:config:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 0, 'F', 1, 1, 'system:config:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 0, 'F', 1, 1, 'system:notice:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 0, 'F', 1, 1, 'system:notice:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 0, 'F', 1, 1, 'system:notice:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 0, 'F', 1, 1, 'system:notice:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 0, 'F', 1, 1, 'monitor:operlog:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 0, 'F', 1, 1, 'monitor:operlog:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 0, 'F', 1, 1, 'monitor:operlog:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 0, 'F', 1, 1, 'monitor:logininfor:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 0, 'F', 1, 1, 'monitor:online:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 0, 'F', 1, 1, 'monitor:online:batchLogout', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 0, 'F', 1, 1, 'monitor:online:forceLogout', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 0, 'F', 1, 1, 'monitor:job:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 0, 'F', 1, 1, 'monitor:job:add', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 0, 'F', 1, 1, 'monitor:job:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 0, 'F', 1, 1, 'monitor:job:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 0, 'F', 1, 1, 'monitor:job:changeStatus', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 0, 'F', 1, 1, 'monitor:job:export', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 0, 'F', 1, 1, 'tool:gen:query', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 0, 'F', 1, 1, 'tool:gen:edit', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 0, 'F', 1, 1, 'tool:gen:remove', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 0, 'F', 1, 1, 'tool:gen:import', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 0, 'F', 1, 1, 'tool:gen:preview', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 0, 'F', 1, 1, 'tool:gen:code', 'icon-system', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details`  (
  `client_id` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端唯一标识',
  `resource_ids` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源ID标识',
  `client_secret` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端安全码',
  `scope` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端授权范围',
  `authorized_grant_types` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端授权类型',
  `web_server_redirect_uri` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器回调地址',
  `authorities` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问资源所需权限',
  `access_token_validity` int(11) NULL DEFAULT NULL COMMENT '设定客户端的access_token的有效时间值（秒）',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT '设定客户端的refresh_token的有效时间值（秒）',
  `additional_information` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `autoapprove` tinyint(4) NULL DEFAULT NULL COMMENT '是否登录时跳过授权（默认false）',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户端配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('twelvet', NULL, '$2a$10$tv2UtR9XN.ElCoy.stJKY.4NGh1BLXDhT82KNlw4wTCX6c.ODNc8K', 'server', 'password,refresh_token', NULL, NULL, 3600, 7200, NULL, NULL);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `service` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` tinyint(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '操作状态（1正常 0异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (1, '菜单管理', 1, 'com.twelvet.server.system.controller.SysMenuController.insert()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"asd\",\"orderNum\":\"12\",\"menuName\":\"asd\",\"params\":{},\"parentId\":0,\"path\":\"asd\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":false,\"menuId\":0,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 1, NULL, '2020-10-10 23:58:27');
INSERT INTO `sys_operation_log` VALUES (2, '菜单管理', 1, 'com.twelvet.server.system.controller.SysMenuController.insert()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"asdad\",\"orderNum\":\"12\",\"menuName\":\"asd\",\"params\":{},\"parentId\":0,\"path\":\"asd\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":false,\"menuId\":0,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 1, NULL, '2020-10-10 23:59:02');
INSERT INTO `sys_operation_log` VALUES (3, '菜单管理', 2, 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"children\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 1, NULL, '2020-10-11 00:26:18');
INSERT INTO `sys_operation_log` VALUES (4, '菜单管理', 1, 'com.twelvet.server.system.controller.SysMenuController.insert()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"asd\",\"orderNum\":\"12\",\"menuName\":\"asd\",\"params\":{},\"parentId\":0,\"path\":\"12\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":false,\"menuId\":0,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 1, NULL, '2020-10-11 00:26:27');
INSERT INTO `sys_operation_log` VALUES (5, '菜单管理', 3, 'com.twelvet.server.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1076', '127.0.0.1', '', '{menuId=1076}', '{\"code\":200,\"msg\":\"操作成功\"}', 1, NULL, '2020-10-11 00:26:29');
INSERT INTO `sys_operation_log` VALUES (6, '菜单管理', 2, 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"4\",\"menuName\":\"TwelveT\",\"params\":{},\"parentId\":0,\"path\":\"https://www.twelvet.com\",\"children\":[],\"updateBy\":\"admin\",\"isFrame\":true,\"menuId\":4,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 1, NULL, '2020-10-11 00:42:14');
INSERT INTO `sys_operation_log` VALUES (7, '菜单管理', 2, 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"children\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 1, NULL, '2020-10-14 21:41:32');
INSERT INTO `sys_operation_log` VALUES (8, '菜单管理', 2, 'com.twelvet.server.system.controller.SysMenuController.update()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":true,\"icon\":\"icon-system\",\"orderNum\":\"1\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"children\":[],\"updateBy\":\"admin\",\"isFrame\":false,\"menuId\":1,\"menuType\":\"M\",\"status\":true}', '{\"code\":200,\"msg\":\"操作成功\"}', 1, NULL, '2020-10-14 21:41:37');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'twelvet', '00', '2471835953@qq.com', '15888888888', '1', '', '$2a$10$/vo1EcIb95RuoYLb69EpJ.6UW5l6v2Tk/SqyJx.asbsizhjv2TuLe', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'twelvet', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
