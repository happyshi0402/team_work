/*
Navicat MySQL Data Transfer

Source Server         : zkhc_server
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : zkhc_server_admin

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-12-18 10:19:23
*/

DROP DATABASE IF EXISTS zkhc_server_admin;
CREATE DATABASE IF NOT EXISTS zkhc_server_admin DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

USE zkhc_server_admin;

SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
-- Table structure for `code_dbinfo`
-- ----------------------------
DROP TABLE IF EXISTS `code_dbinfo`;
CREATE TABLE `code_dbinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '别名',
  `db_driver` varchar(100) NOT NULL COMMENT '数据库驱动',
  `db_url` varchar(200) NOT NULL COMMENT '数据库地址',
  `db_user_name` varchar(100) NOT NULL COMMENT '数据库账户',
  `db_password` varchar(100) NOT NULL COMMENT '连接密码',
  `db_type` varchar(10) DEFAULT NULL COMMENT '数据库类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据库链接信息';

-- ----------------------------
-- Records of code_dbinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('24', '1', '0', '[0],', '总公司', '总公司', '', null);
INSERT INTO `sys_dept` VALUES ('25', '2', '24', '[0],[24],', '开发部', '开发部', '', null);
INSERT INTO `sys_dept` VALUES ('26', '3', '24', '[0],[24],', '运营部', '运营部', '', null);
INSERT INTO `sys_dept` VALUES ('27', '4', '24', '[0],[24],', '战略部', '战略部', '', null);

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `code` varchar(255) DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('50', '0', '0', '性别', null, 'sys_sex');
INSERT INTO `sys_dict` VALUES ('51', '1', '50', '男', null, '1');
INSERT INTO `sys_dict` VALUES ('52', '2', '50', '女', null, '2');
INSERT INTO `sys_dict` VALUES ('53', '0', '0', '状态', null, 'sys_state');
INSERT INTO `sys_dict` VALUES ('54', '1', '53', '启用', null, '1');
INSERT INTO `sys_dict` VALUES ('55', '2', '53', '禁用', null, '2');
INSERT INTO `sys_dict` VALUES ('56', '0', '0', '账号状态', null, 'account_state');
INSERT INTO `sys_dict` VALUES ('57', '1', '56', '启用', null, '1');
INSERT INTO `sys_dict` VALUES ('58', '2', '56', '冻结', null, '2');
INSERT INTO `sys_dict` VALUES ('59', '3', '56', '已删除', null, '3');
INSERT INTO `sys_dict` VALUES ('69', '0', '0', '协议', '', 'protocol');
INSERT INTO `sys_dict` VALUES ('70', '1', '69', 'tcp', null, '1');
INSERT INTO `sys_dict` VALUES ('71', '2', '69', 'udp', null, '2');
INSERT INTO `sys_dict` VALUES ('72', '3', '69', 'http', null, '3');
INSERT INTO `sys_dict` VALUES ('73', '0', '0', '类型', '', 'type');
INSERT INTO `sys_dict` VALUES ('74', '1', '73', 'mysql', null, '1');
INSERT INTO `sys_dict` VALUES ('75', '2', '73', 'redis', null, '2');
INSERT INTO `sys_dict` VALUES ('76', '3', '73', 'mongodb', null, '3');
INSERT INTO `sys_dict` VALUES ('77', '4', '73', 'rabbitmq', null, '4');
INSERT INTO `sys_dict` VALUES ('84', '0', '0', '连通状态', '', 'ali_status');
INSERT INTO `sys_dict` VALUES ('85', '1', '84', '正常', null, '1');
INSERT INTO `sys_dict` VALUES ('86', '2', '84', '不正常', null, '2');
INSERT INTO `sys_dict` VALUES ('87', '0', '0', '访问状态', '', 'fire_status');
INSERT INTO `sys_dict` VALUES ('88', '1', '87', '正常访问', null, '1');
INSERT INTO `sys_dict` VALUES ('89', '2', '87', '不可访问', null, '2');

-- ----------------------------
-- Table structure for `sys_expense`
-- ----------------------------
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE `sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `state` int(11) DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销表';

-- ----------------------------
-- Records of sys_expense
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('217', '登录日志', '1', '2018-12-10 16:39:50', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('218', '登录日志', '1', '2018-12-11 08:57:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('219', '登录日志', '1', '2018-12-11 09:05:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('220', '登录日志', '1', '2018-12-11 09:14:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('221', '登录日志', '1', '2018-12-11 09:17:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('222', '登录日志', '1', '2018-12-11 09:53:20', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('223', '登录日志', '1', '2018-12-11 09:57:43', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('224', '登录日志', '1', '2018-12-11 10:06:08', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('225', '登录日志', '1', '2018-12-11 11:23:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('226', '登录日志', '1', '2018-12-11 11:30:55', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('227', '登录日志', '1', '2018-12-11 14:37:34', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('228', '登录日志', '1', '2018-12-11 14:43:59', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('229', '登录日志', '1', '2018-12-11 14:58:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('230', '登录日志', '1', '2018-12-11 15:13:13', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('231', '登录日志', '1', '2018-12-11 15:29:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('232', '登录日志', '1', '2018-12-13 08:48:51', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('233', '登录日志', '1', '2018-12-13 09:09:54', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('234', '登录日志', '1', '2018-12-13 09:10:27', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('235', '登录日志', '1', '2018-12-13 09:58:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('236', '登录日志', '1', '2018-12-13 11:33:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('237', '登录日志', '1', '2018-12-13 11:35:54', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('238', '登录日志', '1', '2018-12-13 11:41:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('239', '登录日志', '1', '2018-12-13 11:44:01', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('240', '登录日志', '1', '2018-12-13 11:52:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('241', '登录日志', '1', '2018-12-13 11:53:41', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('242', '登录日志', '1', '2018-12-13 14:08:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('243', '登录日志', '1', '2018-12-13 14:09:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('244', '登录日志', '1', '2018-12-13 14:49:11', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('245', '登录日志', '1', '2018-12-13 15:24:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('246', '登录日志', '1', '2018-12-13 16:11:33', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('247', '登录日志', '1', '2018-12-13 16:16:14', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('248', '登录日志', '1', '2018-12-13 16:58:31', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('249', '登录日志', '1', '2018-12-13 17:01:32', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('250', '登录日志', '1', '2018-12-13 17:06:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('251', '登录日志', '1', '2018-12-13 17:07:12', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('252', '登录日志', '1', '2018-12-13 17:16:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('253', '登录日志', '1', '2018-12-13 17:17:11', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('254', '登录日志', '1', '2018-12-13 17:29:19', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('255', '登录日志', '1', '2018-12-13 17:31:07', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('256', '登录日志', '1', '2018-12-13 17:31:57', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('257', '登录日志', '1', '2018-12-13 17:36:44', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('258', '登录日志', '1', '2018-12-13 17:37:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('259', '登录日志', '1', '2018-12-13 17:40:01', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('260', '登录日志', '1', '2018-12-13 17:41:48', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('261', '登录日志', '1', '2018-12-13 17:43:30', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('262', '登录日志', '1', '2018-12-13 17:44:56', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('263', '登录日志', '1', '2018-12-13 17:50:46', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('264', '登录日志', '1', '2018-12-13 17:53:03', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('265', '登录日志', '1', '2018-12-13 17:54:23', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('266', '登录日志', '1', '2018-12-14 09:09:07', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('267', '登录日志', '1', '2018-12-14 10:06:58', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('268', '登录日志', '1', '2018-12-14 10:11:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('269', '登录日志', '1', '2018-12-14 11:14:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('270', '登录日志', '1', '2018-12-14 14:22:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('271', '登录日志', '1', '2018-12-14 16:02:21', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('272', '登录日志', '1', '2018-12-17 10:03:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('273', '登录日志', '1', '2018-12-17 10:49:15', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('274', '登录日志', '1', '2018-12-17 11:24:36', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('275', '登录日志', '1', '2018-12-17 11:26:01', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('276', '登录日志', '1', '2018-12-17 16:27:45', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('277', '登录日志', '1', '2018-12-17 16:31:02', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('278', '登录日志', '1', '2018-12-17 16:32:38', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('279', '登录日志', '1', '2018-12-17 16:33:40', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('280', '登录日志', '1', '2018-12-17 16:35:05', '成功', null, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES ('281', '登录日志', '1', '2018-12-17 16:54:37', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('282', '登录日志', '1', '2018-12-17 17:02:42', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('283', '登录日志', '1', '2018-12-17 17:04:25', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('284', '登录日志', '1', '2018-12-17 17:06:26', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('285', '登录日志', '1', '2018-12-18 09:04:08', '成功', null, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `num` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-user', '#', '4', '1', '1', null, '1', '1');
INSERT INTO `sys_menu` VALUES ('106', 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', '1', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', null, '/mgr/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', null, '/mgr/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', null, '/mgr/delete', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', null, '/mgr/reset', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', null, '/mgr/freeze', '5', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', null, '/mgr/unfreeze', '6', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', null, '/mgr/setRole', '7', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('114', 'role', 'system', '[0],[system],', '角色管理', null, '/role', '2', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', null, '/role/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', null, '/role/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', null, '/role/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', null, '/role/setAuthority', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', null, '/menu', '4', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', null, '/menu/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', null, '/menu/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', null, '/menu/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', null, '/log', '6', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('130', 'druid', 'system', '[0],[system],', '监控管理', null, '/druid', '7', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('131', 'dept', 'system', '[0],[system],', '部门管理', null, '/dept', '3', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', null, '/dict', '4', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', null, '/loginLog', '6', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', null, '/log/delLog', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', null, '/dept/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', null, '/dept/update', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', null, '/dept/delete', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', null, '/dict/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', null, '/dict/update', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', null, '/dict/delete', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('141', 'notice', 'system', '[0],[system],', '通知管理', null, '/notice', '9', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', null, '/notice/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', null, '/notice/update', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', null, '/notice/delete', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('145', 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', '1', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('148', 'code', '0', '[0],', '代码生成', 'fa-code', '/code', '3', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('149', 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', '2', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('158', 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', '7', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', '8', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', '9', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', '10', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('171', 'serverInfo', '0', '[0],', '服务管理', 'fa-sliders', '/serverInfo', '6', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('172', 'serverInfo_add', 'serverInfo', '[0],[serverInfo],', '端口添加', '', '/serverInfo/add', '1', '2', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('173', 'serverInfo_update', 'serverInfo', '[0],[serverInfo],', '端口修改', '', '/serverInfo/update', '2', '2', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('174', 'serverInfo_delete', 'serverInfo', '[0],[serverInfo],', '端口删除', '', '/serverInfo/delete', '3', '2', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('175', 'serverMessage', '0', '[0],', '服务器管理', 'fa-server', '/serverMessage', '5', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('176', 'serverMessage_add', 'serverMessage', '[0],[serverMessage],', '服务器添加', '', '/serverMessage/add', '1', '2', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('177', 'serverMessage_update', 'serverMessage', '[0],[serverMessage],', '服务器修改', '', '/serverMessage/update', '2', '2', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('178', 'serverMessage_delete', 'serverMessage', '[0],[serverMessage],', '服务器删除', '', '/serverMessage/delete', '3', '2', '0', null, '1', null);

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('6', '世界', '10', '欢迎使用Guns管理系统', '2017-01-11 08:53:20', '1');
INSERT INTO `sys_notice` VALUES ('8', '你好', null, '你好', '2017-05-10 19:28:57', '1');

-- ----------------------------
-- Table structure for `sys_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=608 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('554', '业务日志', '菜单新增', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'add', '2018-12-11 09:04:39', '成功', '菜单名称=服务器管理');
INSERT INTO `sys_operation_log` VALUES ('555', '业务日志', '配置权限', '1', 'com.zkhc.server.modular.system.controller.RoleController', 'setAuthority', '2018-12-11 09:05:04', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,服务器管理');
INSERT INTO `sys_operation_log` VALUES ('556', '业务日志', '菜单新增', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'add', '2018-12-11 09:08:15', '成功', '菜单名称=端口添加');
INSERT INTO `sys_operation_log` VALUES ('557', '业务日志', '菜单新增', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'add', '2018-12-11 09:08:42', '成功', '菜单名称=端口修改');
INSERT INTO `sys_operation_log` VALUES ('558', '业务日志', '菜单新增', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'add', '2018-12-11 09:09:23', '成功', '菜单名称=端口删除');
INSERT INTO `sys_operation_log` VALUES ('559', '业务日志', '修改菜单', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'edit', '2018-12-11 09:13:56', '成功', '菜单名称=端口添加;;;字段名称:url地址,旧值:/serverInfo/serverInfo_add,新值:/serverInfo/add');
INSERT INTO `sys_operation_log` VALUES ('560', '业务日志', '修改菜单', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'edit', '2018-12-11 09:14:05', '成功', '菜单名称=端口修改;;;字段名称:url地址,旧值:/serverInfo/serverInfo_update,新值:/serverInfo/update');
INSERT INTO `sys_operation_log` VALUES ('561', '业务日志', '修改菜单', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'edit', '2018-12-11 09:14:14', '成功', '菜单名称=端口删除;;;字段名称:url地址,旧值:/serverInfo/serverInfo_delete,新值:/serverInfo/delete');
INSERT INTO `sys_operation_log` VALUES ('562', '业务日志', '配置权限', '1', 'com.zkhc.server.modular.system.controller.RoleController', 'setAuthority', '2018-12-11 09:15:33', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,服务器管理,端口添加,端口修改,端口删除');
INSERT INTO `sys_operation_log` VALUES ('563', '业务日志', '添加字典记录', '1', 'com.zkhc.server.modular.system.controller.DictController', 'add', '2018-12-11 10:13:25', '成功', '字典名称=协议,字典内容=1:tcp:1;2:udp:2;3:http:3;');
INSERT INTO `sys_operation_log` VALUES ('564', '业务日志', '添加字典记录', '1', 'com.zkhc.server.modular.system.controller.DictController', 'add', '2018-12-11 10:15:02', '成功', '字典名称=类型,字典内容=1:mysql:1;2:redis:2;3:mongodb:3;4:rabbitmq:4;');
INSERT INTO `sys_operation_log` VALUES ('565', '业务日志', '添加字典记录', '1', 'com.zkhc.server.modular.system.controller.DictController', 'add', '2018-12-11 10:17:32', '成功', '字典名称=连通状态,字典内容=0:正常:1;1:不正常:2;');
INSERT INTO `sys_operation_log` VALUES ('566', '业务日志', '添加字典记录', '1', 'com.zkhc.server.modular.system.controller.DictController', 'add', '2018-12-11 10:18:22', '成功', '字典名称=访问状态,字典内容=0:正常访问:1;1:不可访问:2;');
INSERT INTO `sys_operation_log` VALUES ('567', '业务日志', '修改字典', '1', 'com.zkhc.server.modular.system.controller.DictController', 'update', '2018-12-11 14:44:32', '成功', '字典名称=连通状态,字典内容=1:正常:1;2:不正常:2;;;;');
INSERT INTO `sys_operation_log` VALUES ('568', '业务日志', '修改字典', '1', 'com.zkhc.server.modular.system.controller.DictController', 'update', '2018-12-11 14:44:45', '成功', '字典名称=访问状态,字典内容=1:正常访问:1;2:不可访问:2;;;;');
INSERT INTO `sys_operation_log` VALUES ('569', '异常日志', '', '1', null, null, '2018-12-11 14:54:57', '失败', 'org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type \'java.lang.String\' to required type \'java.lang.Integer\'; nested exception is java.lang.NumberFormatException: For input string: \"ff21411feaf040d098bee37e151a43d9\"\r\n	at org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:131)\r\n	at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:124)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:161)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:131)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:866)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:635)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: java.lang.NumberFormatException: For input string: \"ff21411feaf040d098bee37e151a43d9\"\r\n	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)\r\n	at java.lang.Integer.parseInt(Integer.java:580)\r\n	at java.lang.Integer.valueOf(Integer.java:766)\r\n	at org.springframework.util.NumberUtils.parseNumber(NumberUtils.java:210)\r\n	at org.springframework.beans.propertyeditors.CustomNumberEditor.setAsText(CustomNumberEditor.java:115)\r\n	at org.springframework.beans.TypeConverterDelegate.doConvertTextValue(TypeConverterDelegate.java:466)\r\n	at org.springframework.beans.TypeConverterDelegate.doConvertValue(TypeConverterDelegate.java:439)\r\n	at org.springframework.beans.TypeConverterDelegate.convertIfNecessary(TypeConverterDelegate.java:192)\r\n	at org.springframework.beans.TypeConverterDelegate.convertIfNecessary(TypeConverterDelegate.java:99)\r\n	at org.springframework.beans.TypeConverterSupport.doConvert(TypeConverterSupport.java:73)\r\n	at org.springframework.beans.TypeConverterSupport.convertIfNecessary(TypeConverterSupport.java:52)\r\n	at org.springframework.validation.DataBinder.convertIfNecessary(DataBinder.java:692)\r\n	at org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:123)\r\n	... 71 more\r\n');
INSERT INTO `sys_operation_log` VALUES ('570', '业务日志', '新增服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'add', '2018-12-11 15:30:26', '成功', '端口名=葫芦娃');
INSERT INTO `sys_operation_log` VALUES ('571', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-11 15:32:04', '成功', '端口名=葫芦娃;;;字段名称:区域,旧值:000,新值:111');
INSERT INTO `sys_operation_log` VALUES ('572', '业务日志', '删除服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'delete', '2018-12-11 15:32:15', '成功', '主键id=25b3520c8d3f4c95880b5523d655d3a7');
INSERT INTO `sys_operation_log` VALUES ('573', '业务日志', '新增服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'add', '2018-12-11 15:50:04', '成功', '端口名=葫芦娃');
INSERT INTO `sys_operation_log` VALUES ('574', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-13 14:50:16', '成功', '端口名=测试;;;字段名称:端口,旧值:123,新值:555;;;字段名称:阿里代理端口,旧值:10123,新值:10555;;;字段名称:ngrok对应端口,旧值:6123,新值:6555;;;字段名称:域名,旧值:www.www,新值:rabbitadmintest.ngrok.kangmochou.com;;;字段名称:类型,旧值:2,新值:4');
INSERT INTO `sys_operation_log` VALUES ('575', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-13 15:37:20', '成功', '端口名=测试;;;字段名称:域名,旧值:rabbitadmintest.ngrok.kangmochou.com,新值:www.baidu.com');
INSERT INTO `sys_operation_log` VALUES ('576', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-13 15:41:17', '成功', '端口名=apidev;;;字段名称:端口名,旧值:测试,新值:apidev;;;字段名称:域名,旧值:www.baidu.com,新值:ngrok.kangmochou.com');
INSERT INTO `sys_operation_log` VALUES ('577', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-13 15:43:03', '成功', '端口名=apidev;;;字段名称:端口,旧值:555,新值:545;;;字段名称:阿里代理端口,旧值:10555,新值:10545;;;字段名称:ngrok对应端口,旧值:6555,新值:6545');
INSERT INTO `sys_operation_log` VALUES ('578', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-13 16:11:41', '成功', '端口名=apidev;;;字段名称:null,旧值:测试,新值:;;;字段名称:区域,旧值:000,新值:');
INSERT INTO `sys_operation_log` VALUES ('579', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-13 16:12:50', '成功', '端口名=rabbitadmintest;;;字段名称:端口名,旧值:葫芦娃,新值:rabbitadmintest;;;字段名称:端口,旧值:456,新值:555;;;字段名称:协议,旧值:2,新值:3;;;字段名称:阿里代理端口,旧值:10456,新值:10555;;;字段名称:ngrok对应端口,旧值:6456,新值:6555;;;字段名称:域名,旧值:gaga,新值:ngrok.kangmochou.com;;;字段名称:区域,旧值:000,新值:;;;字段名称:类型,旧值:1,新值:4');
INSERT INTO `sys_operation_log` VALUES ('580', '业务日志', '新增服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'add', '2018-12-13 16:17:22', '成功', '端口名=apitest');
INSERT INTO `sys_operation_log` VALUES ('581', '业务日志', '新增服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'add', '2018-12-13 16:18:41', '成功', '端口名=rabbitadminpro');
INSERT INTO `sys_operation_log` VALUES ('582', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-13 16:18:46', '成功', '端口名=apitest;;;字段名称:协议,旧值:1,新值:3');
INSERT INTO `sys_operation_log` VALUES ('583', '业务日志', '新增服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'add', '2018-12-13 16:20:55', '成功', '端口名=admin_test');
INSERT INTO `sys_operation_log` VALUES ('584', '业务日志', '新增服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'add', '2018-12-13 16:21:33', '成功', '端口名=admin_dev');
INSERT INTO `sys_operation_log` VALUES ('585', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-14 16:02:41', '成功', '端口名=admin_test;;;字段名称:null,旧值:,新值:172.16.110.238');
INSERT INTO `sys_operation_log` VALUES ('586', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-14 16:02:47', '成功', '端口名=rabbitadmintest;;;字段名称:null,旧值:,新值:172.16.110.238');
INSERT INTO `sys_operation_log` VALUES ('587', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-14 16:02:51', '成功', '端口名=admin_dev;;;字段名称:null,旧值:,新值:172.16.110.238');
INSERT INTO `sys_operation_log` VALUES ('588', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-14 16:02:54', '成功', '端口名=rabbitadminpro;;;字段名称:null,旧值:,新值:172.16.110.238');
INSERT INTO `sys_operation_log` VALUES ('589', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-14 16:02:57', '成功', '端口名=apitest;;;字段名称:null,旧值:,新值:172.16.110.238');
INSERT INTO `sys_operation_log` VALUES ('590', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-14 16:03:00', '成功', '端口名=apidev;;;字段名称:null,旧值:,新值:172.16.110.238');
INSERT INTO `sys_operation_log` VALUES ('591', '业务日志', '修改菜单', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'edit', '2018-12-17 10:34:48', '成功', '菜单名称=服务管理;;;字段名称:菜单名称,旧值:服务器管理,新值:服务管理');
INSERT INTO `sys_operation_log` VALUES ('592', '业务日志', '菜单新增', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'add', '2018-12-17 10:35:33', '成功', '菜单名称=服务器管理');
INSERT INTO `sys_operation_log` VALUES ('593', '业务日志', '修改菜单', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'edit', '2018-12-17 10:36:51', '成功', '菜单名称=服务管理;;;字段名称:菜单图标,旧值:fa-server,新值:fa-sliders;;;字段名称:菜单排序号,旧值:5,新值:6');
INSERT INTO `sys_operation_log` VALUES ('594', '业务日志', '修改菜单', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'edit', '2018-12-17 10:37:11', '成功', '菜单名称=服务器管理;;;字段名称:菜单图标,旧值:,新值:fa-server;;;字段名称:菜单排序号,旧值:6,新值:5');
INSERT INTO `sys_operation_log` VALUES ('595', '业务日志', '菜单新增', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'add', '2018-12-17 10:38:00', '成功', '菜单名称=服务器添加');
INSERT INTO `sys_operation_log` VALUES ('596', '业务日志', '菜单新增', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'add', '2018-12-17 10:38:25', '成功', '菜单名称=服务器修改');
INSERT INTO `sys_operation_log` VALUES ('597', '业务日志', '菜单新增', '1', 'com.zkhc.server.modular.system.controller.MenuController', 'add', '2018-12-17 10:38:47', '成功', '菜单名称=服务器删除');
INSERT INTO `sys_operation_log` VALUES ('598', '业务日志', '配置权限', '1', 'com.zkhc.server.modular.system.controller.RoleController', 'setAuthority', '2018-12-17 10:39:00', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,服务管理,端口添加,端口修改,端口删除,服务器管理,服务器添加,服务器修改,服务器删除');
INSERT INTO `sys_operation_log` VALUES ('599', '业务日志', '新增服务器', '1', 'com.zkhc.server.modular.system.controller.ServerMessageController', 'add', '2018-12-17 16:28:04', '成功', '服务器地址=127.0.0.1');
INSERT INTO `sys_operation_log` VALUES ('600', '业务日志', '修改服务器', '1', 'com.zkhc.server.modular.system.controller.ServerMessageController', 'update', '2018-12-17 16:33:53', '成功', '服务器地址=127.0.0.1;;;字段名称:服务器密码,旧值:123456,新值:67935593');
INSERT INTO `sys_operation_log` VALUES ('601', '业务日志', '修改服务器', '1', 'com.zkhc.server.modular.system.controller.ServerMessageController', 'update', '2018-12-17 16:35:17', '成功', '服务器地址=127.0.0.1;;;');
INSERT INTO `sys_operation_log` VALUES ('602', '业务日志', '修改服务器', '1', 'com.zkhc.server.modular.system.controller.ServerMessageController', 'update', '2018-12-17 16:35:26', '成功', '服务器地址=127.0.0.1;;;字段名称:服务器密码,旧值:67935593,新值:123456789');
INSERT INTO `sys_operation_log` VALUES ('603', '异常日志', '', '1', null, null, '2018-12-17 17:02:45', '失败', 'java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer\r\n	at com.zkhc.server.modular.system.warpper.ServerInfoWarpper.wrapTheMap(ServerInfoWarpper.java:34)\r\n	at cn.stylefeng.roses.core.base.warpper.BaseControllerWrapper.wrap(BaseControllerWrapper.java:73)\r\n	at cn.stylefeng.roses.core.base.controller.BaseController.warpObject(BaseController.java:77)\r\n	at com.zkhc.server.modular.system.controller.ServerInfoController.list(ServerInfoController.java:72)\r\n	at com.zkhc.server.modular.system.controller.ServerInfoControllerTTFastClassBySpringCGLIBTTe0a1f1fa.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.zkhc.server.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.zkhc.server.modular.system.controller.ServerInfoControllerTTEnhancerBySpringCGLIBTT65faa6e1.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('604', '业务日志', '修改服务器', '1', 'com.zkhc.server.modular.system.controller.ServerMessageController', 'update', '2018-12-17 17:07:42', '成功', '服务器地址=172.16.110.238;;;字段名称:服务器地址,旧值:127.0.0.1,新值:172.16.110.238;;;字段名称:服务器端口,旧值:3306,新值:507');
INSERT INTO `sys_operation_log` VALUES ('605', '业务日志', '新增服务器', '1', 'com.zkhc.server.modular.system.controller.ServerMessageController', 'add', '2018-12-17 17:08:02', '成功', '服务器地址=172.16.110.238');
INSERT INTO `sys_operation_log` VALUES ('606', '业务日志', '新增服务器', '1', 'com.zkhc.server.modular.system.controller.ServerMessageController', 'add', '2018-12-17 17:08:28', '成功', '服务器地址=172.16.110.238');
INSERT INTO `sys_operation_log` VALUES ('607', '业务日志', '修改服务端口', '1', 'com.zkhc.server.modular.system.controller.ServerInfoController', 'update', '2018-12-17 17:13:45', '成功', '端口名=rabbitadmintest;;;字段名称:null,旧值:3,新值:4');

-- ----------------------------
-- Table structure for `sys_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3970 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES ('3377', '105', '5');
INSERT INTO `sys_relation` VALUES ('3378', '106', '5');
INSERT INTO `sys_relation` VALUES ('3379', '107', '5');
INSERT INTO `sys_relation` VALUES ('3380', '108', '5');
INSERT INTO `sys_relation` VALUES ('3381', '109', '5');
INSERT INTO `sys_relation` VALUES ('3382', '110', '5');
INSERT INTO `sys_relation` VALUES ('3383', '111', '5');
INSERT INTO `sys_relation` VALUES ('3384', '112', '5');
INSERT INTO `sys_relation` VALUES ('3385', '113', '5');
INSERT INTO `sys_relation` VALUES ('3386', '114', '5');
INSERT INTO `sys_relation` VALUES ('3387', '115', '5');
INSERT INTO `sys_relation` VALUES ('3388', '116', '5');
INSERT INTO `sys_relation` VALUES ('3389', '117', '5');
INSERT INTO `sys_relation` VALUES ('3390', '118', '5');
INSERT INTO `sys_relation` VALUES ('3391', '119', '5');
INSERT INTO `sys_relation` VALUES ('3392', '120', '5');
INSERT INTO `sys_relation` VALUES ('3393', '121', '5');
INSERT INTO `sys_relation` VALUES ('3394', '122', '5');
INSERT INTO `sys_relation` VALUES ('3395', '150', '5');
INSERT INTO `sys_relation` VALUES ('3396', '151', '5');
INSERT INTO `sys_relation` VALUES ('3907', '105', '1');
INSERT INTO `sys_relation` VALUES ('3908', '106', '1');
INSERT INTO `sys_relation` VALUES ('3909', '107', '1');
INSERT INTO `sys_relation` VALUES ('3910', '108', '1');
INSERT INTO `sys_relation` VALUES ('3911', '109', '1');
INSERT INTO `sys_relation` VALUES ('3912', '110', '1');
INSERT INTO `sys_relation` VALUES ('3913', '111', '1');
INSERT INTO `sys_relation` VALUES ('3914', '112', '1');
INSERT INTO `sys_relation` VALUES ('3915', '113', '1');
INSERT INTO `sys_relation` VALUES ('3916', '165', '1');
INSERT INTO `sys_relation` VALUES ('3917', '166', '1');
INSERT INTO `sys_relation` VALUES ('3918', '167', '1');
INSERT INTO `sys_relation` VALUES ('3919', '114', '1');
INSERT INTO `sys_relation` VALUES ('3920', '115', '1');
INSERT INTO `sys_relation` VALUES ('3921', '116', '1');
INSERT INTO `sys_relation` VALUES ('3922', '117', '1');
INSERT INTO `sys_relation` VALUES ('3923', '118', '1');
INSERT INTO `sys_relation` VALUES ('3924', '162', '1');
INSERT INTO `sys_relation` VALUES ('3925', '163', '1');
INSERT INTO `sys_relation` VALUES ('3926', '164', '1');
INSERT INTO `sys_relation` VALUES ('3927', '119', '1');
INSERT INTO `sys_relation` VALUES ('3928', '120', '1');
INSERT INTO `sys_relation` VALUES ('3929', '121', '1');
INSERT INTO `sys_relation` VALUES ('3930', '122', '1');
INSERT INTO `sys_relation` VALUES ('3931', '150', '1');
INSERT INTO `sys_relation` VALUES ('3932', '151', '1');
INSERT INTO `sys_relation` VALUES ('3933', '128', '1');
INSERT INTO `sys_relation` VALUES ('3934', '134', '1');
INSERT INTO `sys_relation` VALUES ('3935', '158', '1');
INSERT INTO `sys_relation` VALUES ('3936', '159', '1');
INSERT INTO `sys_relation` VALUES ('3937', '130', '1');
INSERT INTO `sys_relation` VALUES ('3938', '131', '1');
INSERT INTO `sys_relation` VALUES ('3939', '135', '1');
INSERT INTO `sys_relation` VALUES ('3940', '136', '1');
INSERT INTO `sys_relation` VALUES ('3941', '137', '1');
INSERT INTO `sys_relation` VALUES ('3942', '152', '1');
INSERT INTO `sys_relation` VALUES ('3943', '153', '1');
INSERT INTO `sys_relation` VALUES ('3944', '154', '1');
INSERT INTO `sys_relation` VALUES ('3945', '132', '1');
INSERT INTO `sys_relation` VALUES ('3946', '138', '1');
INSERT INTO `sys_relation` VALUES ('3947', '139', '1');
INSERT INTO `sys_relation` VALUES ('3948', '140', '1');
INSERT INTO `sys_relation` VALUES ('3949', '155', '1');
INSERT INTO `sys_relation` VALUES ('3950', '156', '1');
INSERT INTO `sys_relation` VALUES ('3951', '157', '1');
INSERT INTO `sys_relation` VALUES ('3952', '133', '1');
INSERT INTO `sys_relation` VALUES ('3953', '160', '1');
INSERT INTO `sys_relation` VALUES ('3954', '161', '1');
INSERT INTO `sys_relation` VALUES ('3955', '141', '1');
INSERT INTO `sys_relation` VALUES ('3956', '142', '1');
INSERT INTO `sys_relation` VALUES ('3957', '143', '1');
INSERT INTO `sys_relation` VALUES ('3958', '144', '1');
INSERT INTO `sys_relation` VALUES ('3959', '145', '1');
INSERT INTO `sys_relation` VALUES ('3960', '148', '1');
INSERT INTO `sys_relation` VALUES ('3961', '149', '1');
INSERT INTO `sys_relation` VALUES ('3962', '171', '1');
INSERT INTO `sys_relation` VALUES ('3963', '172', '1');
INSERT INTO `sys_relation` VALUES ('3964', '173', '1');
INSERT INTO `sys_relation` VALUES ('3965', '174', '1');
INSERT INTO `sys_relation` VALUES ('3966', '175', '1');
INSERT INTO `sys_relation` VALUES ('3967', '176', '1');
INSERT INTO `sys_relation` VALUES ('3968', '177', '1');
INSERT INTO `sys_relation` VALUES ('3969', '178', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '0', '超级管理员', '24', 'administrator', '1');
INSERT INTO `sys_role` VALUES ('5', '2', '1', '临时', '26', 'temp', null);

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'girl.gif', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '张三', '2017-05-05 00:00:00', '2', 'sn93@qq.com', '18200000000', '1', '27', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `sys_user` VALUES ('44', null, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', '1', 'abc@123.com', '', '5', '26', '3', '2017-05-16 20:33:37', null);
INSERT INTO `sys_user` VALUES ('45', null, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:02', null);
INSERT INTO `sys_user` VALUES ('46', null, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:24', null);

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `aaa` int(11) NOT NULL AUTO_INCREMENT,
  `bbb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aaa`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for `zkhc_server_info`
-- ----------------------------
DROP TABLE IF EXISTS `zkhc_server_info`;
CREATE TABLE `zkhc_server_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `port_name` char(64) NOT NULL COMMENT '端口名',
  `host_id` int(11) NOT NULL COMMENT 'ip地址',
  `port` int(11) NOT NULL COMMENT '端口',
  `protocol` int(11) NOT NULL COMMENT '协议(1:tcp  2:udp  3:http)',
  `ali_port` int(11) NOT NULL COMMENT '阿里代理端口',
  `ngrok_port` int(11) NOT NULL COMMENT 'ngrok对应端口',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ali_status` int(11) NOT NULL DEFAULT '2' COMMENT '状态(1:正常   2:不正常)',
  `fire_status` int(11) NOT NULL DEFAULT '2' COMMENT '访问状态(1:正常访问   2:不可访问)',
  `domain_name` varchar(64) NOT NULL COMMENT '域名',
  `fire_zone` char(255) NOT NULL COMMENT '区域 ',
  `type` int(11) NOT NULL COMMENT '类型(1:mysql  2:redis  3:mongodb  4:rabbitmq)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zkhc_server_info
-- ----------------------------
INSERT INTO `zkhc_server_info` VALUES ('144c5211f80f47a58cf3b15864c52274', 'admin_test', '3', '507', '3', '10507', '6507', '', '2', '2', 'ngrok.kangmochou.com', '', '1', '2018-12-13 16:20:55', '2018-12-13 16:20:55');
INSERT INTO `zkhc_server_info` VALUES ('1c66df296da947f6a60f3a46b5ac7c01', 'rabbitadmintest', '4', '555', '3', '10555', '6555', '', '2', '2', 'ngrok.kangmochou.com', '', '4', '2018-12-11 15:50:04', '2018-12-11 15:50:04');
INSERT INTO `zkhc_server_info` VALUES ('40cef3b681224227a09c0ee157754b30', 'admin_dev', '3', '508', '3', '10508', '6508', '', '2', '2', 'ngrok.kangmochou.com', '', '1', '2018-12-13 16:21:33', '2018-12-13 16:21:33');
INSERT INTO `zkhc_server_info` VALUES ('420db53324f84bfba3b5ef1f8a876957', 'rabbitadminpro', '3', '556', '3', '10556', '6556', '', '2', '2', 'ngrok.kangmochou.com', '', '4', '2018-12-13 16:18:41', '2018-12-13 16:18:41');
INSERT INTO `zkhc_server_info` VALUES ('4711c6702d154dbeaacf0ac32a1e1804', 'apitest', '3', '546', '3', '10546', '6546', '', '2', '2', 'ngrok.kangmochou.com', '', '1', '2018-12-13 16:17:22', '2018-12-13 16:17:22');
INSERT INTO `zkhc_server_info` VALUES ('ff21411feaf040d098bee37e151a43d9', 'apidev', '3', '545', '3', '10545', '6545', '', '2', '2', 'ngrok.kangmochou.com', '', '4', '2018-12-11 11:33:53', '2018-12-11 11:33:53');

-- ----------------------------
-- Table structure for `zkhc_server_message`
-- ----------------------------
DROP TABLE IF EXISTS `zkhc_server_message`;
CREATE TABLE `zkhc_server_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `server_host` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务器地址',
  `server_port` int(11) DEFAULT NULL COMMENT '服务器端口',
  `server_user` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务器账号',
  `server_password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务器密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='服务器信息';

-- ----------------------------
-- Records of zkhc_server_message
-- ----------------------------
INSERT INTO `zkhc_server_message` VALUES ('3', '172.16.110.238', '507', 'root', 'eI47qFQ7Ndq6Tz6dn7hExQ==');
INSERT INTO `zkhc_server_message` VALUES ('4', '172.16.110.238', '508', 'root', 'NgYMQP7VWfNL7L9R7FhJsQ==');
INSERT INTO `zkhc_server_message` VALUES ('5', '172.16.110.238', '509', 'root', '0fqZb5lCPFnPa+MefkaWPQ==');
