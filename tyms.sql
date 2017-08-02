/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : tyms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-08-03 00:27:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tyms_action`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_action`;
CREATE TABLE `tyms_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of tyms_action
-- ----------------------------
INSERT INTO `tyms_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `tyms_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '1', '1380173180');
INSERT INTO `tyms_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `tyms_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '1', '1386139726');
INSERT INTO `tyms_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '1', '1383285551');
INSERT INTO `tyms_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `tyms_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `tyms_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `tyms_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `tyms_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `tyms_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类.', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for `tyms_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_action_log`;
CREATE TABLE `tyms_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of tyms_action_log
-- ----------------------------
INSERT INTO `tyms_action_log` VALUES ('1', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/0.html', '1', '1501066723');
INSERT INTO `tyms_action_log` VALUES ('2', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/33.html', '1', '1501066757');
INSERT INTO `tyms_action_log` VALUES ('3', '10', '1', '2130706433', 'Menu', '3', '操作url：/admin/menu/edit/id/3.html', '1', '1501067495');
INSERT INTO `tyms_action_log` VALUES ('4', '10', '1', '2130706433', 'Menu', '14', '操作url：/admin/menu/edit/id/14.html', '1', '1501067541');
INSERT INTO `tyms_action_log` VALUES ('5', '10', '1', '2130706433', 'Menu', '3', '操作url：/admin/menu/edit/id/3.html', '1', '1501068323');
INSERT INTO `tyms_action_log` VALUES ('6', '10', '1', '2130706433', 'Menu', '14', '操作url：/admin/menu/edit/id/14.html', '1', '1501068336');
INSERT INTO `tyms_action_log` VALUES ('7', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/25.html', '1', '1501069860');
INSERT INTO `tyms_action_log` VALUES ('8', '10', '1', '2130706433', 'Menu', '22', '操作url：/admin/menu/edit/id/22.html', '1', '1501069900');
INSERT INTO `tyms_action_log` VALUES ('9', '10', '1', '2130706433', 'Menu', '22', '操作url：/admin/menu/edit/id/22.html', '1', '1501069931');
INSERT INTO `tyms_action_log` VALUES ('10', '10', '1', '2130706433', 'Menu', '14', '操作url：/admin/menu/edit/id/14.html', '1', '1501069969');
INSERT INTO `tyms_action_log` VALUES ('11', '10', '1', '2130706433', 'Menu', '15', '操作url：/admin/menu/edit/id/15.html', '1', '1501069976');
INSERT INTO `tyms_action_log` VALUES ('12', '10', '1', '2130706433', 'Menu', '22', '操作url：/admin/menu/edit/id/22.html', '1', '1501070058');
INSERT INTO `tyms_action_log` VALUES ('13', '10', '1', '2130706433', 'Menu', '22', '操作url：/admin/menu/edit/id/22.html', '1', '1501070080');
INSERT INTO `tyms_action_log` VALUES ('14', '10', '1', '2130706433', 'Menu', '14', '操作url：/admin/menu/edit/id/14.html', '1', '1501070088');
INSERT INTO `tyms_action_log` VALUES ('15', '10', '1', '2130706433', 'Menu', '15', '操作url：/admin/menu/edit/id/15.html', '1', '1501070093');
INSERT INTO `tyms_action_log` VALUES ('16', '9', '1', '2130706433', 'channel', '2', '操作url：/admin/channel/edit/id/2/pid/0.html', '1', '1501071617');
INSERT INTO `tyms_action_log` VALUES ('17', '9', '1', '2130706433', 'channel', '2', '操作url：/admin/channel/edit/id/2/pid/0.html', '1', '1501071649');
INSERT INTO `tyms_action_log` VALUES ('18', '7', '1', '2130706433', 'model', '2', '操作url：/admin/model/edit/id/2.html', '1', '1501071740');
INSERT INTO `tyms_action_log` VALUES ('19', '10', '1', '2130706433', 'Menu', '22', '操作url：/admin/menu/edit/id/22.html', '1', '1501116978');
INSERT INTO `tyms_action_log` VALUES ('20', '10', '1', '2130706433', 'Menu', '21', '操作url：/admin/menu/edit/id/21.html', '1', '1501116998');
INSERT INTO `tyms_action_log` VALUES ('21', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/5.html', '1', '1501117015');
INSERT INTO `tyms_action_log` VALUES ('22', '10', '1', '2130706433', 'Menu', '3', '操作url：/admin/menu/edit/id/3.html', '1', '1501117097');
INSERT INTO `tyms_action_log` VALUES ('23', '7', '1', '2130706433', 'model', '2', '操作url：/admin/model/edit/id/2.html', '1', '1501118838');
INSERT INTO `tyms_action_log` VALUES ('24', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/0.html', '1', '1501124177');
INSERT INTO `tyms_action_log` VALUES ('25', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/35.html', '1', '1501124203');
INSERT INTO `tyms_action_log` VALUES ('26', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/0.html', '1', '1501125366');
INSERT INTO `tyms_action_log` VALUES ('27', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/37.html', '1', '1501125386');
INSERT INTO `tyms_action_log` VALUES ('28', '10', '1', '2130706433', 'Menu', '12', '操作url：/admin/menu/edit/id/12.html', '1', '1501125463');
INSERT INTO `tyms_action_log` VALUES ('29', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/11.html', '1', '1501125472');
INSERT INTO `tyms_action_log` VALUES ('30', '10', '1', '2130706433', 'Menu', '38', '操作url：/admin/menu/edit/id/38.html', '1', '1501125582');
INSERT INTO `tyms_action_log` VALUES ('31', '10', '1', '2130706433', 'Menu', '12', '操作url：/admin/menu/edit/id/12.html', '1', '1501125590');
INSERT INTO `tyms_action_log` VALUES ('32', '10', '1', '2130706433', 'Menu', '8', '操作url：/admin/menu/edit/id/8.html', '1', '1501126257');
INSERT INTO `tyms_action_log` VALUES ('33', '10', '1', '2130706433', 'Menu', '4', '操作url：/admin/menu/edit/id/4.html', '1', '1501127673');
INSERT INTO `tyms_action_log` VALUES ('34', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/33.html', '1', '1501138761');
INSERT INTO `tyms_action_log` VALUES ('35', '10', '1', '2130706433', 'Menu', '39', '操作url：/admin/menu/edit/id/39.html', '1', '1501138805');
INSERT INTO `tyms_action_log` VALUES ('36', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/0.html', '1', '1501145342');
INSERT INTO `tyms_action_log` VALUES ('37', '10', '1', '2130706433', 'Menu', '1', '操作url：/index.php/admin/menu/add/pid/40.html', '1', '1501145364');
INSERT INTO `tyms_action_log` VALUES ('38', '10', '1', '2130706433', 'Menu', '23', '操作url：/index.php/admin/menu/edit/id/23.html', '1', '1501145948');
INSERT INTO `tyms_action_log` VALUES ('39', '10', '1', '2130706433', 'Menu', '24', '操作url：/index.php/admin/menu/edit/id/24.html', '1', '1501145968');
INSERT INTO `tyms_action_log` VALUES ('40', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php/admin/menu/del/id/6.html', '1', '1501145976');
INSERT INTO `tyms_action_log` VALUES ('41', '10', '1', '2130706433', 'Menu', '22', '操作url：/admin/menu/edit/id/22.html', '1', '1501204283');
INSERT INTO `tyms_action_log` VALUES ('42', '10', '1', '2130706433', 'Menu', '22', '操作url：/admin/menu/edit/id/22.html', '1', '1501204363');
INSERT INTO `tyms_action_log` VALUES ('43', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/menu/add/pid/33.html', '1', '1501211657');
INSERT INTO `tyms_action_log` VALUES ('44', '10', '1', '2130706433', 'Menu', '42', '操作url：/admin/menu/edit/id/42.html', '1', '1501213372');
INSERT INTO `tyms_action_log` VALUES ('45', '10', '1', '2130706433', 'Menu', '42', '操作url：/index.php/admin/menu/edit/id/42.html', '1', '1501667313');

-- ----------------------------
-- Table structure for `tyms_ad`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_ad`;
CREATE TABLE `tyms_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `place_id` int(11) DEFAULT NULL COMMENT '广告位ID',
  `title` varchar(150) DEFAULT NULL COMMENT '广告名称',
  `cover_id` int(11) DEFAULT NULL COMMENT '广告图片',
  `photolist` varchar(20) NOT NULL COMMENT '辅助图片',
  `url` varchar(150) DEFAULT NULL COMMENT '广告链接',
  `listurl` varchar(255) DEFAULT NULL COMMENT '辅助链接',
  `background` varchar(150) DEFAULT NULL COMMENT '广告背景',
  `content` text COMMENT '广告描述',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告位状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of tyms_ad
-- ----------------------------
INSERT INTO `tyms_ad` VALUES ('1', '1', '电子商务系统设计与开发', '0', '', '', '', '', '<p>我们为客户提供专业的B2C、C2C、B2B、P2P等电子商务平台开发，同时紧扣企业运营，提供个性化的电子商务平台开发和运营管理平台。 </p>', '1440433466', '1440433466', '1');
INSERT INTO `tyms_ad` VALUES ('2', '1', '企业网站设计与开发', '0', '', '', '', '', '<p>我们为您提供更加专业的企业网站建设、企业文化提升以及企业形象包装服务，为您量身打造更加适合当前网络时代的需求服务，让您的公司更加贴近客户。</p>', '1440433531', '1440433531', '1');
INSERT INTO `tyms_ad` VALUES ('3', '1', 'WEB应用系统设计与开发', '14', '', '', '', '', '<p>我们为您的企业量身打造专业级别的企业OA系统、CRM系统等，为事、企业单位提供更好更高效的无纸化办公平台环境。</p>', '1440433554', '1462966106', '1');
INSERT INTO `tyms_ad` VALUES ('4', '1', '手机APP应用设计与开发', '0', '', 'http://www.yizukeji.cn', '', '', '<p>蚁族科技有限公司专注于手机客户端软件开发，是省内移动客户端开发商的先行者，做到行业内领先地位。 </p>', '1440433571', '1459489811', '1');

-- ----------------------------
-- Table structure for `tyms_addons`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_addons`;
CREATE TABLE `tyms_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `isinstall` int(10) DEFAULT '0' COMMENT '是否安装',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of tyms_addons
-- ----------------------------
INSERT INTO `tyms_addons` VALUES ('1', 'Devteam', '开发团队信息', '开发团队成员信息', '0', '', 'molong', '0.1', '1', '0', '0');
INSERT INTO `tyms_addons` VALUES ('2', 'Sitestat', '站点统计信息', '统计站点的基础信息', '1', '', 'thinkphp', '0.2', '1', '0', '0');
INSERT INTO `tyms_addons` VALUES ('3', 'Systeminfo', '系统环境信息', '用于显示一些服务器的信息', '1', '', 'molong', '0.1', '1', '0', '0');

-- ----------------------------
-- Table structure for `tyms_ad_place`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_ad_place`;
CREATE TABLE `tyms_ad_place` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(150) DEFAULT NULL COMMENT '广告位名称',
  `name` varchar(20) NOT NULL COMMENT '调用名称',
  `show_type` int(11) NOT NULL DEFAULT '5' COMMENT '广告位类型',
  `show_num` int(11) NOT NULL DEFAULT '5' COMMENT '显示条数',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `template` varchar(150) DEFAULT NULL COMMENT '广告位模板',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告位状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告位表';

-- ----------------------------
-- Records of tyms_ad_place
-- ----------------------------
INSERT INTO `tyms_ad_place` VALUES ('1', '首页幻灯片', 'banner', '1', '5', '0', '0', '1440433367', '1440433367', '', '1');

-- ----------------------------
-- Table structure for `tyms_article`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_article`;
CREATE TABLE `tyms_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `category_id` int(10) NOT NULL DEFAULT '0' COMMENT '栏目',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户UID',
  `cover_id` int(10) DEFAULT NULL COMMENT '内容封面',
  `description` text COMMENT '内容描述',
  `content` text COMMENT '内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `is_top` int(2) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `view` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='百问百答';

-- ----------------------------
-- Records of tyms_article
-- ----------------------------
INSERT INTO `tyms_article` VALUES ('1', 'asdfsdaf', '2', '0', '0', 'asdf', '<p>asdfdsaf</p>', '1', '0', '0', '1501071706', '1501071706');

-- ----------------------------
-- Table structure for `tyms_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_attachment`;
CREATE TABLE `tyms_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of tyms_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_attribute`;
CREATE TABLE `tyms_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(11) NOT NULL COMMENT '所属模型',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_must` int(11) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `group_id` int(11) NOT NULL DEFAULT '1' COMMENT '分组',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of tyms_attribute
-- ----------------------------
INSERT INTO `tyms_attribute` VALUES ('20', 'view', '浏览数量', '11', 'num', '0', '浏览数量', '', '2', '0', '1', '1', '0', '0', '1501071681', '1501071681', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('19', 'is_top', '是否置顶', '2', 'bool', '0', '是否置顶', '', '2', '0', '1', '1', '0', '0', '1501071681', '1501071681', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('18', 'status', '数据状态', '2', 'select', '1', '数据状态', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '2', '1', '1', '1', '5', '0', '1501071681', '1501071681', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('16', 'description', '内容描述', '', 'textarea', '', '内容描述', '', '2', '1', '0', '1', '2', '0', '1501071681', '1501071681', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('17', 'content', '内容', '', 'editor', '', '内容', '', '2', '1', '0', '1', '4', '0', '1501071681', '1501071681', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('15', 'cover_id', '内容封面', '10', 'image', '', '内容封面', '', '2', '1', '0', '1', '3', '0', '1501071681', '1501071681', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('14', 'uid', '用户UID', '11', 'num', '0', '用户UID', '', '2', '0', '1', '1', '0', '0', '1501071680', '1501071680', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('13', 'category_id', '栏目', '10', 'bind', '0', '栏目', 'category', '2', '1', '1', '1', '1', '0', '1501071680', '1501071680', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('12', 'title', '标题', '200', 'text', '', '标题', '', '2', '1', '1', '1', '0', '0', '1501071680', '1501071680', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('21', 'update_time', '更新时间', '11', 'datetime', '0', '更新时间', '', '2', '0', '1', '1', '0', '0', '1501071681', '1501071681', '', '0', '', '', '', '0', '');
INSERT INTO `tyms_attribute` VALUES ('22', 'create_time', '添加时间', '11', 'datetime', '0', '添加时间', '', '2', '0', '1', '1', '0', '0', '1501071681', '1501071681', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for `tyms_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_auth_extend`;
CREATE TABLE `tyms_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of tyms_auth_extend
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_auth_group`;
CREATE TABLE `tyms_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_auth_group
-- ----------------------------
INSERT INTO `tyms_auth_group` VALUES ('1', 'admin', '1', '网站编辑', '网站编辑，针对内容进行管理', '1', '2,1');
INSERT INTO `tyms_auth_group` VALUES ('2', 'admin', '1', '网站运营', '针对网站SEO进行管理', '1', '21,20,14,12,3,19,18,17,16,15,13,1');

-- ----------------------------
-- Table structure for `tyms_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_auth_group_access`;
CREATE TABLE `tyms_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_auth_rule`;
CREATE TABLE `tyms_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `group` char(20) NOT NULL DEFAULT '' COMMENT '权限节点分组',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_auth_rule
-- ----------------------------
INSERT INTO `tyms_auth_rule` VALUES ('1', 'admin', '2', 'admin/index/index', '后台首页', '首页管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('2', 'admin', '2', 'admin/form/index', '自定义表单', '运营管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('3', 'admin', '2', 'admin/addons/hooks', '钩子列表', '扩展管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('4', 'admin', '2', 'admin/addons/index', '插件列表', '扩展管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('5', 'admin', '2', 'admin/ad/index', '广告管理', '运营管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('6', 'admin', '2', 'admin/link/index', '友链管理', '运营管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('7', 'admin', '2', 'admin/action/log', '行为日志', '会员管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('8', 'admin', '2', 'admin/action/index', '行为列表', '会员管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('9', 'admin', '2', 'admin/group/access', '权限列表', '会员管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('10', 'admin', '2', 'admin/group/index', '用户组表', '会员管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('11', 'admin', '2', 'admin/user/index', '用户列表', '会员管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('12', 'admin', '2', 'admin/model/index', '模型管理', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('13', 'admin', '2', 'admin/category/index', '栏目管理', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('14', 'admin', '2', 'admin/seo/index', 'SEO设置', '系统管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('15', 'admin', '2', 'admin/database/index?type=import', '数据恢复', '系统管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('16', 'admin', '2', 'admin/database/index?type=export', '数据备份', '系统管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('17', 'admin', '2', 'admin/channel/index', '导航管理', '系统管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('18', 'admin', '2', 'admin/menu/index', '菜单管理', '系统管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('19', 'admin', '2', 'admin/config/group', '配置管理', '系统管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('20', 'admin', '2', 'admin/index/clear', '更新缓存', '首页管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('21', 'admin', '1', 'admin/config/add', '配置添加', '系统管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('22', 'admin', '2', 'admin/content/index', '内容列表', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('23', 'admin', '2', 'admin/content/add', '内容添加', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('24', 'admin', '1', 'admin/content/edit', '内容编辑', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('25', 'admin', '1', 'admin/content/del', '内容删除', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('26', 'admin', '1', 'admin/content/status', '内容设置状态', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('27', 'admin', '1', 'admin/category/add', '栏目添加', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('28', 'admin', '1', 'admin/category/edit', '栏目编辑', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('29', 'admin', '1', 'admin/category/editable', '栏目单字编辑', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('30', 'admin', '1', 'admin/category/remove', '栏目删除', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('31', 'admin', '1', 'admin/category/merge', '栏目合并', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('32', 'admin', '1', 'admin/category/move', '栏目移动', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('33', 'admin', '1', 'admin/category/status', '栏目状态', '内容管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('34', 'admin', '1', 'admin/scan/index', '木马查杀', '首页管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('35', 'admin', '1', 'admin/wechat/index', '公众号设置', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('36', 'admin', '1', 'admin/wechat/menu', '微信菜单', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('37', 'admin', '1', 'admin/wechat/text', '文本回复', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('38', 'admin', '1', 'admin/wechat/img', '图文回复', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('39', 'admin', '1', 'admin/wechat/setting', '公众号配置编辑', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('40', 'admin', '1', 'admin/wechat/add_menu', '新增菜单', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('41', 'admin', '1', 'admin/wechat/edit_menu', '编辑菜单', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('42', 'admin', '1', 'admin/wechat/del_menu', '删除菜单', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('43', 'admin', '1', 'admin/wechat/pub_menu', '发布菜单', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('44', 'admin', '1', 'admin/wechat/add_text', '添加文本回复', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('45', 'admin', '1', 'admin/wechat/del_text', '删除文本回复', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('46', 'admin', '1', 'admin/wechat/add_img', '添加图文', '微信管理', '1', '');
INSERT INTO `tyms_auth_rule` VALUES ('47', 'admin', '1', 'admin/wechat/del_img', '删除图文回复', '微信管理', '1', '');

-- ----------------------------
-- Table structure for `tyms_category`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_category`;
CREATE TABLE `tyms_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of tyms_category
-- ----------------------------
INSERT INTO `tyms_category` VALUES ('1', 'news', '新闻动态', '0', '0', '10', '', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', 'null', '1379474947', '1463561497', '1', '0', '');
INSERT INTO `tyms_category` VALUES ('2', 'company_news', '国内新闻', '1', '1', '10', '', '', '', '', '', '', '', '2,3', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '0', '');
INSERT INTO `tyms_category` VALUES ('3', '', '国外新闻', '1', '2', '10', '', '', '', '', '', '', '', '', '', '', '0', '1', '1', '0', '0', '', '', '0', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `tyms_channel`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_channel`;
CREATE TABLE `tyms_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '导航类型',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `color` varchar(20) DEFAULT NULL COMMENT '导航颜色',
  `band_color` varchar(20) DEFAULT NULL COMMENT '标识点颜色',
  `band_text` varchar(30) DEFAULT NULL COMMENT '标志点文字',
  `active` char(100) NOT NULL DEFAULT '' COMMENT '当前链接',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_channel
-- ----------------------------
INSERT INTO `tyms_channel` VALUES ('1', '0', '网站首页', 'index/index/index', '0', '1', 'home', '', '', '', 'home', '1379475111', '1464490544', '1', '0');
INSERT INTO `tyms_channel` VALUES ('2', '0', '新闻资讯', 'article/list/1', '1', '1', 'article', '', '', '', 'article', '1379475111', '1501071649', '1', '0');

-- ----------------------------
-- Table structure for `tyms_config`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_config`;
CREATE TABLE `tyms_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(10) NOT NULL DEFAULT 'text' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '小图标',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_config
-- ----------------------------
INSERT INTO `tyms_config` VALUES ('1', 'config_group_list', 'textarea', '配置分组', '99', '', '', '', '1447305542', '1452323143', '1', '1:基本\r\n2:会员\r\n3:邮件\r\n4:微信\r\n99:系统', '0');
INSERT INTO `tyms_config` VALUES ('2', 'hooks_type', 'textarea', '钩子的类型', '99', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `tyms_config` VALUES ('3', 'auth_config', 'textarea', 'Auth配置', '99', '', '自定义Auth.class.php类配置', '', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `tyms_config` VALUES ('5', 'data_backup_path', 'text', '数据库备份根路径', '99', '', '路径必须以 / 结尾', '', '1381482411', '1381482411', '1', './data/backup/', '5');
INSERT INTO `tyms_config` VALUES ('6', 'data_backup_part_size', 'text', '数据库备份卷大小', '99', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `tyms_config` VALUES ('7', 'data_backup_compress', 'bool', '数据库备份文件是否启用压缩', '99', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '', '1381713345', '1447306018', '1', '1', '9');
INSERT INTO `tyms_config` VALUES ('8', 'data_backup_compress_level', 'select', '数据库备份文件压缩级别', '99', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '1381713408', '1447305979', '1', '9', '10');
INSERT INTO `tyms_config` VALUES ('9', 'develop_mode', 'bool', '开启开发者模式', '99', '0:关闭\r\n1:开启', '是否开启开发者模式', '', '1383105995', '1447305960', '1', '1', '11');
INSERT INTO `tyms_config` VALUES ('10', 'allow_visit', 'textarea', '不受限控制器方法', '99', '', '', '', '1386644047', '1438075615', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `tyms_config` VALUES ('11', 'deny_visit', 'textarea', '超管专限控制器方法', '99', '', '仅超级管理员可访问的控制器方法', '', '1386644141', '1438075628', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `tyms_config` VALUES ('12', 'admin_allow_ip', 'text', '后台允许访问IP', '99', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '', '1387165454', '1452307198', '1', '', '12');
INSERT INTO `tyms_config` VALUES ('13', 'app_debug', 'bool', '是否调试模式', '99', '0:关闭\r\n1:开启', '是否调试模式', '', '1387165685', '1481539829', '1', '0', '6');
INSERT INTO `tyms_config` VALUES ('14', 'web_site_title', 'text', '网站标题', '1', '', '网站标题前台显示标题', '', '1378898976', '1379235274', '1', 'YizuCMS网站管理系统', '0');
INSERT INTO `tyms_config` VALUES ('15', 'web_site_url', 'text', '网站URL', '1', '', '网站网址', '', '1378898976', '1379235274', '1', 'http://tyms001.com', '1');
INSERT INTO `tyms_config` VALUES ('16', 'web_site_description', 'textarea', '网站描述', '1', '', '网站搜索引擎描述', '', '1378898976', '1379235841', '1', 'YizuCMS网站管理系统', '3');
INSERT INTO `tyms_config` VALUES ('17', 'web_site_keyword', 'textarea', '网站关键字', '1', '', '网站搜索引擎关键字', '', '1378898976', '1381390100', '1', 'YizuCMS网站管理系统,YizuCMS', '6');
INSERT INTO `tyms_config` VALUES ('18', 'web_site_close', 'bool', '关闭站点', '1', '0:否,1:是', '站点关闭后其他用户不能访问，管理员可以正常访问', '', '1378898976', '1447321395', '1', '0', '4');
INSERT INTO `tyms_config` VALUES ('19', 'web_site_icp', 'text', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“赣ICP备13006622号', '', '1378900335', '1379235859', '1', '赣ICP备13006622号', '7');
INSERT INTO `tyms_config` VALUES ('20', 'open_mobile_site', 'bool', '开启手机站', '1', '0:关闭\r\n1:开启', '', '', '1440901307', '1440901543', '1', '0', '4');
INSERT INTO `tyms_config` VALUES ('21', 'list_rows', 'num', '列表条数', '99', '', '', '', '1448937662', '1448937662', '1', '20', '10');
INSERT INTO `tyms_config` VALUES ('22', 'user_allow_register', 'bool', '是否可注册', '2', '1:是\r\n0:否', '', '', '1449043544', '1449043586', '1', '1', '0');
INSERT INTO `tyms_config` VALUES ('23', 'user_group_type', 'textarea', '会员分组类别', '2', '', '', '', '1449196835', '1449196835', '1', 'admin:系统管理员\r\nfront:会员等级', '1');
INSERT INTO `tyms_config` VALUES ('24', 'config_type_list', 'textarea', '字段类型', '99', '', '', '', '1459136529', '1459136529', '1', 'text:单行文本:varchar\r\nstring:字符串:int\r\npassword:密码:varchar\r\ntextarea:文本框:text\r\nbool:布尔型:int\r\nselect:选择:varchar\r\nnum:数字:int\r\ndecimal:金额:decimal\r\ntags:标签:varchar\r\ndatetime:时间控件:int\r\ndate:日期控件:varchar\r\neditor:编辑器:text\r\nbind:模型绑定:int\r\nimage:图片上传:int\r\nimages:多图上传:varchar\r\nattach:文件上传:varchar', '0');
INSERT INTO `tyms_config` VALUES ('25', 'document_position', 'textarea', '文档推荐位', '99', '', '', '', '1453449698', '1453449698', '1', '1:首页推荐\r\n2:列表推荐', '0');
INSERT INTO `tyms_config` VALUES ('26', 'mail_host', 'text', 'smtp服务器的名称', '3', '', 'smtp服务器的名称', '', '1455690530', '1455690556', '1', 'smtp.163.com', '0');
INSERT INTO `tyms_config` VALUES ('27', 'mail_smtpauth', 'select', '启用smtp认证', '3', '0:否,1:是', '启用smtp认证', '', '1455690641', '1455690689', '1', '1', '0');
INSERT INTO `tyms_config` VALUES ('28', 'mail_username', 'text', '邮件发送用户名', '3', '', '邮件发送用户名', '', '1455690771', '1455690771', '1', '你的邮箱账号', '0');
INSERT INTO `tyms_config` VALUES ('29', 'mail_password', 'text', '邮箱密码', '3', '', '邮箱密码，如果是qq邮箱，则填安全密码', '', '1455690802', '1455690802', '1', '你的邮箱密码', '0');
INSERT INTO `tyms_config` VALUES ('30', 'mail_fromname', 'text', '发件人姓名', '3', '', '发件人姓名', '', '1455690838', '1455690838', '1', '发件人姓名', '0');
INSERT INTO `tyms_config` VALUES ('31', 'mail_ishtml', 'select', '是否HTML格式邮件', '3', '0:否,1:是', '是否HTML格式邮件', '', '1455690888', '1455690888', '1', '1', '0');
INSERT INTO `tyms_config` VALUES ('32', 'mail_charset', 'text', '邮件编码', '3', '', '设置发送邮件的编码', '', '1455690920', '1455690920', '1', 'UTF8', '0');
INSERT INTO `tyms_config` VALUES ('33', 'wechat_name', 'text', '微信名称', '4', '', '填写微信名称', '', '1459136529', '1461898406', '1', '', '0');
INSERT INTO `tyms_config` VALUES ('41', 'pc_themes', 'text', 'PC站模板', '0', '', '', '', '1480043043', '1480043043', '1', 'default', '0');
INSERT INTO `tyms_config` VALUES ('42', 'mobile_themes', 'text', '手机站模板', '0', '', '', '', '1480043066', '1480043066', '1', '', '0');
INSERT INTO `tyms_config` VALUES ('43', 'nav_type_list', 'textarea', '导航分类', '99', '', '', '', '1481539756', '1481539801', '1', '1:顶部\r\n2:底部', '1');

-- ----------------------------
-- Table structure for `tyms_district`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_district`;
CREATE TABLE `tyms_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45052 DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

-- ----------------------------
-- Records of tyms_district
-- ----------------------------
INSERT INTO `tyms_district` VALUES ('1', '北京市', '1', '0');
INSERT INTO `tyms_district` VALUES ('2', '天津市', '1', '0');
INSERT INTO `tyms_district` VALUES ('3', '河北省', '1', '0');
INSERT INTO `tyms_district` VALUES ('4', '山西省', '1', '0');
INSERT INTO `tyms_district` VALUES ('5', '内蒙古自治区', '1', '0');
INSERT INTO `tyms_district` VALUES ('6', '辽宁省', '1', '0');
INSERT INTO `tyms_district` VALUES ('7', '吉林省', '1', '0');
INSERT INTO `tyms_district` VALUES ('8', '黑龙江省', '1', '0');
INSERT INTO `tyms_district` VALUES ('9', '上海市', '1', '0');
INSERT INTO `tyms_district` VALUES ('10', '江苏省', '1', '0');
INSERT INTO `tyms_district` VALUES ('11', '浙江省', '1', '0');
INSERT INTO `tyms_district` VALUES ('12', '安徽省', '1', '0');
INSERT INTO `tyms_district` VALUES ('13', '福建省', '1', '0');
INSERT INTO `tyms_district` VALUES ('14', '江西省', '1', '0');
INSERT INTO `tyms_district` VALUES ('15', '山东省', '1', '0');
INSERT INTO `tyms_district` VALUES ('16', '河南省', '1', '0');
INSERT INTO `tyms_district` VALUES ('17', '湖北省', '1', '0');
INSERT INTO `tyms_district` VALUES ('18', '湖南省', '1', '0');
INSERT INTO `tyms_district` VALUES ('19', '广东省', '1', '0');
INSERT INTO `tyms_district` VALUES ('20', '广西壮族自治区', '1', '0');
INSERT INTO `tyms_district` VALUES ('21', '海南省', '1', '0');
INSERT INTO `tyms_district` VALUES ('22', '重庆市', '1', '0');
INSERT INTO `tyms_district` VALUES ('23', '四川省', '1', '0');
INSERT INTO `tyms_district` VALUES ('24', '贵州省', '1', '0');
INSERT INTO `tyms_district` VALUES ('25', '云南省', '1', '0');
INSERT INTO `tyms_district` VALUES ('26', '西藏自治区', '1', '0');
INSERT INTO `tyms_district` VALUES ('27', '陕西省', '1', '0');
INSERT INTO `tyms_district` VALUES ('28', '甘肃省', '1', '0');
INSERT INTO `tyms_district` VALUES ('29', '青海省', '1', '0');
INSERT INTO `tyms_district` VALUES ('30', '宁夏回族自治区', '1', '0');
INSERT INTO `tyms_district` VALUES ('31', '新疆维吾尔自治区', '1', '0');
INSERT INTO `tyms_district` VALUES ('32', '台湾省', '1', '0');
INSERT INTO `tyms_district` VALUES ('33', '香港特别行政区', '1', '0');
INSERT INTO `tyms_district` VALUES ('34', '澳门特别行政区', '1', '0');
INSERT INTO `tyms_district` VALUES ('35', '海外', '1', '0');
INSERT INTO `tyms_district` VALUES ('36', '其他', '1', '0');
INSERT INTO `tyms_district` VALUES ('37', '东城区', '2', '1');
INSERT INTO `tyms_district` VALUES ('38', '西城区', '2', '1');
INSERT INTO `tyms_district` VALUES ('39', '崇文区', '2', '1');
INSERT INTO `tyms_district` VALUES ('40', '宣武区', '2', '1');
INSERT INTO `tyms_district` VALUES ('41', '朝阳区', '2', '1');
INSERT INTO `tyms_district` VALUES ('42', '丰台区', '2', '1');
INSERT INTO `tyms_district` VALUES ('43', '石景山区', '2', '1');
INSERT INTO `tyms_district` VALUES ('44', '海淀区', '2', '1');
INSERT INTO `tyms_district` VALUES ('45', '门头沟区', '2', '1');
INSERT INTO `tyms_district` VALUES ('46', '房山区', '2', '1');
INSERT INTO `tyms_district` VALUES ('47', '通州区', '2', '1');
INSERT INTO `tyms_district` VALUES ('48', '顺义区', '2', '1');
INSERT INTO `tyms_district` VALUES ('49', '昌平区', '2', '1');
INSERT INTO `tyms_district` VALUES ('50', '大兴区', '2', '1');
INSERT INTO `tyms_district` VALUES ('51', '怀柔区', '2', '1');
INSERT INTO `tyms_district` VALUES ('52', '平谷区', '2', '1');
INSERT INTO `tyms_district` VALUES ('53', '密云县', '2', '1');
INSERT INTO `tyms_district` VALUES ('54', '延庆县', '2', '1');
INSERT INTO `tyms_district` VALUES ('55', '和平区', '2', '2');
INSERT INTO `tyms_district` VALUES ('56', '河东区', '2', '2');
INSERT INTO `tyms_district` VALUES ('57', '河西区', '2', '2');
INSERT INTO `tyms_district` VALUES ('58', '南开区', '2', '2');
INSERT INTO `tyms_district` VALUES ('59', '河北区', '2', '2');
INSERT INTO `tyms_district` VALUES ('60', '红桥区', '2', '2');
INSERT INTO `tyms_district` VALUES ('61', '塘沽区', '2', '2');
INSERT INTO `tyms_district` VALUES ('62', '汉沽区', '2', '2');
INSERT INTO `tyms_district` VALUES ('63', '大港区', '2', '2');
INSERT INTO `tyms_district` VALUES ('64', '东丽区', '2', '2');
INSERT INTO `tyms_district` VALUES ('65', '西青区', '2', '2');
INSERT INTO `tyms_district` VALUES ('66', '津南区', '2', '2');
INSERT INTO `tyms_district` VALUES ('67', '北辰区', '2', '2');
INSERT INTO `tyms_district` VALUES ('68', '武清区', '2', '2');
INSERT INTO `tyms_district` VALUES ('69', '宝坻区', '2', '2');
INSERT INTO `tyms_district` VALUES ('70', '宁河县', '2', '2');
INSERT INTO `tyms_district` VALUES ('71', '静海县', '2', '2');
INSERT INTO `tyms_district` VALUES ('72', '蓟县', '2', '2');
INSERT INTO `tyms_district` VALUES ('73', '石家庄市', '2', '3');
INSERT INTO `tyms_district` VALUES ('74', '唐山市', '2', '3');
INSERT INTO `tyms_district` VALUES ('75', '秦皇岛市', '2', '3');
INSERT INTO `tyms_district` VALUES ('76', '邯郸市', '2', '3');
INSERT INTO `tyms_district` VALUES ('77', '邢台市', '2', '3');
INSERT INTO `tyms_district` VALUES ('78', '保定市', '2', '3');
INSERT INTO `tyms_district` VALUES ('79', '张家口市', '2', '3');
INSERT INTO `tyms_district` VALUES ('80', '承德市', '2', '3');
INSERT INTO `tyms_district` VALUES ('81', '衡水市', '2', '3');
INSERT INTO `tyms_district` VALUES ('82', '廊坊市', '2', '3');
INSERT INTO `tyms_district` VALUES ('83', '沧州市', '2', '3');
INSERT INTO `tyms_district` VALUES ('84', '太原市', '2', '4');
INSERT INTO `tyms_district` VALUES ('85', '大同市', '2', '4');
INSERT INTO `tyms_district` VALUES ('86', '阳泉市', '2', '4');
INSERT INTO `tyms_district` VALUES ('87', '长治市', '2', '4');
INSERT INTO `tyms_district` VALUES ('88', '晋城市', '2', '4');
INSERT INTO `tyms_district` VALUES ('89', '朔州市', '2', '4');
INSERT INTO `tyms_district` VALUES ('90', '晋中市', '2', '4');
INSERT INTO `tyms_district` VALUES ('91', '运城市', '2', '4');
INSERT INTO `tyms_district` VALUES ('92', '忻州市', '2', '4');
INSERT INTO `tyms_district` VALUES ('93', '临汾市', '2', '4');
INSERT INTO `tyms_district` VALUES ('94', '吕梁市', '2', '4');
INSERT INTO `tyms_district` VALUES ('95', '呼和浩特市', '2', '5');
INSERT INTO `tyms_district` VALUES ('96', '包头市', '2', '5');
INSERT INTO `tyms_district` VALUES ('97', '乌海市', '2', '5');
INSERT INTO `tyms_district` VALUES ('98', '赤峰市', '2', '5');
INSERT INTO `tyms_district` VALUES ('99', '通辽市', '2', '5');
INSERT INTO `tyms_district` VALUES ('100', '鄂尔多斯市', '2', '5');
INSERT INTO `tyms_district` VALUES ('101', '呼伦贝尔市', '2', '5');
INSERT INTO `tyms_district` VALUES ('102', '巴彦淖尔市', '2', '5');
INSERT INTO `tyms_district` VALUES ('103', '乌兰察布市', '2', '5');
INSERT INTO `tyms_district` VALUES ('104', '兴安盟', '2', '5');
INSERT INTO `tyms_district` VALUES ('105', '锡林郭勒盟', '2', '5');
INSERT INTO `tyms_district` VALUES ('106', '阿拉善盟', '2', '5');
INSERT INTO `tyms_district` VALUES ('107', '沈阳市', '2', '6');
INSERT INTO `tyms_district` VALUES ('108', '大连市', '2', '6');
INSERT INTO `tyms_district` VALUES ('109', '鞍山市', '2', '6');
INSERT INTO `tyms_district` VALUES ('110', '抚顺市', '2', '6');
INSERT INTO `tyms_district` VALUES ('111', '本溪市', '2', '6');
INSERT INTO `tyms_district` VALUES ('112', '丹东市', '2', '6');
INSERT INTO `tyms_district` VALUES ('113', '锦州市', '2', '6');
INSERT INTO `tyms_district` VALUES ('114', '营口市', '2', '6');
INSERT INTO `tyms_district` VALUES ('115', '阜新市', '2', '6');
INSERT INTO `tyms_district` VALUES ('116', '辽阳市', '2', '6');
INSERT INTO `tyms_district` VALUES ('117', '盘锦市', '2', '6');
INSERT INTO `tyms_district` VALUES ('118', '铁岭市', '2', '6');
INSERT INTO `tyms_district` VALUES ('119', '朝阳市', '2', '6');
INSERT INTO `tyms_district` VALUES ('120', '葫芦岛市', '2', '6');
INSERT INTO `tyms_district` VALUES ('121', '长春市', '2', '7');
INSERT INTO `tyms_district` VALUES ('122', '吉林市', '2', '7');
INSERT INTO `tyms_district` VALUES ('123', '四平市', '2', '7');
INSERT INTO `tyms_district` VALUES ('124', '辽源市', '2', '7');
INSERT INTO `tyms_district` VALUES ('125', '通化市', '2', '7');
INSERT INTO `tyms_district` VALUES ('126', '白山市', '2', '7');
INSERT INTO `tyms_district` VALUES ('127', '松原市', '2', '7');
INSERT INTO `tyms_district` VALUES ('128', '白城市', '2', '7');
INSERT INTO `tyms_district` VALUES ('129', '延边朝鲜族自治州', '2', '7');
INSERT INTO `tyms_district` VALUES ('130', '哈尔滨市', '2', '8');
INSERT INTO `tyms_district` VALUES ('131', '齐齐哈尔市', '2', '8');
INSERT INTO `tyms_district` VALUES ('132', '鸡西市', '2', '8');
INSERT INTO `tyms_district` VALUES ('133', '鹤岗市', '2', '8');
INSERT INTO `tyms_district` VALUES ('134', '双鸭山市', '2', '8');
INSERT INTO `tyms_district` VALUES ('135', '大庆市', '2', '8');
INSERT INTO `tyms_district` VALUES ('136', '伊春市', '2', '8');
INSERT INTO `tyms_district` VALUES ('137', '佳木斯市', '2', '8');
INSERT INTO `tyms_district` VALUES ('138', '七台河市', '2', '8');
INSERT INTO `tyms_district` VALUES ('139', '牡丹江市', '2', '8');
INSERT INTO `tyms_district` VALUES ('140', '黑河市', '2', '8');
INSERT INTO `tyms_district` VALUES ('141', '绥化市', '2', '8');
INSERT INTO `tyms_district` VALUES ('142', '大兴安岭地区', '2', '8');
INSERT INTO `tyms_district` VALUES ('143', '黄浦区', '2', '9');
INSERT INTO `tyms_district` VALUES ('144', '卢湾区', '2', '9');
INSERT INTO `tyms_district` VALUES ('145', '徐汇区', '2', '9');
INSERT INTO `tyms_district` VALUES ('146', '长宁区', '2', '9');
INSERT INTO `tyms_district` VALUES ('147', '静安区', '2', '9');
INSERT INTO `tyms_district` VALUES ('148', '普陀区', '2', '9');
INSERT INTO `tyms_district` VALUES ('149', '闸北区', '2', '9');
INSERT INTO `tyms_district` VALUES ('150', '虹口区', '2', '9');
INSERT INTO `tyms_district` VALUES ('151', '杨浦区', '2', '9');
INSERT INTO `tyms_district` VALUES ('152', '闵行区', '2', '9');
INSERT INTO `tyms_district` VALUES ('153', '宝山区', '2', '9');
INSERT INTO `tyms_district` VALUES ('154', '嘉定区', '2', '9');
INSERT INTO `tyms_district` VALUES ('155', '浦东新区', '2', '9');
INSERT INTO `tyms_district` VALUES ('156', '金山区', '2', '9');
INSERT INTO `tyms_district` VALUES ('157', '松江区', '2', '9');
INSERT INTO `tyms_district` VALUES ('158', '青浦区', '2', '9');
INSERT INTO `tyms_district` VALUES ('159', '南汇区', '2', '9');
INSERT INTO `tyms_district` VALUES ('160', '奉贤区', '2', '9');
INSERT INTO `tyms_district` VALUES ('161', '崇明县', '2', '9');
INSERT INTO `tyms_district` VALUES ('162', '南京市', '2', '10');
INSERT INTO `tyms_district` VALUES ('163', '无锡市', '2', '10');
INSERT INTO `tyms_district` VALUES ('164', '徐州市', '2', '10');
INSERT INTO `tyms_district` VALUES ('165', '常州市', '2', '10');
INSERT INTO `tyms_district` VALUES ('166', '苏州市', '2', '10');
INSERT INTO `tyms_district` VALUES ('167', '南通市', '2', '10');
INSERT INTO `tyms_district` VALUES ('168', '连云港市', '2', '10');
INSERT INTO `tyms_district` VALUES ('169', '淮安市', '2', '10');
INSERT INTO `tyms_district` VALUES ('170', '盐城市', '2', '10');
INSERT INTO `tyms_district` VALUES ('171', '扬州市', '2', '10');
INSERT INTO `tyms_district` VALUES ('172', '镇江市', '2', '10');
INSERT INTO `tyms_district` VALUES ('173', '泰州市', '2', '10');
INSERT INTO `tyms_district` VALUES ('174', '宿迁市', '2', '10');
INSERT INTO `tyms_district` VALUES ('175', '杭州市', '2', '11');
INSERT INTO `tyms_district` VALUES ('176', '宁波市', '2', '11');
INSERT INTO `tyms_district` VALUES ('177', '温州市', '2', '11');
INSERT INTO `tyms_district` VALUES ('178', '嘉兴市', '2', '11');
INSERT INTO `tyms_district` VALUES ('179', '湖州市', '2', '11');
INSERT INTO `tyms_district` VALUES ('180', '绍兴市', '2', '11');
INSERT INTO `tyms_district` VALUES ('181', '舟山市', '2', '11');
INSERT INTO `tyms_district` VALUES ('182', '衢州市', '2', '11');
INSERT INTO `tyms_district` VALUES ('183', '金华市', '2', '11');
INSERT INTO `tyms_district` VALUES ('184', '台州市', '2', '11');
INSERT INTO `tyms_district` VALUES ('185', '丽水市', '2', '11');
INSERT INTO `tyms_district` VALUES ('186', '合肥市', '2', '12');
INSERT INTO `tyms_district` VALUES ('187', '芜湖市', '2', '12');
INSERT INTO `tyms_district` VALUES ('188', '蚌埠市', '2', '12');
INSERT INTO `tyms_district` VALUES ('189', '淮南市', '2', '12');
INSERT INTO `tyms_district` VALUES ('190', '马鞍山市', '2', '12');
INSERT INTO `tyms_district` VALUES ('191', '淮北市', '2', '12');
INSERT INTO `tyms_district` VALUES ('192', '铜陵市', '2', '12');
INSERT INTO `tyms_district` VALUES ('193', '安庆市', '2', '12');
INSERT INTO `tyms_district` VALUES ('194', '黄山市', '2', '12');
INSERT INTO `tyms_district` VALUES ('195', '滁州市', '2', '12');
INSERT INTO `tyms_district` VALUES ('196', '阜阳市', '2', '12');
INSERT INTO `tyms_district` VALUES ('197', '宿州市', '2', '12');
INSERT INTO `tyms_district` VALUES ('198', '巢湖市', '2', '12');
INSERT INTO `tyms_district` VALUES ('199', '六安市', '2', '12');
INSERT INTO `tyms_district` VALUES ('200', '亳州市', '2', '12');
INSERT INTO `tyms_district` VALUES ('201', '池州市', '2', '12');
INSERT INTO `tyms_district` VALUES ('202', '宣城市', '2', '12');
INSERT INTO `tyms_district` VALUES ('203', '福州市', '2', '13');
INSERT INTO `tyms_district` VALUES ('204', '厦门市', '2', '13');
INSERT INTO `tyms_district` VALUES ('205', '莆田市', '2', '13');
INSERT INTO `tyms_district` VALUES ('206', '三明市', '2', '13');
INSERT INTO `tyms_district` VALUES ('207', '泉州市', '2', '13');
INSERT INTO `tyms_district` VALUES ('208', '漳州市', '2', '13');
INSERT INTO `tyms_district` VALUES ('209', '南平市', '2', '13');
INSERT INTO `tyms_district` VALUES ('210', '龙岩市', '2', '13');
INSERT INTO `tyms_district` VALUES ('211', '宁德市', '2', '13');
INSERT INTO `tyms_district` VALUES ('212', '南昌市', '2', '14');
INSERT INTO `tyms_district` VALUES ('213', '景德镇市', '2', '14');
INSERT INTO `tyms_district` VALUES ('214', '萍乡市', '2', '14');
INSERT INTO `tyms_district` VALUES ('215', '九江市', '2', '14');
INSERT INTO `tyms_district` VALUES ('216', '新余市', '2', '14');
INSERT INTO `tyms_district` VALUES ('217', '鹰潭市', '2', '14');
INSERT INTO `tyms_district` VALUES ('218', '赣州市', '2', '14');
INSERT INTO `tyms_district` VALUES ('219', '吉安市', '2', '14');
INSERT INTO `tyms_district` VALUES ('220', '宜春市', '2', '14');
INSERT INTO `tyms_district` VALUES ('221', '抚州市', '2', '14');
INSERT INTO `tyms_district` VALUES ('222', '上饶市', '2', '14');
INSERT INTO `tyms_district` VALUES ('223', '济南市', '2', '15');
INSERT INTO `tyms_district` VALUES ('224', '青岛市', '2', '15');
INSERT INTO `tyms_district` VALUES ('225', '淄博市', '2', '15');
INSERT INTO `tyms_district` VALUES ('226', '枣庄市', '2', '15');
INSERT INTO `tyms_district` VALUES ('227', '东营市', '2', '15');
INSERT INTO `tyms_district` VALUES ('228', '烟台市', '2', '15');
INSERT INTO `tyms_district` VALUES ('229', '潍坊市', '2', '15');
INSERT INTO `tyms_district` VALUES ('230', '济宁市', '2', '15');
INSERT INTO `tyms_district` VALUES ('231', '泰安市', '2', '15');
INSERT INTO `tyms_district` VALUES ('232', '威海市', '2', '15');
INSERT INTO `tyms_district` VALUES ('233', '日照市', '2', '15');
INSERT INTO `tyms_district` VALUES ('234', '莱芜市', '2', '15');
INSERT INTO `tyms_district` VALUES ('235', '临沂市', '2', '15');
INSERT INTO `tyms_district` VALUES ('236', '德州市', '2', '15');
INSERT INTO `tyms_district` VALUES ('237', '聊城市', '2', '15');
INSERT INTO `tyms_district` VALUES ('238', '滨州市', '2', '15');
INSERT INTO `tyms_district` VALUES ('239', '菏泽市', '2', '15');
INSERT INTO `tyms_district` VALUES ('240', '郑州市', '2', '16');
INSERT INTO `tyms_district` VALUES ('241', '开封市', '2', '16');
INSERT INTO `tyms_district` VALUES ('242', '洛阳市', '2', '16');
INSERT INTO `tyms_district` VALUES ('243', '平顶山市', '2', '16');
INSERT INTO `tyms_district` VALUES ('244', '安阳市', '2', '16');
INSERT INTO `tyms_district` VALUES ('245', '鹤壁市', '2', '16');
INSERT INTO `tyms_district` VALUES ('246', '新乡市', '2', '16');
INSERT INTO `tyms_district` VALUES ('247', '焦作市', '2', '16');
INSERT INTO `tyms_district` VALUES ('248', '濮阳市', '2', '16');
INSERT INTO `tyms_district` VALUES ('249', '许昌市', '2', '16');
INSERT INTO `tyms_district` VALUES ('250', '漯河市', '2', '16');
INSERT INTO `tyms_district` VALUES ('251', '三门峡市', '2', '16');
INSERT INTO `tyms_district` VALUES ('252', '南阳市', '2', '16');
INSERT INTO `tyms_district` VALUES ('253', '商丘市', '2', '16');
INSERT INTO `tyms_district` VALUES ('254', '信阳市', '2', '16');
INSERT INTO `tyms_district` VALUES ('255', '周口市', '2', '16');
INSERT INTO `tyms_district` VALUES ('256', '驻马店市', '2', '16');
INSERT INTO `tyms_district` VALUES ('257', '济源市', '2', '16');
INSERT INTO `tyms_district` VALUES ('258', '武汉市', '2', '17');
INSERT INTO `tyms_district` VALUES ('259', '黄石市', '2', '17');
INSERT INTO `tyms_district` VALUES ('260', '十堰市', '2', '17');
INSERT INTO `tyms_district` VALUES ('261', '宜昌市', '2', '17');
INSERT INTO `tyms_district` VALUES ('262', '襄樊市', '2', '17');
INSERT INTO `tyms_district` VALUES ('263', '鄂州市', '2', '17');
INSERT INTO `tyms_district` VALUES ('264', '荆门市', '2', '17');
INSERT INTO `tyms_district` VALUES ('265', '孝感市', '2', '17');
INSERT INTO `tyms_district` VALUES ('266', '荆州市', '2', '17');
INSERT INTO `tyms_district` VALUES ('267', '黄冈市', '2', '17');
INSERT INTO `tyms_district` VALUES ('268', '咸宁市', '2', '17');
INSERT INTO `tyms_district` VALUES ('269', '随州市', '2', '17');
INSERT INTO `tyms_district` VALUES ('270', '恩施土家族苗族自治州', '2', '17');
INSERT INTO `tyms_district` VALUES ('271', '仙桃市', '2', '17');
INSERT INTO `tyms_district` VALUES ('272', '潜江市', '2', '17');
INSERT INTO `tyms_district` VALUES ('273', '天门市', '2', '17');
INSERT INTO `tyms_district` VALUES ('274', '神农架林区', '2', '17');
INSERT INTO `tyms_district` VALUES ('275', '长沙市', '2', '18');
INSERT INTO `tyms_district` VALUES ('276', '株洲市', '2', '18');
INSERT INTO `tyms_district` VALUES ('277', '湘潭市', '2', '18');
INSERT INTO `tyms_district` VALUES ('278', '衡阳市', '2', '18');
INSERT INTO `tyms_district` VALUES ('279', '邵阳市', '2', '18');
INSERT INTO `tyms_district` VALUES ('280', '岳阳市', '2', '18');
INSERT INTO `tyms_district` VALUES ('281', '常德市', '2', '18');
INSERT INTO `tyms_district` VALUES ('282', '张家界市', '2', '18');
INSERT INTO `tyms_district` VALUES ('283', '益阳市', '2', '18');
INSERT INTO `tyms_district` VALUES ('284', '郴州市', '2', '18');
INSERT INTO `tyms_district` VALUES ('285', '永州市', '2', '18');
INSERT INTO `tyms_district` VALUES ('286', '怀化市', '2', '18');
INSERT INTO `tyms_district` VALUES ('287', '娄底市', '2', '18');
INSERT INTO `tyms_district` VALUES ('288', '湘西土家族苗族自治州', '2', '18');
INSERT INTO `tyms_district` VALUES ('289', '广州市', '2', '19');
INSERT INTO `tyms_district` VALUES ('290', '韶关市', '2', '19');
INSERT INTO `tyms_district` VALUES ('291', '深圳市', '2', '19');
INSERT INTO `tyms_district` VALUES ('292', '珠海市', '2', '19');
INSERT INTO `tyms_district` VALUES ('293', '汕头市', '2', '19');
INSERT INTO `tyms_district` VALUES ('294', '佛山市', '2', '19');
INSERT INTO `tyms_district` VALUES ('295', '江门市', '2', '19');
INSERT INTO `tyms_district` VALUES ('296', '湛江市', '2', '19');
INSERT INTO `tyms_district` VALUES ('297', '茂名市', '2', '19');
INSERT INTO `tyms_district` VALUES ('298', '肇庆市', '2', '19');
INSERT INTO `tyms_district` VALUES ('299', '惠州市', '2', '19');
INSERT INTO `tyms_district` VALUES ('300', '梅州市', '2', '19');
INSERT INTO `tyms_district` VALUES ('301', '汕尾市', '2', '19');
INSERT INTO `tyms_district` VALUES ('302', '河源市', '2', '19');
INSERT INTO `tyms_district` VALUES ('303', '阳江市', '2', '19');
INSERT INTO `tyms_district` VALUES ('304', '清远市', '2', '19');
INSERT INTO `tyms_district` VALUES ('305', '东莞市', '2', '19');
INSERT INTO `tyms_district` VALUES ('306', '中山市', '2', '19');
INSERT INTO `tyms_district` VALUES ('307', '潮州市', '2', '19');
INSERT INTO `tyms_district` VALUES ('308', '揭阳市', '2', '19');
INSERT INTO `tyms_district` VALUES ('309', '云浮市', '2', '19');
INSERT INTO `tyms_district` VALUES ('310', '南宁市', '2', '20');
INSERT INTO `tyms_district` VALUES ('311', '柳州市', '2', '20');
INSERT INTO `tyms_district` VALUES ('312', '桂林市', '2', '20');
INSERT INTO `tyms_district` VALUES ('313', '梧州市', '2', '20');
INSERT INTO `tyms_district` VALUES ('314', '北海市', '2', '20');
INSERT INTO `tyms_district` VALUES ('315', '防城港市', '2', '20');
INSERT INTO `tyms_district` VALUES ('316', '钦州市', '2', '20');
INSERT INTO `tyms_district` VALUES ('317', '贵港市', '2', '20');
INSERT INTO `tyms_district` VALUES ('318', '玉林市', '2', '20');
INSERT INTO `tyms_district` VALUES ('319', '百色市', '2', '20');
INSERT INTO `tyms_district` VALUES ('320', '贺州市', '2', '20');
INSERT INTO `tyms_district` VALUES ('321', '河池市', '2', '20');
INSERT INTO `tyms_district` VALUES ('322', '来宾市', '2', '20');
INSERT INTO `tyms_district` VALUES ('323', '崇左市', '2', '20');
INSERT INTO `tyms_district` VALUES ('324', '海口市', '2', '21');
INSERT INTO `tyms_district` VALUES ('325', '三亚市', '2', '21');
INSERT INTO `tyms_district` VALUES ('326', '五指山市', '2', '21');
INSERT INTO `tyms_district` VALUES ('327', '琼海市', '2', '21');
INSERT INTO `tyms_district` VALUES ('328', '儋州市', '2', '21');
INSERT INTO `tyms_district` VALUES ('329', '文昌市', '2', '21');
INSERT INTO `tyms_district` VALUES ('330', '万宁市', '2', '21');
INSERT INTO `tyms_district` VALUES ('331', '东方市', '2', '21');
INSERT INTO `tyms_district` VALUES ('332', '定安县', '2', '21');
INSERT INTO `tyms_district` VALUES ('333', '屯昌县', '2', '21');
INSERT INTO `tyms_district` VALUES ('334', '澄迈县', '2', '21');
INSERT INTO `tyms_district` VALUES ('335', '临高县', '2', '21');
INSERT INTO `tyms_district` VALUES ('336', '白沙黎族自治县', '2', '21');
INSERT INTO `tyms_district` VALUES ('337', '昌江黎族自治县', '2', '21');
INSERT INTO `tyms_district` VALUES ('338', '乐东黎族自治县', '2', '21');
INSERT INTO `tyms_district` VALUES ('339', '陵水黎族自治县', '2', '21');
INSERT INTO `tyms_district` VALUES ('340', '保亭黎族苗族自治县', '2', '21');
INSERT INTO `tyms_district` VALUES ('341', '琼中黎族苗族自治县', '2', '21');
INSERT INTO `tyms_district` VALUES ('342', '西沙群岛', '2', '21');
INSERT INTO `tyms_district` VALUES ('343', '南沙群岛', '2', '21');
INSERT INTO `tyms_district` VALUES ('344', '中沙群岛的岛礁及其海域', '2', '21');
INSERT INTO `tyms_district` VALUES ('345', '万州区', '2', '22');
INSERT INTO `tyms_district` VALUES ('346', '涪陵区', '2', '22');
INSERT INTO `tyms_district` VALUES ('347', '渝中区', '2', '22');
INSERT INTO `tyms_district` VALUES ('348', '大渡口区', '2', '22');
INSERT INTO `tyms_district` VALUES ('349', '江北区', '2', '22');
INSERT INTO `tyms_district` VALUES ('350', '沙坪坝区', '2', '22');
INSERT INTO `tyms_district` VALUES ('351', '九龙坡区', '2', '22');
INSERT INTO `tyms_district` VALUES ('352', '南岸区', '2', '22');
INSERT INTO `tyms_district` VALUES ('353', '北碚区', '2', '22');
INSERT INTO `tyms_district` VALUES ('354', '双桥区', '2', '22');
INSERT INTO `tyms_district` VALUES ('355', '万盛区', '2', '22');
INSERT INTO `tyms_district` VALUES ('356', '渝北区', '2', '22');
INSERT INTO `tyms_district` VALUES ('357', '巴南区', '2', '22');
INSERT INTO `tyms_district` VALUES ('358', '黔江区', '2', '22');
INSERT INTO `tyms_district` VALUES ('359', '长寿区', '2', '22');
INSERT INTO `tyms_district` VALUES ('360', '綦江县', '2', '22');
INSERT INTO `tyms_district` VALUES ('361', '潼南县', '2', '22');
INSERT INTO `tyms_district` VALUES ('362', '铜梁县', '2', '22');
INSERT INTO `tyms_district` VALUES ('363', '大足县', '2', '22');
INSERT INTO `tyms_district` VALUES ('364', '荣昌县', '2', '22');
INSERT INTO `tyms_district` VALUES ('365', '璧山县', '2', '22');
INSERT INTO `tyms_district` VALUES ('366', '梁平县', '2', '22');
INSERT INTO `tyms_district` VALUES ('367', '城口县', '2', '22');
INSERT INTO `tyms_district` VALUES ('368', '丰都县', '2', '22');
INSERT INTO `tyms_district` VALUES ('369', '垫江县', '2', '22');
INSERT INTO `tyms_district` VALUES ('370', '武隆县', '2', '22');
INSERT INTO `tyms_district` VALUES ('371', '忠县', '2', '22');
INSERT INTO `tyms_district` VALUES ('372', '开县', '2', '22');
INSERT INTO `tyms_district` VALUES ('373', '云阳县', '2', '22');
INSERT INTO `tyms_district` VALUES ('374', '奉节县', '2', '22');
INSERT INTO `tyms_district` VALUES ('375', '巫山县', '2', '22');
INSERT INTO `tyms_district` VALUES ('376', '巫溪县', '2', '22');
INSERT INTO `tyms_district` VALUES ('377', '石柱土家族自治县', '2', '22');
INSERT INTO `tyms_district` VALUES ('378', '秀山土家族苗族自治县', '2', '22');
INSERT INTO `tyms_district` VALUES ('379', '酉阳土家族苗族自治县', '2', '22');
INSERT INTO `tyms_district` VALUES ('380', '彭水苗族土家族自治县', '2', '22');
INSERT INTO `tyms_district` VALUES ('381', '江津市', '2', '22');
INSERT INTO `tyms_district` VALUES ('382', '合川市', '2', '22');
INSERT INTO `tyms_district` VALUES ('383', '永川市', '2', '22');
INSERT INTO `tyms_district` VALUES ('384', '南川市', '2', '22');
INSERT INTO `tyms_district` VALUES ('385', '成都市', '2', '23');
INSERT INTO `tyms_district` VALUES ('386', '自贡市', '2', '23');
INSERT INTO `tyms_district` VALUES ('387', '攀枝花市', '2', '23');
INSERT INTO `tyms_district` VALUES ('388', '泸州市', '2', '23');
INSERT INTO `tyms_district` VALUES ('389', '德阳市', '2', '23');
INSERT INTO `tyms_district` VALUES ('390', '绵阳市', '2', '23');
INSERT INTO `tyms_district` VALUES ('391', '广元市', '2', '23');
INSERT INTO `tyms_district` VALUES ('392', '遂宁市', '2', '23');
INSERT INTO `tyms_district` VALUES ('393', '内江市', '2', '23');
INSERT INTO `tyms_district` VALUES ('394', '乐山市', '2', '23');
INSERT INTO `tyms_district` VALUES ('395', '南充市', '2', '23');
INSERT INTO `tyms_district` VALUES ('396', '眉山市', '2', '23');
INSERT INTO `tyms_district` VALUES ('397', '宜宾市', '2', '23');
INSERT INTO `tyms_district` VALUES ('398', '广安市', '2', '23');
INSERT INTO `tyms_district` VALUES ('399', '达州市', '2', '23');
INSERT INTO `tyms_district` VALUES ('400', '雅安市', '2', '23');
INSERT INTO `tyms_district` VALUES ('401', '巴中市', '2', '23');
INSERT INTO `tyms_district` VALUES ('402', '资阳市', '2', '23');
INSERT INTO `tyms_district` VALUES ('403', '阿坝藏族羌族自治州', '2', '23');
INSERT INTO `tyms_district` VALUES ('404', '甘孜藏族自治州', '2', '23');
INSERT INTO `tyms_district` VALUES ('405', '凉山彝族自治州', '2', '23');
INSERT INTO `tyms_district` VALUES ('406', '贵阳市', '2', '24');
INSERT INTO `tyms_district` VALUES ('407', '六盘水市', '2', '24');
INSERT INTO `tyms_district` VALUES ('408', '遵义市', '2', '24');
INSERT INTO `tyms_district` VALUES ('409', '安顺市', '2', '24');
INSERT INTO `tyms_district` VALUES ('410', '铜仁地区', '2', '24');
INSERT INTO `tyms_district` VALUES ('411', '黔西南布依族苗族自治州', '2', '24');
INSERT INTO `tyms_district` VALUES ('412', '毕节地区', '2', '24');
INSERT INTO `tyms_district` VALUES ('413', '黔东南苗族侗族自治州', '2', '24');
INSERT INTO `tyms_district` VALUES ('414', '黔南布依族苗族自治州', '2', '24');
INSERT INTO `tyms_district` VALUES ('415', '昆明市', '2', '25');
INSERT INTO `tyms_district` VALUES ('416', '曲靖市', '2', '25');
INSERT INTO `tyms_district` VALUES ('417', '玉溪市', '2', '25');
INSERT INTO `tyms_district` VALUES ('418', '保山市', '2', '25');
INSERT INTO `tyms_district` VALUES ('419', '昭通市', '2', '25');
INSERT INTO `tyms_district` VALUES ('420', '丽江市', '2', '25');
INSERT INTO `tyms_district` VALUES ('421', '思茅市', '2', '25');
INSERT INTO `tyms_district` VALUES ('422', '临沧市', '2', '25');
INSERT INTO `tyms_district` VALUES ('423', '楚雄彝族自治州', '2', '25');
INSERT INTO `tyms_district` VALUES ('424', '红河哈尼族彝族自治州', '2', '25');
INSERT INTO `tyms_district` VALUES ('425', '文山壮族苗族自治州', '2', '25');
INSERT INTO `tyms_district` VALUES ('426', '西双版纳傣族自治州', '2', '25');
INSERT INTO `tyms_district` VALUES ('427', '大理白族自治州', '2', '25');
INSERT INTO `tyms_district` VALUES ('428', '德宏傣族景颇族自治州', '2', '25');
INSERT INTO `tyms_district` VALUES ('429', '怒江傈僳族自治州', '2', '25');
INSERT INTO `tyms_district` VALUES ('430', '迪庆藏族自治州', '2', '25');
INSERT INTO `tyms_district` VALUES ('431', '拉萨市', '2', '26');
INSERT INTO `tyms_district` VALUES ('432', '昌都地区', '2', '26');
INSERT INTO `tyms_district` VALUES ('433', '山南地区', '2', '26');
INSERT INTO `tyms_district` VALUES ('434', '日喀则地区', '2', '26');
INSERT INTO `tyms_district` VALUES ('435', '那曲地区', '2', '26');
INSERT INTO `tyms_district` VALUES ('436', '阿里地区', '2', '26');
INSERT INTO `tyms_district` VALUES ('437', '林芝地区', '2', '26');
INSERT INTO `tyms_district` VALUES ('438', '西安市', '2', '27');
INSERT INTO `tyms_district` VALUES ('439', '铜川市', '2', '27');
INSERT INTO `tyms_district` VALUES ('440', '宝鸡市', '2', '27');
INSERT INTO `tyms_district` VALUES ('441', '咸阳市', '2', '27');
INSERT INTO `tyms_district` VALUES ('442', '渭南市', '2', '27');
INSERT INTO `tyms_district` VALUES ('443', '延安市', '2', '27');
INSERT INTO `tyms_district` VALUES ('444', '汉中市', '2', '27');
INSERT INTO `tyms_district` VALUES ('445', '榆林市', '2', '27');
INSERT INTO `tyms_district` VALUES ('446', '安康市', '2', '27');
INSERT INTO `tyms_district` VALUES ('447', '商洛市', '2', '27');
INSERT INTO `tyms_district` VALUES ('448', '兰州市', '2', '28');
INSERT INTO `tyms_district` VALUES ('449', '嘉峪关市', '2', '28');
INSERT INTO `tyms_district` VALUES ('450', '金昌市', '2', '28');
INSERT INTO `tyms_district` VALUES ('451', '白银市', '2', '28');
INSERT INTO `tyms_district` VALUES ('452', '天水市', '2', '28');
INSERT INTO `tyms_district` VALUES ('453', '武威市', '2', '28');
INSERT INTO `tyms_district` VALUES ('454', '张掖市', '2', '28');
INSERT INTO `tyms_district` VALUES ('455', '平凉市', '2', '28');
INSERT INTO `tyms_district` VALUES ('456', '酒泉市', '2', '28');
INSERT INTO `tyms_district` VALUES ('457', '庆阳市', '2', '28');
INSERT INTO `tyms_district` VALUES ('458', '定西市', '2', '28');
INSERT INTO `tyms_district` VALUES ('459', '陇南市', '2', '28');
INSERT INTO `tyms_district` VALUES ('460', '临夏回族自治州', '2', '28');
INSERT INTO `tyms_district` VALUES ('461', '甘南藏族自治州', '2', '28');
INSERT INTO `tyms_district` VALUES ('462', '西宁市', '2', '29');
INSERT INTO `tyms_district` VALUES ('463', '海东地区', '2', '29');
INSERT INTO `tyms_district` VALUES ('464', '海北藏族自治州', '2', '29');
INSERT INTO `tyms_district` VALUES ('465', '黄南藏族自治州', '2', '29');
INSERT INTO `tyms_district` VALUES ('466', '海南藏族自治州', '2', '29');
INSERT INTO `tyms_district` VALUES ('467', '果洛藏族自治州', '2', '29');
INSERT INTO `tyms_district` VALUES ('468', '玉树藏族自治州', '2', '29');
INSERT INTO `tyms_district` VALUES ('469', '海西蒙古族藏族自治州', '2', '29');
INSERT INTO `tyms_district` VALUES ('470', '银川市', '2', '30');
INSERT INTO `tyms_district` VALUES ('471', '石嘴山市', '2', '30');
INSERT INTO `tyms_district` VALUES ('472', '吴忠市', '2', '30');
INSERT INTO `tyms_district` VALUES ('473', '固原市', '2', '30');
INSERT INTO `tyms_district` VALUES ('474', '中卫市', '2', '30');
INSERT INTO `tyms_district` VALUES ('475', '乌鲁木齐市', '2', '31');
INSERT INTO `tyms_district` VALUES ('476', '克拉玛依市', '2', '31');
INSERT INTO `tyms_district` VALUES ('477', '吐鲁番地区', '2', '31');
INSERT INTO `tyms_district` VALUES ('478', '哈密地区', '2', '31');
INSERT INTO `tyms_district` VALUES ('479', '昌吉回族自治州', '2', '31');
INSERT INTO `tyms_district` VALUES ('480', '博尔塔拉蒙古自治州', '2', '31');
INSERT INTO `tyms_district` VALUES ('481', '巴音郭楞蒙古自治州', '2', '31');
INSERT INTO `tyms_district` VALUES ('482', '阿克苏地区', '2', '31');
INSERT INTO `tyms_district` VALUES ('483', '克孜勒苏柯尔克孜自治州', '2', '31');
INSERT INTO `tyms_district` VALUES ('484', '喀什地区', '2', '31');
INSERT INTO `tyms_district` VALUES ('485', '和田地区', '2', '31');
INSERT INTO `tyms_district` VALUES ('486', '伊犁哈萨克自治州', '2', '31');
INSERT INTO `tyms_district` VALUES ('487', '塔城地区', '2', '31');
INSERT INTO `tyms_district` VALUES ('488', '阿勒泰地区', '2', '31');
INSERT INTO `tyms_district` VALUES ('489', '石河子市', '2', '31');
INSERT INTO `tyms_district` VALUES ('490', '阿拉尔市', '2', '31');
INSERT INTO `tyms_district` VALUES ('491', '图木舒克市', '2', '31');
INSERT INTO `tyms_district` VALUES ('492', '五家渠市', '2', '31');
INSERT INTO `tyms_district` VALUES ('493', '台北市', '2', '32');
INSERT INTO `tyms_district` VALUES ('494', '高雄市', '2', '32');
INSERT INTO `tyms_district` VALUES ('495', '基隆市', '2', '32');
INSERT INTO `tyms_district` VALUES ('496', '台中市', '2', '32');
INSERT INTO `tyms_district` VALUES ('497', '台南市', '2', '32');
INSERT INTO `tyms_district` VALUES ('498', '新竹市', '2', '32');
INSERT INTO `tyms_district` VALUES ('499', '嘉义市', '2', '32');
INSERT INTO `tyms_district` VALUES ('500', '台北县', '2', '32');
INSERT INTO `tyms_district` VALUES ('501', '宜兰县', '2', '32');
INSERT INTO `tyms_district` VALUES ('502', '桃园县', '2', '32');
INSERT INTO `tyms_district` VALUES ('503', '新竹县', '2', '32');
INSERT INTO `tyms_district` VALUES ('504', '苗栗县', '2', '32');
INSERT INTO `tyms_district` VALUES ('505', '台中县', '2', '32');
INSERT INTO `tyms_district` VALUES ('506', '彰化县', '2', '32');
INSERT INTO `tyms_district` VALUES ('507', '南投县', '2', '32');
INSERT INTO `tyms_district` VALUES ('508', '云林县', '2', '32');
INSERT INTO `tyms_district` VALUES ('509', '嘉义县', '2', '32');
INSERT INTO `tyms_district` VALUES ('510', '台南县', '2', '32');
INSERT INTO `tyms_district` VALUES ('511', '高雄县', '2', '32');
INSERT INTO `tyms_district` VALUES ('512', '屏东县', '2', '32');
INSERT INTO `tyms_district` VALUES ('513', '澎湖县', '2', '32');
INSERT INTO `tyms_district` VALUES ('514', '台东县', '2', '32');
INSERT INTO `tyms_district` VALUES ('515', '花莲县', '2', '32');
INSERT INTO `tyms_district` VALUES ('516', '中西区', '2', '33');
INSERT INTO `tyms_district` VALUES ('517', '东区', '2', '33');
INSERT INTO `tyms_district` VALUES ('518', '九龙城区', '2', '33');
INSERT INTO `tyms_district` VALUES ('519', '观塘区', '2', '33');
INSERT INTO `tyms_district` VALUES ('520', '南区', '2', '33');
INSERT INTO `tyms_district` VALUES ('521', '深水埗区', '2', '33');
INSERT INTO `tyms_district` VALUES ('522', '黄大仙区', '2', '33');
INSERT INTO `tyms_district` VALUES ('523', '湾仔区', '2', '33');

-- ----------------------------
-- Table structure for `tyms_file`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_file`;
CREATE TABLE `tyms_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(100) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of tyms_file
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_form`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_form`;
CREATE TABLE `tyms_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '表单名称',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '表单标识',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='自定义表单';

-- ----------------------------
-- Records of tyms_form
-- ----------------------------
INSERT INTO `tyms_form` VALUES ('1', 'form', 'form', '1501069567', '1501069567');

-- ----------------------------
-- Table structure for `tyms_form_form`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_form_form`;
CREATE TABLE `tyms_form_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='form';

-- ----------------------------
-- Records of tyms_form_form
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_goods_config`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_goods_config`;
CREATE TABLE `tyms_goods_config` (
  `goods_id` mediumint(1) unsigned NOT NULL COMMENT '商品id不自增',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `goods_description` varchar(255) NOT NULL DEFAULT '' COMMENT '商品描述',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`goods_id`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_goods_config
-- ----------------------------
INSERT INTO `tyms_goods_config` VALUES ('1', '纤必达21天系统营养塑身套餐', '888.00', '快速塑身套餐', '2', '1501133689');

-- ----------------------------
-- Table structure for `tyms_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_hooks`;
CREATE TABLE `tyms_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_hooks
-- ----------------------------
INSERT INTO `tyms_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `tyms_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', '', '1');
INSERT INTO `tyms_hooks` VALUES ('3', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'Sitestat,Devteam,Systeminfo', '1');

-- ----------------------------
-- Table structure for `tyms_link`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_link`;
CREATE TABLE `tyms_link` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `ftype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:友情链接 1:合作单位',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '链接地址',
  `cover_id` int(11) NOT NULL DEFAULT '0' COMMENT '封面图片ID',
  `descrip` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `hits` tinyint(7) NOT NULL DEFAULT '0' COMMENT '点击率',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uid` int(7) NOT NULL DEFAULT '0' COMMENT '用户ID ',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_link
-- ----------------------------
INSERT INTO `tyms_link` VALUES ('1', '1', '蚁族科技', 'http://www.yizukeji.cn', '0', '', '0', '0', '1462496026', '0', '1');

-- ----------------------------
-- Table structure for `tyms_member`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_member`;
CREATE TABLE `tyms_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `signature` text COMMENT '用户签名',
  `pos_province` int(11) DEFAULT '0' COMMENT '用户所在省份',
  `pos_city` int(11) DEFAULT '0' COMMENT '用户所在城市',
  `pos_district` int(11) DEFAULT '0' COMMENT '用户所在县城',
  `pos_community` int(11) DEFAULT '0' COMMENT '用户所在区域',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐值',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of tyms_member
-- ----------------------------
INSERT INTO `tyms_member` VALUES ('1', 'admin', '7525b1f1d883957e49451843911fd5b2', 'admin', 'admin@admin.com', null, '0', '0000-00-00', '123123', '0', '', '0', '0', '0', '0', 'iJhmGg', '6', '0', '1501066646', '2130706433', '1501635805', '1');

-- ----------------------------
-- Table structure for `tyms_member_extend`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_member_extend`;
CREATE TABLE `tyms_member_extend` (
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `education` int(10) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_member_extend
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_member_extend_group`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_member_extend_group`;
CREATE TABLE `tyms_member_extend_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) NOT NULL COMMENT '分组数据表',
  `profile_name` varchar(25) NOT NULL COMMENT '扩展分组名称',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `visiable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见，1可见，0不可见',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_member_extend_group
-- ----------------------------
INSERT INTO `tyms_member_extend_group` VALUES ('1', 'member_extend', '个人资料', '1403847366', '0', '1', '1');

-- ----------------------------
-- Table structure for `tyms_member_extend_setting`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_member_extend_setting`;
CREATE TABLE `tyms_member_extend_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员字段表';

-- ----------------------------
-- Records of tyms_member_extend_setting
-- ----------------------------
INSERT INTO `tyms_member_extend_setting` VALUES ('1', 'education', '学历', '10', 'select', '', '', '1', '1:小学\r\n2:初中\r\n3:高中', '0', '1', '1455930923', '1455930787');

-- ----------------------------
-- Table structure for `tyms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_menu`;
CREATE TABLE `tyms_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(10) NOT NULL DEFAULT 'admin' COMMENT '菜单类别（admin后台，user会员中心）',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '分类图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_menu
-- ----------------------------
INSERT INTO `tyms_menu` VALUES ('1', '首页', 'admin', 'home', '0', '0', 'admin/index/index', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('2', '系统', 'admin', 'laptop', '0', '9', 'admin/config/group', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('3', '内容', 'admin', 'list', '0', '6', 'admin/category/index', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('4', '权限', 'admin', 'lock', '0', '7', 'admin/user/index', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('35', '产品', 'admin', 'shopping-cart', '0', '1', 'admin/goods/index', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('21', '友链管理', 'admin', 'link', '3', '0', 'admin/link/index', '1', '', '运营管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('7', '更新缓存', 'admin', 'refresh', '1', '0', 'admin/index/clear', '0', '', '后台首页', '0', '0');
INSERT INTO `tyms_menu` VALUES ('8', '配置管理', 'admin', 'cogs', '2', '0', 'admin/config/group', '0', '', '系统配置', '0', '0');
INSERT INTO `tyms_menu` VALUES ('9', '菜单管理', 'admin', 'book', '2', '0', 'admin/menu/index', '0', '', '系统配置', '0', '0');
INSERT INTO `tyms_menu` VALUES ('10', '导航管理', 'admin', 'map-marker', '2', '0', 'admin/channel/index', '0', '', '系统配置', '0', '0');
INSERT INTO `tyms_menu` VALUES ('12', '数据恢复', 'admin', 'mail-reply', '37', '2', 'admin/database/index?type=import', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('13', 'SEO设置', 'admin', 'anchor', '2', '0', 'admin/seo/index', '0', '', '优化设置', '0', '0');
INSERT INTO `tyms_menu` VALUES ('14', '文章分类', 'admin', 'list-ol', '3', '1', 'admin/category/index', '0', '', '内容配置', '0', '0');
INSERT INTO `tyms_menu` VALUES ('15', '模型管理', 'admin', 'th-list', '3', '2', 'admin/model/index', '0', '', '内容配置', '0', '0');
INSERT INTO `tyms_menu` VALUES ('16', '管理员列表', 'admin', 'user', '4', '0', 'admin/user/index', '0', '', '用户管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('17', '管理员组别', 'admin', 'users', '4', '0', 'admin/group/index', '0', '', '用户管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('18', '权限列表', 'admin', 'paw', '4', '0', 'admin/group/access', '0', '', '用户管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('19', '行为列表', 'admin', 'file-text', '4', '0', 'admin/action/index', '1', '', '行为管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('20', '行为日志', 'admin', 'clipboard', '4', '0', 'admin/action/log', '1', '', '行为管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('22', '广告管理', 'admin', 'cc', '2', '0', 'admin/ad/index', '0', '', '运营管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('23', '插件列表', 'admin', 'usb', '2', '0', 'admin/addons/index', '0', '', '插件管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('24', '钩子列表', 'admin', 'code', '2', '0', 'admin/addons/hooks', '0', '', '插件管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('26', '伪静态规则', 'admin', 'magnet', '2', '0', 'admin/seo/rewrite', '0', '', '优化设置', '0', '0');
INSERT INTO `tyms_menu` VALUES ('27', '主题管理', 'admin', 'heartbeat', '2', '0', 'admin/config/themes', '0', '', '系统配置', '0', '0');
INSERT INTO `tyms_menu` VALUES ('28', '木马查杀', 'admin', 'medkit', '1', '0', 'admin/scan/index', '0', '', '后台首页', '0', '0');
INSERT INTO `tyms_menu` VALUES ('29', ' 公众号设置', 'admin', 'comments', '1', '0', 'admin/wechat/index', '0', '', '微信管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('30', '微信菜单', 'admin', 'navicon', '1', '0', 'admin/wechat/menu', '0', '', '微信管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('31', ' 文本回复', 'admin', 'file-text-o', '1', '0', 'admin/wechat/text', '0', '', '微信管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('32', ' 图文回复', 'admin', 'file-picture-o', '1', '0', 'admin/wechat/img', '0', '', '微信管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('33', '会员', 'admin', 'user', '0', '3', 'admin/member/index', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('34', '会员列表', 'admin', 'user', '33', '1', 'admin/member/index', '0', '', '会员管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('36', '产品管理', 'admin', 'shopping-cart', '35', '0', 'admin/goods/index', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('37', '数据库', 'admin', 'database', '0', '4', 'admin/database/index?type=export', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('38', '数据备份', 'admin', 'exchange', '37', '1', 'admin/database/index?type=export', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('39', '提现申请', 'admin', 'money', '33', '2', 'admin/member/withdrawals', '0', '', '提现管理', '0', '0');
INSERT INTO `tyms_menu` VALUES ('40', '订单', 'admin', 'credit-card', '0', '2', 'admin/order/index', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('41', '订单列表', 'admin', 'credit-card', '40', '0', 'admin/order/index', '0', '', '', '0', '0');
INSERT INTO `tyms_menu` VALUES ('42', '会员类型', 'admin', 'user', '33', '0', 'admin/member/users_type', '0', '', '会员管理', '0', '0');

-- ----------------------------
-- Table structure for `tyms_model`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_model`;
CREATE TABLE `tyms_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `icon` varchar(20) NOT NULL COMMENT '模型图标',
  `is_doc` int(2) NOT NULL DEFAULT '1' COMMENT '是否为文档模型',
  `attribute_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '25' COMMENT '列表数据长度',
  `search_key` varchar(50) DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) DEFAULT '' COMMENT '高级搜索的字段',
  `template_list` varchar(255) DEFAULT '' COMMENT '列表显示模板',
  `template_add` varchar(255) DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(255) DEFAULT '' COMMENT '编辑模板',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of tyms_model
-- ----------------------------
INSERT INTO `tyms_model` VALUES ('2', 'article', '百问百答', '', '1', '1:基础', 'id:ID\r\ntitle:标题\r\ncreate_time:添加时间|time_format\r\nupdate_time:更新时间|time_format', '25', '', '', '', '', '', '1', '1501071680', '1501118838');

-- ----------------------------
-- Table structure for `tyms_order`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_order`;
CREATE TABLE `tyms_order` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '订单金额',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `goods_id` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '商品ID',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  UNIQUE KEY `add_time` (`add_time`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_order
-- ----------------------------
INSERT INTO `tyms_order` VALUES ('1', '201708021508', '1', '100.00', '1501657709', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `tyms_picture`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_picture`;
CREATE TABLE `tyms_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_picture
-- ----------------------------
INSERT INTO `tyms_picture` VALUES ('1', '/uploads/picture/20170726/685cd12e2e907967aeea35b12592bda1.jpg', '/uploads/picture/20170726/685cd12e2e907967aeea35b12592bda1.jpg', '061edf0dbfaec088fd36eff434bfe038', '66e05f15e8fe483a5bcf4f6a7656d848097a6a49', '1', '1501068459');
INSERT INTO `tyms_picture` VALUES ('2', '/uploads/picture/20170727/fd604752e5a7332e1f37ca072b0837a9.png', '/uploads/picture/20170727/fd604752e5a7332e1f37ca072b0837a9.png', '8b4d73e6595f576ed81488dcd2bf023b', 'a7d3094e5fc76dd5ce0fefc2897a738ca9dbe231', '1', '1501122775');
INSERT INTO `tyms_picture` VALUES ('3', '/uploads/picture/20170802/c49ef6fd31d2bb82e4ec33e407786923.jpg', '/uploads/picture/20170802/c49ef6fd31d2bb82e4ec33e407786923.jpg', '7286df589338035c7395b51f8a9c43f4', '4a4330cd0274d03eedebb636b6a0371337661556', '1', '1501662114');
INSERT INTO `tyms_picture` VALUES ('4', '/uploads/picture/20170802/c01fc7ccef777d162954883fb40caa57.jpg', '/uploads/picture/20170802/c01fc7ccef777d162954883fb40caa57.jpg', '2cf182f0f9e13d019baaeab6d7bef397', 'd37c4d9aad8e29a5267082dff972fe887802d1ea', '1', '1501663712');
INSERT INTO `tyms_picture` VALUES ('5', '/uploads/picture/20170802/e6999171c851230e35f3f4a4d6d7d956.jpg', '/uploads/picture/20170802/e6999171c851230e35f3f4a4d6d7d956.jpg', 'c98c7ed8b0d77d4fc39be922d102d019', 'f367be3cd1f5502461728acae14a835ca87413a1', '1', '1501663718');
INSERT INTO `tyms_picture` VALUES ('6', '/uploads/picture/20170802/aa424482c2a613e134dd6c0d26776a7a.jpg', '/uploads/picture/20170802/aa424482c2a613e134dd6c0d26776a7a.jpg', '7286df589338035c7395b51f8a9c43f4', '4a4330cd0274d03eedebb636b6a0371337661556', '1', '1501663724');

-- ----------------------------
-- Table structure for `tyms_rewrite`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_rewrite`;
CREATE TABLE `tyms_rewrite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '规则',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='伪静态表';

-- ----------------------------
-- Records of tyms_rewrite
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_seo_rule`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_seo_rule`;
CREATE TABLE `tyms_seo_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` text NOT NULL COMMENT '规则标题',
  `app` varchar(40) DEFAULT NULL,
  `controller` varchar(40) DEFAULT NULL,
  `action` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `seo_title` text NOT NULL COMMENT 'SEO标题',
  `seo_keywords` text NOT NULL COMMENT 'SEO关键词',
  `seo_description` text NOT NULL COMMENT 'SEO描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_seo_rule
-- ----------------------------
INSERT INTO `tyms_seo_rule` VALUES ('1', '整站标题', '', '', '', '1', 'YizuCMS网站管理系统', 'YizuCMS网站管理系统', 'YizuCMS网站管理系统', '7');

-- ----------------------------
-- Table structure for `tyms_sync_login`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_sync_login`;
CREATE TABLE `tyms_sync_login` (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tyms_sync_login
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_users`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_users`;
CREATE TABLE `tyms_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '微信昵称',
  `head_pic` varchar(255) DEFAULT NULL COMMENT '微信头像',
  `openid` varchar(100) DEFAULT NULL COMMENT '微信openid',
  `real_name` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `users_type` tinyint(1) unsigned NOT NULL COMMENT '会员类型',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员等级',
  `is_distribut` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为分销商 0 否 1 是',
  `present_weight` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '目前体重 单位kg',
  `target_weight` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '目标体重 单位kg',
  `parentids` varchar(255) NOT NULL COMMENT '上级ids',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`user_id`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM AUTO_INCREMENT=2592 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_users
-- ----------------------------
INSERT INTO `tyms_users` VALUES ('1', 'hello', '', null, '', '0', '13800138006', '4', '0', '0', '0', '', '1245048540');
INSERT INTO `tyms_users` VALUES ('2', null, null, null, '', '0', '', '1', '0', '0', '0', '', '1245048540');
INSERT INTO `tyms_users` VALUES ('5', null, null, null, '', '0', '13800138070', '1', '0', '0', '0', '', '1245048540');
INSERT INTO `tyms_users` VALUES ('13', '支付宝用户', null, '2088502287689843', '', '0', '', '1', '0', '0', '0', '', '1452152213');
INSERT INTO `tyms_users` VALUES ('14', '支付宝用户', null, '2088702176714764', '', '0', '13527626251', '1', '0', '0', '0', '', '1455951476');
INSERT INTO `tyms_users` VALUES ('17', '15889560679', null, null, '', '0', '15889560679', '1', '0', '0', '0', '', '1456967563');
INSERT INTO `tyms_users` VALUES ('18', 'QQ用户', null, '7EDE8DFC152E4775A9C2364F6AF8EE0F', '', '0', '', '1', '0', '0', '0', '', '1458012281');
INSERT INTO `tyms_users` VALUES ('19', 'QQ用户', null, 'FCC5C85BED6E6ABC35419FE368A00727', '', '0', '', '1', '0', '0', '0', '', '1458014985');
INSERT INTO `tyms_users` VALUES ('20', 'QQ用户', null, 'FA0F766456C3521A13CD4224C4BD8FB0', '', '0', '', '1', '0', '0', '0', '', '1458027904');
INSERT INTO `tyms_users` VALUES ('21', null, null, 'ov6YJuFRy4LyRi0nJVuCaTN3R0a8', '', '0', '', '2', '0', '0', '0', '', '1458117558');
INSERT INTO `tyms_users` VALUES ('22', 'QQ用户', null, '11E4EE0B9DE5EE7DFAC16C1D33E60EB9', '', '0', '', '1', '0', '0', '0', '', '1460800970');
INSERT INTO `tyms_users` VALUES ('23', 'admin@qq.com', null, null, '', '0', '', '1', '0', '0', '0', '', '1461054700');
INSERT INTO `tyms_users` VALUES ('24', '当然想', null, 'oyP7DwOjfAEaqMiuBnK3c8O6MXvA100', '', '0', '', '1', '1', '0', '0', '', '1462776737');
INSERT INTO `tyms_users` VALUES ('25', null, null, 'oyP7DwI3MEgsxk2XsoV3MNtj_-SQ11', '', '0', '', '1', '0', '0', '0', '', '1462776847');
INSERT INTO `tyms_users` VALUES ('26', null, null, 'oyP7DwObuNn-btWG43eyb4nbf2l8', '', '0', '', '1', '0', '0', '0', '', '1462782703');
INSERT INTO `tyms_users` VALUES ('27', null, null, 'oyP7DwAba0XnqrA_BUTTOhaCi1CI', '', '0', '', '1', '0', '0', '0', '', '1462790645');
INSERT INTO `tyms_users` VALUES ('28', null, null, 'oyP7DwHaQWPWasysxaehsI8T2T8I', '', '0', '', '1', '0', '0', '0', '', '1462805957');
INSERT INTO `tyms_users` VALUES ('29', null, null, 'oyP7DwG9Dnx8dN-WTdgi9PlSd7rc', '', '0', '', '1', '0', '0', '0', '', '1462891163');
INSERT INTO `tyms_users` VALUES ('30', null, null, 'oyP7DwMMXs4-XIZGZRMAiVspFgHM', '', '0', '', '1', '0', '0', '0', '', '1462927866');
INSERT INTO `tyms_users` VALUES ('31', null, null, 'oyP7DwJHJt1VhC7WyVDnX6NFjphI', '', '0', '', '1', '0', '0', '0', '', '1462937473');
INSERT INTO `tyms_users` VALUES ('32', null, null, 'oyP7DwM6ja5eDjVxcshrDdgfgQL0', '', '0', '', '1', '0', '0', '0', '', '1462938634');
INSERT INTO `tyms_users` VALUES ('33', null, null, 'oyP7DwDmYJ_Ni6PcvgDkdPiKt_Cg', '', '0', '', '1', '0', '0', '0', '', '1462942529');
INSERT INTO `tyms_users` VALUES ('34', null, null, 'oyP7DwIPYSH2UOJ_KpqPHTPLgddc', '', '0', '', '1', '0', '0', '0', '', '1462969900');
INSERT INTO `tyms_users` VALUES ('35', null, null, 'oyP7DwFw9aB1JTJFUoIvhQhtG4k4', '', '0', '', '1', '0', '0', '0', '', '1463011770');
INSERT INTO `tyms_users` VALUES ('36', null, null, 'oyP7DwLtr2oZ0DncBaMt5Hkqmrug', '', '0', '', '1', '0', '0', '0', '', '1463022121');
INSERT INTO `tyms_users` VALUES ('37', null, null, 'oyP7DwL0sKeZLhuLhi_0nDA2BEWc', '', '0', '', '1', '0', '0', '0', '', '1463023148');
INSERT INTO `tyms_users` VALUES ('38', null, null, 'oyP7DwOZMtC632YlRXjCM7iWI5so', '', '0', '', '1', '0', '0', '0', '', '1463037833');
INSERT INTO `tyms_users` VALUES ('39', null, null, 'oyP7DwHa52dI8NKGDUYC1E0eNxyU', '', '0', '', '1', '0', '0', '0', '', '1463040330');
INSERT INTO `tyms_users` VALUES ('40', null, null, 'oyP7DwD8I8idV5bGMlXfDuqKzYto', '', '0', '', '1', '0', '0', '0', '', '1463101044');
INSERT INTO `tyms_users` VALUES ('41', null, null, 'oyP7DwPfubsbOfO8cqyk9HpgePZs', '', '0', '', '1', '0', '0', '0', '', '1463109066');
INSERT INTO `tyms_users` VALUES ('42', null, null, 'oyP7DwJ7J47OqVii-_tGQ-hnWeVM', '', '0', '', '1', '0', '0', '0', '', '1463114836');
INSERT INTO `tyms_users` VALUES ('43', null, null, 'oyP7DwGrJ8g9yIh6xu01oiJcPVQY', '', '0', '', '1', '0', '0', '0', '', '1463120500');
INSERT INTO `tyms_users` VALUES ('44', null, null, 'oyP7DwNLUVpa-H8gIgtLsfKYas1E', '', '0', '', '1', '0', '0', '0', '', '1463152386');
INSERT INTO `tyms_users` VALUES ('45', null, null, 'oyP7DwCmFolV778g4DvaM9iSc3cQ', '', '0', '', '1', '0', '0', '0', '', '1463192422');
INSERT INTO `tyms_users` VALUES ('46', null, null, 'oJdmCw9lJpc48dG2Gr5A1ALxIC74', '', '0', '', '1', '0', '0', '0', '', '1463205178');
INSERT INTO `tyms_users` VALUES ('47', null, null, 'oJdmCw2biby9lgxSkH8RQHE_h-Co', '', '0', '', '1', '0', '0', '0', '', '1463211490');
INSERT INTO `tyms_users` VALUES ('48', null, null, 'oJdmCw51zWqUQ_HYGc3i5mvupiVQ', '', '0', '', '1', '0', '0', '0', '', '1463245529');
INSERT INTO `tyms_users` VALUES ('49', null, null, 'oJdmCw7Ih77Ft5_-c6xx8J03H-cQ', '', '0', '', '1', '0', '0', '0', '', '1463249022');
INSERT INTO `tyms_users` VALUES ('50', null, null, 'oJdmCwwlLmG_GVP9fIP-LM2JIgdw', '', '0', '', '1', '0', '0', '0', '', '1463282748');
INSERT INTO `tyms_users` VALUES ('51', null, null, 'oJdmCwy1W5ahVfYT-6wymHrhCQwc', '', '0', '', '1', '0', '0', '0', '', '1463307492');
INSERT INTO `tyms_users` VALUES ('52', null, null, 'oJdmCwy3Ac2klwa_DAi-dXbXucvU', '', '0', '', '1', '0', '0', '0', '', '1463311937');
INSERT INTO `tyms_users` VALUES ('53', 'QQ用户', null, '21EFCC02C014475494C7596073B134A1', '', '0', '', '1', '0', '0', '0', '', '1463449416');
INSERT INTO `tyms_users` VALUES ('54', null, null, 'oyP7DwE_y16KoQ1PsqZofhYRtc4M11111', '', '0', '', '1', '0', '0', '0', '', '1463453490');
INSERT INTO `tyms_users` VALUES ('55', null, null, 'oyP7DwAN6dEprPCUoAT80CE5moSc', '', '0', '', '1', '0', '0', '0', '', '1463479495');
INSERT INTO `tyms_users` VALUES ('56', null, null, 'oyP7DwPcxJm_mlIq1oMHUXSQFZ8Q', '', '0', '', '1', '0', '0', '0', '', '1463505080');
INSERT INTO `tyms_users` VALUES ('57', null, null, 'oyP7DwLI_2H1WGzZCnoVjT74sags', '', '0', '', '1', '0', '0', '0', '', '1463552444');
INSERT INTO `tyms_users` VALUES ('58', null, null, 'oyP7DwBqxN15u2cs9tbsA8CCfaVg', '', '0', '', '1', '0', '0', '0', '', '1463553044');
INSERT INTO `tyms_users` VALUES ('59', null, null, 'oyP7DwAKp2V_9htMxHHGItOmUgpQ', '', '0', '', '1', '0', '0', '0', '', '1463562851');
INSERT INTO `tyms_users` VALUES ('60', null, null, 'oyP7DwOGYjDlJtO50nFb6V5b1W5A', '', '0', '', '1', '0', '0', '0', '', '1463591448');
INSERT INTO `tyms_users` VALUES ('61', null, null, 'oyP7DwDlxsqYifn05uEaZbdUAqG0', '', '0', '', '1', '0', '0', '0', '', '1463625862');
INSERT INTO `tyms_users` VALUES ('62', null, null, 'oyP7DwHZFFlxVIGg9ovcsLSWFk-E', '', '0', '', '1', '0', '0', '0', '', '1463626375');
INSERT INTO `tyms_users` VALUES ('63', null, null, 'oyP7DwDLrAQqG-tRULKAK88IHTQs', '', '0', '', '1', '0', '0', '0', '', '1463628588');
INSERT INTO `tyms_users` VALUES ('64', null, null, 'oyP7DwPB9X0cM7E__iAyGRIRjzHw', '', '0', '', '1', '0', '0', '0', '', '1463638984');
INSERT INTO `tyms_users` VALUES ('65', null, null, 'oyP7DwMhxfwEUOmCFaCeBtKef764', '', '0', '', '1', '0', '0', '0', '', '1463640330');
INSERT INTO `tyms_users` VALUES ('66', null, null, 'oyP7DwBup3BoObgYGuwMaQE2Uc4o', '', '0', '', '1', '0', '0', '0', '', '1463640759');
INSERT INTO `tyms_users` VALUES ('67', null, null, 'oyP7DwMkBImNWdbpicnM32p-UPp0', '', '0', '', '1', '0', '0', '0', '', '1463642423');
INSERT INTO `tyms_users` VALUES ('68', null, null, 'oyP7DwGwzPuj4txCIASSGGoie0H8', '', '0', '', '1', '0', '0', '0', '', '1463648869');
INSERT INTO `tyms_users` VALUES ('69', null, null, 'oyP7DwC-_B-2LOp4nEYPW_SxcjrQ', '', '0', '', '1', '0', '0', '0', '', '1463648890');
INSERT INTO `tyms_users` VALUES ('70', null, null, 'oyP7DwKvjidr4YJuoyoc0gUzPiWY', '', '0', '', '1', '0', '0', '0', '', '1463666463');
INSERT INTO `tyms_users` VALUES ('71', null, null, 'oyP7DwJU1djPzqnUDq3VmUDKY5NY', '', '0', '', '1', '0', '0', '0', '', '1463727025');
INSERT INTO `tyms_users` VALUES ('72', null, null, 'oyP7DwNqfVYLBs6bCyK3P0o22XnE', '', '0', '', '1', '0', '0', '0', '', '1463733248');
INSERT INTO `tyms_users` VALUES ('73', null, null, 'oyP7DwM2GjYaBke3aH1r_nmLiwdU', '', '0', '', '1', '0', '0', '0', '', '1463747761');
INSERT INTO `tyms_users` VALUES ('74', null, null, 'oyP7DwPnFouBKVft-LEp_lhIOZmQ', '', '0', '', '1', '0', '0', '0', '', '1463751019');
INSERT INTO `tyms_users` VALUES ('75', null, null, 'oyP7DwLh9pA7WF8oJIPraFFno6vU', '', '0', '', '1', '0', '0', '0', '', '1463768579');
INSERT INTO `tyms_users` VALUES ('76', null, null, 'oyP7DwMKm022Sln9idN6tqGe6QrI', '', '0', '', '1', '0', '0', '0', '', '1463798542');
INSERT INTO `tyms_users` VALUES ('77', null, null, 'oyP7DwOfe3ANmvWRxehedgAzAMJ0', '', '0', '', '1', '0', '0', '0', '', '1463798933');
INSERT INTO `tyms_users` VALUES ('78', null, null, 'oyP7DwPYjFPFOZfwkAZuJmVlBkNY', '', '0', '', '1', '0', '0', '0', '', '1463800403');
INSERT INTO `tyms_users` VALUES ('79', null, null, 'oyP7DwFW86s9WB0og5iI9qvfDv3c', '', '0', '', '1', '0', '0', '0', '', '1463800696');
INSERT INTO `tyms_users` VALUES ('80', null, null, 'oyP7DwLnfyOt8F69gt9Z2hcNKWvk', '', '0', '', '1', '0', '0', '0', '', '1463805817');
INSERT INTO `tyms_users` VALUES ('81', '18668115507', null, null, '', '0', '18668115507', '1', '0', '0', '0', '', '1463830119');
INSERT INTO `tyms_users` VALUES ('82', null, null, 'oyP7DwJztdwLl2euVdVYDaW5nySY', '', '0', '', '1', '0', '0', '0', '', '1463911159');
INSERT INTO `tyms_users` VALUES ('83', null, null, 'oyP7DwMElWYd2iILNt1QRFT4NL_U', '', '0', '', '1', '0', '0', '0', '', '1463911315');
INSERT INTO `tyms_users` VALUES ('84', null, null, 'oyP7DwDuwbQnW27JD87yJkCdmSco', '', '0', '', '1', '0', '0', '0', '', '1463928787');
INSERT INTO `tyms_users` VALUES ('85', null, null, 'oyP7DwPzl9vBGt2RYYRocozQSOPs', '', '0', '', '1', '0', '0', '0', '', '1463929247');
INSERT INTO `tyms_users` VALUES ('86', 'QQ用户', null, '021623CBE8EB1E431A00964C80BE66BD', '', '0', '', '1', '0', '0', '0', '', '1463930881');
INSERT INTO `tyms_users` VALUES ('87', null, null, 'oyP7DwKcuXLjJ0qWjo9KXk2T2WzQ', '', '0', '', '1', '0', '0', '0', '', '1463969992');
INSERT INTO `tyms_users` VALUES ('88', null, null, 'oyP7DwGSUBDyYNTLP2Zk9ZhXk-dg', '', '0', '', '1', '0', '0', '0', '', '1463972567');
INSERT INTO `tyms_users` VALUES ('89', null, null, 'oyP7DwHimyCDdB_BebiX11KP3JfM', '', '0', '', '1', '0', '0', '0', '', '1463981480');
INSERT INTO `tyms_users` VALUES ('90', null, null, 'oyP7DwP8xZYdic8S7GJEjDS8zo50', '', '0', '', '1', '0', '0', '0', '', '1463985830');
INSERT INTO `tyms_users` VALUES ('91', null, null, 'oyP7DwJ35Lsy05gEnNiKlTdHpJQI', '', '0', '', '1', '0', '0', '0', '', '1464001335');
INSERT INTO `tyms_users` VALUES ('92', null, null, 'oyP7DwPajxF2NCt8vc21KVAnSjtg', '', '0', '', '1', '0', '0', '0', '', '1464001763');
INSERT INTO `tyms_users` VALUES ('93', 'QQ用户', null, '63A3F78B141AE1F5CC189438450DB35B', '', '0', '', '1', '0', '0', '0', '', '1464040723');
INSERT INTO `tyms_users` VALUES ('94', null, null, 'oyP7DwDyo6lDwASf5Id2qrxaS-Wk', '', '0', '', '1', '0', '0', '0', '', '1464051275');
INSERT INTO `tyms_users` VALUES ('95', '18081240805', null, null, '', '0', '18081240805', '1', '0', '0', '0', '', '1464053547');
INSERT INTO `tyms_users` VALUES ('96', 'QQ用户', null, '43627FE89709323198EC51DA36DA905B', '', '0', '', '1', '0', '0', '0', '', '1464054594');
INSERT INTO `tyms_users` VALUES ('97', '13721062485', null, null, '', '0', '13721062485', '1', '0', '0', '0', '', '1464054669');
INSERT INTO `tyms_users` VALUES ('98', null, null, 'oyP7DwACbwV7X8LSL2iSWI_4nY4I', '', '0', '', '1', '0', '0', '0', '', '1464056689');
INSERT INTO `tyms_users` VALUES ('99', null, null, 'oyP7DwIfWMRXBy-qLntOj2cbUZmg', '', '0', '', '1', '0', '0', '0', '', '1464056967');
INSERT INTO `tyms_users` VALUES ('100', null, null, 'oyP7DwIyOAhdXkqndf_6ZqB3MGxM', '', '0', '', '1', '0', '0', '0', '', '1464057024');
INSERT INTO `tyms_users` VALUES ('101', null, null, 'oyP7DwCDtEauhXtU0gMGXUcXpUbY', '', '0', '', '1', '0', '0', '0', '', '1464057784');
INSERT INTO `tyms_users` VALUES ('102', null, null, 'oyP7DwDASAfHI5u1GhRHWFQJ262A', '', '0', '', '1', '0', '0', '0', '', '1464057954');
INSERT INTO `tyms_users` VALUES ('103', '9689259@qq.com', null, null, '', '0', '', '1', '0', '0', '0', '', '1464060099');
INSERT INTO `tyms_users` VALUES ('104', null, null, 'oyP7DwM6DJSnpjGgFpfm_YN6c5yA', '', '0', '', '1', '0', '0', '0', '', '1464060231');
INSERT INTO `tyms_users` VALUES ('105', null, null, 'oyP7DwG69hXDK3-pbm4ghnRi1JpE', '', '0', '', '1', '0', '0', '0', '', '1464061114');
INSERT INTO `tyms_users` VALUES ('106', 'QQ用户', null, '315C535B96C0172CEDEC341E96116D0A', '', '0', '', '1', '0', '0', '0', '', '1464068199');
INSERT INTO `tyms_users` VALUES ('107', null, null, 'oyP7DwOTRZMgKK2Gq92K5FgFWgV8', '', '0', '', '1', '0', '0', '0', '', '1464071916');
INSERT INTO `tyms_users` VALUES ('108', null, null, 'oyP7DwOT7xUmnGp-TlXr5QVxN8cQ', '', '0', '', '1', '0', '0', '0', '', '1464074949');
INSERT INTO `tyms_users` VALUES ('109', 'QQ用户', null, '5828031B79014DFFFD160D15D6C4B53B', '', '0', '', '1', '0', '0', '0', '', '1464075268');
INSERT INTO `tyms_users` VALUES ('110', null, null, 'oyP7DwJC55NUTiJa_v-ImFGgiSIc', '', '0', '', '1', '0', '0', '0', '', '1464077028');
INSERT INTO `tyms_users` VALUES ('111', null, null, 'oyP7DwNsWIfOB2GPjayT7QHukkxQ', '', '0', '', '1', '0', '0', '0', '', '1464084901');
INSERT INTO `tyms_users` VALUES ('112', null, null, 'oyP7DwNtaKz2jDZxAPQNczyo7C2U', '', '0', '', '1', '0', '0', '0', '', '1464141281');
INSERT INTO `tyms_users` VALUES ('113', '文浩', null, 'oyP7DwELaAJd7rZWkj-2k65-I2_c', '', '0', '', '1', '0', '0', '0', '', '1464152627');
INSERT INTO `tyms_users` VALUES ('114', null, null, 'oyP7DwOlBy4KgNigYCn_TjbpRqk8', '', '0', '', '1', '0', '0', '0', '', '1464156617');
INSERT INTO `tyms_users` VALUES ('115', 'QQ用户', null, '6E3C488B2EEF423E683958D25476BE0A', '', '0', '', '1', '0', '0', '0', '', '1464162966');
INSERT INTO `tyms_users` VALUES ('116', null, null, 'oyP7DwPBmoRHaaAgtYolt2w5tt3I', '', '0', '', '1', '0', '0', '0', '', '1464168000');
INSERT INTO `tyms_users` VALUES ('117', null, null, 'oyP7DwPYnpy0W6lx4Mzdrk9Czp9I', '', '0', '', '1', '0', '0', '0', '', '1464266018');
INSERT INTO `tyms_users` VALUES ('118', null, null, 'oyP7DwLPhuuyumuO-gyZDrEmwaQQ', '', '0', '', '1', '0', '0', '0', '', '1464313576');
INSERT INTO `tyms_users` VALUES ('119', null, null, 'oyP7DwIVmdQgQAIpgGK7eP6QHVVY', '', '0', '', '1', '0', '0', '0', '', '1464318576');
INSERT INTO `tyms_users` VALUES ('120', null, null, 'oyP7DwEs_AtPu8JeU1gyRLg5pmxk', '', '0', '', '1', '0', '0', '0', '', '1464359596');
INSERT INTO `tyms_users` VALUES ('121', '星辰', null, 'oyP7DwLOJ2UIPn2r1-ceeNy0bKUk', '', '0', '', '1', '0', '0', '0', '', '1464406251');
INSERT INTO `tyms_users` VALUES ('122', null, null, 'oyP7DwCp0gjCSqNKfPLPx7hYyYo8', '', '0', '', '1', '0', '0', '0', '', '1464505828');
INSERT INTO `tyms_users` VALUES ('123', null, null, 'oyP7DwPTauC44Uj9ocyrRUdGTDsM', '', '0', '', '1', '0', '0', '0', '', '1464512017');
INSERT INTO `tyms_users` VALUES ('124', '多多唛', null, 'oyP7DwN5jmM-t4XYcAKHNmRgn1x8', '', '0', '', '1', '0', '0', '0', '', '1464524985');
INSERT INTO `tyms_users` VALUES ('125', null, null, 'oyP7DwLneWuRme8CXz9ePNCA9iuo', '', '0', '', '1', '0', '0', '0', '', '1464592110');
INSERT INTO `tyms_users` VALUES ('126', null, null, 'oyP7DwG0YabJYU4tai9c9Qn-NUgY', '', '0', '', '1', '0', '0', '0', '', '1464594264');
INSERT INTO `tyms_users` VALUES ('127', 'QQ用户', null, '4B50F65BFFD5D138CAF5AB50EA9A5329', '', '0', '', '1', '0', '0', '0', '', '1464595629');
INSERT INTO `tyms_users` VALUES ('128', null, null, 'oyP7DwPhrZKxeIOu85D7sbLjnrAc', '', '0', '', '1', '0', '0', '0', '', '1464666630');
INSERT INTO `tyms_users` VALUES ('129', null, null, 'oyP7DwKYawEPV8ADa4rBCdOSy6p8', '', '0', '', '1', '0', '0', '0', '', '1464685691');
INSERT INTO `tyms_users` VALUES ('130', null, null, 'oyP7DwHpLaemRVgpHC-FENsGYzJ8', '', '0', '', '1', '0', '0', '0', '', '1464761915');
INSERT INTO `tyms_users` VALUES ('131', 'QQ用户', null, '0F924E48F7EF061285934B7F67E46FCB', '', '0', '', '1', '0', '0', '0', '', '1465110413');
INSERT INTO `tyms_users` VALUES ('132', '18681372520', null, null, '', '0', '18681372520', '1', '0', '0', '0', '', '1465180069');
INSERT INTO `tyms_users` VALUES ('133', null, null, 'oyP7DwAqUWSbBoQaOBFRHO7oGPpU', '', '0', '', '1', '0', '0', '0', '', '1465185030');
INSERT INTO `tyms_users` VALUES ('134', null, null, 'oyP7DwItiqCQVBP_VMFeaSXBaAjs', '', '0', '', '1', '0', '0', '0', '', '1465188694');
INSERT INTO `tyms_users` VALUES ('135', null, null, 'oyP7DwOc2BBxUvhKkqQkIcXft698', '', '0', '', '1', '0', '0', '0', '', '1465190770');
INSERT INTO `tyms_users` VALUES ('136', null, null, 'oyP7DwB1lAbZkHZfeYOri0hIONBY', '', '0', '', '1', '0', '0', '0', '', '1465221720');
INSERT INTO `tyms_users` VALUES ('137', null, null, 'oyP7DwCvchfJ2RKh-icQMkU-UqTg', '', '0', '', '1', '0', '0', '0', '', '1465274546');
INSERT INTO `tyms_users` VALUES ('138', null, null, 'oyP7DwN25XFaXsMc3E-C29hElVjE', '', '0', '', '1', '0', '0', '0', '', '1465276270');
INSERT INTO `tyms_users` VALUES ('139', null, null, 'oyP7DwHLqXX3vPB5ZvJ6fk2dv5Ls', '', '0', '', '1', '0', '0', '0', '', '1465286455');
INSERT INTO `tyms_users` VALUES ('140', null, null, 'oyP7DwMxJ1STb9VH5oF0FMoCNNaQ', '', '0', '', '1', '0', '0', '0', '', '1465291597');
INSERT INTO `tyms_users` VALUES ('141', null, null, 'oyP7DwD5brsnvhNXtkqo_D7PEJXo', '', '0', '', '1', '0', '0', '0', '', '1465292857');
INSERT INTO `tyms_users` VALUES ('142', null, null, 'oyP7DwCBdje6YxNCINUF-lXOpZWg', '', '0', '', '1', '0', '0', '0', '', '1465295531');
INSERT INTO `tyms_users` VALUES ('143', null, null, 'oyP7DwFKsN82PkVg92pXzqfj6hac', '', '0', '', '1', '0', '0', '0', '', '1465353468');
INSERT INTO `tyms_users` VALUES ('144', null, null, 'oyP7DwF37AFpxzJuVV4pA2qqb8p8', '', '0', '', '1', '0', '0', '0', '', '1465357803');
INSERT INTO `tyms_users` VALUES ('145', null, null, 'oyP7DwJxc_J8a-tiXyxX1hh6qlSo', '', '0', '', '1', '0', '0', '0', '', '1465398808');
INSERT INTO `tyms_users` VALUES ('146', null, null, 'oyP7DwDJmUG8ixdHvRR6VhwaOKFc', '', '0', '', '1', '0', '0', '0', '', '1465484670');
INSERT INTO `tyms_users` VALUES ('147', null, null, 'oyP7DwH6MbkSVujsYfuGimiz20bo', '', '0', '', '1', '0', '0', '0', '', '1465533852');
INSERT INTO `tyms_users` VALUES ('148', 'QQ用户', null, '45B1AFE9BB61E514472CA6991205527E', '', '0', '', '1', '0', '0', '0', '', '1465553883');
INSERT INTO `tyms_users` VALUES ('149', null, null, 'oyP7DwI2Ru-3id7CgPOEJ30VPEEI', '', '0', '', '1', '0', '0', '0', '', '1465580610');
INSERT INTO `tyms_users` VALUES ('150', null, null, 'oyP7DwMW0hvjqXenZiOqwRAjJlAQ', '', '0', '', '1', '0', '0', '0', '', '1465613373');
INSERT INTO `tyms_users` VALUES ('151', null, null, 'oyP7DwGCxdrFWS1IRrfkHnQUe10g', '', '0', '', '1', '0', '0', '0', '', '1465717939');
INSERT INTO `tyms_users` VALUES ('152', null, null, 'oyP7DwDeRJViZf6YsueuJOaZMW_U2222', '', '0', '', '1', '0', '0', '0', '', '1465725029');
INSERT INTO `tyms_users` VALUES ('153', null, null, 'oyP7DwIzvS5gdCgk4A4bpt33sa1A11111', '', '0', '', '1', '0', '0', '0', '', '1465734857');
INSERT INTO `tyms_users` VALUES ('154', 'QQ用户', null, '4D8B48D54F22E7561BF127D91FC575AE', '', '0', '', '1', '0', '0', '0', '', '1465871792');
INSERT INTO `tyms_users` VALUES ('155', null, null, 'oyP7DwArOvvmCcbkjUsGiC7b-120', '', '0', '', '1', '0', '0', '0', '', '1465876750');
INSERT INTO `tyms_users` VALUES ('156', null, null, 'oyP7DwJ3ijZmsc5Tj0Iie5uChKWE', '', '0', '', '1', '0', '0', '0', '', '1465919023');
INSERT INTO `tyms_users` VALUES ('157', null, null, 'oyP7DwJBvlQl482Wv8bu-1ccXTwM', '', '0', '', '1', '0', '0', '0', '', '1465955229');
INSERT INTO `tyms_users` VALUES ('158', null, null, 'oyP7DwGzskUmqqVIc2oPdtNKXdxA', '', '0', '', '1', '0', '0', '0', '', '1465972842');
INSERT INTO `tyms_users` VALUES ('160', null, null, 'oyP7DwEMozSOgD7RjQJOg0jBMU6A', '', '0', '', '1', '0', '0', '0', '', '1466133639');
INSERT INTO `tyms_users` VALUES ('161', null, null, 'oyP7DwB5D2euBtW7ogV28EYkds6A', '', '0', '', '1', '0', '0', '0', '', '1466133656');
INSERT INTO `tyms_users` VALUES ('162', null, null, 'oyP7DwNE9_iWuuY0Cq3CEJWGiH1w', '', '0', '', '1', '0', '0', '0', '', '1466133820');
INSERT INTO `tyms_users` VALUES ('163', null, null, 'oyP7DwEX562CIvDyjI3UCkounYjE', '', '0', '', '1', '0', '0', '0', '', '1466133853');
INSERT INTO `tyms_users` VALUES ('164', null, null, 'oyP7DwE3AJ7405tDFFfmK9gqFnl0', '', '0', '', '1', '0', '0', '0', '', '1466134050');
INSERT INTO `tyms_users` VALUES ('165', null, null, 'oyP7DwJCAakDaIMFOKYV8eE6fVbQ', '', '0', '', '1', '0', '0', '0', '', '1466134225');
INSERT INTO `tyms_users` VALUES ('166', null, null, 'oyP7DwLAHxoCa42h6-uHlQV9_wfE', '', '0', '', '1', '0', '0', '0', '', '1466134872');
INSERT INTO `tyms_users` VALUES ('167', null, null, 'oyP7DwHYLOiLbiaTQZFXEbYhzwx8', '', '0', '', '1', '0', '0', '0', '', '1466135406');
INSERT INTO `tyms_users` VALUES ('168', null, null, 'oyP7DwGY_4ECdbEkrOcZSRtWppzA', '', '0', '', '1', '0', '0', '0', '', '1466135662');
INSERT INTO `tyms_users` VALUES ('169', null, null, 'oyP7DwH-kiadZ3fpLeHgy9Ofae6g', '', '0', '', '1', '0', '0', '0', '', '1466137380');
INSERT INTO `tyms_users` VALUES ('170', null, null, 'oyP7DwLW4vwbNpuWfwe9PqDD7spg', '', '0', '', '1', '0', '0', '0', '', '1466137566');
INSERT INTO `tyms_users` VALUES ('171', null, null, 'oyP7DwCURSIlpSFdGBhWqaAYemWc', '', '0', '', '1', '0', '0', '0', '', '1466137879');
INSERT INTO `tyms_users` VALUES ('172', null, null, 'oyP7DwAVx6YsUf3IB-jbGXP99uX4', '', '0', '', '1', '0', '0', '0', '', '1466138734');
INSERT INTO `tyms_users` VALUES ('173', null, null, 'oyP7DwNSFR9ekTdjXPHu-yu5sE78', '', '0', '', '1', '0', '0', '0', '', '1466140636');
INSERT INTO `tyms_users` VALUES ('174', null, null, 'oyP7DwBONYjywx8R4q5nAM17jTG4', '', '0', '', '1', '0', '0', '0', '', '1466141290');
INSERT INTO `tyms_users` VALUES ('175', '搜豹公司-IT宇宙人', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7xz8lMqGz5seibOicfotDERplXmEhRyZLkkY8fFxiaHTkhcib00SfeYEkL5zmibqiapgVkQpey1FibdCNozOSHZ2zejt7f0v1iaeJDrVU/0', 'oyP7DwOjfAEaqMiuBnK3c8O6MXvA', '', '0', '13800000000', '1', '1', '0', '0', '', '1466155113');
INSERT INTO `tyms_users` VALUES ('176', 'winter', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UPka7RJWe4VwiaVgQjgzYrstapvG1e8lZ4ibBqPRIiaNnDHefj9XJiaO8DrSjxqtDGGBIOvIsnETyMBK/0', 'oyP7DwACwEuS6uBPDy4tAYHg7Uf8', '', '0', '', '1', '0', '0', '0', '', '1466156155');
INSERT INTO `tyms_users` VALUES ('180', '王清华-App定制开发，电商', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2KoOHWSXNSS3heLicTXXygLAztv0yOXbJmS4g0Auic3U5F3A8bAHtYUtBfeq2ibxqFFZKNlvLQA7poYz7yvTWtfBv/0', 'oyP7DwDeRJViZf6YsueuJOaZMW_U', '', '0', '', '1', '1', '0', '0', '', '1466161534');
INSERT INTO `tyms_users` VALUES ('181', '海天一色', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDvNMmL5xPXcqBG8LKuBmAL106m1KImTIYTjoCF7Mr7tOK0JjFJH3BgCzu7gn47cBBXRAG6yEapy/0', 'oyP7DwDwpy3SeN5LpjL08XKxAtms', '', '0', '', '1', '1', '0', '0', '', '1466172558');
INSERT INTO `tyms_users` VALUES ('182', '华章酱～', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QaZOq8N3ZlkXDMgD5ygQbPEcj1XicDNTyeC7Vv5xNOUHcqgySaXHHXznjTldQiaXRKtnAkibTAJNmS/0', 'oyP7DwPjH2SXKwVTLTiGMEdHAfX8', '', '0', '', '1', '1', '0', '0', '', '1466221724');
INSERT INTO `tyms_users` VALUES ('183', '往往外', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7592e3peU7W8ibdJkUwkflUkfibzyxiaTEkEW2PwMmjmYrGpJlWGQn7XoJYcR2vsB0A9iar9u7l3lQd/0', 'oyP7DwI3MEgsxk2XsoV3MNtj_-SQ', '', '0', '', '1', '1', '0', '0', '', '1466221781');
INSERT INTO `tyms_users` VALUES ('184', '鹏少', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlEiaib0mb7Cu68LJOUxicJBSusOPcorBiaZZLKug4ic8xETPIUOe1Ygf0YH49v9BVCMSJPZUponNUichia0/0', 'oyP7DwJSvDXQ10Z7sNnz_pqHWBTc', '', '0', '', '1', '1', '0', '0', '', '1466243904');
INSERT INTO `tyms_users` VALUES ('185', 'IMB', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlEbI06jSgWuiclickhIs4tYkdp2Ac3xpxyFwIchyBNJ0csFA5hWKYAtPTgkambWJAldDeyy2EIXYfX/0', 'oyP7DwAH0lNkc_EJ1a8uihc1VAmA', '', '0', '', '1', '1', '0', '0', '', '1466353446');
INSERT INTO `tyms_users` VALUES ('186', '超级电冰箱', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcERPoDyDp8VSRLZyuo3mhXEq48XeSsJicq5YCLOYDVYzcibTbuO2hmAJWDrHt3uPmx1QbQhd4duEBw/0', 'oyP7DwJjHW34FClsOIQ-gQHap3yw', '', '0', '', '1', '1', '0', '0', '', '1466410803');
INSERT INTO `tyms_users` VALUES ('187', '改变', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0WC62uUuo2vFnLyuAVDkvGYLYaO8gEbMgiblKanzmyGrO8fUhPQv4UYEuSBTh7MqzoZKMy1icbAzLPvzGZoWNQNe/0', 'oyP7DwPSiaGnt1sJwJxRjbzHqC8o', '', '0', '', '1', '1', '0', '0', '', '1466436131');
INSERT INTO `tyms_users` VALUES ('188', '林小玲   艺学汇商城', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eEAb4yx9tN5xvk6c9H56q7fGzHULiaPCnFNh6Y69geJ9oGia3sroH6XJuB4AWibJeIuVSdImgKhqK8q/0', 'oyP7DwIu-5NNA61QHmqHo7XAr0Q4', '', '0', '', '1', '1', '0', '0', '', '1466436156');
INSERT INTO `tyms_users` VALUES ('189', '十指间的挥洒', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UOM6ev63FiaZRpOodBkJiaQyQaghkOd73qiaXE3Ebyl17YQrbsYfoln9YlyhSNej0AbaOruamuwwoLR/0', 'oyP7DwLiuBGOwPuGn_E80wKvABNo', '', '0', '', '1', '1', '0', '0', '', '1466436332');
INSERT INTO `tyms_users` VALUES ('190', '憶', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEITvu1o8N9yAq9DuxzRURxWTwWGAVbKLbUpTmZO72thekDcib6Fa7icIQ4DTkiaiaibzeqR2NPkCz3dorA/0', 'oyP7DwGcCCv8HSK-hCG6kGsqgwvg', '', '0', '', '1', '1', '0', '0', '', '1466436463');
INSERT INTO `tyms_users` VALUES ('191', 'A十指间的挥洒M', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4fLWaUCoyAOQF5ABdHDhED2g2jAQXCibzeFibZia1BW8HQp3YNyqVw9v5c20C24SBBvjicJ4BY6En6dw/0', 'oyP7DwBimfN0qN8_1QmgV38Kl4yc', '', '0', '', '1', '1', '0', '0', '', '1466436825');
INSERT INTO `tyms_users` VALUES ('192', 'want', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4jZykrwUCdibXibmfvwRkLx9pfzIYicu8tPkekZ9VJqpicWjgpfHWDu3Gc2CuX4V1xTKic5wxjdjvDBhUbICskJO6dC/0', 'oyP7DwHbNRvezh95GTd311pEoKu4', '', '0', '', '1', '1', '0', '0', '', '1466437018');
INSERT INTO `tyms_users` VALUES ('193', '゛涼城夢境空人心°', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eFnc45ljRvSb9dmAvetMrFzLySYK6V8QwfjoaCqN51hSAKRxhUlLSDPz7UVn1Btgavibk1mtN2kvv/0', 'oyP7DwDf4eiFjy5chpehyGoXeUok', '', '0', '', '1', '1', '0', '0', '', '1466437432');
INSERT INTO `tyms_users` VALUES ('194', 'steffens', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1ianMyJeusZaYoUfOPMG7iaq9G9Bbxialo4enGGrdzKekzK9W1Zao08NUxdUAzdVecibDxlic8MKkTOh1ZESziaG3rw9/0', 'oyP7DwJl1GL5Bsc1kLLRP3t5PRkw', '', '0', '', '1', '1', '0', '0', '', '1466438252');
INSERT INTO `tyms_users` VALUES ('195', '湘水木目', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJM2xja4ltPMdJT80SrYU9uzRpBKpiceGhmICpQoh5goW5KC0EfdwibLYuw8J96V7szIt2FYjmRBun/0', 'oyP7DwCNW276nNzh_wB5hh8xMBsc', '', '0', '', '1', '1', '0', '0', '', '1466438804');
INSERT INTO `tyms_users` VALUES ('196', '刘学浩', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELSrEgDaAHopn4qeGJDtHeVM5JUE4OKI2fibZpibTEwqf1Wyev3EwNWIZEUGTs0VRZ75M21qLF6fVVQ/0', 'oyP7DwHwG3sRBG5k5BeObr3rd_WM', '', '0', '', '1', '1', '0', '0', '', '1466439261');
INSERT INTO `tyms_users` VALUES ('197', '布艺小将', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL530cztib738SD7eLlHN2UbT68eiaPNcxhaqjLiabRE3xiaf0aoDuxEdzWUcnoVK2soNfSmvVIF7hNs77juRKBBft9e/0', 'oyP7DwL7GhFcuTxyjSQ0NiZJ_QTY', '', '0', '', '1', '1', '0', '0', '', '1466439315');
INSERT INTO `tyms_users` VALUES ('198', '曹宇翔', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2R05FK51nFia1GbQzTWtribeXaLgp5iaUDRXvJ3j87I09omsqcqXHz6S4LNPrjhCRtDYUCmuNJe56yVRNScKZdqek/0', 'oyP7DwBubWKmgVwS3rmTxrGKIQtk', '', '0', '', '1', '1', '0', '0', '', '1466439396');
INSERT INTO `tyms_users` VALUES ('199', '千', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKZdRdicegdpcZQHZkL0XM5iayMRLNkibgAt0RytD1tASwhF6aXbL5Rw68cgw57NuHBUY6QwvC6tiaE4g/0', 'oyP7DwA_QnADxtbfYVeil3gX3LWs', '', '0', '', '1', '1', '0', '0', '', '1466439671');
INSERT INTO `tyms_users` VALUES ('200', 'jomlz', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1E14CPNw2mJpIMk96N1nr6PoxFfQkQgg5LYqmf4QlKyCdFuTxAVlmeO7cFXuVNoibicDx0sMQSicCtDdB2nQd76cN/0', 'oyP7DwId2DIpvHzWs_vn3ViCuFo8', '', '0', '', '1', '1', '0', '0', '', '1466440007');
INSERT INTO `tyms_users` VALUES ('201', '低调哥', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4gFsesQeiabGMqHibJy3QIeQz3gfEf39c2lOGiaXRkwLG30ypQGz3TM1ulRDvN63wNiaDiaAqMjOM2W0B/0', 'oyP7DwEGIFF601Sig8u2SJXhbwQ0', '', '0', '', '1', '1', '0', '0', '', '1466452682');
INSERT INTO `tyms_users` VALUES ('202', '蒋小俊', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p21ib0u81WA6ynBwxdYMOcpgMZh2NbibBbdGff6qp6MlDFDcLGp0sdCUUE7ZnlOwichibuCNx3mND4hlHdlibyjMRwl8/0', 'oyP7DwHnzNrtg87cJ_T4GfWZ9e9w', '', '0', '', '1', '1', '0', '0', '', '1466464786');
INSERT INTO `tyms_users` VALUES ('203', '风筝', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraHEr6GRoq2bmPzrR8N7ZgBRyWGic0WUlVbEWkYdFicsBr9cPGYhiaiciav2mZBYUia6BgMLvEkZkI065V0/0', 'oyP7DwKZo3Zz61FnBhqVYi9-SHCU', '', '0', '', '1', '1', '0', '0', '', '1466465479');
INSERT INTO `tyms_users` VALUES ('204', '予我温暖', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfweoSRJdKMwsticbvN03Mol3dB9U8yKIrUeynCJUXVaVbJ1XBCfjJkpYQaTM73LgvpMlibbxqt3Auw/0', 'oyP7DwO7Mor-pmRuHOLnylmIfxBA', '', '0', '', '1', '1', '0', '0', '', '1466465755');
INSERT INTO `tyms_users` VALUES ('205', '酷蛙雄霸天下', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia8IEQ7KPdFqiaKUDxViaDERfcgHrGc33k41swkoNPR4pv9JAhz51LyPkgRicek4K42SXTRsjuWJFZ9j/0', 'oyP7DwLdGkR9GqBArdDtLewGhGNE', '', '0', '', '1', '1', '0', '0', '', '1466466149');
INSERT INTO `tyms_users` VALUES ('206', '古董哥', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Xrm0VmAtF36qV5Eia0I3wFx65Vk7G3O0Wib0hmxDS9ciafXSXfUxHhZwuQlt7ibgLiaCYwexRUibcaQ2d/0', 'oyP7DwFeCnrT_JvHOGKBluuPG-AY', '', '0', '', '1', '1', '0', '0', '', '1466467292');
INSERT INTO `tyms_users` VALUES ('207', '容子浩', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7E87iaqSoXibGIHGs1t12ofU6KXVgGRNbcloB8NTxN2vD29vALHXfe5LzoiavXFUaedXggPUml2DhQXpRrVZcdrc7/0', 'oyP7DwONz0eks_y7BHQHA-sfsQZQ', '', '0', '', '1', '1', '0', '0', '', '1466469686');
INSERT INTO `tyms_users` VALUES ('208', '钟灵琼·James Zhong', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6ia1BGFb4dA87cQQria6UOPic2uS1nx95v5olz9xjNCvyMG3HOGajyShicgXiaIN0lllEr3EvcVDD3hp/0', 'oyP7DwGinohSxvrZhxaJ7Rr5DTJE', '', '0', '18921111111', '1', '1', '0', '0', '', '1466471816');
INSERT INTO `tyms_users` VALUES ('209', '坛子不装菜', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4lTYkoougYLfVO2qJG88r8SozFDDdH13mhAf4Z4sOfKVUFQibzKiaWu6ENULsXzTQTY8mGcNX5CByL/0', 'oyP7DwHPakczqiEUprZY2H5Thas8', '', '0', '', '1', '1', '0', '0', '', '1466472032');
INSERT INTO `tyms_users` VALUES ('210', '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKfThBWZ2Fy6dzXLBpuibRCfVztCUH8ETLeC6OnvDdHDqE5hU4tUsygIqUic5GmUIS4OUdu0cEHMInw/0', 'oyP7DwJa5VX5PSIJDTRArgJYgGMc', '', '0', '', '1', '1', '0', '0', '', '1466472405');
INSERT INTO `tyms_users` VALUES ('211', '尘封', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKvOuCrzqWIBH4Y40deealg2USgkNJicgG4uhLdQXcPfNibfDFbAe0W2KmJKERTwzKjauooTQB6vZJA/0', 'oyP7DwK98sifPLzvAsV13wVbfs8I', '', '0', '', '1', '1', '0', '0', '', '1466476045');
INSERT INTO `tyms_users` VALUES ('212', '当燃', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p07Whpric8y8MzWiciazOoPMrxGqvo25zkWWgSUPrQj5OMiaFWWs00fSthTvg4QqYAumrRgNpGhTiaG6rc4pBpClYeDJ/0', 'oyP7DwE_y16KoQ1PsqZofhYRtc4M', '', '0', '', '1', '1', '0', '0', '', '1466483216');
INSERT INTO `tyms_users` VALUES ('213', '✨L.木勇҉', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90O7kU4CPvTHh9DEavkfVz3g96Ivd6mtDibv7wj6zpHdFBQgcn3Q50grSe2dxBq29ibx4hUZYySf1iaU/0', 'oyP7DwJA3b7M5Zijunsb17gW2IZU', '', '0', '', '1', '1', '0', '0', '', '1466483843');
INSERT INTO `tyms_users` VALUES ('214', '丶FZM', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0SZrCBpEShve3bnuvneMcjCCJKBy02notpAGbZPRBA58KSRSuzFAgd3tqI0FBurGrE3OxUWZib7hLg06MU866iac/0', 'oyP7DwLqBtFL8flfmZq8H7p2xNKg', '', '0', '', '1', '1', '0', '0', '', '1466488456');
INSERT INTO `tyms_users` VALUES ('215', '赖维明', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfkVBicDkeJmLv4tyOkpcV4S0uXxyR9LEp23T17sMQBhapEmT8aMrBWq267R52FAHmtG9s4iapbEuiaA/0', 'oyP7DwOpSLvE07fVzT290lBGuQyU', '', '0', '', '1', '1', '0', '0', '', '1466496143');
INSERT INTO `tyms_users` VALUES ('216', '宋仲基‮‮脸小的你了摸并‭', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5XszBC0XAlzXlan3r1gMxE9zB43dqXAYa6Er9QzbdeiaYSCbqhNsAnsWuSKfKuIKYkibs2YuR3yxYtteQU5qrsT8/0', 'oyP7DwFUV_SWE4D-XswcuM0ZA5b0', '', '0', '', '1', '1', '0', '0', '', '1466520415');
INSERT INTO `tyms_users` VALUES ('217', 'astar', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcpBY4eQibeGPWCK0JiaCsJfiayc5UhickVbPgz7hNGogVoLzkfk56KtX1sMzo58pBQ1a2pvicd7cGNlxw/0', 'oyP7DwPYW3Z-XHmgG2uDG49NUy4Y', '', '0', '', '1', '1', '0', '0', '', '1466520488');
INSERT INTO `tyms_users` VALUES ('218', 'Per', 'http://wx.qlogo.cn/mmopen/zHOFcUcjCFnd6HUznfnDkv4UyRCc0xKZUcLOd3HoOCsHhN3Bv0IYTayExjCE04AhxEthibLVQFOJsW22UUvoibsRZSXX3jWAFy/0', 'oyP7DwMN81GPwSAKNJLo-0AAzJKo', '', '0', '', '1', '1', '0', '0', '', '1466521440');
INSERT INTO `tyms_users` VALUES ('219', 'jaychang1989', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p24hhvdesj7J1MhBxQsaD6AmKPuIDd5vgWB3PwpibLfzLxDpHgLnxOGwuXb5ulCeP8zCHicPiaHHKHr48z9q1DxOSB/0', 'oyP7DwLRpYKnICM2hhRhjUHSKDBg', '', '0', '', '1', '1', '0', '0', '', '1466521710');
INSERT INTO `tyms_users` VALUES ('220', 'gavin', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL76ye48B6MiaTmGcX4ZO8B42wRF3hfkcoJ2TlPAf8kU1GV1T37Ga1IMGH7EbjmvxIK8Ap3HIcgr6fc6ic3ccO2mbN/0', 'oyP7DwHgNwjO8z76nZ8Inn2kxwxw', '', '0', '', '1', '1', '0', '0', '', '1466522093');
INSERT INTO `tyms_users` VALUES ('221', '森  ', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMwBQSGZibHUWe1IM9mRdicyw74Xfm7zpmHlAJhPJ0jqlf9ibdpccV2vlFHoicfUKMKslQkADicYjQo06/0', 'oyP7DwMK46rRU0y63GQWyuzWbPPY', '', '0', '', '1', '1', '0', '0', '', '1466522686');
INSERT INTO `tyms_users` VALUES ('222', '贱哥', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5XszBC0XAlzWAjMPzpVDQeYoMnktbCicIlzuV1jtRXt5s2YdhW5O4Jx6sebgFcoNqCvDuiaUh5znke4XgKm03211/0', 'oyP7DwB7pxGQWieKDVHxfK2xTC5E', '', '0', '', '1', '1', '0', '0', '', '1466522933');
INSERT INTO `tyms_users` VALUES ('223', '', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibf9z2uDaz2VIcvJOziawWmKEthBbkY3BnqWEcTeEAnCj6hnPcCsNEl3SpAJf0Y5wiacq3fSZiakaBickibvmjfLVVibnr/0', 'oyP7DwAMvM-qGy5WofSs5pfDCxWE', '', '0', '', '1', '1', '0', '0', '', '1466522933');
INSERT INTO `tyms_users` VALUES ('224', '林泽滨', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlJfhHpQ1WUolvQvtEBbywTxL9J2Azq7y3rKnR67TKrY1eauvP9114hic6jXRHPPAOiar2NZJIXCECn/0', 'oyP7DwOD_fTY8mbXxSxOifcsiSY8', '', '0', '', '1', '1', '0', '0', '', '1466522955');
INSERT INTO `tyms_users` VALUES ('225', '郭锅锅Iam', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dENsyCWPkdZ03pVbELRDTcsIC3hA4aRqCDEiaMNLeGyrZTu2YBIpMpzczGnd3LOgpekH9fibAcZThicq/0', 'oyP7DwO4SCm8FYqC4P_PzWZZQNAc', '', '0', '', '1', '1', '0', '0', '', '1466523238');
INSERT INTO `tyms_users` VALUES ('226', ' If转角能遇见love', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p31mIibDuiav9qpwUa70YsvXaTpMa3bCiagwDyvTibYghTw8Zvic44A766yOzcHjxPHV5qs5zUTPTjcDLnBsVXCteicYU/0', 'oyP7DwHMbVqA0hNALZeODUER1DnI', '', '0', '', '1', '1', '0', '0', '', '1466523248');
INSERT INTO `tyms_users` VALUES ('227', '司徒', 'http://wx.qlogo.cn/mmopen/NFAYhmR4VUAOR6ZEQsp8Micqp9KYmJJC701bTrnZVuDd8nicNVMDSkhmp6IUwbIAibMPdwvsMRrIehSfnCRmfWoIIjB9pFjc7ld/0', 'oyP7DwGykSOXYETV9oV7QBiAi12g', '', '0', '', '1', '1', '0', '0', '', '1466523266');
INSERT INTO `tyms_users` VALUES ('228', '欧名松', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMHTAefgWK7NF7zIfhEqDvoOEEicaDCCDCcScsjDUtVnXQNkOCgq4kMmKybqZITqlkcUV3UZKicStN/0', 'oyP7DwDCwNO48AAKz396RL-49PEk', '', '0', '', '1', '1', '0', '0', '', '1466523676');
INSERT INTO `tyms_users` VALUES ('229', '董董', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4oa1MbO8WQ2spJZUYTX1N1Zv25vmAXm331Yibp0RjlslubQbxbSWpQsrKJZmhV7rVErOhzZnReUrb/0', 'oyP7DwHICKA54GUw65XVSshpui6c', '', '0', '', '1', '1', '0', '0', '', '1466523760');
INSERT INTO `tyms_users` VALUES ('230', 'Brains', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7u5XFkjbiahNsicFFfIicMsPo8QdJ46cTcpJkJYPRvj8xSUrRicoLeBoeDlLeTsu9reCbuO32OibYcicu/0', 'oyP7DwAyTEAW97KLB7HWm9V5cFsU', '', '0', '', '1', '1', '0', '0', '', '1466523902');
INSERT INTO `tyms_users` VALUES ('231', '矛盾', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4cr5pUUnBc4uHicn1AFxTqXbr2qv3BicVfCzagPA6MIN9XxuMcudiagObp7HySpEiaPRCVtPsY0umH9SYL7ibNPuGib7QibAg0GOhfXM/0', 'oyP7DwPvQIrenPW686qW9lM6zSvA', '', '0', '', '1', '1', '0', '0', '', '1466524401');
INSERT INTO `tyms_users` VALUES ('232', '橙留香', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90D30TicBeuwZdPstL2FrwbLCKBGwsCLiajuialwPkxUVryTL0G5SZaWibs4iclPX1SfLbtWHZ6oUFmLe5/0', 'oyP7DwM7mjt5Ef6E5uMPJBcS32vw', '', '0', '', '1', '1', '0', '0', '', '1466524966');
INSERT INTO `tyms_users` VALUES ('233', '无', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCLfEXz3L8JQKguh0vK11k1kwM6rbe6G46eIQMKru5M6SX1eicBhOWFPxwgO1Mz49T2ibPbc7JyOwgQ/0', 'oyP7DwGEPQ42vi-quul2NWQYEc-8', '', '0', '', '1', '1', '0', '0', '', '1466525010');
INSERT INTO `tyms_users` VALUES ('234', '许先森', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELf05tl2O7ibcpHib62icfheo3dW2CGAFIG6O7sNspGmbw4YnZP0f7sicB0ntXWauqTugMC70ZQ2ZAAAg/0', 'oyP7DwNknC4lVT4uwlOF6vgldIq0', '', '0', '', '1', '1', '0', '0', '', '1466525638');
INSERT INTO `tyms_users` VALUES ('235', 'Scorpion', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP09DgzqiaNTjVtmDnCSpKyqBgGgxCz2ibydWySceQicpGQwUsYIEw3NPIvrTmU7hS3P4Na4rqqCndxHSa5xu684vBic/0', 'oyP7DwBflvo0Jydc1CsTagTAmDU8', '', '0', '', '1', '1', '0', '0', '', '1466527756');
INSERT INTO `tyms_users` VALUES ('236', '鱼', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0PgbklwPFZFrlvmKTajTRuecibsylPOQ1X42t3k7EDVwQohkMVPqibUsvYdzicRj8ORCeOImoyNGK69djhz3sKzKK/0', 'oyP7DwPplAbPgF_O3IENmWlI-tT4', '', '0', '', '1', '1', '0', '0', '', '1466548928');
INSERT INTO `tyms_users` VALUES ('237', 'RandyGO', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIDKpI1hk7OiaBtaiakaX08TxwlrEicUq8sLQPqxXUYETanwQyP0Cx6AVndmkte710ddguAzQqkrmGkA/0', 'oyP7DwE_fVkDb7jPLDuVxMieBY9g', '', '0', '', '1', '1', '0', '0', '', '1466549858');
INSERT INTO `tyms_users` VALUES ('238', '@¥', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELaCqeJELcXemZuXlHToBxy7Ixk2wsyYAFJ9FfDuOo6B75zsmQSUB37UreOzdHJtGMOLKosD7F5bQ/0', 'oyP7DwAxgBMk6hQ0iq7lOH6MuGho', '', '0', '', '1', '1', '0', '0', '', '1466551429');
INSERT INTO `tyms_users` VALUES ('239', '^ _ ^', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia86WDnLctgXYd9pOlL8m2o4ze08EUnP8bGibjN3G00Ctwz5ckw8VHLs5z7Xa5nXQxt5IJiaYLjFgSic/0', 'oyP7DwFBOOILjyWWye8qMKG6DeQo', '', '0', '', '1', '1', '0', '0', '', '1466556883');
INSERT INTO `tyms_users` VALUES ('240', 'Marco', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7iboibFJDEhXTVFb9QrBZVX3e1ZcxJFvDuumTrOoItib1GxSISMo8Kyibexylsl4xqdKwLsDngjSWol/0', 'oyP7DwMHBlrRimOxNRl4QiCVH4zk', '', '0', '', '1', '1', '0', '0', '', '1466557364');
INSERT INTO `tyms_users` VALUES ('241', '雷龙', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM62JTR4N3Q6g3yAbDgyyfreHI72CCvVyBo1wqm5rib8PuElbTMnD9IdyL1zxzsyKia3lSLqaAASxJjw/0', 'oyP7DwF7R20nkfQ4S2cVpwi4VYPQ', '', '0', '', '1', '1', '0', '0', '', '1466557582');
INSERT INTO `tyms_users` VALUES ('242', 'L', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMtzPMutkibzjyzlicJ5sw1yJw57h1GUf0XHMEdptrPPatgEpfHgPR9OsIlsia7bLrwa2nScwMicbicNZ/0', 'oyP7DwLGHOcJN5fUibVfrxMh6ni0', '', '0', '', '1', '1', '0', '0', '', '1466558214');
INSERT INTO `tyms_users` VALUES ('243', '咖喱Get get', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3H0dKNoEVyT3sibjfcZQxVRCSrRSMBJOKibspJnOlpo5vocfib85gVwicIdXYGNFbHmmxVwpQuWB62sA/0', 'oyP7DwCuEKe9HNRYEj0-9N-lcDQA', '', '0', '', '1', '1', '0', '0', '', '1466558335');
INSERT INTO `tyms_users` VALUES ('244', '明', 'http://wx.qlogo.cn/mmopen/Qk2WicPplRQiakBc4FXAlo9qVUhaLA2gUeQBUicOiaCZbbNuuv4IQ3W2FHa49yB6JL9AiaB7IAzSNUoHRfGcLaEUd6F948MQAraYc/0', 'oyP7DwKNF3GN_-eFcCBmaj9WbKKM', '', '0', '', '1', '1', '0', '0', '', '1466558448');
INSERT INTO `tyms_users` VALUES ('245', '笑从容', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBjWTse2GuChSgQBon8VfLurol6DFNPreqic7HdTDCOgibvAcPMcQBBE40jfavY2R4y6S8cdEAciaMyg/0', 'oyP7DwA49TGwa3Vb24ax6badN72s', '', '0', '', '1', '1', '0', '0', '', '1466559039');
INSERT INTO `tyms_users` VALUES ('246', '花名小贝', 'http://wx.qlogo.cn/mmopen/xfxfWLHmo5ibujDAYoEjj2pwfD24LyqKyTkkjZicJUKzePHCzzIQRwSosTXRA6vZNxtcU0U8hoBK6GoqOVkzleEh8skiaibq4MJX/0', 'oyP7DwJDQwdR2npjUycSWm5z9FJo', '', '0', '', '1', '1', '0', '0', '', '1466559137');
INSERT INTO `tyms_users` VALUES ('247', '勿曰', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKoGBV3jfiaRhPZ7Ievdz0TOUhChV6aIiaFibib3DNwatGhnCtGmWPAbeBngh4icgQEKcYyh6GEM1OfrlQ/0', 'oyP7DwKqbRLIil57C2hNp4j-nrgM', '', '0', '', '1', '1', '0', '0', '', '1466561214');
INSERT INTO `tyms_users` VALUES ('248', 'FOST', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfBw6kYs42cGIWTK6u7hiaNPqAJH1KWay77PwR1BB65ic1JCyg7j1VyvTC0FsH2QzHnxYaKa5jUVoyQ/0', 'oyP7DwErkgMlA499Ta2bhpXEByLg', '', '0', '', '1', '1', '0', '0', '', '1466561690');
INSERT INTO `tyms_users` VALUES ('249', 'Amber', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibYicBVvSXyao3r21ujLsdmfJnSjOFfNCvtFmhiaqfLUqdjjo1GVRQbNbEr86FLjb27l8m6sH6MA5R/0', 'oyP7DwFV7Fs8P996-oGKSMu9gbXg', '', '0', '', '1', '1', '0', '0', '', '1466561696');
INSERT INTO `tyms_users` VALUES ('250', '陈刚', 'http://wx.qlogo.cn/mmopen/U84MtpMvHnVx4NuYb78833jr138vOriaicmERvibbCIhufPaTmN9J6ic4ia9pOeNBx4pfAJUVNicicfZyVSAacY7TtDYw/0', 'oyP7DwHH0M6c2ws8oKIW4jxatyTQ', '', '0', '', '1', '1', '0', '0', '', '1466564898');
INSERT INTO `tyms_users` VALUES ('251', '高大为', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIyBn6BP1ctkia2GhY1atVb4qbU2IaSu8afSf9jEicrqy8icYBD3R48suagevCuEbCSIHzpveiccicAdrA/0', 'oyP7DwICUquDsz-dUnJ3Gc4ax6MM', '', '0', '', '1', '1', '0', '0', '', '1466566136');
INSERT INTO `tyms_users` VALUES ('252', '古德爱蒂儿', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pkm37A69B9zaVdlEBtaeOF26kof4ESkOQXb9SGEE8p4ibgdXZMB6zYgicM8ibZx9sWBr12V1L8R0MSfiaQerhQ00p3D8/0', 'oyP7DwKvTvqLJNShcGlWFo9S-qUA', '', '0', '', '1', '1', '0', '0', '', '1466566471');
INSERT INTO `tyms_users` VALUES ('253', 'KING', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6RAHG2l2o5H8YF4S9tvpiaUricGXERRXLFz1iceGmUyQs9lsNUtvxAVO4x5oqpEZFR7XmGF1qIM9JkmD1YhXpWKSC/0', 'oyP7DwAK2I0x_9tFB-LfP6G0e_rA', '', '0', '', '1', '1', '0', '0', '', '1466573228');
INSERT INTO `tyms_users` VALUES ('254', '猥琐猫叔', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p15W3c3wPeiabpWPHcKEbE7bEuN4CFouXI6YQY6GXz4ibVx269iapfdSF5BeuP7Ae4ghxoeb9GSyG7ld1kUnEhuwl4/0', 'oyP7DwId002pWLJjxpvzfQYZ_sK8', '', '0', '', '1', '1', '0', '0', '', '1466578430');
INSERT INTO `tyms_users` VALUES ('255', 'Amo', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicxbsrhLrBKmZLHhDib5nyNjAwjPcTeUBUzgb5lUzrOxtRibU2uHVbfPS3uMibfgYa0YulsE6WvBfmu/0', 'oyP7DwA19tn-9B7gig9RKuPzfn9s', '', '0', '', '1', '1', '0', '0', '', '1466578830');
INSERT INTO `tyms_users` VALUES ('256', 'A.王振', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdIiaNYjOXeYnayw3NYfpHphafMOh6CQpibLvGrkXq5rbhzXXCiayZtPB3dBAx6CYibkFz7Ga6wXicjnag/0', 'oyP7DwLInhUTySt0wlMZcXl8ZaM8', '', '0', '', '1', '1', '0', '0', '', '1466579491');
INSERT INTO `tyms_users` VALUES ('257', '立新', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEIuzDLbgXDWaSwLf5NCKUIqGt7efpcmtOnBDSJTzTvGhCt7iaRwS7SrZLCxkLtPf0EQWvoiakia75Xg/0', 'oyP7DwFDcLzajr2sKHxoxRuoBGVk', '', '0', '', '1', '1', '0', '0', '', '1466580009');
INSERT INTO `tyms_users` VALUES ('258', '翟顺', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY55uM9T7lHDwk6ucWv29LUgh9G87FlM8efPRaHicp0ekEacjmCjK1z1CGbnS17eUFjRSs0AUV0sYk1/0', 'oyP7DwEQoPRUCmyw7AtuYf9w_8ic', '', '0', '', '1', '1', '0', '0', '', '1466580423');
INSERT INTO `tyms_users` VALUES ('259', '@yaya ', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6KXC8XicM1PdK3N3ia1iaD1VmVQIKTq5FEtWRticbicePomJqMsEeWPNsCPwYsnRfS1eicDCugycuiaH14YFEUfiadUbon/0', 'oyP7DwLVF_M68Q0kBbVx3czU21ZQ', '', '0', '', '1', '1', '0', '0', '', '1466581776');
INSERT INTO `tyms_users` VALUES ('260', 'A00:余凯 万马T.TIME服装城:00A', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI9vfibrx1BmJDceLYzWBzy3faFyiadncbVhL77pYCoehicVhhxcDaeyVoCXIiat46MnAUL5RSGcCd0wQ/0', 'oyP7DwHwx-_9Cq6FGoVV-4lFGEWU', '', '0', '', '1', '1', '0', '0', '', '1466581905');
INSERT INTO `tyms_users` VALUES ('261', 'super赛亚宁', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0UjmRI6icGiccibsx7pfUcoA2SKDIFDW4BGkC5ckvf0RQrjOua0N4rpMuRN2oAx9T1nTsJgJp0G4ygw/0', 'oyP7DwK0lNd5PbTVw1Pww3-LN2wo', '', '0', '', '1', '1', '0', '0', '', '1466582356');
INSERT INTO `tyms_users` VALUES ('262', '吉祥如意', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1VR0jI2XWXKLPYUACKxibJckovxnaaxELXwxHetFcVvZgV5oovLan3e12qFHmlkKzk7ic8ibVLOn2p8kfwGiaRv5nQ/0', 'oyP7DwIULflzppLhwWji-rtag0Do', '', '0', '', '1', '1', '0', '0', '', '1466582423');
INSERT INTO `tyms_users` VALUES ('263', '恋晴', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOgZL1LhvFTWlpuFmiby76ossgkHBZ16snHortOnibtLsicaev1ib7wA06GIEHP4ROVJJicYy28eqG9iaA/0', 'oyP7DwKw-nLKSP2EaCklaGbL6GDU', '', '0', '', '1', '1', '0', '0', '', '1466582524');
INSERT INTO `tyms_users` VALUES ('264', '筱玲', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1o5vCZdoKncxc8lcbN44Io3FnicMCrNOEfcZkVBwibIzpVXqkDVwVr82n64iaEp4JfjvMfaaUuvpcdwbd5mM6Y3GJ/0', 'oyP7DwDqEHl4yKC9F04rb_lSBzJU', '', '0', '', '1', '1', '0', '0', '', '1466582558');
INSERT INTO `tyms_users` VALUES ('265', '闪电', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0b2KibmJW18nTjy1nRM60S0eUmfpX8RsrukTdg7Jtf92NSChibGfrfyUceLlcAaMk98gJvyxdYE48N/0', 'oyP7DwHN7bWP_LGeaT4gtKKm5mSw', '', '0', '', '1', '1', '0', '0', '', '1466585967');
INSERT INTO `tyms_users` VALUES ('266', '天到', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4hrice2MEbo3tahN7W9QQBPfZ63YWecSda5mEiccOpJYLBLiatlX1PWLQ5dRzVqBXprrf8hUqibup8PrRjrGEtNW6T/0', 'oyP7DwHsoWkl7bxv1mYD-2IkuQfc', '', '0', '', '1', '1', '0', '0', '', '1466587508');
INSERT INTO `tyms_users` VALUES ('267', '一路向北', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDYp4b7aezLHD55BibeCFQs9AiaVHsc9hrPyBArrcNVwXH0dkxNib1ibWLu7Bezdia7xwKxLBjcv97vdYA/0', 'oyP7DwDef4mFrPIKa6Os_wqT64dk', '', '0', '', '1', '1', '0', '0', '', '1466587860');
INSERT INTO `tyms_users` VALUES ('268', '～Seraph！', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UH8A8d1lI4Pic34fiaomZ7g7icMR8EKo33P2smMTp6Hq7bDqib1fQ3faKiclvbUM0VeQ3J9zPAMEuH36ia/0', 'oyP7DwDzWY63E4GWGmF-KcgbJB_0', '', '0', '', '1', '1', '0', '0', '', '1466591373');
INSERT INTO `tyms_users` VALUES ('269', '芬芬', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eFUFibCD3chq1jqBuxVMwBmYIAo5nQBaXGIFSophuxcfrexEHWA7mmqicdHuSPOicJMl0XicRT7mXjze/0', 'oyP7DwB0fyD_ISmh2B3ikHj2P6wA', '', '0', '', '1', '1', '0', '0', '', '1466591498');
INSERT INTO `tyms_users` VALUES ('270', '关机', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7Cg9UzyYUJ01FkvhOBEURvgsspCVZqntVQhibrjo6X4mggSAO2h0tibTmib14J5jNHAhldgwNBH4CF1aFicPSjW40K4MeTnurRXRs/0', 'oyP7DwFFFk3LVPJ-R3fCqWzOif-c', '', '0', '', '1', '1', '0', '0', '', '1466596820');
INSERT INTO `tyms_users` VALUES ('271', '皇家马德里', '', 'oyP7DwGYl6_EF9K7Wk0uUQFoc6pc', '', '0', '', '1', '1', '0', '0', '', '1466604706');
INSERT INTO `tyms_users` VALUES ('272', '橋', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawZticuUib1nRKWW85DPh4viaYPcExSLJJI3BqNheTL6oXcwAET9FIxQ0H7b9AicfUF6j67S7K09JWdX/0', 'oyP7DwJeJLExRPDLOyINByutHDG4', '', '0', '', '1', '1', '0', '0', '', '1466608550');
INSERT INTO `tyms_users` VALUES ('273', '春雨', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDURbG2HiczOrj0MLtPhDHh8w4kTAIBtgb1RS56UR2rQjzzFiahJHfH0GibCTl69xM5AkQg1QpQAjP5/0', 'oyP7DwDcW-sozpuZ3NWsRJxuhJH0', '', '0', '', '1', '1', '0', '0', '', '1466608743');
INSERT INTO `tyms_users` VALUES ('274', 'ARicky', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKkjyKAd4QeSCUX1lndKPkcGSvBOvrt3JRF9Xib51gF2LNP4iaAGcYUaU1ySibQ5aeyc2HqiaBVlrRsnQ/0', 'oyP7DwBogfLQyb8bY82gl_C1FU-I', '', '0', '', '1', '1', '0', '0', '', '1466613746');
INSERT INTO `tyms_users` VALUES ('275', 'Mr.Dz工作室', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1TgGCia1k4YeQF2NN9Yo1zIibicG9fst4icf6ib7DS0ke6IQ7kz0ib8CHAqnd7KiboEm67FHWwhGQPtN7j/0', 'oyP7DwOM7yclJ_DmHw0AcokhPQO0', '', '0', '', '1', '1', '0', '0', '', '1466617201');
INSERT INTO `tyms_users` VALUES ('276', '邹意', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfnO4JZ6szt3vbPHwmkqyjXp7xGq2MjPq1nU4SIRYEeocQkMhKmSfn2sDDicHDyTVcNfnZbroiaC67pNdGg5iavgKT/0', 'oyP7DwDMx0ebgAoHpiKmhPl_s9vM', '', '0', '', '1', '1', '0', '0', '', '1466648813');
INSERT INTO `tyms_users` VALUES ('277', '零下3度', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL64NiaD05VZU2XJc78Oibc90OIDnibmJSebJ8ic17cz4pZdCIXzmaOOqhiaWbnfRSuFOEHRaWMDSYlSgEw/0', 'oyP7DwLEF1cle7hkDfN0ZYNiFQXo', '', '0', '', '1', '1', '0', '0', '', '1466651227');
INSERT INTO `tyms_users` VALUES ('278', '马海伟', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEIjTSpU6dXDalLyU0yuXgmxa1OpIMmbebc2icEkUHnFNEnvxY4iax3NpBIiaiaqKIjicpETPBHiakxM8Et/0', 'oyP7DwATbA6brOJ2-RMyKckz2feY', '', '0', '', '1', '1', '0', '0', '', '1466651373');
INSERT INTO `tyms_users` VALUES ('279', '未流星', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4iagwNYxtZ3QUEmcPevMG7v4hD3hGY891gqSDQXF4vqeGkQS9dGPUDfTnibH8zXeJXbicibJ1psSg4do/0', 'oyP7DwFBpO2CWfYgkLprgUSdFllU', '', '0', '', '1', '1', '0', '0', '', '1466652087');
INSERT INTO `tyms_users` VALUES ('280', '橙小萌', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEK8CRbdINLTmBHBqRJfSVO6GP33cq4neetbhuHIw3QHibqX0r2xWtd81OCCPlCvqTPDCHrfl1AGzQ/0', 'oyP7DwCMsmfR8SuG3CpZDLjseYLI', '', '0', '', '1', '1', '0', '0', '', '1466656344');
INSERT INTO `tyms_users` VALUES ('281', 'Linux', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAl6xUtXhVsc5zaBydyAydialOxmjSdE7S52j6RhZtp9fzXkhosEesF5bcNs1qXSickyZJZ6dpSjhibA/0', 'oyP7DwNUElbnRoXHsQiY3kRjERPc', '', '0', '', '1', '1', '0', '0', '', '1466657093');
INSERT INTO `tyms_users` VALUES ('282', 'Yado', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDANq0WoII8De50WpEL52PibNPNWxzI890ktEib6j4UFhrS4zXbOvwYz4y7OYBnibWiaoRmcKUJKaHdRQ/0', 'oyP7DwGy_PRrLsTKci9PufYh000M', '', '0', '', '1', '1', '0', '0', '', '1466660025');
INSERT INTO `tyms_users` VALUES ('283', '浅蓝。', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3z0KBOTl1eCSSJ0WwibRXEyGXlia8R7no69SqCt2t4j9Su4MJicjBdibpDA8xMvKdOjQz4MrZDoWSEJ/0', 'oyP7DwEbgi0-aDBZEwNplTgfThJY', '', '0', '', '1', '1', '0', '0', '', '1466664455');
INSERT INTO `tyms_users` VALUES ('284', 'Mr.邓', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7y5Rp1DvS0W9gsG4Om4JDoWlWPcBzJz0IEmh8MgSkSicLMz3V2Hc1nPDJ9P2E2r8rUd4LCtibBAIdw/0', 'oyP7DwB2-lpYwfSf2YB5cfrnNVBA', '', '0', '', '1', '1', '0', '0', '', '1466666113');
INSERT INTO `tyms_users` VALUES ('285', '马国强Frank', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5U2a3syJha8ibKYJkr65VRhLUUPsh2WoNmCibU9wm8dIfXX9Cpv7Sf6GanOXGK8SJ6R6mgFwR4VubOg6DToEJWUK/0', 'oyP7DwKcalNqi0lJvYUslNAXMydc', '', '0', '', '1', '1', '0', '0', '', '1466666324');
INSERT INTO `tyms_users` VALUES ('286', '灰太狼', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0RSmHJ6477aZfXrgVfLnWYMkHU8mVCjaf6TTSjqiar66eAtthAC2vseqLWFP3RzqhoOWmrjFxPOnk/0', 'oyP7DwG0OvKAyTWLBxxZfiYCp2B4', '', '0', '', '1', '1', '0', '0', '', '1466670326');
INSERT INTO `tyms_users` VALUES ('287', 'en', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eGbesOPTgbxvFCBLCDT4xeh1PZV6dR23JibicKv7R1nQIFEfibF91cFvZ7iaS75DhQ378o7S6aEnicfNf/0', 'oyP7DwOtCY5rQbYxdZwX11x45L-c', '', '0', '', '1', '1', '0', '0', '', '1466671976');
INSERT INTO `tyms_users` VALUES ('288', '', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iax38CrO9D6KNuY8nwgXAsxKkiahArBX5hibCb04TNdibsOdwGB5pIqN9LvjC9kTiccqL7OCQ5eibydXd2/0', 'oyP7DwNrcrpg_7iPg7h1Zo00jNTs', '', '0', '', '1', '1', '0', '0', '', '1466673362');
INSERT INTO `tyms_users` VALUES ('289', 'Hamsing', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3zF4AFiaj08SODR5kx1bAJXw50CjA5wQ2XyQiaUAJZ9ick2fsRPg8xQbxEoFbt3AjGEzHVyHeIZZ0Ig2ibJwfxrjeI/0', 'oyP7DwERb_hqpA4U6kUT_fshwjmI', '', '0', '', '1', '1', '0', '0', '', '1466673843');
INSERT INTO `tyms_users` VALUES ('290', '远方', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMibT6jcBHibNUqH0P1k4jPLzWIDCU5BKygCf2zyIb5b1OYBOvX3xUSU6gUUFQoBcAlic4ibPSh9S9jw/0', 'oyP7DwN1EX_QO5YijD3A9Vka15ik', '', '0', '', '1', '1', '0', '0', '', '1466674532');
INSERT INTO `tyms_users` VALUES ('291', '王进良', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2dVtaYxjkgwZ7Nia9jcSia8QQuKuOUvhdiaF0xSAPK3TvpANV4DTGcrDRQ0JibmeK141j4WLBfPacZM/0', 'oyP7DwP7VmoNoN2b_xY54R1Elz-w', '', '0', '', '1', '1', '0', '0', '', '1466676966');
INSERT INTO `tyms_users` VALUES ('292', '多多先生', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5axReV8ZdsiasuNfnB74bFs6tfC7DFtVEibRLkm4lHlz72icibefArP2zliaGWNcDFiaoIUAiaFS2BicP7RaGW1sLy0ricX/0', 'oyP7DwFZbjCMP3bOiBSgh-R0p85I', '', '0', '', '1', '1', '0', '0', '', '1466678346');
INSERT INTO `tyms_users` VALUES ('293', '筱（Xiao）亮子', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELwMxNdrecP25jK9aM2whr25hFrnSmsBDEobXZBzpJbIovPcvqtFvxaibBrDibJO6pMHR9dMt7PlzPw/0', 'oyP7DwNf2vgACJn72vIadIbgTXgw', '', '0', '', '1', '1', '0', '0', '', '1466685427');
INSERT INTO `tyms_users` VALUES ('294', '雪狼', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1NJ0ONRufhLhmqXTL9iaqqyHQOfETx1zg62hldU0k1Q8ib22x6Z3libSA8wqUd9VNGxJMfb37Yuw3P82ZcvLGxFnz/0', 'oyP7DwMi_K3h2_7cD099fumzyorc', '', '0', '', '1', '1', '0', '0', '', '1466689041');
INSERT INTO `tyms_users` VALUES ('295', '真情邂逅', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0T4ZvdZjprKUUowno2ZibWdXBP32s4ia8yicF7UFhv1AtsdNB0gXjgbTy8b3tcRciaqdf932xC2sZogn/0', 'oyP7DwCS--0fOuM1qatRZMwdA7_A', '', '0', '', '1', '1', '0', '0', '', '1466689382');
INSERT INTO `tyms_users` VALUES ('296', 'Rose', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90IYJ3nEMDaGbRP9Hibc52hkIHu9HIS5unicqCvb6HgTmPogwIsVDrQwUKBIBWPxluYuyUtNCfflBVP/0', 'oyP7DwOLiMDc_xDd4lIsrzc_f7p4', '', '0', '', '1', '1', '0', '0', '', '1466689608');
INSERT INTO `tyms_users` VALUES ('297', '方立', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdMUzeVBY1qMZOCSkrVmZmhpx2MeoXnCsHhz5cxGiaKpYFkdzbtOTpCJ7d4F0dSWgwxRVtJ88t8kLw/0', 'oyP7DwBzL-OjXRqvKIMAeJQmn6TM', '', '0', '', '1', '1', '0', '0', '', '1466689822');
INSERT INTO `tyms_users` VALUES ('298', '田敏(Tim)', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1yjeUhngAnSEyCQshicpNZdm3BbibZPAySX2s1ZKickfBdDDu719icaFIQCPkAjvvd50ibbEoQ319dR4QNlFsVsEbmW/0', 'oyP7DwJuKh2o85x-1RuS8JI5Qa9I', '', '0', '', '1', '1', '0', '0', '', '1466690275');
INSERT INTO `tyms_users` VALUES ('299', '汪胜文', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDs9UGnZBPmxkTS784Q9hspRzAGaPjco62nWTXV7GTmuibuZJID9HwX538ibhKwYxbICIUJDiaWySwTia9AlrAhW5jsMibMFl7nNicAI/0', 'oyP7DwAEDOiia40kJW-W0e21SMy8', '', '0', '', '1', '1', '0', '0', '', '1466690951');
INSERT INTO `tyms_users` VALUES ('300', '宝宝曦曦', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4icXEvMx2qrLacRaMiah7ourQyLWXmhvyKP0MEjtjhd7h50v6vCBep1ib0flUE9Mk7suniboOIXLVBTtNCMwcJ9PPb/0', 'oyP7DwJlQAp0-QPwHcqRApPWC7Bw12', '', '0', '', '1', '1', '0', '0', '', '1466691027');
INSERT INTO `tyms_users` VALUES ('301', '何政', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3WVzFicS5MIyP0ce4YUrDYYqRe5QhYlCH310MZlpw0jkMG5hAIS3gjBrERTbHKR2RiatXDn1xKXiajGo6KADBpgLl/0', 'oyP7DwBeHgrY0mGPC17_uU4QYJ84', '', '0', '', '1', '1', '0', '0', '', '1466691105');
INSERT INTO `tyms_users` VALUES ('302', 'xinuxZ', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5wSBOvbTEouicZZkSEVw861xWRF8FZnukcTwtUAPtGYe7BeO9tDQZsA0TibOic51enTAyPPibaTQfjwF/0', 'oyP7DwKaUByiNLpjrLxGwshY_AHM', '', '0', '', '1', '1', '0', '0', '', '1466691656');
INSERT INTO `tyms_users` VALUES ('303', 'SSZY', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90EEoAJVsAQEdeF3pOoHBJ8OZEvjyH6nfyGv2eWBviax6nh2PE2KIec5WKRc5GiclpAww78X90DticCk/0', 'oyP7DwE-fl7WYxIdtZ2MXLlkPiiU', '', '0', '', '1', '1', '0', '0', '', '1466691679');
INSERT INTO `tyms_users` VALUES ('304', '艾国华', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qratMyjt9QictxiaPZWibTneR0Gpq7Hw1AJI4qPrQMvT3O9JwemMqjfbQceBtHZ7hDpNgCHYtqQRGZLck/0', 'oyP7DwCV2XhVL1FWNQyiU0rrFSa4', '', '0', '', '1', '1', '0', '0', '', '1466691968');
INSERT INTO `tyms_users` VALUES ('305', 'Lee Han', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdNuPTGiav9htcE4xtWZibmHjbsmwNdvc6LEVOCv57mWTBn0XrrXULplLEX9CX10qSgINFzPGklgqBc/0', 'oyP7DwHBGxlKWL9OZGjQjjiZznFg', '', '0', '', '1', '1', '0', '0', '', '1466692823');
INSERT INTO `tyms_users` VALUES ('306', 'Sin Wing Lok', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5KScaR36AYwuvYBar48QCjfKUSUrxjEnAicjttOU8hscGXZlmtiaKPqribXEyz7RLDl5BCPO2siajFGia3WYiaV1zaQib/0', 'oyP7DwIZTy_oFL086pYB1KaAzvwI', '', '0', '', '1', '1', '0', '0', '', '1466692981');
INSERT INTO `tyms_users` VALUES ('307', '徐智', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraDkWsyBKNfYztibjADCCXthbEEVJUYegNG0wEPe0lWWoibkHaGUUibgPfawZ3GwBiaIhImkHjYAl2EdM/0', 'oyP7DwMq7v5zzhkM-utq-wUYqWyY', '', '0', '', '1', '1', '0', '0', '', '1466693898');
INSERT INTO `tyms_users` VALUES ('308', 'nkm85', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL61iaIOnZLZia8DKeRqO0iaNbAYjexLpibCDbr4JLTlywDZBubBFSFiahW7k9UibdnuDO6r9sWaWibqTBibLLNQUQoPdTbf/0', 'oyP7DwBXUCD2YqkO6UlvPGeSgQqc', '', '0', '', '1', '1', '0', '0', '', '1466694283');
INSERT INTO `tyms_users` VALUES ('310', '宝宝曦曦', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4icXEvMx2qrLacRaMiah7ourQyLWXmhvyKP0MEjtjhd7h50v6vCBep1ib0flUE9Mk7suniboOIXLVBTtNCMwcJ9PPb/0', 'oyP7DwJlQAp0-QPwHcqRApPWC7Bw', '', '0', '', '1', '1', '0', '0', '', '1466696045');
INSERT INTO `tyms_users` VALUES ('311', '瑞博网络', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKcf3Ef8lhQxaO67v2icMVH3oyVy7uG8gDd5LicA1wdU3C21cII4bWde10tict5ooEFMupPCjibNHoFZQ/0', 'oyP7DwDmT5HIY3TrTIHSlqR9XkTo', '', '0', '', '1', '1', '0', '0', '', '1466708022');
INSERT INTO `tyms_users` VALUES ('312', 'A云起科技', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WdKruZH1Ch1qlMIpZ8AxpQQdcPIIIwGG44TvyfN0lKSic5ibUwicWmhnfI0w7YEHwhZ8OvbtTnIyFS/0', 'oyP7DwBQkKpy8psSaG8oxsIKX_ds', '', '0', '', '1', '1', '0', '0', '', '1466731954');
INSERT INTO `tyms_users` VALUES ('313', '周永平', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6Y9ADP1icWZicKqJ1tBQaLasAVu5zjQP4JeqVTSQmEMf74u6vQGrhKicy4sIAOiczibPBUP7ibRicX0ADBw/0', 'oyP7DwDwL55xb6Vdl2vLJgCXGCME', '', '0', '', '1', '1', '0', '0', '', '1466733160');
INSERT INTO `tyms_users` VALUES ('314', '老王', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dENWBQbEGKKKLdfE5QW93uFgOtuFF9uWwg90K6kJrZQLI7zmPJ2yHMW5fqyp9AgkBZtUianXYrqD5e/0', 'oyP7DwIaOyGtuFF-sg4PeQ7cCBoo', '', '0', '', '1', '1', '0', '0', '', '1466733688');
INSERT INTO `tyms_users` VALUES ('315', 'A_A One Zero', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEO6VasspnjFxKuMYusS1NibFSAAZqr893BnORBA4r9CY52qvsSdQElzqcIw2qgJxwg4ic0Hthss7Oh/0', 'oyP7DwELD8VsXh3wIX-TQ9omcLVI', '', '0', '', '1', '1', '0', '0', '', '1466733834');
INSERT INTO `tyms_users` VALUES ('316', 'Moore', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL51HibtP8IasXAEJT0QCLmUYQx37eKwfjEXvSJrQqXIoZlKBcMIzCtAjjqLdS9SnTKFwAytaxAPgfj1WcOKFWpbP/0', 'oyP7DwCBrGcajrBhRmGl5JV92-7Q', '', '0', '', '1', '1', '0', '0', '', '1466734111');
INSERT INTO `tyms_users` VALUES ('317', '巴蒂', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlOGOqI9saAvn7iccXPzxfmT57kK0iccribIO7slibomY2JkoQSauXeYm4EkW1HiamlTh0AlS3o4cHOVcR/0', 'oyP7DwEXIWEV_LdmhMHhARbBiodY', '', '0', '', '1', '1', '0', '0', '', '1466735934');
INSERT INTO `tyms_users` VALUES ('318', '睿圣.郎海军', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIczaoewvTPl5sSNyRGzZaezv0X9OXuTxic1asA4wNTzYIBicicgEGxyPx5SbvsIezNRqkDbibssXaP8g/0', 'oyP7DwEXCeCN1KgBuKwJZcFr20no', '', '0', '', '1', '1', '0', '0', '', '1466738409');
INSERT INTO `tyms_users` VALUES ('319', '少锋', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eF1mSs3V27ibjtuoIDYMQCewVE0eLn7pcchdDsfgYicX1efC4QaUpXWPRphNT1RmgHQZrQLp4GxnibK/0', 'oyP7DwMj_gE7-rF-rM4HKZylZrzc', '', '0', '', '1', '1', '0', '0', '', '1466738790');
INSERT INTO `tyms_users` VALUES ('320', '迅哥哥', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMsOOqiat5IB5Sa8FfR69SKrO5PRZ03ic6UNIm99cIRoibuHMMENjic8UpnbenRQfDP98ltQ2ibwSYWza/0', 'oyP7DwP-a4ZZBhRfCiv_RW3vrr1Y', '', '0', '', '1', '1', '0', '0', '', '1466747491');
INSERT INTO `tyms_users` VALUES ('321', '', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcfFSHRwDZWiaqUTBBJ66WFpk8m9p4toTrxsTADtReUrNQbU6XL2HJLpnkI1SIwTybEfbtsicKys3GEyOjDD0uBZc/0', 'oyP7DwAQrOHwoAOP_daYsqUUsOLs', '', '0', '', '1', '1', '0', '0', '', '1466749355');
INSERT INTO `tyms_users` VALUES ('322', '单身侠', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cd3aCVicyjd5ha18GE5qw9cvqmgVXiar1CicumV2ibk8WsaSJzO0wyc7yr8PMicjJraFDbqu2PYkMWbn/0', 'oyP7DwBG-aXlNth1dXkbl65IpLjI', '', '0', '', '1', '1', '0', '0', '', '1466752707');
INSERT INTO `tyms_users` VALUES ('323', 'H2O', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eAMeeXRFQzU0R4jJgLBxX2mSpGvx1QJA75DzdWy703rhJDXKQS8bT7xvmXSTqAsTbkjj4IJ6AM2j/0', 'oyP7DwNPM_eGFKgqtdonB9uK2cc0', '', '0', '', '1', '1', '0', '0', '', '1466753560');
INSERT INTO `tyms_users` VALUES ('324', '战地音乐', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4nELDtrORb3ld0InfWfgbxtEH3RM1HjRK5vB6fsYY53SMyNtgePjpRGwrcIIFElXwAwXxicts3EmQ/0', 'oyP7DwN_HL7baCfczjXC0H3c1_ak', '', '0', '', '1', '1', '0', '0', '', '1466754438');
INSERT INTO `tyms_users` VALUES ('325', '焦建成', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5w8zBh9jkQ7G9tgtZkqZ0fhdbEpZbbxcofPj184GXriagEDyyyg0eNiavS4CDpBTIGrnyy9WMMDZsI/0', 'oyP7DwHEBPJhsbEJs8aBEpoJYCWo', '', '0', '', '1', '1', '0', '0', '', '1466755194');
INSERT INTO `tyms_users` VALUES ('326', 'lyndon', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaic6ZibnG0J7ciaIc3oqOa58tvfJBUVEOdxRZbMhE8ScCcibFziaBMIiahm4DMhAIaM2ibzqONZ66VXk2pf/0', 'oyP7DwAw7OcJRr2ToFNG-mZfOBlk', '', '0', '', '1', '1', '0', '0', '', '1466758606');
INSERT INTO `tyms_users` VALUES ('327', '张龙', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eCITnEMruOPhmN85eiaiaFCfyAsT5dWKksal1baKEib5BWXATNN2Myl6odZj8Et09wDT15gXXRLPiaju/0', 'oyP7DwHPKuPaLGjGaAMQfdYeDDqs', '', '0', '', '1', '1', '0', '0', '', '1466761307');
INSERT INTO `tyms_users` VALUES ('328', 'Sium', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2e9cz16X9BVeNaYJddksGxSibqGntMJapicSUFBic9Tia0CQ8TVSib0X4ChWx08wKMK4ZRljSEcn9Ts7XnEO2fuSQnN/0', 'oyP7DwIK3iUUjS0e2AAjpJBPAd_k', '', '0', '', '1', '1', '0', '0', '', '1466761912');
INSERT INTO `tyms_users` VALUES ('329', '小鱼儿', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p36ahjnCEauKPCS5jCZjlfRIVcbXJcpRsianGEibRJSEXuTSfDPO1zrF22bVvetnfiatOBl7pcaqvHE0yq5C7ibRN9y/0', 'oyP7DwNiMN_L2FPB7-ZBNaQr7Dzw', '', '0', '', '1', '1', '0', '0', '', '1466771843');
INSERT INTO `tyms_users` VALUES ('330', '零添加渔醉香---成哥', 'http://wx.qlogo.cn/mmopen/xfxfWLHmo5ibujDAYoEjj2oBM3iaZMk8iaDGyw1dGTrppyUsT3SfRD2hQdNRSnvqHlbnSBCKFGu5clZgdnZTf7Cw4w6fQyiaotSJ/0', 'oyP7DwFB4ZRQ6dwzrl8whUbJ-j3k', '', '0', '', '1', '1', '0', '0', '', '1466784589');
INSERT INTO `tyms_users` VALUES ('331', 'Over', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcgpcCCNwVTaUicxicrdJ79iagEVdKDKhBtglY2to0Zibbib1qhsuZ3WyDdHAuk2z3DianZ1Z0EicbLFZkpg/0', 'oyP7DwBc5GMM_dL6BTwfqywP1Xxs', '', '0', '', '1', '1', '0', '0', '', '1466784797');
INSERT INTO `tyms_users` VALUES ('332', '晏明阳', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDckq3VVDIzo68Wqa4YxqHbCzxyjYuQZFlbVxYCEJibWTIWD25UAT7omoyd0uSfPV4R7QBzKVmBVH/0', 'oyP7DwFX0UZC_lrRsZJjeLIpQI9I', '', '0', '', '1', '1', '0', '0', '', '1466785987');
INSERT INTO `tyms_users` VALUES ('333', '剩下光年。', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1dF8YGM6zxGtow6xNLuHwc9I5yeYjnictgjcqJJfHNjOfzEfgJhoCIQFCavrTeeLHWwPADcznnicMicwlcr3yUs1h/0', 'oyP7DwCFBgPirAn4Wk69QBPRv5w0', '', '0', '', '1', '1', '0', '0', '', '1466818946');
INSERT INTO `tyms_users` VALUES ('334', 'A Joon.Ying', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibetU2Zibx2TibXlvIySEoOsLSp6O2Fp8uwKhosIZ0LcSZEdatrM3yT68y189ftcvCHULplB1c0Gtn2w/0', 'oyP7DwJepL-cQecE6eVGpXSok6bU', '', '0', '', '1', '1', '0', '0', '', '1466822780');
INSERT INTO `tyms_users` VALUES ('335', 'Jk', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0TEdNbGJupsBCKTYEvc02oHbTqK4N5NjqY8yJhRV5xiauwS51F4Q2C4CLZdwklVs6iadkbOmndhTrR/0', 'oyP7DwK43uxkTxSWaDAmOPiT7_Qs', '', '0', '', '1', '1', '0', '0', '', '1466824838');
INSERT INTO `tyms_users` VALUES ('336', '四', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJN8ibY7icxmGuErAHDmhfYNza8qtKmvybotX9CYJr0rWObEeZteTAtgRSjXXuFliaUicyujGmtVoLQZw/0', 'oyP7DwO10o_QNmqVGw10Cf_I_P_c', '', '0', '', '1', '1', '0', '0', '', '1466825892');
INSERT INTO `tyms_users` VALUES ('337', '璘彬。', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKdvkAruicUy8yva5DvF8x3kXO70e2AVePDmvIYvekBUT2pz2NAyibARZKLQT4XxpxIUpbYPC17Gf0g/0', 'oyP7DwI9w9vrktFGT1QMSJLR2rV0', '', '0', '', '1', '1', '0', '0', '', '1466827772');
INSERT INTO `tyms_users` VALUES ('338', 'YG', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJIYZOib1En7p24TK4MbSzmzrcUYC0DLXLrlBOx8vS0XVYcWJWu4KenicwQvG4MKicT7zqiaf7uUSpngQ/0', 'oyP7DwJuZ6nnwxuavEGHiYuEdOHA', '', '0', '', '1', '1', '0', '0', '', '1466829176');
INSERT INTO `tyms_users` VALUES ('339', '◎_◎', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4XxJdzmLhjR2r2LMNX27WicFQMUV6e3ZuL31vricTSiayKROtnjicw1sIlsGFcaPAGx0tXDT5MKvTTCZQJBzGSnsiaj/0', 'oyP7DwPbtvF59U25cDRAwiA15li0', '', '0', '', '1', '1', '0', '0', '', '1466830738');
INSERT INTO `tyms_users` VALUES ('340', '张侃', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4g6eb6olw6DfPsciabcQEyanTzc1Q63YRCT4bGjffpFHGV1M9fm2awBzOGyJ0cy7w2ZOWVfG3NJ7K/0', 'oyP7DwHEH4PsisjUF5R1CcxOZH24', '', '0', '', '1', '1', '0', '0', '', '1466836377');
INSERT INTO `tyms_users` VALUES ('341', '吴绍勇', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP25vBuPRAibRqXQGve6zeqGYmVEHTgY5CMJzbZQXNJaYGVn6IqPD0uwwZJYlGkDfib8d1SMHwgo1BCdOOTxtqYLhm/0', 'oyP7DwM6oiHr84vQgCS_u9L23Vtk', '', '0', '', '1', '1', '0', '0', '', '1466837597');
INSERT INTO `tyms_users` VALUES ('342', 'A风跑我跟着', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6qYoiaQGbCkZ6SfJuYjkicmXIv4psmUhsEibictzoibBPTMzSJwB9wiaYoXoRibG29kFkVRsu3dV119ToE/0', 'oyP7DwJhbdWrPxyOyiHQA5wAMMZo', '', '0', '', '1', '1', '0', '0', '', '1466845155');
INSERT INTO `tyms_users` VALUES ('343', '林贵斌', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1n3qehXvuw5jjVqGWOU6SYgdV4h918Shqa2SuoOoYBjspRZ6N5NqibxY20TibSPMZeore5VFDHjRxvOHSLpia05nH/0', 'oyP7DwOXRYBrJtKqZiUYPsfTdZ08', '', '0', '', '1', '1', '0', '0', '', '1466850641');
INSERT INTO `tyms_users` VALUES ('344', '熊熊一直在', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6qt1ZRdr2dsiauUeYffyWJXNk4c5NHtxDoKiaD6KibarDAO3hSyQUHXIX6CtBkA7kTgibWiaWSs1yqXck9USDXCZ0u6/0', 'oyP7DwCQ_Hyz8pgAbIDQ2LSpfo-g', '', '0', '', '1', '1', '0', '0', '', '1466866404');
INSERT INTO `tyms_users` VALUES ('345', '枫叶', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia337cMY2oD1JVYUN0B1ZIdnsl2cV7Z75YOlsSRyn1cZxqk5SjeNvvDn1h4VNjgxsoOOTnpA2E1Hf/0', 'oyP7DwNtyRvqqR_B4Wx2ZWnwBq2Y', '', '0', '', '1', '1', '0', '0', '', '1466913384');
INSERT INTO `tyms_users` VALUES ('346', '飘零', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBoibYanBOLy0fWyynKs2YXWc6oUrzfCtDyCprsySq6CatuiasQNM3pRL1aKH1WHNicRb1dAX1Ye3Bew/0', 'oyP7DwGADOAICrBmiC9etYnYcm7s', '', '0', '', '1', '1', '0', '0', '', '1466927481');
INSERT INTO `tyms_users` VALUES ('347', 'Bluce Lee', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY56o7gKKrIOiajcocicW2hePubtsoQw6HPInnV4yoc1jTp9iapibiaxG9yVal4Jibm4SYecTBmiaBsnZjuTn/0', 'oyP7DwJGiqIrcxqCwwPlA853Nocg', '', '0', '', '1', '1', '0', '0', '', '1466930983');
INSERT INTO `tyms_users` VALUES ('348', 'Sandy', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0TMjd4fchkBuZ9VSOskUHFyZ2aQ6PicymCrWLWWVHMbPfwagT37KY5rdIjKQmjHibCfCyM9gibmcDibt/0', 'oyP7DwNoqOePG_ZumFqIaBbaC4lk', '', '0', '', '1', '1', '0', '0', '', '1466935240');
INSERT INTO `tyms_users` VALUES ('349', '姬楚项', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7ap1vC8sIKbbvZ6NMQWlicl21ZKABOLFpDgdewUpboY0YyicfibVkwDp41UV6TG87vIxZIj900m7Dk/0', 'oyP7DwDix1n41b9_jA6-4YJprylY', '', '0', '', '1', '1', '0', '0', '', '1466939456');
INSERT INTO `tyms_users` VALUES ('350', '非常田', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eAT23pkecpydYan6NFV6I6mQo1ce7b2lVLD5N8icxpGOUiaTrSSJrbKSZ9Dya6icxloHY5j7ZSNWYfO/0', 'oyP7DwKUufudrkqcClaZ8zc2W90U', '', '0', '', '1', '1', '0', '0', '', '1466949886');
INSERT INTO `tyms_users` VALUES ('351', 'T.T.', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdP67YsVf5Bxm7WIaJXKr2D35wwMhBiaJrRjyFSfibniahGaOsMgQePoMhQPxHRLm9Id5XmibX990OFNI/0', 'oyP7DwLjUWzxD89sTpUZjILrL03c', '', '0', '', '1', '1', '0', '0', '', '1466951174');
INSERT INTO `tyms_users` VALUES ('352', '瞌睡虫', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia8xc63M8rYYBgO8ia8ibicNmGw8HJNGJEq1E7D0fdQKqcO1PubfMUF7B7jmPUgtDt9jJOLNzVo6UoMc/0', 'oyP7DwNWWasKU3IG0DsnW3a0UL1c', '', '0', '', '1', '1', '0', '0', '', '1466987247');
INSERT INTO `tyms_users` VALUES ('353', 'lucky', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibd8WzCXiaG7gbHALWuiaNO1tOUbFdIzVzR3W3uNtDwIzDganM6IM0obLRuKv8YxTmUI9Pg8DSnQYvBg/0', 'oyP7DwNguG8tVdOTdSchL3ZN9JHE', '', '0', '', '1', '1', '0', '0', '', '1466988643');
INSERT INTO `tyms_users` VALUES ('354', '龙重阳', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p10vhJkJJkzZ8MrFuj5jbgiceTou3qCODaL2qTeeciaRPnEsjicpJzQA7CB9O4lKhSvASKAwJYPfYK1DibbxyHl6B9q/0', 'oyP7DwDJwb7LNQmpv1O4cRmWpWuc', '', '0', '', '1', '1', '0', '0', '', '1466988834');
INSERT INTO `tyms_users` VALUES ('355', '青山', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELT5Uwfq8tsPhj3kmKbetSpBd6cQHCG5xcX7V60Tkp5SEVaprw7Sa7tRPS9mqoZdWkB1p8DZMGBsA/0', 'oyP7DwGiXg5IuuMG4VtdducFTEno', '', '0', '', '1', '1', '0', '0', '', '1466989452');
INSERT INTO `tyms_users` VALUES ('356', '手背', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBUJsQ3tXrZA5YOTbt1icl4zL2F5HHnyZBNZnVZkDH1q8Hic6z4g9snbicghRuE8wHQCRTbusEScPcWQ/0', 'oyP7DwLop86Z95jB1uk_NahivMpI', '', '0', '', '1', '1', '0', '0', '', '1466989722');
INSERT INTO `tyms_users` VALUES ('357', '天和', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdLz9MayGqUibFJYST8SOhNicc4YAQEGDbmJnLFia0Waq8XIOQnCxzX6ibLrY6iawBDhV7kuffjNHrEvCU/0', 'oyP7DwIIg7DrWQZm--Ztrvi6TxzY', '', '0', '', '1', '1', '0', '0', '', '1466992350');
INSERT INTO `tyms_users` VALUES ('358', 'Molly', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEL27fubqD9wgIreCEkzSiazfKtQ5kzPwz0odRTSv48aE9LOU0rycGZvbkZs1Imlibib0qdWyD8YFyGx/0', 'oyP7DwOCo9KagViButWHcTHIMNoI', '', '0', '', '1', '1', '0', '0', '', '1466992837');
INSERT INTO `tyms_users` VALUES ('359', '小郭', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEEKyMs33F8w4Jiba7GMtcjSgGwgqSbB2p5ZSEg7Kpdzruu5SnEKak2spVID7QXSltDPNTeiaYhribP0/0', 'oyP7DwKnA-HiG3vrwusfXFp0N77w', '', '0', '', '1', '1', '0', '0', '', '1466993259');
INSERT INTO `tyms_users` VALUES ('360', '李', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibf4iaC1dzUKGEEQMUFU1gNI3O9xNBp3VcwUf8ekJicyaQVkNUiayaJqWfjk66jNuYWu3ibYbS9Da6pMgAgIJ0UC3jS5/0', 'oyP7DwMaSSBEFrz4vaIbJw77yKWA', '', '0', '', '1', '1', '0', '0', '', '1466995066');
INSERT INTO `tyms_users` VALUES ('361', 'A李刚-网站设计', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcKafmM92ianht095XKwcpEKU4rBMnnFv6M4XXdrtyE8kktiaTliak34v2JUiabSKOlfmWE0Z2V0bDReg/0', 'oyP7DwLtEtkzkHRAFmKyXcxPyme0', '', '0', '', '1', '1', '0', '0', '', '1466996881');
INSERT INTO `tyms_users` VALUES ('362', '作风哥', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD8EfXgkMO8OIiaUTQW33tqIRT4IYPeTftmbnBhiaY4Q9FFR99ncOuyWRoUV27MjhjjiaR7kJMYqoj2A/0', 'oyP7DwLcg0TNHqCPIKu9TvkknpLI', '', '0', '', '1', '1', '0', '0', '', '1466998869');
INSERT INTO `tyms_users` VALUES ('363', '正在输入......', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDtjvWV2t8wiblnL2kDWXkJvEnXutxjbka60pv9X6MGCrL8OD3xaB4sl67temcqtJRIMptiaz0TnbCQ/0', 'oyP7DwGIppra_THL5NpZDqLCpz9A', '', '0', '', '1', '1', '0', '0', '', '1466999262');
INSERT INTO `tyms_users` VALUES ('364', 'Leslie 祥！', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Uznrp9X6whhzHxvV2TaYkIO7IKuicldSmHic8axmfwXD2kibGPfJrg6C6IznoFs354fAj9ZeSHMwI4/0', 'oyP7DwErNG3wNQfbVJKL9uSfLPx0', '', '0', '', '1', '1', '0', '0', '', '1467003326');
INSERT INTO `tyms_users` VALUES ('365', '邢健', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibctYkS85iaiazI9GHLe1wKg29CUctDaCiaH1CfKdQzLJ0ufuMJw95tNo9ze04xDc7LpsuweI9VJ0Qb1ibaibWPFVQGa2/0', 'oyP7DwOB2iPPZCXNbHifaAuW6Q40', '', '0', '', '1', '1', '0', '0', '', '1467009162');
INSERT INTO `tyms_users` VALUES ('366', '大红马 ', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcyyrcicYDKAeHRlIzoaMGTPBOAacLjbpzz2lEdHXIdCuKeUOb81SLM67RkeRarV1wB84rVGfHEdWg/0', 'oyP7DwLrxJf-rlWEt5c7xGAv1KZk', '', '0', '', '1', '1', '0', '0', '', '1467009514');
INSERT INTO `tyms_users` VALUES ('367', '阿福', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdSbrpJ0nQ0Lh8SwcmWxRDeZGTuBVnsXa31hxuRHXJrRvKrIJohlQvGeMQIPR53fia0icU7QibUsQeopxulfJnHjy6/0', 'oyP7DwA5HZaCl3mkl9D92bQl_yu4', '', '0', '', '1', '1', '0', '0', '', '1467015499');
INSERT INTO `tyms_users` VALUES ('368', '曾幸彬', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3WabJWiajF1vyHm0ZMS5V6flGXicLF0AOwxHMJtAxSVZGqavGGasiabHBOsD48C5XEBLlsn8NaBmlGp5WnU6gPjwZ/0', 'oyP7DwJfCl9LDaaIXPMhruwPe5ss', '', '0', '', '1', '1', '0', '0', '', '1467016799');
INSERT INTO `tyms_users` VALUES ('369', 'sai', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7tCL5GxicakiaTy0qphx5zFMiahAmLSYbXcsOey0pFiaYN9meFcdBNy6mRiaGKyD5fUM7ocWGaMPkwhz/0', 'oyP7DwCgTiMW19Y6zTBgZpvcfigo', '', '0', '', '1', '1', '0', '0', '', '1467018306');
INSERT INTO `tyms_users` VALUES ('370', '༄ེིོུ消ཉ྄ིོུ失༄', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90JiaaKbumuUWxNzdbTgXwicXlgGYtMgb5JdxvlzMNic2nTibudibOcVECh6SUFqHaX02S2BzWkA12ibpDn/0', 'oyP7DwCGihB-6kLHCxMuJAPeQ3GA', '', '0', '', '1', '1', '0', '0', '', '1467021951');
INSERT INTO `tyms_users` VALUES ('371', '文辉  400.comོ', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2zFZH7UIERicnkEjHibSiaxj1HicXDiaJBoUwr7JDdYNjHBXJNW09osmm55bOxsWibawmRiaCQRkw4oD5Ov9oQUooZ6we/0', 'oyP7DwEZ2I1ZtDpPhGJCX_hwpbqs', '', '0', '', '1', '1', '0', '0', '', '1467022829');
INSERT INTO `tyms_users` VALUES ('372', '李刚', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM45dFKYFJibOvZRyfyd5Sb5exf9dE3SiaSGEhibDdwiaCjZUpawvicwicSjmSkMM8AGkRaL6uEqfDMwiafug/0', 'oyP7DwBizmuDqKeWJbQn325afKVM', '', '0', '', '1', '1', '0', '0', '', '1467026213');
INSERT INTO `tyms_users` VALUES ('373', '如来神掌', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELBqHLibyzuz861j6JZr9pnn3d0PDK9FtPGe7sbo9QfgXCN1T9asysvduKNiaqyN4mFN6B9sVposnJw/0', 'oyP7DwDpIhsoiklRyq7pdk_dD4XU', '', '0', '', '1', '1', '0', '0', '', '1467026432');
INSERT INTO `tyms_users` VALUES ('374', '张高郑', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eG3oUV9br9jGnRJDZgPUufDFjNr2c57FuSbFWgvty1GXpvI1xic6TgMvTRtHZZ72hAvZ59mib37xpic/0', 'oyP7DwLVWybR-GvxDrDiiejJ5C0E', '', '0', '', '1', '1', '0', '0', '', '1467076526');
INSERT INTO `tyms_users` VALUES ('375', 'NON', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaib33oTqg6XCAARysibWibYWwwkYykqQLCZHN62thSt5zOUchfvNADPtaLHhIEib7UdzcUeo8VRJiab9ib/0', 'oyP7DwLl0Pwl9zE6zkwXVmggjTKk', '', '0', '', '1', '1', '0', '0', '', '1467076912');
INSERT INTO `tyms_users` VALUES ('376', '前行', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5Ch3RTetFXwYzWibfMwFibTiaEWZ9ueY9qTnU7E2LQPTdpenRxAlMPyAv2a9DVpG7q0XBGu32F9zb8A/0', 'oyP7DwEoYC25vY8jQevaYL77Nlxw', '', '0', '', '1', '1', '0', '0', '', '1467080519');
INSERT INTO `tyms_users` VALUES ('377', '微信用户', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIB0ibeS3mNBf23sQBzxcibiaKFIIr2jxKJ0bIiayrXsO4Pw8RdW6jDYCsAwHwicj6Ipg8JAQ0XXeaGLMg/0', 'oyP7DwLMcvAQX_CLfMmUk7RJpsIk', '', '0', '', '1', '1', '0', '0', '', '1467082177');
INSERT INTO `tyms_users` VALUES ('378', 'A0魏椿人', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6ojkTdwuRjvUwicDxRQaCsP4XlBuS4F8ibBn7ESROibj8TQTCtAx8dMuOeLjCAbyzAaicO83yggDyC4g/0', 'oyP7DwCsWSRzl7edlHzzgadC3zUg', '', '0', '', '1', '1', '0', '0', '', '1467084264');
INSERT INTO `tyms_users` VALUES ('379', '信源、叶家良', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY54q2UX9d8nGsl5P25nlS5Bu5f6AvPic0kVQVStUlLAOTwiaJq5icibEAx7r2L00V7LiaMOAkq3Qic3YrqW/0', 'oyP7DwPEpr9T5kx0JPO5cqEhYg0E', '', '0', '', '1', '1', '0', '0', '', '1467084461');
INSERT INTO `tyms_users` VALUES ('380', '微影客', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eG0rQUs6tXp4D9S8QQaiceHPZvHOgOzia2tibUBv5ywkfZicqyMJ6Oeib7aQJaTRZVic2vmeBk2hMmszoF/0', 'oyP7DwPLSAd_JDsG3krDTjpRFKHs', '', '0', '', '1', '1', '0', '0', '', '1467085296');
INSERT INTO `tyms_users` VALUES ('381', '弓长广日匀', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6Y25XvjUM9hpss0KH2UibSibps83IPo0HRLmttRVfriaBJV52W6rq4VQ52tLrw03yjxA8xCUuicYGJqA/0', 'oyP7DwGRruICUOVY8Dml_gfGzJf0', '', '0', '', '1', '1', '0', '0', '', '1467085949');
INSERT INTO `tyms_users` VALUES ('382', '吃开心果的虫子', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3ice2aEczmJEiaNicHd6YAROeIccWV4lrNYIRN79Ubjib2Msf4Awyojnm0DvdsTVHFI6GqzfAz3lKNpQ/0', 'oyP7DwFwHtEMV6fevonK7RPN5h-8', '', '0', '', '1', '1', '0', '0', '', '1467086716');
INSERT INTO `tyms_users` VALUES ('383', 'Adam', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKgzXohhK76kKZsfIeyia1wC7ib1vSjrFYPt4vbJD2mQVqNTD6c5iaBpxVKDb96owQVlw1IYksYCFz4w/0', 'oyP7DwKFR8ycvwfCAfwmuM3uu1Fg', '', '0', '', '1', '1', '0', '0', '', '1467088353');
INSERT INTO `tyms_users` VALUES ('384', '李志强', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMLLY76dpre2bQpwZOOOHMjCwNFrgOIrugIHys7EhvQR7gYmGvyKYKOibHKNbl7IhTBGxeKJ7SkBe/0', 'oyP7DwOnYf9MMzl5MfMJAS17tF34', '', '0', '', '1', '1', '0', '0', '', '1467088760');
INSERT INTO `tyms_users` VALUES ('385', '18932020010', null, null, '', '0', '18932020010', '1', '1', '0', '0', '', '1467089277');
INSERT INTO `tyms_users` VALUES ('386', '放马南山', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKEhleW9ibLibias1PANQ2lpJMzUZPQObqjpdhy9WL822hW0mTW6rJRALiaADMMopTfQ8NnoCZBXhT2W/0', 'oyP7DwPfrcZ2aDPpbcyiwIJaheL0', '', '0', '', '1', '1', '0', '0', '', '1467090078');
INSERT INTO `tyms_users` VALUES ('387', '闪拓软件No.1', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEL8olWgXCCEhoMBmSpkCMPicZ1ZwUxpp488VENiccicsDZmezs2iab39aYGb6gE7WjibC1s2SLDIhx9Hy/0', 'oyP7DwGYm7i522lhjkiPbRonjXEA', '', '0', '', '1', '1', '0', '0', '', '1467091638');
INSERT INTO `tyms_users` VALUES ('388', '微信用户', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia8cjY81eicwZXgQS2BPT2TfjYb9KKnYqarY90ich6PlfiaNQRNEYY68NVwSoEjSxb4hLxmJC6OOgVH9/0', 'oyP7DwO8BjYIbpl6BlhIFjnndV9Y', '', '0', '', '1', '1', '0', '0', '', '1467092449');
INSERT INTO `tyms_users` VALUES ('389', 'Demo', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDDTGpABGGVtuGMcDIvCoHf8y8NH0Vvobj1gN4f0537eLqUSJby6Sespdne9hQP0umfxan9mayMf/0', 'oyP7DwBmL_Atdcw1EfGmu4dDNUMs', '', '0', '', '1', '1', '0', '0', '', '1467093093');
INSERT INTO `tyms_users` VALUES ('390', 'pengbo', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP27ovYxGxPeCbNic7kIMksiarz1rUeInib4RVDWTggFTPDYiaTZEa5tPc8z7ZfwqpvDs7IlpHnHcJfRtV1VO1UzEr64/0', 'oyP7DwCHo799AhEsCs3RVATyB-I0', '', '0', '', '1', '1', '0', '0', '', '1467095949');
INSERT INTO `tyms_users` VALUES ('391', '鸢鸳', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOUxUhySVOX6xcDfv3ej5LAjhk0O62vN3iaoeu8jH5FSOhj6WUE2ChhlWpHTHyZgZJoCkpAa38Q6Q/0', 'oyP7DwPzy2OpEA0m_DUzp6rDSMhU', '', '0', '', '1', '1', '0', '0', '', '1467099235');
INSERT INTO `tyms_users` VALUES ('392', '秦琼蕊', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ibibz4iaOsuV8ozsaFtseM12DmSvdqQqINOFa8XFuzdLtKN4VQPgbCVskkmMicg6dV1Xjt3kQNHwQFQ/0', 'oyP7DwPc7yWW7Wv68UaUIXKamLws', '', '0', '', '1', '1', '0', '0', '', '1467101923');
INSERT INTO `tyms_users` VALUES ('393', 'Are we alone', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCdicpwhmOnXB6snt8Cxbx7CennEHlZJ9twuO3lxEDL6fysABOVQIibQ4ZbAibiaicDh0sgLkdknlwFbjQ/0', 'oyP7DwIGChBSyaiMBtu-FFL1yJZs', '', '0', '', '1', '1', '0', '0', '', '1467104080');
INSERT INTO `tyms_users` VALUES ('394', '稻子', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEHCAQm8aXKic7sicjImTcUq1zbY1HLOn7boM21AlfyUcjvMpia6C7H3v7a7CBwibpxFABRtRthzb6kfJ/0', 'oyP7DwA8RtQtcFKkSvBwrvciDSNQ', '', '0', '', '1', '1', '0', '0', '', '1467105232');
INSERT INTO `tyms_users` VALUES ('395', '老北', 'http://wx.qlogo.cn/mmopen/hY02C90AvzQMy7ZAfjgBHUCez42yPI69AsTTmMBmtD5sCnictN8O2RdRJYTx68QRPYMqsWYQicxicZFicvGqNxM4SPPdn7zIprMt/0', 'oyP7DwJAmvSM8xGI-TGDnZI1azqA', '', '0', '', '1', '1', '0', '0', '', '1467106894');
INSERT INTO `tyms_users` VALUES ('396', 'Brian.刘', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1NJ0ONRufhLk1J0RKkSQDAicFxl6eQ26HsxwK2uTEAdBDpte73hoLS94eoibliclkDAhuzv5NkS1ibJfEpLNG08Ax2/0', 'oyP7DwFP3IFB7JGdyot3x6zGWidg', '', '0', '', '1', '1', '0', '0', '', '1467107737');
INSERT INTO `tyms_users` VALUES ('397', 'CEO', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4uicAcYb7zT3Tb8LZCL7bktJpr1auKuZezcCpDAHIsj0b3hT9pZ5pnkS8nG40pAjktiaVhxFYicfy4F/0', 'oyP7DwDCPaCCVy7cW2kDFHFHa5nA', '', '0', '', '1', '1', '0', '0', '', '1467107923');
INSERT INTO `tyms_users` VALUES ('398', '时光', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDKtDUfgGEBOjHib0dhuezSe50NfedicEHF6cClxYoorubZWtQgyMbE7NvlO1MTnqtyjuV2pE87Mckw/0', 'oyP7DwAFtI54T4Y0t6GhV0lJDvm4', '', '0', '', '1', '1', '0', '0', '', '1467108416');
INSERT INTO `tyms_users` VALUES ('399', '吴东鹏', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELVh9e2qDm2icrbaGyPkuVp85R4Vk23slzkg3U1qsN3cgnibibych4vznHYSgA6tNpBpw691gAUuKLAQ/0', 'oyP7DwLSDw3p9FnLr0J7kZRCCSgw', '', '0', '', '1', '1', '0', '0', '', '1467108474');
INSERT INTO `tyms_users` VALUES ('400', '青柠萌', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3d06cYE4h64u7sJFxDqibCI1QWUQE29ye9V3LVDGpUprYxI2NKPicSUZFeZicoUMRoZba03rQibkbKSg/0', 'oyP7DwDDv1tJtBgqhqAnv3S6hc_k', '', '0', '', '1', '1', '0', '0', '', '1467108870');
INSERT INTO `tyms_users` VALUES ('401', '戴安娜Diana', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4icTvkae9j6oqVJ2G2KrFbN0KzMkY4cEXqibObUX7GpibUGRgRmGOlmL7E15JLAWRKPWDj6lWkUJhXUoj00RHGu1y/0', 'oyP7DwO11NEkWu8eV-nsSC4uHQTA', '', '0', '', '1', '1', '0', '0', '', '1467111690');
INSERT INTO `tyms_users` VALUES ('402', 'aguodont', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY58ytYdz6EZKZUvH180aa0ggu4dpxxKfeYq1WX2C4VsnDicXoU5ibj39QvSGTZKQnYa8kEvs64zwWaf/0', 'oyP7DwCPOVtLDbneDlnPDbB5V6hU', '', '0', '', '1', '1', '0', '0', '', '1467115101');
INSERT INTO `tyms_users` VALUES ('403', '中国贝贝', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC7Qf7XEiaSDyLn9KY96xUVia5r2B1AgLMibxN4GEBPuqYTdP5F9O5zic2CF5NeaD5FbmzwibXsucib2xog/0', 'oyP7DwHW56SHW2ojL-ORLDC5x3_M', '', '0', '', '1', '1', '0', '0', '', '1467115129');
INSERT INTO `tyms_users` VALUES ('404', 'camry-青红造了个白', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM798GFXhVrRmYbicTcH7mvLRFicETaPt3vtAaGDlH7GTlArkK9koOmoYiaI4qT4tle1hzAV2KibPJBibevNwfw2RgFDbd2MlVZ4B6P8/0', 'oyP7DwJxVMjn8KyvKoSJquvbXUGY', '', '0', '', '1', '1', '0', '0', '', '1467116711');
INSERT INTO `tyms_users` VALUES ('405', '微力传媒 周小賢', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QnREYwoqqBjfdVA3678CpLibxGMNibe5mRqAK1DquMtUGV1qSKrJv6vPYZzicic7lCmibnzTzDORxKsq/0', 'oyP7DwBNgi50wipJ2oKNW9caNmEI', '', '0', '', '1', '1', '0', '0', '', '1467119495');
INSERT INTO `tyms_users` VALUES ('406', '★A_七巧', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELgJxYaH3btHDeFhTAicyCWU54xWYYckpzAQ7oKZ4SD2RgjXyZ4UGV92j4NcbMzQTiaPzc2iaw9zBg7/0', 'oyP7DwB9WdX4AwHwadhs6wsZr0TY', '', '0', '', '1', '1', '0', '0', '', '1467120483');
INSERT INTO `tyms_users` VALUES ('407', '释情', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eOEaUXlibnpnmeePK1gfmcWvsNPSricicquuia9qAysqb3rB3dHdTKBiasYPHuYk6oa0sCVEssCghd5icq/0', 'oyP7DwEva-G4sFPhKKFT3kZympG8', '', '0', '', '1', '1', '0', '0', '', '1467121275');
INSERT INTO `tyms_users` VALUES ('408', '西风瘦马', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY505sH79r6fKMmIMpJQEXHXF6pUZA0m6HqyBCGEamjMJUXAoczfSuedqFfM0U4QTjyd30NZ7iborsZ/0', 'oyP7DwGNhu4gbK73CPS8QuujEg7w', '', '0', '', '1', '1', '0', '0', '', '1467123772');
INSERT INTO `tyms_users` VALUES ('409', 'sclfq', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4oic7FLGEV0BpA3HQbwtTQGHv1j65RF4Zb8c454RNk29vOLgsry69A6SZZxIMyqpP1lzicCgfFibHLU/0', 'oyP7DwHwvaOlumoUO6i258Ui5dlQ', '', '0', '', '1', '1', '0', '0', '', '1467126703');
INSERT INTO `tyms_users` VALUES ('410', '冬唐', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAfcnt0tgGssDCP5LezCpS6fBZjSUj5Ttfg0JLxcyCC6oMMqbiabZFHpOFmXWgHJJOrOSupulvMWvQ/0', 'oyP7DwI0gRDrOPxvudePD3etJ714', '', '0', '', '1', '1', '0', '0', '', '1467126878');
INSERT INTO `tyms_users` VALUES ('411', '轻描淡写', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELnb0aeQhJDbHXhznYw4LfEibGlfcIDkch13qjlzTh17mDlzT8nQib9hwX9ItDryb3LdicFEGoDeDYC/0', 'oyP7DwCL4GUCQEWdE13sORts6ZOY', '', '0', '', '1', '1', '0', '0', '', '1467131961');
INSERT INTO `tyms_users` VALUES ('412', '且行且珍惜', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlAlTywwyJO8qeNiarVbmW3ICFBZ8aNbqG1pO8ZaruCRZF59ib44iaCJ69Mnp91XfydfHkFDTCqSJby1/0', 'oyP7DwL2kMCo-zAe6ZlzhfQRXuLw', '', '0', '', '1', '1', '0', '0', '', '1467154990');
INSERT INTO `tyms_users` VALUES ('413', '李古董', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2H7HZaibz1R7pqEeE8dOJwzFIRNThjsWG5ibZe1P9fLTPsqehNcFsJ8nDv7y0OiaLbTiaejwScx2MhAhqVyaiayF6dH/0', 'oyP7DwAQc6pkYMWfJ7cjjkjIBNQA', '', '0', '', '1', '1', '0', '0', '', '1467164180');
INSERT INTO `tyms_users` VALUES ('414', 'Ryan.', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlHlLvVCC51gbjrN3GGd47wCRYU5CiaNSVDDt6udoYl7AXhDeg2OBGynoXNe6zCYlCd2x4Lgm7a4Xq/0', 'oyP7DwHBslOaioUmWAFSb25xca8Y', '', '0', '', '1', '1', '0', '0', '', '1467164497');
INSERT INTO `tyms_users` VALUES ('415', '高鹏', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0YITa6PxFMuqTianKRIRtJhaaOJPssXia2Fm5P8RnrEwh87V2q6Mbj4CNUWUiaQib8wfw7E56AeK5Iiaq/0', 'oyP7DwOBNobYo4CDVDVR1MEYT9xg', '', '0', '', '1', '1', '0', '0', '', '1467165028');
INSERT INTO `tyms_users` VALUES ('416', '大头熊', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UKvGdXE0tbZDKYPsWw4yMAamXA8wfiaQ3yfe9wAouU5OjzKGhZwVibYAm4UI0mgSSu4apne7SwbNv8/0', 'oyP7DwGfk3mWENU2WM_TsL6gNVVg', '', '0', '', '1', '1', '0', '0', '', '1467167490');
INSERT INTO `tyms_users` VALUES ('417', '陈房伟', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4lGr8tVvzLThHuNBxf0fuCx3vibTibZanQCia2SYNwOB0TNIUsEmQbGjr1bfDMld5LHB7WnFLldEStw/0', 'oyP7DwGRyJlOgxCSmqDf43iAxO8Y', '', '0', '', '1', '1', '0', '0', '', '1467168008');
INSERT INTO `tyms_users` VALUES ('418', '墨清阁书法招生办', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia74IhkkZUSSEX9dHSGG2mxJa16Kic1P0mXPXxreicfAS1Xrvx0aPpFTia7Ck35icQKjzggT0q34pzHic9/0', 'oyP7DwKQGGp6PT-9qOJR_Q8fehjU', '', '0', '', '1', '1', '0', '0', '', '1467168499');
INSERT INTO `tyms_users` VALUES ('419', '于无声处听惊雷', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7y7UORzubJqbZduZg0shkCzGFTGPq7SAqJw58iauY17YkuL9HK8TID8tEB1ZyL2pN6MydqKItXST/0', 'oyP7DwARtzTAghDdD14_f4V-pTK4', '', '0', '', '1', '1', '0', '0', '', '1467169024');
INSERT INTO `tyms_users` VALUES ('420', '小旭', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7ZbyB78ia44zJicFeF4iaQXF4FWY5j4pibiaibr1gp9J9yjFoUJYyqkwgnY3Y8ib8ib5hUNAshiahs3eWUChOfWqfNaFqyh/0', 'oyP7DwHCMT3PNklNox5D4rKKLHRs', '', '0', '', '1', '1', '0', '0', '', '1467170126');
INSERT INTO `tyms_users` VALUES ('421', 'DeathKnight', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCBSW9FMRzVbAziaWyKibYfJiboor6sWo5gQoWlDYyXib6t9GvVYrYvP77VuSU73YyYIW87Y4x1qwmUcQ/0', 'oyP7DwC-riBRUBwBb9kpClcCt97M', '', '0', '', '1', '1', '0', '0', '', '1467170142');
INSERT INTO `tyms_users` VALUES ('422', '严肃的猫', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4lxE0KScZ7nEqAPzCBDe3iarW2WrBQich9iaSW811zv1x20SibrnnAfLhcoHgDSCnSZfBZpibjiaibEgSTA/0', 'oyP7DwGlP7vXWkKiVXoaAP-tZxj4', '', '0', '', '1', '1', '0', '0', '', '1467170394');
INSERT INTO `tyms_users` VALUES ('423', 'why not', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibflicexsrmsTv8BcAAUeicZOib7AhJC7XtGKC3aGgjoB1j0GV4PcmSS1eE1eAHEzjeO0oYKfqj8KvY5dTBpFV08M3ic/0', 'oyP7DwCaBkKbFvNosFUZjKw_CIUo', '', '0', '', '1', '1', '0', '0', '', '1467170677');
INSERT INTO `tyms_users` VALUES ('424', '张东', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4l0uQwRne7LvU2ZibjxbH4lYy6MY7skNRD2IsDk50iahHLnyKoAVZUBLPsboW4sicEhdUVPltT5Ueh9/0', 'oyP7DwNaYlrANaQlzknDtUfnKkco', '', '0', '', '1', '1', '0', '0', '', '1467170866');
INSERT INTO `tyms_users` VALUES ('425', '挑灯看醉', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKFbNGNOTMqIKv7iaGP3d4Gs7o882d3oaicjhvkbD6QT6B5vvEIXgTkVfFNgW8zszWvmlicbgRQlODHiaib1TADv1XWm03DT674EBwo/0', 'oyP7DwAeM4wuVrSvPCbLMqkoOzJk', '', '0', '', '1', '1', '0', '0', '', '1467171997');
INSERT INTO `tyms_users` VALUES ('426', '木匠', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaxfYorbiceuFvcrzaQhZ9X2UacgINtDjaNJJj53kHFo8FicCVx2o6gItJEDUtfLhtZuEH1BT6yrbka/0', 'oyP7DwLvyYwBNlhgR9ksz9pJp8H4', '', '0', '', '1', '1', '0', '0', '', '1467173260');
INSERT INTO `tyms_users` VALUES ('427', '伍炎华', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4iaZx4CI3uLsrvMMeYCBkQhnW1TOj4lW8dK366zmZXv7Wj8CltLhZjDLBCk2CfEGwEbjVqPTf64vp/0', 'oyP7DwP6ArhHBlPKWDoECpMWkCL4', '', '0', '', '1', '1', '0', '0', '', '1467178328');
INSERT INTO `tyms_users` VALUES ('428', '苏健柱【网站项目外包、产品摄影】', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Qwia425apdcRSatlvvo2onjxr4n8CkicpcVRL9LhmsFzEe9pFase2Ev92j105EUxp7O8HvpicmuEOj/0', 'oyP7DwM-NK9kj4mn4_ILPxUbuhhs', '', '0', '', '1', '1', '0', '0', '', '1467178348');
INSERT INTO `tyms_users` VALUES ('429', '陈景新@eGoBest', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL77cZLEkeTuDN3orLZamFjvNnIk8Mdzj2fG8dPFDx1DNj2Z4wByTBKZWO8cssbcDyh5IsWAPBOwttUt83lXsHJ7/0', 'oyP7DwA1iU8gg5am64jJazEhyfv4', '', '0', '', '1', '1', '0', '0', '', '1467179306');
INSERT INTO `tyms_users` VALUES ('430', '陈小悟', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCceqicjDugXCORFictPIMAibicicMDibKRSIBn198mIp9sXkOVyLCE0OVicpq4RlGVdYMawUjl6icQia1Gl8VTyZr2eTKhDEhcPIwPa26A/0', 'oyP7DwFWiEjeh9DIxr9AZdpGWoqY', '', '0', '', '1', '1', '0', '0', '', '1467180722');
INSERT INTO `tyms_users` VALUES ('431', 'BOBo', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCtos4Pbqico4Bvntg5QEjpcfxHklko3jhgYDz8W0Av6woiaCW5ZFyC4noic4euib3o3DicAW8L4nmRSfA/0', 'oyP7DwGsKyQeU4R6OsIpVhsad2AE', '', '0', '', '1', '1', '0', '0', '', '1467180990');
INSERT INTO `tyms_users` VALUES ('432', '亚文', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMJvJj91u3R2KYaMon0XEjFlfHiaMkQxsibnLCdw6gic44oez5lIHFr29veSjOuOfKFJNykZicepFKWr/0', 'oyP7DwIqhxi1d5v_yokkb9URG5b4', '', '0', '', '1', '1', '0', '0', '', '1467183171');
INSERT INTO `tyms_users` VALUES ('433', '王园奇', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibe3X5TyIuj7H1pNtJWHiaAY9oNhPLjXia2bO5enW7U9vk1FFzsibOf9yAoW9Vo4r2sVCD7752MdJcl3qBvSlTMoiboG/0', 'oyP7DwEAhdDzOvfgnchkEh3Zr9-c', '', '0', '', '1', '1', '0', '0', '', '1467184149');
INSERT INTO `tyms_users` VALUES ('434', '小天', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1oFicQ1EhKOliaFEzADwbHiaMuoa6S7HTkhJibZ5lvjmibcOku9M9g1zicdT7ny0deBnvDa6puflvV8Cib/0', 'oyP7DwFv8eFnDZwa1qAIBsS8O7j4', '', '0', '', '1', '1', '0', '0', '', '1467185756');
INSERT INTO `tyms_users` VALUES ('435', '┢┦aΡｐy', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJgwbbMEsDMH0DAEPJgvgiceX4aIicW7vzicIckP36P5gLs7K2j6sMJ8bQ5Y2TYdZe8UPRMIgaIgdYyg/0', 'oyP7DwI1fKslnVZQcnxBtLHwi0gk', '', '0', '', '1', '1', '0', '0', '', '1467185969');
INSERT INTO `tyms_users` VALUES ('436', '雪诺', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJa9vLiclL0YjU0rOdIjzCMuJ3zYjv0fFTPLxiaJaic6XRetECBe2lnbtYnjIV00vibmXibPNEPBat9qVw/0', 'oyP7DwNFtlEZn896Zqy_3GX5tPVw', '', '0', '', '1', '1', '0', '0', '', '1467186467');
INSERT INTO `tyms_users` VALUES ('437', '罗根', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL2SfHGwo2HUjLevDQUkXJa6fwMoUdbYsfzecCYxT9ZaR15MiaIxEILXjia5yh17ZDNBIxBzplutX7w/0', 'oyP7DwDfr_f7SfzSnm8uxDb23p80', '', '0', '', '1', '1', '0', '0', '', '1467188523');
INSERT INTO `tyms_users` VALUES ('438', 'shallwe99', '', 'oyP7DwM5S-26U4D1kvm9d0juxK1U', '', '0', '', '1', '1', '0', '0', '', '1467188594');
INSERT INTO `tyms_users` VALUES ('439', '张六六', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY52mic2ZJzjLOC5o0icgbpNv1tCkWCntlALjtGUkdA0Z1f6T3iaWcxBMPNaia4lribuczgjdicXDarvHEDP/0', 'oyP7DwFesexgyZO7HtYc-mPSaw7A', '', '0', '', '1', '1', '0', '0', '', '1467189541');
INSERT INTO `tyms_users` VALUES ('440', '王子术', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL2DgsOCE4u6iawSzjjiaJk0quS2lUoqJgK14JickDvAz7eERibfjNcdMFHYgZ6cA6A7jVde79batkmfg/0', 'oyP7DwC768zh5jgwkT0YHkkWFTlA', '', '0', '', '1', '1', '0', '0', '', '1467197656');
INSERT INTO `tyms_users` VALUES ('441', '南极', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5KScaR36AYws6DpZOLxa2Ua3aphUcGc76VuknrnFulu3sViaCF6TpEkjWoBvSenOZ6TGI60icNcExEuHS7UI44Is/0', 'oyP7DwLvdNTYgnwVEfHXRWQVpItI', '', '0', '', '1', '1', '0', '0', '', '1467198544');
INSERT INTO `tyms_users` VALUES ('442', '自来也', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0mOBaroBROe1fr2G62hUlL4n3PzjaZtXBicgk5BicCZiaiaIia2ImhtQhkvsdr7ttEwFJKCSAMtZAOEFmJhNbCd0xz2/0', 'oyP7DwE7veYWaKEIuaJTCHtKpnxk', '', '0', '', '1', '1', '0', '0', '', '1467203641');
INSERT INTO `tyms_users` VALUES ('443', '寺城', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6WsZZIW7JlESPEz19SbyGEIuQtzWDx50xtIyG9mkMZuRkS4jiadVwxMAFlibV9tzJfBoYl8R9Yl2q6BnDEzBOf0P/0', 'oyP7DwDVMJ4XKYEMBevFGTIlFTh4', '', '0', '', '1', '1', '0', '0', '', '1467205975');
INSERT INTO `tyms_users` VALUES ('444', '温双', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UCTsooctmNnEXqc5Lj9uIegmWFbnmQxCR3AV4DiaM8FALQn0PR5I9cudcC1wI3iaOqPZxISFPDhXbT/0', 'oyP7DwJkSVfljIFjfynpAXqO7XuE', '', '0', '', '1', '1', '0', '0', '', '1467209945');
INSERT INTO `tyms_users` VALUES ('445', '罗东菊', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4uEmh7SAFY7DDQayDz59iavFiaRvqsx8zKNkl6Z8pQ5MFDPnyCaMdiaWbkzhticshM5DMzic3dzxRK4Vo/0', 'oyP7DwG7Vu8xDAigLzZC3b9dcJoA', '', '0', '', '1', '1', '0', '0', '', '1467213230');
INSERT INTO `tyms_users` VALUES ('446', '阳诡子', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdgq0BFBiaicgjaX5jiaxgZia5YA2D3e8TibhVSdXL1FZwHVUNRIeKRef7RoEB2ibRfbBufYFI9j1X0byJwFB9qYop3lYLlylePSiabiao/0', 'oyP7DwAZ34S7gIq6PmVEfUfYEsx4', '', '0', '', '1', '1', '0', '0', '', '1467251099');
INSERT INTO `tyms_users` VALUES ('447', '1258058@qq.com', null, null, '', '0', '', '1', '1', '0', '0', '', '1467251740');
INSERT INTO `tyms_users` VALUES ('448', '*云淡*风轻*', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0cyVkknQKgTxAKKMFhCBU9PabJClbX996YibxVatiaoxq2pJmCZTeuhadRFFvb6ttOM9pW5d8aswaB0wicjDeUTHQ/0', 'oyP7DwJOUT8vxZW6ABW2b6vN9rCs', '', '0', '', '1', '1', '0', '0', '', '1467252740');
INSERT INTO `tyms_users` VALUES ('449', '星光下的暧昧', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY57GoRhZdibU8H0IOOZnT9CibcLnibqJldwASXzkqysMSpTicpVLkhr2NibFj0TP1MOpffIaYPmYTSo6Ne/0', 'oyP7DwM5PburW0plbjD8_E39mMDU', '', '0', '', '1', '1', '0', '0', '', '1467253114');
INSERT INTO `tyms_users` VALUES ('450', 'TRock', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5DekJMNYosrd9TRe6C4Lj6Ju72dYnhO5VNqjj4uB2Rl0yHus0rKiaficDoOozqfRNFr6y6Gp5uzrzUAia6ZvWoBia8/0', 'oyP7DwBhHRHL1gi_XPG_uVpxrVX0', '', '0', '', '1', '1', '0', '0', '', '1467254540');
INSERT INTO `tyms_users` VALUES ('451', 'MAX', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0wDycxb0jGjmKb5ibP5zp70ficeZzeSXGqGLKBoGgS0lKkN83T3S3sHEwQHWiabkibOKN9Zr3YEq6iamJftibgE3zib9S/0', 'oyP7DwHb6x4NNbFDmizzUUK3DI6Q', '', '0', '', '1', '1', '0', '0', '', '1467254558');
INSERT INTO `tyms_users` VALUES ('452', 'Z', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eNPA8M6K7yz3viatJlnwNrM9oFPK8wAgCsiaLz5V6oWzjThDLJWHdO21IRlSLNm7hI7kO2lZPEh2icT/0', 'oyP7DwOn8aGzAX32hcHegeSZJ2Qk', '', '0', '', '1', '1', '0', '0', '', '1467255965');
INSERT INTO `tyms_users` VALUES ('453', 'J.C', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5U2a3syJha8yIcJt4ZmjMZHZWQjdd4jQTM4gsE4Cb4ia7SdmzvwUvgIqchpdodo3RVxK40RelOxfYTWgdadz2NY/0', 'oyP7DwH-VwXskC7ATULkHVtEjatQ', '', '0', '', '1', '1', '0', '0', '', '1467257678');
INSERT INTO `tyms_users` VALUES ('454', '杨欢欢', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibec5YFMJqPp5TU8xiaExOKquK54PYftELdaiaOHjgg7tMWWOX7CY7ZMVxMgiaR59jvtu2jdOe6NoPtgw/0', 'oyP7DwIAcZS12Md-YXLeobojWd4U', '', '0', '', '1', '1', '0', '0', '', '1467258447');
INSERT INTO `tyms_users` VALUES ('455', '陆子陌陌', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEHNvgFQhCoMB9wrt6kv5clsBTeAm5KQiczYxLXLT8H6j3krNc7J2ays75Nz5CyrcVK5RicUuAWrHNW/0', 'oyP7DwBPUdJr4xKZTpaxW-2PMtS8', '', '0', '', '1', '1', '0', '0', '', '1467259002');
INSERT INTO `tyms_users` VALUES ('456', '梦羽', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5dxb0NDrk4flwvA6uRGXsWYickD7vAkXmHqzujc4ADagCjdib0rR4WOKOzibdBSLX3XevwdXMR9Hsibw/0', 'oyP7DwHrN1xRnw4R71cTVFbfbq8o', '', '0', '', '1', '1', '0', '0', '', '1467269548');
INSERT INTO `tyms_users` VALUES ('457', '火符', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlIiaicoQZIfsuByd4F9bz5VI2DeFg8XfzicOR7cTMAia3icZRVKnyqZeiaylvWL5BQAv0NpAD8Hjfw80tV/0', 'oyP7DwCFgIs17GnSJ893sQIfzjJs', '', '0', '', '1', '1', '0', '0', '', '1467274191');
INSERT INTO `tyms_users` VALUES ('458', '似水流年1', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0T8Zafiab1sIGkRrib0fkb94bDgV1ujBO3K0efNpIFQoPfaAEXlW1MkliaMH9SC1OtfndStxbyVCHQ1/0', 'oyP7DwG4bCqn0UP47I7rnZASPmGM', '', '0', '', '1', '1', '0', '0', '', '1467278244');
INSERT INTO `tyms_users` VALUES ('459', 'MASONman', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJXiaCTBvZWDYwzagAzSicGF4314bkm9TlW1gvv6s8Bdqs96yFpL6bdfAMXwcsZckLFLNg5fefmdW8g/0', 'oyP7DwBW2-U3v0wk7Uk9tXamBtYI', '', '0', '', '1', '1', '0', '0', '', '1467280603');
INSERT INTO `tyms_users` VALUES ('460', '北方的狼', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLChyHswnt3SibZqdDmjRH1w4g048XSMtCNog4prgbtnVDoibWvjGuS0pz9fzQse68mdoP38epXIzSiaQ/0', 'oyP7DwKr1ZXcsskE9O_LW40Zff-c', '', '0', '', '1', '1', '0', '0', '', '1467288261');
INSERT INTO `tyms_users` VALUES ('461', '单曲循环', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dED9JJxNAcLjCXceqJKScsFeWzhAGtznPYcYD0pHsIxWiaVvqSNibs07tVtVZXmdRAVG2UXsdRNUecN/0', 'oyP7DwBLM24EC7WBoFZcArMMUGn4', '', '0', '', '1', '1', '0', '0', '', '1467304522');
INSERT INTO `tyms_users` VALUES ('462', 'Ｅnterゝ', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL63d2UaHQwQzu2aY1zfVcNLtfepXYR9XHWL8T71Q6gTrWIQ2pAkLjoWlCl9JUTEEQ9myicMMWPia5hvOWAicglhtG3/0', 'oyP7DwOoD1ihOFbKQMlgt71azytY', '', '0', '', '1', '1', '0', '0', '', '1467337160');
INSERT INTO `tyms_users` VALUES ('463', 'Mr.happy☀', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaxpmkF85DHjxSicicVCu1BxcZJrTcJiaSTVniaYv3yI8Wib3G7wgh0pLUA57Sc7ib5sxU0ib6yzFrZBv6Zk/0', 'oyP7DwH-GMBXexFIGx2RHgTgSqgI', '', '0', '', '1', '1', '0', '0', '', '1467337363');
INSERT INTO `tyms_users` VALUES ('464', 'Heung.Bear(晶綺)', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4kQiaFgdpiaLcVrN7fLRysq68lwhu6FwtJr2lfVgdoZgQj4iaxl4VHY1BNecWVQNGUnwsm4xMgd8baib/0', 'oyP7DwGO8JavdG8ol5YU6w5PiQsU', '', '0', '', '1', '1', '0', '0', '', '1467338897');
INSERT INTO `tyms_users` VALUES ('465', '谭鋆贤', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEIRm9ibuEaGWnLVg5UtibHPlA2cUBQ991LltDrej2YsEpbzHTcGI51myaE0u8YXX5dcZpgmcs3LUZp/0', 'oyP7DwONvSSeAR44bV7bI1hymEQ0', '', '0', '', '1', '1', '0', '0', '', '1467341133');
INSERT INTO `tyms_users` VALUES ('466', 'oayloev', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazAtCRfX036DU2hMnEUdianKPoZYEA2j9ibBwo2Y0drp8k8MymNia5ZPeIMkaltLd0NsMKFqQiczibj1e/0', 'oyP7DwG0FgNI36n91DAAeVuirJqU', '', '0', '', '1', '1', '0', '0', '', '1467343573');
INSERT INTO `tyms_users` VALUES ('467', '1144134213@qq.com', null, null, '', '0', '', '1', '1', '0', '0', '', '1467344187');
INSERT INTO `tyms_users` VALUES ('468', '阿明', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIC9Tr48KkqLRhXB9dcy3mljHQC1JnLY6457nTIKgc0kU66hQbKMsdKWw8cwZkAXC0EqehVOZs92A/0', 'oyP7DwEQ-jdr2lNUyTIEi88bVyTA', '', '0', '', '1', '1', '0', '0', '', '1467344224');
INSERT INTO `tyms_users` VALUES ('469', 'A毛毛', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdicoqIPymQq2NNtE9UNnBBVpUn8MubF2WmvcVXezfib1Y9SibhgGLJwvh3r7ASsnNicHGePINJf5cBZA/0', 'oyP7DwK2SNBm9kJ0KCrQnV1bEgUU', '', '0', '', '1', '1', '0', '0', '', '1467344283');
INSERT INTO `tyms_users` VALUES ('470', '&Thom Browne', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p15W3c3wPeiabrjd1ck1rHNP0qiaL769nfdSEUwvfAR9vfcTRAPcibD4Tia2j9GojpxjL9PRUvIKvia0b0aJHUCphjibh/0', 'oyP7DwC54uBsWJGcIn3XLzxi3slg', '', '0', '', '1', '1', '0', '0', '', '1467344875');
INSERT INTO `tyms_users` VALUES ('471', 'SunBowl', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfpEfB4nrXfBYmETGhPcnpicSPZ5sqexdVBDmyk8nmOFibvBBvULxcEy5K1Rph8055uNl59KhIBR4BJ1ibYUjuMbjy/0', 'oyP7DwEpU4kTaypXv20tCHWZef54', '', '0', '', '1', '1', '0', '0', '', '1467349609');
INSERT INTO `tyms_users` VALUES ('472', 'A0杜桥东部人才', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6q9JspBWGcDicwBGuWVROe4mIj1FpwajmysZwE4MG40q0LIdwwM3hmCLiaKfuuOw95wz2NTNoCohkw/0', 'oyP7DwKO0R8K001pgLp3zghxFlII', '', '0', '', '1', '1', '0', '0', '', '1467351442');
INSERT INTO `tyms_users` VALUES ('473', 'andy', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGNbD0ZGBgs0K8icmlYqO5m1kxDyFzbkiaw3vvQrKgRcf5hz0jP8anV0JlEwFSwga0EmWTgu0yhDzL/0', 'oyP7DwGYljI7c6c6djyzLUsLxWUU', '', '0', '', '1', '1', '0', '0', '', '1467354565');
INSERT INTO `tyms_users` VALUES ('474', '孙不二', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY58fd940QPANY3cUM9dTffKXKVvZ22v59r7ibM6dyMibmickfwda2k2lmYPlKLeVYNiaANSry3ScYfsYf/0', 'oyP7DwMQ_lXzXTh_Gf6uZwr87024', '', '0', '', '1', '1', '0', '0', '', '1467355301');
INSERT INTO `tyms_users` VALUES ('475', 'Arios.L', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDLMiaK5o2T21WztFqVAsDfa9mNlbibWAsyiaoqVtibgWOc2S6IMtt4Bensr9rhSPQicC2Q9Sm3icCVNfHQ/0', 'oyP7DwPpQVKaO5qtEzcGupWxW9VY', '', '0', '', '1', '1', '0', '0', '', '1467355844');
INSERT INTO `tyms_users` VALUES ('476', '一叶舟', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawiaqaE3KhKwEicyiawbBdf38JibqISHxKOLPfb31ruYiaiaD9eDy162y0lceBxlO1MB0FDJjBDicUjH3z9/0', 'oyP7DwB9oI5oIh63UJZQJxhkMgJc', '', '0', '', '1', '1', '0', '0', '', '1467357348');
INSERT INTO `tyms_users` VALUES ('477', '杀猪刀', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicInYnX3vqxGRtzWBsPDupUy3DJzib1cSd7KGtcc4KtF7z2HCWZQZjewMGG9BmCBCjib9g6Cqqk4sa/0', 'oyP7DwF6c88uDOqR5JJt4edhRUC4', '', '0', '', '1', '1', '0', '0', '', '1467358120');
INSERT INTO `tyms_users` VALUES ('478', '', 'http://wx.qlogo.cn/mmopen/LibNrIz6OEOqKJHWGtLNBhLAkCibibsgx5ga63UIEDwOkiaMJqHSr1OLdYnyDjXlNu3rQOiaFuicNZU9nfwtD8h2mczabjHPhKUF63/0', 'oyP7DwJUUmCXXoV0WzKG2X3ULg2k', '', '0', '', '1', '1', '0', '0', '', '1467359779');
INSERT INTO `tyms_users` VALUES ('479', '改个不太好记的昵称', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia8IOeueKIKJ2oDC3FAy9Rdwy7ibQwyxrLuvctruqAOSnu5A5hp3p8xU001J9UxPfI0pq8J70dbFzh/0', 'oyP7DwIXi-shn4qPClaGpAQ3_-v4', '', '0', '', '1', '1', '0', '0', '', '1467360471');
INSERT INTO `tyms_users` VALUES ('480', 'heart还好吧', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eHVgeuGYepXO0Wu0jHS1dWXGrwPlY7eZgnLJOzMbFYbtKN2rU6VjOYKTnYMVMfIpfREdPWVI2m4g/0', 'oyP7DwOi01VWReblkCvL0Huq6C0Y', '', '0', '', '1', '1', '0', '0', '', '1467362385');
INSERT INTO `tyms_users` VALUES ('481', 'michal', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia11ez2u0icnicY0icoWQicf7WW3byVSAOzlC4uU26MiboPlicRN7BVao6pMia9z0tWEl41EHbtRGm5drOIF/0', 'oyP7DwF9oilTH-L23jgJidaHfSJc', '', '0', '', '1', '1', '0', '0', '', '1467364004');
INSERT INTO `tyms_users` VALUES ('482', '春泥·初夏', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6kNXYO1F3wL6Q0LuMiaFd1Q35a6V9GacqO6MicGCfHsfZTkIk7YnZ6CrLzmLd3Msz6aoG9cicVnroeBufHiaD40c6m/0', 'oyP7DwBJS8BpAqGSfemzPFQmAgoA', '', '0', '', '1', '1', '0', '0', '', '1467364049');
INSERT INTO `tyms_users` VALUES ('483', '小强', '', 'oyP7DwEp_E4R5KpnE5MZ6ZIRYWYk', '', '0', '', '1', '1', '0', '0', '', '1467364412');
INSERT INTO `tyms_users` VALUES ('484', 'Tesla', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4kDMI8SIq00Wu3WAytHu3VxYQ3UKWyhWkHdZjtT12TohP8XRPuaLD0K5hJ03iaGVou7xXmcW2ZC9B/0', 'oyP7DwPmOXffFsRqpPJk-2N_QUQg', '', '0', '', '1', '1', '0', '0', '', '1467370524');
INSERT INTO `tyms_users` VALUES ('485', 'σ宁静致远', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eHUMYT9l64ZVk55nic2KdEAQicZpndzPAibyExOZV41lqUAiaXhPH9gtTP2ZO3dMiae2fWp5Sp0CWPh4r/0', 'oyP7DwF0_MIKXcBHig3PKNW4MYDI', '', '0', '', '1', '1', '0', '0', '', '1467370960');
INSERT INTO `tyms_users` VALUES ('486', '初舞CHUWU', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIHPj83lWb6wzSL6JfLDanuJqfwdumibqiaoMWpolqiaFgnBbXwpmic1ZE28Cv0x1wWKWgmwzsAIJtWg/0', 'oyP7DwC3temQHzYyXOlFQT1xCe1o', '', '0', '', '1', '1', '0', '0', '', '1467373923');
INSERT INTO `tyms_users` VALUES ('487', 'Andy', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK1MaiblE0btgylXYia3zSP4tIFtEbka1lFW9gHMDab5gjFbt2gQgpq9Wzvq4nWEruHPiccJttCn5JUw/0', 'oyP7DwKIhUvmv2otN9fpU2jDYBiM', '', '0', '', '1', '1', '0', '0', '', '1467376971');
INSERT INTO `tyms_users` VALUES ('488', 'Rade', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCfMHg86jrXxCicNIEKaxx24COzpYECfqDYnvtibYn7u9qPtYs7aBNOskcso8pOBsAohqk3tmCibXogg/0', 'oyP7DwL1BgYG8VZJw39LG7-YnWCE', '', '0', '', '1', '1', '0', '0', '', '1467381489');
INSERT INTO `tyms_users` VALUES ('489', 'lz1024', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ8M0ZsMWEWYRia8V29dfPRfSeX9kUO2Qpx79eQPdEytMZMBTCkHiauibR72k52RCHCLClK779ICkYkw/0', 'oyP7DwJLH_nU1DI_akzCOsQp2MPc', '', '0', '', '1', '1', '0', '0', '', '1467384790');
INSERT INTO `tyms_users` VALUES ('490', '宇宇宇宇宇宇宇', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJvogZXb8nJdTEAjczZia6AFyO88mfzJXQMXIqnQa6HmIOGD75SuK7q4lfib23W2EWLib1NFjq5C8Y0/0', 'oyP7DwKpt1YeMchbvVPR9T_epxQY', '', '0', '', '1', '1', '0', '0', '', '1467387504');
INSERT INTO `tyms_users` VALUES ('491', '大卫', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UHVp6odwdhslShIHGHXWqBqicwPGnhnVAia9Cd0E9QibRQ7KbWty7NFUehiaVicPbAxvVqnZQRCicyJ5tW/0', 'oyP7DwCr6AJ0TdjXUVxKVVv3Hn6Y', '', '0', '', '1', '1', '0', '0', '', '1467392125');
INSERT INTO `tyms_users` VALUES ('492', '我是坏人！', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaxgicG3AOzxMRjxM13ULwJNMD6cbDRdAYsp3yoTCdvjbfib8X9SP209HLc2cofL8MQyqfVdppQIT5K/0', 'oyP7DwB89nCUHeCg_ktIkxu71dso', '', '0', '', '1', '1', '0', '0', '', '1467393371');
INSERT INTO `tyms_users` VALUES ('493', '@YuTao', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eHgIWTY1WicrzAH5C9c50ia4LC5OBqZ583jAHryia8xyKHKuQrFT7YIVw0WhEkD77zqicvNsicmicaC8vh/0', 'oyP7DwHheyH2_yi6NVXAKW_rHgHc', '', '0', '', '1', '1', '0', '0', '', '1467415446');
INSERT INTO `tyms_users` VALUES ('494', '董记超', 'http://wx.qlogo.cn/mmopen/zlF6AxdcK8BSnaFDsiauOAmCV8hNp599eMqy6jTSTgDHwLHm3DZx0nHIrSokBZj9O3wyuBBlCDdfw4zFpbFeCShgKQkiaIhxAM/0', 'oyP7DwHq_NMXeW3i6qoPqJVV_mNI', '', '0', '', '1', '1', '0', '0', '', '1467417017');
INSERT INTO `tyms_users` VALUES ('495', '凯旋门付强', 'http://wx.qlogo.cn/mmopen/y4ibhUzTEvX3JB1at06zsDtF5EcbUOq7TIlEGP3kzrVaYTTlmkMwPRD8R3Zt0yia9qibpbecvkk28RBibKe6ibZWib0ffAic6fHePsj/0', 'oyP7DwL7gClLeRG-hOkEz1WDX7wY', '', '0', '', '1', '1', '0', '0', '', '1467424197');
INSERT INTO `tyms_users` VALUES ('496', 'XavierChen', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM61PgfpiaUnxWEX9jJuZBiaJV7D5uU3Sz2icOW5fsUibjUdKgl7RO4icvH9L3MxOuHmVDtibibIvOJRrkUNg/0', 'oyP7DwMt_ddoQAEXk2Mc_OAPwMJ8', '', '0', '', '1', '1', '0', '0', '', '1467428736');
INSERT INTO `tyms_users` VALUES ('497', '楊  堃', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazDl7MCFrNfmgm777eqfcAqxX7k5L6uTJB6a9AeFjzS5KR6DxYgjAkapwue1EWT0chBf5ohkEyWK/0', 'oyP7DwO07R3wMEOIjnSTyrx9imjY', '', '0', '', '1', '1', '0', '0', '', '1467430890');
INSERT INTO `tyms_users` VALUES ('498', '搬红砖的小男孩', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2ibBR706V4N9TybcwFYX1nhrPzLCtCTjLNicv6ib7zHaNMyy0ibkGdwCNh4swVkJgkUic4lsy3fwQa7VT0Vib0sLXsWib/0', 'oyP7DwNCifE8tCaWgHhEUqoyFHW4', '', '0', '', '1', '1', '0', '0', '', '1467435530');
INSERT INTO `tyms_users` VALUES ('499', '雷阿伦ly', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dENibRNJXeeQvlwVJzpWTZaZCBaF6Ieylic3vcwBjTp4ricjv647y1JPTdYInpciaYFicVDvgG5SSXVSrB/0', 'oyP7DwJrXBt26UR1sucEI9RdOYEo', '', '0', '', '1', '1', '0', '0', '', '1467436307');
INSERT INTO `tyms_users` VALUES ('500', '希', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2xZMgDkL8STwOETZSWOaXvheB8qIXlb2SJjVhSkVzXohWqa5gGlCB2ztbvuvJBHPaM4vqhicHgJHQ/0', 'oyP7DwLNE6QBzL4SzK_1jL-5AnvA', '', '0', '', '1', '1', '0', '0', '', '1467437593');
INSERT INTO `tyms_users` VALUES ('501', '嚣章', 'http://wx.qlogo.cn/mmopen/L6Wt2dDdhhWzWuJiamagcD2QEfiaeLM97KJhSMkMVTfsPuVjFqvuCeqhYicq8iaMxjrY9rfsPYicZw3fSicoxKBRHDOEHCRW0oc8z8/0', 'oyP7DwImthVK2wTUrFSQYYPa6weE', '', '0', '', '1', '1', '0', '0', '', '1467441684');
INSERT INTO `tyms_users` VALUES ('502', 'Phycho', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8ULSSLxzejaN1X1IYQQtLhFnicok4JPocM96bjqRcI97aPWicI8yI8Ikgz0IDxQykfs1dCcibEcrbHKp/0', 'oyP7DwJBpc1_d4W4oyWg97c_20pM', '', '0', '', '1', '1', '0', '0', '', '1467441756');
INSERT INTO `tyms_users` VALUES ('503', '凌箫勿念', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2zicfU45nrcFBy9Ut2Ltglibpgc7zKr7MJoiapxKzfHypiaRuSrxb2GXWMYicVzRRs6Cr1ba4IhZ2Jiczw/0', 'oyP7DwBFz17izh7Oghma8hIx1tb8', '', '0', '', '1', '1', '0', '0', '', '1467443392');
INSERT INTO `tyms_users` VALUES ('504', '袁娟', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcr2icp14H4e7VM2lD5LooOg3xafj3xzqmGiauujibeWwMxnckZzG06fn0ZNbVMUJMicoQ0URo84RynBg/0', 'oyP7DwEV5ObASAsX4mBIFnN2HqFE', '', '0', '', '1', '1', '0', '0', '', '1467444443');
INSERT INTO `tyms_users` VALUES ('505', 'Ocean', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4bwXX2tAAWB66nff8lG6TnEkLc3JtgT2QDuVcoMAf5oZdDZwssAYRgJibvreao9B9kNcyukkrlWiaA/0', 'oyP7DwApm6D7XxgYO4eAGZMiQ68M', '', '0', '', '1', '1', '0', '0', '', '1467448468');
INSERT INTO `tyms_users` VALUES ('506', '刘乃明', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELkccTibPElSY2IibRm9fYvUeKdSalcqRYTz4luzEz3vFrfvuFpo2hjVlabc55N1F2YfiahOPZx9hXaw/0', 'oyP7DwM_ezWXFQwyVgg5T3S6NwFU', '', '0', '', '1', '1', '0', '0', '', '1467449809');
INSERT INTO `tyms_users` VALUES ('507', '范嘉琪', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0UKQYBgwkRGeYjr0XsukbbsAxNUMfLiao9uAcaGS6tQNVy54wmKdJ75yUN9y4pBdMgEdTFDq4KK5h/0', 'oyP7DwFWnV-Lqre6l-lFReb-QbWM', '', '0', '', '1', '1', '0', '0', '', '1467449934');
INSERT INTO `tyms_users` VALUES ('508', '18900000000', null, null, '', '0', '18900000000', '1', '1', '0', '0', '', '1467450828');
INSERT INTO `tyms_users` VALUES ('509', 'iterator', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1o5vCZdoKncz1zNf4sKWHiauD6ySZakDjoTGFh3FlS2X74yXQl4O9ZHz70IK9pen0LD0FZHE6XTQdIdmJh6lXIk/0', 'oyP7DwObesF1Mh9VXBePuZ-PpI4w', '', '0', '', '1', '1', '0', '0', '', '1467469518');
INSERT INTO `tyms_users` VALUES ('510', 'Peter', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5maA65QCOSXP2zB7UYF2mLhOV9xIID9Zfa9V81ich3dktwOx6MKuwkFFgCJrhlj0TU0PdEicQRJJQQ/0', 'oyP7DwAwVVtmQmhOp7Sl5Wcq-qqw', '', '0', '', '1', '1', '0', '0', '', '1467470068');
INSERT INTO `tyms_users` VALUES ('511', '余凯', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY55d4AUYPyBB1kzIUQrZ6KpfKdKZicpoxnxQ98HibPicQdicYv4oJAiaxxfiazZNuLVicILUiaK4ouDdUPFX9/0', 'oyP7DwOPK6nkHeJDRqB5VyR5eRLM', '', '0', '', '1', '1', '0', '0', '', '1467518198');
INSERT INTO `tyms_users` VALUES ('512', 'LeeJinki', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UOq1ydfY9KMsQbsBSDaFlcibObBPO44ibsSupZAyoL99A32n9icVLW2Nasw14wltMW5QyibGzLEsM4BP/0', 'oyP7DwK1646jPQ-vysCKo314B06M', '', '0', '', '1', '1', '0', '0', '', '1467522814');
INSERT INTO `tyms_users` VALUES ('513', ' 深圳_Jason', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6PUySR0Y2qgNa8A5s98PH9w4P7XxXMIaVPUUCvJSm1b9ibrAWp54naDdbFr4na14T7X8LgY8icfNt8mq9vjaAQ7O/0', 'oyP7DwHYV5sDE4h4IWMvw9Gak6Fo', '', '0', '', '1', '1', '0', '0', '', '1467523696');
INSERT INTO `tyms_users` VALUES ('514', '蓝猫', 'http://wx.qlogo.cn/mmopen/hY02C90AvzQMy7ZAfjgBHWtic4rDgUXULiaZrWzcgHD6ic7duBmWYjckeMm2xzF2CnsFf5UMEBxnp2MLxdY4QYPhwh8rLm6Eetd/0', 'oyP7DwDf7xgKf04WYLt_u5KToM68', '', '0', '', '1', '1', '0', '0', '', '1467535801');
INSERT INTO `tyms_users` VALUES ('515', '随', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlA2ic8Rb4V7TtFvibYvUkTq0vuUp4ogXibhnVsqpHKcNUGhn8KXPg9809VHYaRo1WbaRTQyFC1cvX61/0', 'oyP7DwNi52DrD-t2oDi2grtVyFtw', '', '0', '', '1', '1', '0', '0', '', '1467535880');
INSERT INTO `tyms_users` VALUES ('516', '君择华俊', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1iaKCsmx12dZNn8LKPMxOdaef5kUG6eceJUR5SIsFQ5VUSFyWkHwr55l7M9q9icicGD6aCiazjdCPa6A/0', 'oyP7DwAam-Dl0GNZQzSVV3StIz54', '', '0', '', '1', '1', '0', '0', '', '1467547158');
INSERT INTO `tyms_users` VALUES ('517', '复刻', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKZUvzdaTo152QR8ceVkRcfxbHaHDTiarGFYX9DwwDzT4twoyhnnVqMXJibniauxe1XIc0aIbaRKElvA/0', 'oyP7DwL-SAwZGDUiLj317EHOHvzM', '', '0', '', '1', '1', '0', '0', '', '1467548157');
INSERT INTO `tyms_users` VALUES ('518', '钦', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaib14dFYas6Ug0BAlM4SlAca9dAp5SicrQEcibOTXYJt60dpq9hYKNcibNBfBnpeSD8GImrU92k4qcP4/0', 'oyP7DwK4mLTFRYoaazf06U1aYd4M', '', '0', '', '1', '1', '0', '0', '', '1467554824');
INSERT INTO `tyms_users` VALUES ('519', '听风牧云', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOZBuOiahjia7r9GtIOaxrW5IlgmAJ2QXZsCmpsod2eBIrfadiazhgib4GPFMAEnv4PZxEKAXLUTWccf/0', 'oyP7DwIngfu4ICIlaoUi4nXmUUGE', '', '0', '', '1', '1', '0', '0', '', '1467562928');
INSERT INTO `tyms_users` VALUES ('520', 'wiw.n', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaxZkI2pX2Q2rHHmeo5pUiah2x67LHDpDNLJLaLdx4DnqVjsNT9sSeGWhCzf1L1gZmCNOtnzJkAJUo/0', 'oyP7DwF9ZZYsnZBRRSHEN4pR5S48', '', '0', '', '1', '1', '0', '0', '', '1467595995');
INSERT INTO `tyms_users` VALUES ('521', '星落', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaz3MvRBmAA7WTjibcpsfl66mY1yCML9q6micjqoqeiclnSvHQU5xVWbvgWyLwYDveZ5CgD1Cdawr16v/0', 'oyP7DwNiSYjfWGyd1yapO7VRSd-c', '', '0', '', '1', '1', '0', '0', '', '1467599251');
INSERT INTO `tyms_users` VALUES ('522', '刘龙', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJb9zecXregIwIHhDMibNu79cFJAjGibBrxxZjSIiciaKtwzlByMQV9H4gqicWEEpNxFHbqwlmwaBNicLUQ/0', 'oyP7DwH7Vd3DkQrryoj_Xi5imwvU', '', '0', '', '1', '1', '0', '0', '', '1467601176');
INSERT INTO `tyms_users` VALUES ('523', '心宇迷茫', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibQPicnFJUic0stlq36L5EZtqN8r0kAInvCDHVy1Ouwia6w3fDV4ydAOXMic5X89CdU4icE69XZiaibdcyg/0', 'oyP7DwFJO8fE-_zKjPjOBBaIByek', '', '0', '', '1', '1', '0', '0', '', '1467603797');
INSERT INTO `tyms_users` VALUES ('524', '悠悠', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4vMpDdmxJFLpFygjUbVibobwAibAMwu9XwWXkLdx0J8595LaaIBvFRyYZmDlPvUKNs1xpY7ibeIXfzy/0', 'oyP7DwMveCnBYblR26R5louTVcmg', '', '0', '13187315085', '1', '1', '0', '0', '', '1467603824');
INSERT INTO `tyms_users` VALUES ('525', '♭雨印记', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ZgOzN0AsvQGvnAEafZwFOeF0adsDuQPy9gvK5vWoBico3honrjtic3LnSCQpHIs2KjibfiaoR1yEWalAsex31LsXe/0', 'oyP7DwMIRPqqzEtYOZHdqhnsyWZs', '', '0', '', '1', '1', '0', '0', '', '1467603903');
INSERT INTO `tyms_users` VALUES ('526', '...', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1IaWsPGa0wDgU2Ar92NDz46jKiasIvMbhOe1ubyfXVUs2PGTbx6nKBY0vzphjbRI8icfgOppkLorF/0', 'oyP7DwL4oEW9pniuiPv8gfqEr6QI', '', '0', '', '1', '1', '0', '0', '', '1467604200');
INSERT INTO `tyms_users` VALUES ('527', '肖正武', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3Mr9shiax82YzVMekxOfYEdZjuYiaOLf3Ws01ico4P1XpogEEnYrwpPI1ebWodibE9z2dd92EmDmBpLo/0', 'oyP7DwA6T4loz5jGXJdljrjGKUoA', '', '0', '', '1', '1', '0', '0', '', '1467605710');
INSERT INTO `tyms_users` VALUES ('528', '张彦君', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcEj2yrs14BgPHQd3joS7mSlyO104rzbeDobF1IoclZP4lpibKAP1XTicxibM1TOj6WFSxmWhUicg9jqg/0', 'oyP7DwJQFPNe-mZeJgEIZXMO7J6I', '', '0', '', '1', '1', '0', '0', '', '1467606041');
INSERT INTO `tyms_users` VALUES ('529', '易先生', 'http://wx.qlogo.cn/mmopen/6nK4pZfNk1TAtCxdNYZ9iatiaRC10F7wQ3141Biao5fgBYwWoOF3rQYbZwCzazBTjKL8pziaQicnu0TrlN3dDibU5qol9tZmqG5Bzic/0', 'oyP7DwBV7IAyJBZnvuLFRJ8bxw3E', '', '0', '', '1', '1', '0', '0', '', '1467606346');
INSERT INTO `tyms_users` VALUES ('530', '开心网络', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53GqFViaG4jHZibzy0sOedibm2abvAWTnpBr8CLpOQQ9kibeCH6j2ew5r9nsPM7Ge9rXZyaYul6qf8AG/0', 'oyP7DwHGSYKoj2OY7KPWLrhJRKLo', '', '0', '', '1', '1', '0', '0', '', '1467606616');
INSERT INTO `tyms_users` VALUES ('531', '我会的', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdoKHBuibwzFPILMrcibG7nYSuGwP1YrDKgd1vpbrXjdTpKdcnOObiaaRcB4IsuhVqKPLVXLXTkP9NibA/0', 'oyP7DwCSQ9lY_EalhYecAtVdZfEc', '', '0', '', '1', '1', '0', '0', '', '1467606742');
INSERT INTO `tyms_users` VALUES ('532', '卡卡罗特', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3XnkGws0LfdfhxcC92peWhnLcasAW1JHbskEOywP51uI68mt75iaIP6SY0ONyfnias0MAlVcUWzBWdOG5JmeNV8x/0', 'oyP7DwHi7l949gKVKPd_J8Ja7TwY', '', '0', '', '1', '1', '0', '0', '', '1467606765');
INSERT INTO `tyms_users` VALUES ('533', 'Ricky Yan', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDARFjsZ7Zz0H1mS4JgLPfvibJqJ07FRl3W3hUQHiaovO7o7JWoT7vZcq4pX56IK7vxFTn0VvXtsxrw/0', 'oyP7DwGK0S1aw19vfmZLBgM4UNpg', '', '0', '', '1', '1', '0', '0', '', '1467612610');
INSERT INTO `tyms_users` VALUES ('534', '季末', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0EFTGalFCeO6IAcldD1TswTV3jQJyzf977PXgYBQeR4u1VeYEA7e5XPHJRglh4iblfNWdRCqypsQnQXQkqUR7fY/0', 'oyP7DwKvPoMuhdoEop9305i3svrM', '', '0', '', '1', '1', '0', '0', '', '1467618498');
INSERT INTO `tyms_users` VALUES ('535', '栩栩如淘', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazricf6WNfIib445xtFJDj8uMlbz6MIk65p7SADpCicKIKzuyaeALOkHZ8p8CpMfvrFJiadlShUtUY8K/0', 'oyP7DwGAFlPFzxJa-PFK4qHpW9Wo', '', '0', '', '1', '1', '0', '0', '', '1467620107');
INSERT INTO `tyms_users` VALUES ('536', '天汇小杨', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfJuSLFlsAHYbDiadPAvTpkYfZdUsbicDsxYCZtoJz6WTVOMoCOQAgkMMpRFVttDpm4qV1KWJUwcxxw/0', 'oyP7DwGmYpzmEPdtP6AR6xKQCzRc', '', '0', '', '1', '1', '0', '0', '', '1467621305');
INSERT INTO `tyms_users` VALUES ('537', '梦工厂', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdnj3xY9PJIyFuRbl8UK7RoiaZZiaibEVFt69nCGJRLSe6eACgjG3TJucs3nV09ekqFMuXq9DUbGZCAg/0', 'oyP7DwBc9Axb2LvEwIp3XxZmQB7E', '', '0', '', '1', '1', '0', '0', '', '1467622941');
INSERT INTO `tyms_users` VALUES ('538', 'Zavier · 张威', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELfsxiamTQLodhWnybrm2icnhk0MpYzV7o6FbdvHUP8mHTkmNhrZ7icb6SEQJ5YGWcy5ULxRme5ibvOaA/0', 'oyP7DwOAinYKQ58mimre0WtrCBuM', '', '0', '', '1', '1', '0', '0', '', '1467623893');
INSERT INTO `tyms_users` VALUES ('539', '开心就好', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3NG7yyLn1eqPgFlianoXd0XaO1hgf7AVXWTqJ5FcADiaxlfHFpOPvkrnJv8VtQJkGHg5juo9EzEksdMQ2cDibJibicw/0', 'oyP7DwChFHVwy230uBaAme8s683s', '', '0', '', '1', '1', '0', '0', '', '1467624226');
INSERT INTO `tyms_users` VALUES ('540', '枫林-PHP工程师', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia33iapxkKOsiavlBrlaHjChcAOZc1PG0CFajG0e8LhVC6lkPSDDnpV5HQXicTZEUT7rwP7rU9bqkzVH/0', 'oyP7DwAHQiv9zz5nOrg__bVP755k', '', '0', '', '1', '1', '0', '0', '', '1467624432');
INSERT INTO `tyms_users` VALUES ('541', '火星奔奔。。', 'http://wx.qlogo.cn/mmopen/PYhfYIwEo391YTTSFYHGBOeuAJf4YXe7H2pibXUGqFzzic7LvhGz2kibuC4SLx9OwQdJH5x7aia3682pV9r5Kb851CPTy6ueR7Uia/0', 'oyP7DwDDCBtEcoTTdrI4O4RFH-d4', '', '0', '', '1', '1', '0', '0', '', '1467638162');
INSERT INTO `tyms_users` VALUES ('542', '阿锋', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4kIWw8dnCsBzwzhbREjpumvYskddhAjR165jRQo9hWPrVRzESEFGN9BTT8JgTF1daX4iaYE5AzcIb/0', 'oyP7DwOf8tBd9IWErP8QnSWfzLuE', '', '0', '', '1', '1', '0', '0', '', '1467640141');
INSERT INTO `tyms_users` VALUES ('543', '任杰', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBQB7h52B3nZ50kzicWIrMicED8OyicdjibcCVibIP3Pv54H7XaGmXCODwfQ5cicu0DuzYjM2diaAw6Qf99g/0', 'oyP7DwA3DjtJssrNKhZ_q118F8Bg', '', '0', '', '1', '1', '0', '0', '', '1467641419');
INSERT INTO `tyms_users` VALUES ('544', 'Ai书影', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0fW4vNy6aGqYqHl0LwbicyzpHFiblxJCZDq7VRoXe8jThC3SfUte8MSfTvxBpjOiaFX9p8B0eXPfp6B/0', 'oyP7DwI39UurimunbpqOp8oE2H7U', '', '0', '', '1', '1', '0', '0', '', '1467641942');
INSERT INTO `tyms_users` VALUES ('545', '黎洋富', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELwZziaTOJ6YibSgC8WDcDarykA7YJEfYb99DtK3yXR5fa1qe6IupTkWL7wWln4lN5F1CF89hqC6Sbg/0', 'oyP7DwMNy8pyKo5lgjafsO7v9prs', '', '0', '', '1', '1', '0', '0', '', '1467643783');
INSERT INTO `tyms_users` VALUES ('546', 'Ave_', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4GVY8ibyibI7bJTOXqicJ6rcX6wWRQulZ8pIWrghThIic2vK20C9qZmEt3Rdl0KyrwWDED6iclZ0Pm6jZaujGzNOohH/0', 'oyP7DwBDUKihzGjNyIJiE3LBPdGQ', '', '0', '', '1', '1', '0', '0', '', '1467644073');
INSERT INTO `tyms_users` VALUES ('547', 'Mr.Y', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL45pMiaBxUbfDicZysv7T8Giap9Ug1uic6hIYSG7UASRwHTAu0riaWUTwpOnOkmLdc1RBdzbehg1wWklLg/0', 'oyP7DwG0hBXUfbUozcZzVjoGBOR4', '', '0', '', '1', '1', '0', '0', '', '1467682575');
INSERT INTO `tyms_users` VALUES ('548', '小夏', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6aQ8gDcGe6s8qIm5S2YyzR6u0YibQkvarb2reiburjnx359lz4f1aGaHLMiag0YNhxeUkP4MF5D4Micg/0', 'oyP7DwCQpEF088p012DSGgU_NGGQ', '', '0', '', '1', '1', '0', '0', '', '1467682719');
INSERT INTO `tyms_users` VALUES ('549', 'yancy', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0CV0j9LVtK6E9hFtzfBV9UwLPvWDzjl2DqcBzWStDbnn1YFoy9KrbWVgHbEJkI4R1glx5lfNscfn11pMNL44IU/0', 'oyP7DwLWkBLw5OehZGCVRpTQmr-w', '', '0', '', '1', '1', '0', '0', '', '1467683393');
INSERT INTO `tyms_users` VALUES ('550', '吴浩', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEHPPj1mIic280KZoU3dhBPLOuNPWKHD4oy7VW2TicIBxvicDPvM5RIksLw6EfuaonicfrYfulWQC8qZQ/0', 'oyP7DwOst7pe0Xt6UWNvx4yM3aP4', '', '0', '', '1', '1', '0', '0', '', '1467685381');
INSERT INTO `tyms_users` VALUES ('551', '卡佩拉', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pkkMU3U0VPAz1ybGjabRicmKICliczRQxntsPzeKfyy4RoKicmkLITgjRLKCMVe0Zo6IUBh0TticZJQ1hhVfk1AEFP8I/0', 'oyP7DwO2oEjplbuWvyvsz3xEWlro', '', '0', '', '1', '1', '0', '0', '', '1467685474');
INSERT INTO `tyms_users` VALUES ('552', '小新', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLANpeNbF0C70X60VDkI8pLq6Ytu8DJvzWCascRm67ENO0AE8t5WfApJiaZNKBtxXRds27h10Ym9gqw/0', 'oyP7DwJvdK7GJACef6GjIl1Jy_to', '', '0', '', '1', '1', '0', '0', '', '1467686263');
INSERT INTO `tyms_users` VALUES ('553', '乐友平 京墨医疗', 'http://wx.qlogo.cn/mmopen/86FBKqUiam03hCPrlMCsLT5QA9bkXINvL8ibOPqJ58D0L5TcNLAas8bXBRfCuyh6kNQP87b5V873Yrl9icQiba6ZCvSfQYfEhATX/0', 'oyP7DwOpwnV0JvovgsljLyQ5Gd18', '', '0', '', '1', '1', '0', '0', '', '1467695126');
INSERT INTO `tyms_users` VALUES ('554', 'Washington', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKRDg2tb9ZGMzf2XibL1XqmP43gHVGhGQibibyRl7zVxdjib8aA7kvG5lfSNOgwibdxV2lG5v1THBFHc6A/0', 'oyP7DwKj1BpJlPF9fxvt6HtEvbv0', '', '0', '', '1', '1', '0', '0', '', '1467701874');
INSERT INTO `tyms_users` VALUES ('555', 'Barnett', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0Fn3l7Z9RX9BhPEGpF2yrOMdtiaxsTm5iaY9JHPgRoA8icFicatxibdNOGQVnkjmTgKl3egD9KOicpJ8lqJ9gmj6y6dv/0', 'oyP7DwNZvq7IPbmtI8ZzMf-jITL8', '', '0', '', '1', '1', '0', '0', '', '1467703602');
INSERT INTO `tyms_users` VALUES ('556', '永进纱窗厂-小吴', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJp9Ky3VPQrfibVgn8Rv7qS1rGoiccG0RJB1hnkpLwHfgOPngSDhj8fVAqfhIp0djTJl1TiciaWMZDtC/0', 'oyP7DwFeO6HWH89bER0hmJeqWfhA', '', '0', '', '1', '1', '0', '0', '', '1467713852');
INSERT INTO `tyms_users` VALUES ('557', 'WEAREYOUNG', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ducn8a6Gibkn0SJiaiaGQ2lsCps0w0wcYdCHWdWgjA5ciaKcKHrIrXOsFLAhqibBX3K8JJ2tuJGyhoTsdDr6LQ9Njd/0', 'oyP7DwANpmyIQ17qceLPsytNjVnk', '', '0', '', '1', '1', '0', '0', '', '1467714060');
INSERT INTO `tyms_users` VALUES ('558', '@A', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53xmZ0a4HBhvY13NFtHuvEPUicLGxRIibSv1ufMCgJXyhlkQXUICUpNibAESgEnG5JYd8tFrgoJXgwL/0', 'oyP7DwNbPpSSu3VLz02m_1R6Tutw', '', '0', '', '1', '1', '0', '0', '', '1467721125');
INSERT INTO `tyms_users` VALUES ('559', '浅伤', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDA2uRlTCXT6G3AicJVLqRuzlSXyB4l2l54V50DKtzzIYNQh3xjeBvDxGKv0PwvicDY9mln8dcw66X/0', 'oyP7DwAPoXJ2RhNOh4Dy69JL37es', '', '0', '', '1', '1', '0', '0', '', '1467721373');
INSERT INTO `tyms_users` VALUES ('560', '幸运熊', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2WlbmDl26gHdnDoOicTQyYYia4zoleWRmUQCn3U0GbS3A0NXfM1Q0mwC0Swk2Bbod0p1804gAV9ZE9orP5fsIrrd/0', 'oyP7DwBE8k88jYCu0XpLEFFcVE5s', '', '0', '', '1', '1', '0', '0', '', '1467768998');
INSERT INTO `tyms_users` VALUES ('561', 'Jiaqn', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VFjeamSesRcPmgogBViaZnQw1pWZ0eFCW0CS9SbOIVhUPmXiblZGnuWWjiblAeGgxR8Sk9Afgjauau/0', 'oyP7DwJ7QDZRZh7wnwZz8X2z_iOc', '', '0', '', '1', '1', '0', '0', '', '1467769639');
INSERT INTO `tyms_users` VALUES ('562', '叶子。', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2v0ynfBu4UPMiaibLBuRSefKaDzttnpWCIUMn9vR060WxLfr3zcQ52Umhe2VOGn8ial90OJkvKDqKK/0', 'oyP7DwL30FGH0xuIPlx7KS_izelw', '', '0', '', '1', '1', '0', '0', '', '1467770212');
INSERT INTO `tyms_users` VALUES ('563', 'Cyan', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0XhqF3bGSAiaEvTOjTdozKYRKSFgGgA3UB8jRMKL51HbaUrXRA99551HJ2siaa6icSewwiaSKHUd7QbW/0', 'oyP7DwP0jpufQCclToMBED7Yo-7Y', '', '0', '', '1', '1', '0', '0', '', '1467771245');
INSERT INTO `tyms_users` VALUES ('564', '柒玥', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ibYZ2RTVxib4zTybu2HomI2X7wMgIBA7IqXDic5Y0OkchribEG939efhzNB7dJj9yeCWyFhGRMe2zA1jboQ8KWPtK/0', 'oyP7DwGHyRnfyNmtBVkDMZRExNUY', '', '0', '', '1', '1', '0', '0', '', '1467780427');
INSERT INTO `tyms_users` VALUES ('565', 'Erik', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UJTkJ2RN0GjduktibcDo0ib6vkxdWebbGNdvnJv2kL0Cv7gibuXibml2ic3fqg5Yvnh4JfFb7rSDtaxoQ/0', 'oyP7DwAEgzojq--yRiV96HMYMFZk', '', '0', '', '1', '1', '0', '0', '', '1467781534');
INSERT INTO `tyms_users` VALUES ('566', 'Ricky@Jeadar', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA2KKyXXuTCxQzngSSfzmUYfUuo1JsXxNyhMUgmXC7GtMmxGAXG1L8q0tzpic1IcQdmIRmg5ovrcsj8E9lwUCpaT3YQdHzAvibZ0/0', 'oyP7DwBLPx22ScEwPhdf56gzUI2A', '', '0', '', '1', '1', '0', '0', '', '1467782644');
INSERT INTO `tyms_users` VALUES ('567', '陈科良', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlEIZtPRZNjg4hugd9nN4P3B5RicbLpU6D1iaNjhDs4nicTcCQxnh7BcWHQq18hwR3Fs51oDOyb2g3rJ/0', 'oyP7DwDBIA5TmOy3fbrbb55yTwKQ', '', '0', '', '1', '1', '0', '0', '', '1467783395');
INSERT INTO `tyms_users` VALUES ('568', '', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6icyBOKiaickI8KdjbExHde4pH6dvyib7lh6KQCdGMgMGRroan0W3QWIBHpz6uZPHYOkibgg2dmoZyXIJ9l8WMI5tiaO/0', 'oyP7DwEL_HfnKEaPXgkNMAzJXjL8', '', '0', '', '1', '1', '0', '0', '', '1467783917');
INSERT INTO `tyms_users` VALUES ('569', '刘鸿斌', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdp7iaW4Z2kf4Qlaia9icgLePh2kXYCCq6nrMkBVVYdIQEmYibEmXJonpEGgxeggZaN8U7GfnLia4mXXXw/0', 'oyP7DwADU7vPfeEy_afSC43Cgf0Y', '', '0', '', '1', '1', '0', '0', '', '1467784696');
INSERT INTO `tyms_users` VALUES ('570', '沈子胜', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdMibBIhiadeicqnIyEwHLln30LTt0kA6KUfDRMCIVcXdsicm3dYmuykIgQh2Y3aCKCpCibAIqjxGAZKNg/0', 'oyP7DwBZzJpF6LRVvpsh70UK-YOI', '', '0', '', '1', '1', '0', '0', '', '1467785316');
INSERT INTO `tyms_users` VALUES ('571', '云飞狼舞', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0tFuK5s39e8QJ3JoZmh5hERmHiaN1PHQMtb2XlL6XTm2rmlZRrGxsN0pfBS5MHskUibKIJlILjj5sOErjbh8icIvK/0', 'oyP7DwI3lZWaZl4QcuG99BQiEb6k', '', '0', '', '1', '1', '0', '0', '', '1467797760');
INSERT INTO `tyms_users` VALUES ('572', '葸水空空', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ybPhBibB954FtnshPoDjEhJ4wQKe4C6v0Pj4htaDxlQNCUkl6GZbxPY0iaeSQ3grdaSlJGGNibhrn8/0', 'oyP7DwEDi5oEELtffkD21bM3lBfk', '', '0', '', '1', '1', '0', '0', '', '1467797929');
INSERT INTO `tyms_users` VALUES ('573', 'itworker', '', 'oyP7DwMLRuA7qP24J8sBO3-EItNU', '', '0', '', '1', '1', '0', '0', '', '1467798385');
INSERT INTO `tyms_users` VALUES ('574', '李霸霸', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY50YN4McLWCCusffuHsYziapoPgHibAOS8TLvEic9Aylb32UpmpjLGIllDRpGrszLpYGsjiaBquaZ1uj8/0', 'oyP7DwEBSJABsXl4nvSXFUuI-wWc', '', '0', '', '1', '1', '0', '0', '', '1467799798');
INSERT INTO `tyms_users` VALUES ('575', '袁少兵', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4EHFUNorSzvZ8ZYI2kv6x7lkYSgddYwyKwmTgGeple6sCDNOvOHTHYDmyVVd5QVAy79VwDsGHCV/0', 'oyP7DwLK2QfyOgNR39DxsugRU9qY', '', '0', '', '1', '1', '0', '0', '', '1467802992');
INSERT INTO `tyms_users` VALUES ('576', '麽丶回首', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3JXYZxfzrT99tsYumvxPFOMcnTvRuiaph9pOJDGyUKKo7Q5vzv6IpooEozSsAPrzmnY1uoHXq6mUdEWFMpuCichr/0', 'oyP7DwPayy0Viu0c3fXie7ypBXZM', '', '0', '', '1', '1', '0', '0', '', '1467809497');
INSERT INTO `tyms_users` VALUES ('577', 'hello_world', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7KxFVKdUXfkDvWy8DSHszNZuG4gs7KC0lqlhAWgSnjicD9Aib5Wzg12XicANNIlB4Dwbia7raZzak0pnibEwOpcQZjb/0', 'oyP7DwCFRY3XGua60HMi-y7rhsn4', '', '0', '', '1', '1', '0', '0', '', '1467817748');
INSERT INTO `tyms_users` VALUES ('578', '绣 财 ！', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELickM4pOx6a5tmJaQLsO08NFt9vENR7LH3OraEnyVKJSibHKmLflJP89nh4KwUQ6tECYaqQ0pH3c9w/0', 'oyP7DwKBt1Auc-ybOdZtfSYooZww', '', '0', '', '1', '1', '0', '0', '', '1467818127');
INSERT INTO `tyms_users` VALUES ('579', '！', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eEib4icMv6orb5Ugqw504hvhFrjictE7s6e92ChAAmUDMXU43AqO6DfRv6t3oCmgJ3lNJfqpiaaQyrWO/0', 'oyP7DwOTFqfQn2uhVJZDcht6Qt9k', '', '0', '', '1', '1', '0', '0', '', '1467855880');
INSERT INTO `tyms_users` VALUES ('580', '风三十John', 'http://wx.qlogo.cn/mmopen/L6Wt2dDdhhXOSM1FIK0pdBPVztFMu4CUVj0XpxLkt1ldxic2LuuPyibxCdHsrraoGzF3ct2TeqOUz2L24PMTHmRaBPicHRqSD8S/0', 'oyP7DwDGq75e8CCF0TybNPfthoOI', '', '0', '', '1', '1', '0', '0', '', '1467856707');
INSERT INTO `tyms_users` VALUES ('581', 'Time丶Out', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJmUibTrR5OWBnlBXQfraVhwJQeiaNuhF10NTKT5VslicoLUJ4MB3eongIRfib4KFnHianwqrO3llXia1Og/0', 'oyP7DwCswV3Df_S9NeZ84OVQewX8', '', '0', '', '1', '1', '0', '0', '', '1467858598');
INSERT INTO `tyms_users` VALUES ('582', '不凡', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBTIHOfUOZCR02FfaMA74OAqDKc6sZXvib9XzxsKcHTLZkLqVMrBRsjfUzdBbbAMpe5qtbU2PYBD6w/0', 'oyP7DwC4yGNQCMAhv7nO5mYe7-mE', '', '0', '', '1', '1', '0', '0', '', '1467859800');
INSERT INTO `tyms_users` VALUES ('583', '念顷', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY57ic4gP79BQZNyEqsibbmP5HuIwqRYeB2eIMpO04T7p1coBLUic86EVWGQ3Ieo4wTv41a43icDdZ76vv/0', 'oyP7DwNu1Z0qFvix1JPKZoHkO00g', '', '0', '', '1', '1', '0', '0', '', '1467860413');
INSERT INTO `tyms_users` VALUES ('584', 'Macthink', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJQPBEDFcP7wwJVsT7QnyHia99Yu7Yd3ibhsRgqBojKkEX38kdT4KwJHzMq3ZuBf6aiaGFdic5dmIicTug/0', 'oyP7DwACv_EAngdQXSs_a-4HW7V8', '', '0', '', '1', '1', '0', '0', '', '1467860924');
INSERT INTO `tyms_users` VALUES ('585', '释然', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eLibecXklfGT5HSmjDf88Jg6pp65k0RSbI1OKicaib68MtACdKKOrT5uV3cibCkftraHMiaWMhzRwMZsX/0', 'oyP7DwHIZN1TdztUkER3qUUT4REE', '', '0', '', '1', '1', '0', '0', '', '1467860976');
INSERT INTO `tyms_users` VALUES ('586', '只会修电脑', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UCyGOkOw7wasygxLO9libWDblMyvAZxoCltlZgkKibm6FO9bv5B3ibX1zv6jv1iaH7KMo9I2aHuv74icH/0', 'oyP7DwDKLBvegKtIJqXT_mlMzgS8', '', '0', '', '1', '1', '0', '0', '', '1467861402');
INSERT INTO `tyms_users` VALUES ('587', '沈大海', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBbJviaIMIhZl3eQnoHa8yAPYxQdAXfpQwO6xHNcR86mr3dWaZejveyyb93U3eyNME6VqBLzfyEabw/0', 'oyP7DwF_mX1EGyrxonjE8N1EAQyg', '', '0', '', '1', '1', '0', '0', '', '1467862869');
INSERT INTO `tyms_users` VALUES ('588', '小黄人', '', 'oyP7DwIgX9jvDFCgnX5q6KIMtdZE', '', '0', '', '1', '1', '0', '0', '', '1467863234');
INSERT INTO `tyms_users` VALUES ('589', 'Koizora', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIr8dRNaPzH1FnIuYXGJLKXXPTRPSYicD0UAepzkXDK9URfBDfVKiaZjIVuZXpe7kE44iaEaQthBfmNw/0', 'oyP7DwHRIuq8lFqy9SF9BrdgL-Xc', '', '0', '', '1', '1', '0', '0', '', '1467863349');
INSERT INTO `tyms_users` VALUES ('590', 'hh', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL6KlR8lwJ5JoD64rZqG8jsicxajMHian7UplPWHuL8wjeKYggSdQ3cxzv7vwspCQMOMJDvdPgRicbOQ/0', 'oyP7DwHJay_VQCwVey3fVydASY7U', '', '0', '', '1', '1', '0', '0', '', '1467867065');
INSERT INTO `tyms_users` VALUES ('591', '烨', '', 'oyP7DwOIeLZ-dJJoAOgvnsCl5JfM', '', '0', '', '1', '1', '0', '0', '', '1467867902');
INSERT INTO `tyms_users` VALUES ('592', '微笑', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0XZsQVXBh4XcPnEAMjqy1nicQicgWib2zttmsxB4f996rzd4ic5Noj6ia0juPhKYJD9aq0KRFTDSqqnmB/0', 'oyP7DwD5F-pEjTk1B-EuKRHgB-_g', '', '0', '', '1', '1', '0', '0', '', '1467869605');
INSERT INTO `tyms_users` VALUES ('593', 'Tim', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5zt128lZW6zjANkDwkeOYsTMHnG0ibZvYhwgFSGsiaZD5Wg90BtSoPGzAbfzH7rws2TInm9FIvGsOHDsjFlqsXhZZ13tqTPtEibk/0', 'oyP7DwJ-y-7i5fyTzkRM8pD2xAXk', '', '0', '', '1', '1', '0', '0', '', '1467871797');
INSERT INTO `tyms_users` VALUES ('594', '孤独行者', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2jlR2la6M9eV5iclyniaiapbqWq5ydlZ1x8z7ibpeh0YcXXLLlBepXQUfu3mhtnxvMPKOBH5icaF1UQHngGRYPzZP4t/0', 'oyP7DwBYj2LxztfM6K8ZaLVMrjA4', '', '0', '', '1', '1', '0', '0', '', '1467879741');
INSERT INTO `tyms_users` VALUES ('595', '24k纯帅', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDd9LB2UxkTquc4AFRygIUwQfTNSGmfLyLJKGoaO8vSDBQaqvuw3qicPuRRAA82Txicz3Vj3oulqIjxE/0', 'oyP7DwItn6hgxAtUyl-YLDXfu_oA', '', '0', '', '1', '1', '0', '0', '', '1467880869');
INSERT INTO `tyms_users` VALUES ('596', 'zero', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7FueoCK7s7iaYdy35lsQZDgDAxZBPZic4ZlxctMYMeUMZfHKjicyX3ibrHowuFMp7BwbiarK6PKaCBkIwIT2EhLZnaK/0', 'oyP7DwPHpHs_iC3v8Pqh18kgWx2Y', '', '0', '', '1', '1', '0', '0', '', '1467881285');
INSERT INTO `tyms_users` VALUES ('597', '任宝宝', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0qkMNvQJZRFVOGxcg5VJ4zLzDpSyUnkfdzXsJicuZ0qoTXn03rmeZZklOTmuAZRRCe91OoicKrmevazDvejfJCQW/0', 'oyP7DwDDZc3xxPAaAFDyRF-n2ooA', '', '0', '', '1', '1', '0', '0', '', '1467883051');
INSERT INTO `tyms_users` VALUES ('598', 'T.C.P 2016', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1MWZ8XucLLIP5jibnic1oP6rF0WJH1JHNchPlXs8waLhlMY55XdIib53gnRfkGcvtatyicmOh1KaSaib4P23RaOT1hD/0', 'oyP7DwA1HtCJAMS2fHDgA0BTg8V0', '', '0', '', '1', '1', '0', '0', '', '1467883068');
INSERT INTO `tyms_users` VALUES ('599', 'Vincent', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4jxGOPIDWUibXRZJtewNpCcBq5TDAvjicqwjs2icxFkltR2zA4OCfauefibYhY3gBsmMxqgrwSBTwwAz/0', 'oyP7DwI-nt0lU7m38ID4JNvFvZFA', '', '0', '', '1', '1', '0', '0', '', '1467883819');
INSERT INTO `tyms_users` VALUES ('600', 'YiuLung Tang', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY52RzEsmibU1hECnm3YB2pHxGGvT8gm2nw4Vn7rUEAbAO4OZvb6qTq8kibF3utd8u8VjcX9APZM43KL/0', 'oyP7DwN-1tOz-z1tiC3gsd2Hit2A', '', '0', '', '1', '1', '0', '0', '', '1467884835');
INSERT INTO `tyms_users` VALUES ('601', '楚天', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5Xia9RQ81ZgoZiaGZS8zHS2JEVzzibN0VuWhahJdadfZ0NNyfeq13F3rGCYKibStAiaP8XUXS6dPIlriaGiaJLibUUavRP/0', 'oyP7DwAmdlhMAZmX_To3wnwbrX44', '', '0', '', '1', '1', '0', '0', '', '1467885753');
INSERT INTO `tyms_users` VALUES ('602', '刘超', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1ELzTFeWsnvdoDxDicXtLiaFlWznibpBy7ujNsG0Sbq3icPaXSVZf94opibIQ3y5Aq1OicSl3TPXWLgbH/0', 'oyP7DwM0pRgBCxocueOUHyd-v7E8', '', '0', '', '1', '1', '0', '0', '', '1467885841');
INSERT INTO `tyms_users` VALUES ('603', 'Linger_Guo', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI7saibTKiclvNJaCATyHxuNTL3Ayz1pHeHLLzEHpZ4XRjooEE3aDHjIzvyB7LYY0waYPtbaEYChZ7A/0', 'oyP7DwB1TlbR999YC4wjddQsf-JI', '', '0', '', '1', '1', '0', '0', '', '1467904888');
INSERT INTO `tyms_users` VALUES ('604', 'jonny', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4Qj5IdgHYJnBicd4GQhr90HJicGsXIibTAEae5bjMeHdlKiayiaBG4msswK8Z1kj74iar6eGycmr7ZKUEic5C1Bxmjzhw/0', 'oyP7DwOfO7UnM_bqeSgltKGfCnWs', '', '0', '', '1', '1', '0', '0', '', '1467905963');
INSERT INTO `tyms_users` VALUES ('605', '汪汪汪', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5icKPSCXqkicgldcen6yCaV7gayJnicbNkkicCrLXR4Q9UnW1BAXytxsFbVSdujAdbI10OiaCnmC3k9bt/0', 'oyP7DwFA-pl0iMxQqoR15hNC2kY0', '', '0', '', '1', '1', '0', '0', '', '1467909540');
INSERT INTO `tyms_users` VALUES ('606', '未进化的类人猿', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia27fOArVXiadBKJenVR2fRTSh0B6gkicsEQ7RencosQgwnlHMhCI5tIxkGtRib4vOiaok6SshadMTSH5/0', 'oyP7DwIgdwMFCM3woLrXdkGEY5aQ', '', '0', '', '1', '1', '0', '0', '', '1467938325');
INSERT INTO `tyms_users` VALUES ('607', 'VINCENT.', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4BBHuPOxu83ytcPAYaxibevOJjMMfxrPibghYCWrLyBmJIGfmiaaQ7exWexicI5XdIPIRwofAnabQwxNa43oXaJG1SLh6XtywQYOU/0', 'oyP7DwOh54piGJmQ7TosiBXHW7dw', '', '0', '', '1', '1', '0', '0', '', '1467945085');
INSERT INTO `tyms_users` VALUES ('608', '松林', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0bfRqC16mEzVVFhONYjHQ9iabOsCCwKkpuMQcSx7s6xicEsGN4eibVCKlGv3eSU0N49CyCx93wD69Bd/0', 'oyP7DwCe4VewewpGk28ZJj6PRQZQ', '', '0', '', '1', '1', '0', '0', '', '1467945162');
INSERT INTO `tyms_users` VALUES ('609', '小蚂蚁', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELfGCuf0ONnt2VKmH3OiaUGq9cPzOthMnZtibk3nI2EVId6mlZozX65jIy1El3xTWaK6abF44kuYXu/0', 'oyP7DwIZWKXy2UFqLAkSWzfJbndU', '', '0', '', '1', '1', '0', '0', '', '1467945316');
INSERT INTO `tyms_users` VALUES ('610', 'مۇتەللىپ ', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WZ31qa1eCdEcWjRRLibS6S0mWib9YL7D24TdKG8x4RwJMeLJYa6QPDUDR02xbu59QIUCcSRSCrA7t/0', 'oyP7DwIFhJ4nE9l4UWWfazQSo4io', '', '0', '', '1', '1', '0', '0', '', '1467946590');
INSERT INTO `tyms_users` VALUES ('611', '逆流', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0RJEsquJFZTDqto3ksPicL4JyYhLIcqpDHAAU7aCP5omJhzibicdlbsfrw6j1lLYcwugLyqPAHO5PZr/0', 'oyP7DwMvhxXYmDwHRApVy-9Tn2-s', '', '0', '', '1', '1', '0', '0', '', '1467946762');
INSERT INTO `tyms_users` VALUES ('612', '成功源于坚持', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4pM5NGgap0oq0iavGr7oljBgRiapwI6PCq5fMycibV5k8IyfJnvKFOc6JLMrYX5wL9AsmdKEOgGqiccudEics9qIL5NJc2A3ufZdVY/0', 'oyP7DwGoLI10n_hpPiNiXFJJuryw', '', '0', '', '1', '1', '0', '0', '', '1467946799');
INSERT INTO `tyms_users` VALUES ('613', '透明丷', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9yp2cWwIpZpVPD1sbCv97yqG1vricfPFEJb1tKUaA6U6E0dCIpdEDv7DdfibEjNMIZusOk8cUUIsI/0', 'oyP7DwMU2s58Fb3LzdhDWtkNE6Jc', '', '0', '', '1', '1', '0', '0', '', '1467948159');
INSERT INTO `tyms_users` VALUES ('614', '员外', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC9MrXIp8cM5qo6E6oAXbibkvpmrvpgiaw6AKE0SJPIKEhiaG25D5hbEICOVHKwFvogZd3tBUxOD1h9w/0', 'oyP7DwNGUljsB6Q7FC4Tw1kOCYow', '', '0', '', '1', '1', '0', '0', '', '1467948191');
INSERT INTO `tyms_users` VALUES ('615', '颜', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6hdN6z8mAIqwHbicr8xDgVhnckSXqLnJEtdcaBdyz8onZiakiaToibU7EpTp8Pl4aCrbG47uPJdqwcVg/0', 'oyP7DwE5OixAEf7M-gOtOBIy89u8', '', '0', '', '1', '1', '0', '0', '', '1467959449');
INSERT INTO `tyms_users` VALUES ('616', '京宝', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIFze41JTQyJupnvTY1KTyUokooS4C3OyF8iasCiag9FKawZ0c29pqq6Nj2GF8lbbasr1CN2ryrXHVA/0', 'oyP7DwEqPFCrhMNwraxxAjJie_l4', '', '0', '', '1', '1', '0', '0', '', '1467962169');
INSERT INTO `tyms_users` VALUES ('617', '刘云', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90BQSD2o34zDEI4h7oTXqJgjDJ4tUILGib8LibroticaibHS2u7kz9d3vvW9Gg71P9ertAGibicTHaLtjBib/0', 'oyP7DwDLa5qItvUsS7qyJlJE17OQ', '', '0', '', '1', '1', '0', '0', '', '1467963487');
INSERT INTO `tyms_users` VALUES ('618', '叫啥了。。', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicg8OXOhIsQFSTLeFggpLyCCYQzO6pU7kq2w49sm2hUPw5Xu0G1PSdlSCRJvhoE1vYwkGQn2QvvY/0', 'oyP7DwHBjouq3TzzDf1bV7PY4BVc', '', '0', '', '1', '1', '0', '0', '', '1467966317');
INSERT INTO `tyms_users` VALUES ('619', '回车键', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMGDVJP70eKB0zQ491PpH0XZxTKrzYCApV3RPVT3AvtuTWRbXibWCFYRiaNlDHCTZUpvnCGk59Bnad/0', 'oyP7DwHvM4oz2vG_9rHStsMbbvog', '', '0', '', '1', '1', '0', '0', '', '1467966709');
INSERT INTO `tyms_users` VALUES ('620', '肖杰', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEO0Arj3ZzbC1XPeJdMm3nwuYjX8YU4POc1Fge3ctBib0raCIEje2TBRNMHVrvRicee21ibhBSJY1kNib/0', 'oyP7DwLACvnsxreMkvITeCoeORzY', '', '0', '', '1', '1', '0', '0', '', '1467966803');
INSERT INTO `tyms_users` VALUES ('621', '老赵@安米网@光音网络', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIZksOFlFf6KkonuD1MNTbiaDib2Qg8tmQia0cNPRmgf9FGVhduRVxv1S9YMVibw2YuVVPV3uHlGCOialg/0', 'oyP7DwA7huCGaR9GLEhfiDQmY_so', '', '0', '', '1', '1', '0', '0', '', '1467966836');
INSERT INTO `tyms_users` VALUES ('622', '三军统帅', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibf8KRVOOZuSSo0rP6LMsFicolS052MkicJNVD9jnTiat77Ooj6EgGibV5OZRJ88GKd6zJQvnu7ibB9N2u24Drw0piapWs/0', 'oyP7DwBOXixvrSUuQFX0r9CZbBgA', '', '0', '', '1', '1', '0', '0', '', '1467967118');
INSERT INTO `tyms_users` VALUES ('623', '十二', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibd8uw7ibnxiayhnktSgzd1l11g4IicOf7QlbttbMBZhvAfC9UkFMYdNxttvibibAOCyOVGMFsVQJg7aaWg/0', 'oyP7DwMJFu16giknpAKgngcyHLRE', '', '0', '', '1', '1', '0', '0', '', '1467967151');
INSERT INTO `tyms_users` VALUES ('624', '回眸', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdCSgabgia5ib9SicvHtOFTbms2L1QIPMl6AoJRIsKoZXftjUswD9GichH25yBQrnQFXJynLApICpCia9Lr2RSCUMNRW/0', 'oyP7DwKZrsrQbwHe-DD47OQKhi_8', '', '0', '', '1', '1', '0', '0', '', '1467967233');
INSERT INTO `tyms_users` VALUES ('625', 'Exception', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3Fp8ECiamiaRlicT1uGibxkYFTkCwia9RCAW9O6NYeZPLmKgxLynE3OwKszt6yMnboQu36szRfhnmibwqEugy9p5ibrW7/0', 'oyP7DwIU_1hCGdO7pB2lrP2nXbgc', '', '0', '', '1', '1', '0', '0', '', '1467967356');
INSERT INTO `tyms_users` VALUES ('626', '秀才', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOMry9ia8tPEQ4iaFZrcHsvhelrZicnca4VCV9kLQkzWiaUBicyjictnwes8PibngH8kkvdeic3wSFrWQLPZ/0', 'oyP7DwOud1_nn7y2TjuQwhoDG2IU', '', '0', '', '1', '1', '0', '0', '', '1467969554');
INSERT INTO `tyms_users` VALUES ('627', '上善若水', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0RMdwiaWk9XBb1mia2gBrOibAX6fuekl50S89qTvcFeUo8o0Gln7oNtUZ2ygOOFVpibNpSkpemtuhm5/0', 'oyP7DwL9_x6eYXBMjimOWFI27jfU', '', '0', '', '1', '1', '0', '0', '', '1467970497');
INSERT INTO `tyms_users` VALUES ('628', '石头', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBJ6ib7LmdLiacU8v2joPD7lCTKqaEaG9tPGp9PicJKzxLJXfwQ9XQHymCrBXqnmvdPq9Su3Jylic0ARg/0', 'oyP7DwDQHZ_RzO6uaLj8VZF1b6-4', '', '0', '', '1', '1', '0', '0', '', '1467970520');
INSERT INTO `tyms_users` VALUES ('629', 'leixingmin', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADZibQ04e5hSmWfZjCptv87b0iaoAgGIBAx7cQgB8ExP5ricC7F2zUyAGuicd0yIvgqf2IV82wvDpa0w/0', 'oyP7DwOhZ24MCb_wPFYS1tuCYJIc', '', '0', '', '1', '1', '0', '0', '', '1467970664');
INSERT INTO `tyms_users` VALUES ('630', '好', 'http://wx.qlogo.cn/mmopen/Xh3zaoqlqQ9YynrUmsRnVRiawBWOUBC7BI5icQSjrQfPO5QaO5KDwGz5q3P4yRg9bWtSFJY61h6cjQCGJiatX3UFmEK5RGCKkp4/0', 'oyP7DwFWudm1idxmNZXxYnAyAYUA', '', '0', '', '1', '1', '0', '0', '', '1467971016');
INSERT INTO `tyms_users` VALUES ('631', '黄德爱', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdSbrpJ0nQ0LnSGhY2Obu2JP04CJl6ymq1UrTR2fLTYery5PbKFwvhVMgy8eqDtXysIAgNqrOOKibwO2sYic56oQY/0', 'oyP7DwFC835Zvsx1O3RAe8exLv2I', '', '0', '', '1', '1', '0', '0', '', '1467972228');
INSERT INTO `tyms_users` VALUES ('632', '金奎', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1K0GYp2y3eHoyHoAuffko7icAHXPmB2EXUOd8bmP98b1wibiaaqcnKEe6h3uy1TJMkCCeVvojxbSia0j6icSstVB5k9/0', 'oyP7DwDrW53AVXcThhzfY0jBy17E', '', '0', '', '1', '1', '0', '0', '', '1467972522');
INSERT INTO `tyms_users` VALUES ('633', '梁鹏豪', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Gfy6IEYVN9GWoW3BEXE16qMTh0NsGias1HJwiaZadyQwMFVSAjr5b9ChydH2wxQ5NEcpR3iauSldAic/0', 'oyP7DwAnt8E2sKuQXGG22Mc6xLW4', '', '0', '', '1', '1', '0', '0', '', '1467972719');
INSERT INTO `tyms_users` VALUES ('634', 'a.R', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBlrvWFrUf5ibWwazQiaR0YHLKcyGYNJxKYzzsRjYC4xic8IDx93LK1ekqOs1OgxqgQdIG06Q9mmVcPw/0', 'oyP7DwARCMwJlWf8EmB61Vc1wpVc', '', '0', '', '1', '1', '0', '0', '', '1467974643');
INSERT INTO `tyms_users` VALUES ('635', 'Li_坤林、', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eP4iaRfYuPMoNRch5LZIBqicaMnJhgLLicUicstq5C4moU6Erg5XgCYcDVew6hNa7x8sEtj7IZk4ia09E/0', 'oyP7DwFdfEM-TMlz6mvyer_wtnM4', '', '0', '', '1', '1', '0', '0', '', '1467975237');
INSERT INTO `tyms_users` VALUES ('636', '王峰Paul', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UFeC8gTxCzicnqyo1pE7fXHNo8NIG46YhrSrgwXCV8VychzbjTjqKdAqKmMkgmOVmTZDsJPrHz6qW/0', 'oyP7DwHp9fPnaE9vTZoV427PJl8k', '', '0', '', '1', '1', '0', '0', '', '1467976686');
INSERT INTO `tyms_users` VALUES ('637', '张彬', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Q4WylEdvkNm1adxibSibRr7GJnLCvC7uCayjFuWChSb3ttkQtLbZU321KVdor1cgSapwUCxFRaYGia/0', 'oyP7DwBT8qRo5xzfr8faph8brSWc', '', '0', '', '1', '1', '0', '0', '', '1467977654');
INSERT INTO `tyms_users` VALUES ('638', 'W', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6w3fJdSiaOVrf31BeqP0L8cyEk9GuTiaHgcUkSZWqRFqIKjcRbVWdE79Pr58tibUBLMr76UibtUxibbFrCdRMSR1ic93/0', 'oyP7DwP5hvesA9Svgj0YvfC9KBHE', '', '0', '', '1', '1', '0', '0', '', '1467979064');
INSERT INTO `tyms_users` VALUES ('639', 'Johnny', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawyTVss3FiaSUIdmb8xwWsnNRibOxAmd7RpXOJx8zc6Z5RAfOyJQdPJwIHwKue3x5xbibg1pPiavr3mw/0', 'oyP7DwEULmXmKS_1q7gZIV_CcMs0', '', '0', '', '1', '1', '0', '0', '', '1467981629');
INSERT INTO `tyms_users` VALUES ('640', 'xunice', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELGFiaMfFdOqYOC3mmib8sbZicg7tCYYhDYY8xbI564Isu5P4Bk2aV1XYqn6iaQgticgic3R1MBaPlAobjw/0', 'oyP7DwCr3oO_8FVFOXKUQbfvoAJw', '', '0', '', '1', '1', '0', '0', '', '1467983920');
INSERT INTO `tyms_users` VALUES ('641', 'A王栋 一百牛人资源整合', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP20zvVzbicgVRrHMAbTZuDftuVgFwnsDib5beH8iaGWNPVT5MicHv90z2Z9nXApia0sQqxAibibyfwQibpmydvDVqSd50qC/0', 'oyP7DwFWG5pPpEVSjmU9ImCyaObw', '', '0', '', '1', '1', '0', '0', '', '1467984318');
INSERT INTO `tyms_users` VALUES ('642', '阿刘', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5mlsObVAqHqoxkSw5veoU8fAjR6uMl6od8PCnkJO6hqz7XZBdjOGiacuB2RvgBicicggWuBk6AGajTQ/0', 'oyP7DwLBksGYcwyjJ88IRyBvTJdU', '', '0', '', '1', '1', '0', '0', '', '1467987912');
INSERT INTO `tyms_users` VALUES ('643', '原味', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0SKMH7hM1ttIuNCiahgsAOqApib9cviapjl4sMicD3ic12UwRrflMuPELS1Tsxun3uM7CUvfvoAJk5XT/0', 'oyP7DwM-ESCVqPSu-migZ3FIqrO4', '', '0', '', '1', '1', '0', '0', '', '1467987928');
INSERT INTO `tyms_users` VALUES ('644', 'A Goodneswolf', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3miatQyhMTzoygGEMe9UjXSeia77CkDTlpOK0w6ZLsg05ke8QOH4MFgVRIwaT7DCfz2KicZZeKo4ic7CmfvnM37W9K/0', 'oyP7DwBsWgchoXb5SK2dIeiIHv30', '', '0', '', '1', '1', '0', '0', '', '1467990672');
INSERT INTO `tyms_users` VALUES ('645', '控心', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibf8SyHeHe5MibQezKB4kzP4NbnjibhAE8FaevWqiaDCEPOblAgn1hFXDbzX5OtiaERP4oyyz35WXTwktBwPibjgloA4ia/0', 'oyP7DwPc9wBBhChSmrTno6leYbyo', '', '0', '', '1', '1', '0', '0', '', '1467990943');
INSERT INTO `tyms_users` VALUES ('646', 'ピザ', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qranMqFuzPYUMH6ibSQyhs3kpTvUuR7ibsKvw0Xq6sHAtAaAKjhXiaMibgHia0hWzdf6tZ4HOvY3jYWK4KY/0', 'oyP7DwGV2yqBtdds9ejtOY7nnK6Y', '', '0', '', '1', '1', '0', '0', '', '1467992030');
INSERT INTO `tyms_users` VALUES ('647', '蔡海涛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM52ibkibpgyZGvicU8QusHCkA8sexZLRhn6drC4KGgjIo3kDEXVHHwxHib7alSibCEGULtfFkm0LBdpywksjmLI1M9Nkkc3sQIur5TY/0', 'oyP7DwHTpgtsgm-sW-_r5MC55khE', '', '0', '', '1', '1', '0', '0', '', '1467993150');
INSERT INTO `tyms_users` VALUES ('648', '加强', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eORziaxSQsqIyXpuuCE78pAfc3zicjApjiavtCXfYGtKQ82Ns83gVCDgghHTteIbicYFN12URv6WLllia/0', 'oyP7DwBtzVwpJU4eYnlqOEwIXpqE', '', '0', '', '1', '1', '0', '0', '', '1468026299');
INSERT INTO `tyms_users` VALUES ('649', '18621719404', null, null, '', '0', '18621719404', '1', '1', '0', '0', '', '1468027240');
INSERT INTO `tyms_users` VALUES ('650', '。', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY54cE5V96aEW40DflUib6fNrzWBnBrvfaGWtEtMydTCZvP4mKiaT96Ny4sA84OPHETKt5WF30KzuFwx/0', 'oyP7DwBm7yn6QHGSpzyCeRUQAkEk', '', '0', '', '1', '1', '0', '0', '', '1468027278');
INSERT INTO `tyms_users` VALUES ('651', '未央莫愁湖', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKxic6bB4D9EtCvE1VUmQTiazQC92w5hReoetap1lQdWwVLmk1QRJNE4uMibp7Jrt2jice4eanmh5L8X/0', 'oyP7DwGXhKRIhRTH6mDN9XnbTqZo', '', '0', '', '1', '1', '0', '0', '', '1468027306');
INSERT INTO `tyms_users` VALUES ('652', '刘强', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKnLLEbSDAlX2NrNKTFRx7rpuzVyibfdI0OnQXxITwrPtAswzg1vMa9o5ZAiaMpAewctkgHpSx6oNHg/0', 'oyP7DwD_zIeRR8xbmNjCMDSoYWR4', '', '0', '', '1', '1', '0', '0', '', '1468032262');
INSERT INTO `tyms_users` VALUES ('653', 'ye', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4uQ7yDibGQU3Uryp96nCRxGY2xqjlUFdq2HicrgtKofHYC0k3AWiahiccGCR9jryWn9ibviaZsdpAVlRzq/0', 'oyP7DwGqCXCRh9bxOy8uPPeKaEYg', '', '0', '', '1', '1', '0', '0', '', '1468032377');
INSERT INTO `tyms_users` VALUES ('654', '', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4FyOyAlrtOTfABcy6lVuKlTVaCSGhUQeiaUQwKW3EqO9sA4ibRHrHmJBiaV5jRoYqjqCEgNhwyKnPeA/0', 'oyP7DwOqxz8LV8iOtyGNaml6GVBA', '', '0', '', '1', '1', '0', '0', '', '1468032419');
INSERT INTO `tyms_users` VALUES ('655', '13728846099', null, null, '', '0', '13728846099', '1', '1', '0', '0', '', '1468043880');
INSERT INTO `tyms_users` VALUES ('656', '如鱼得水', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4tcJYGpF5H18lDyAu61U3CNibJxnjgbDCN1sWr2LjbZKkwURbcOpTPj1LJmSSpj76H0gWuBh5qFUH/0', 'oyP7DwPpncXL0fIwJ5qcG52F-4sE', '', '0', '', '1', '1', '0', '0', '', '1468045484');
INSERT INTO `tyms_users` VALUES ('657', '智风', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY50JdmQX8Nvibhr9Uq6PSPeiam3BxWBwlhibvdp2DiaoGtnrzYPTI0OrQljqyg3mWf3giaUCia4gOGJGD1ic/0', 'oyP7DwLyHf8iUqE54vM4GtDbTwpc', '', '0', '', '1', '1', '0', '0', '', '1468046013');
INSERT INTO `tyms_users` VALUES ('658', '秦之炎╭(╯ε╰)╮', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1C4FKw4ibfVWP5exKj44ALjT7jOxDDExfVnvnQMEx5uJGib5aOZ48lMrco01MgENp4SV5yOC77z0icPxRmQzQv3x6/0', 'oyP7DwAZdO2JVZVBUd1Q-G3jrak4', '', '0', '', '1', '1', '0', '0', '', '1468046545');
INSERT INTO `tyms_users` VALUES ('659', '联创娱乐管理', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UEMsibqmPsFyr3qbqJXia4YbVRnaL43bCoibHpVaYicicwXicUGiboAeiauicvrLgOmuC6Riajp0m21gWItrAe/0', 'oyP7DwJXLUsUl3pbM95PRuXDMKoo', '', '0', '', '1', '1', '0', '0', '', '1468046588');
INSERT INTO `tyms_users` VALUES ('660', '张清泉', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5eYa3QkvyxkjiaLulGagUNmAqlA7hmytErfbUlKrDBPk3JNmhywibVpuiaLZQU7vzzpz0HpgQl7mWJA/0', 'oyP7DwD1oG5zAZnULD47pGfruiuw', '', '0', '', '1', '1', '0', '0', '', '1468048204');
INSERT INTO `tyms_users` VALUES ('661', 'anne', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7m98a6yjDPiaygwBFbKd8ibpNaGs6P05YwFnDZQxNkwy6pnUM95AicZFicSDiaZdJHWsxpafFlTBBgMsjJCf92VLdGk0iaS6iblcZqFg/0', 'oyP7DwDUMXybX5ziFC2sk1Egiv1g', '', '0', '', '1', '1', '0', '0', '', '1468048928');
INSERT INTO `tyms_users` VALUES ('662', '张扬（互联网+）', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcMNzV3UCk2dfpYI0cuVibyuD3EQCXVnHM1j9ia9f8s5icQ3dNyeib5QUBTKjdzJIEZXibZrSYUr4yEsPQ/0', 'oyP7DwIQ0jFYf68GeUpdhlOr25Xs', '', '0', '', '1', '1', '0', '0', '', '1468049692');
INSERT INTO `tyms_users` VALUES ('663', '宿迁老葛', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELfXsHkia7HBNib0Zo8YnbngJBJPTlZW2AFIutzOS8fUXibxhcBCdx0JFaXRA5DscUX0FTSuOtSuLCJg/0', 'oyP7DwP1yhKJPponRHseh8MpgcXg', '', '0', '', '1', '1', '0', '0', '', '1468053276');
INSERT INTO `tyms_users` VALUES ('664', '聚闲科技-邱禹鹏', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6y1hTOgClRT5657BgLhSQAj4xT9cqqWibwpaPnPlJHlcTfIPzOLz8HOxz6ibGoBeRPyWyQVj7tSKE/0', 'oyP7DwE2UPV60I-_T0mhjVvNROdc', '', '0', '', '1', '1', '0', '0', '', '1468056942');
INSERT INTO `tyms_users` VALUES ('665', 'ArH', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90GRNoqCUWmiaWMyAUucSS8TjtjJYBXPtsmWhthIvuX3RKAIUPaIwCibxDRYj08iac2PHCHgOlOVnFJm/0', 'oyP7DwKCuTXSrh8GGvReayqHStrk', '', '0', '', '1', '1', '0', '0', '', '1468057454');
INSERT INTO `tyms_users` VALUES ('666', '..林', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIZxGONZtDjD030JTv1TaNUhTBae9p9fcdlKvHrSWibheghiaEhz4U5NMrSNRmeOiaCEuI4Ashg27wf9xKBxFyXYnGEQy1tPe7hwg/0', 'oyP7DwC0IGOZ_Mug7r2fYrNoOmk0', '', '0', '', '1', '1', '0', '0', '', '1468058216');
INSERT INTO `tyms_users` VALUES ('667', 'feI', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeS5IKwH4lCj7QenMvrMkChic3Pd9tia2YSHMyPFuJ9dwk4ZY5xuhj1IvZkTRfDsmONI2VZxUodxobA/0', 'oyP7DwEEBu6WKxZf7QFrl8YRIoIs', '', '0', '', '1', '1', '0', '0', '', '1468058298');
INSERT INTO `tyms_users` VALUES ('668', '木长', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFqzBxmbUPRJgD3aaSBVtoKnvDLGu79wAZoKF62esdP2xibsJQmKJhkU6XicSMEklGpkTVxxgo9S0U/0', 'oyP7DwMxE24Iei4mQTOG7uzpnhso', '', '0', '', '1', '1', '0', '0', '', '1468076093');
INSERT INTO `tyms_users` VALUES ('669', '不大点事', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJmbUgmTV9LORhJm83GzIL9cEWW1wFcUeds7rkYADZtlxvctFHsJsndnniaQJ0EcgZg73adrVcd1c/0', 'oyP7DwFDQxmKVzzkqr_fRTRcbMcY', '', '0', '', '1', '1', '0', '0', '', '1468077048');
INSERT INTO `tyms_users` VALUES ('670', '靖王', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY51AfgYukkic0KLApVdWtXy7UbD02yeps9bCBEFDG9QSFg413v1wwVC48Hgo34NpqkZkEBIY40CBy3/0', 'oyP7DwPsOGdbzkz17vqH-DhwrepM', '', '0', '', '1', '1', '0', '0', '', '1468077063');
INSERT INTO `tyms_users` VALUES ('671', 'Te amo', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5GphFT2T7QKshzr2P0UqlLpRrkDxdGCewMvDYldwFQ9gaESw0nyWrqib54fDjbZbjMBzPPJGyPiaWLMvIjhTYWS6/0', 'oyP7DwDPKOhnswNCLeihRQpyDd34', '', '0', '', '1', '1', '0', '0', '', '1468077328');
INSERT INTO `tyms_users` VALUES ('672', '初大米', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJgQMNfYh4ibIolIK7Exz8UzsRj7E9L4MftlXV5o8SH1iasicOAPNTrQujo6Mibg52bUSv8tSuUmcAiahA/0', 'oyP7DwNSKF4uRH760HAHw4LBlkp8', '', '0', '', '1', '1', '0', '0', '', '1468094126');
INSERT INTO `tyms_users` VALUES ('673', '空城旧梦 ™', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0UVldEP73B9jf9gKZJXIuDQKaAudFfmryxctwrfMY9icpLQBEibXB01rzQwwcpOibI036Xy40tEKdad/0', 'oyP7DwESF5bdw3FUGoJCjQCpOFwY', '', '0', '', '1', '1', '0', '0', '', '1468110370');
INSERT INTO `tyms_users` VALUES ('674', '大卫', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibd2GVOzib2SMKyB1RfTome0GhY7eticLHQfKFzu77nn2j41HVib1yBEZSJamCOYZ3mMOricDrickUL7rLxibQE4TqwKwI8uhibstUnMicY/0', 'oyP7DwOsR_BEkQXbP4oa13RsioZ0', '', '0', '', '1', '1', '0', '0', '', '1468120552');
INSERT INTO `tyms_users` VALUES ('675', 'Eleven', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1IP19df5iaF2DssE0ECpjNzDIhZvzYiciczrEJHwRAYeSjkRlv3MhCBlDHUNhBKeB0JZFRGv2UL07r6AAEWn64v5y/0', 'oyP7DwBZgmrwtra7FRbbaqz45S7I', '', '0', '', '1', '1', '0', '0', '', '1468123192');
INSERT INTO `tyms_users` VALUES ('676', '王华', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ibcvO8QJuU90RFwSt2oI7ZGRwRUWlADdw1qoggJca48VXAWnWedmBNHbzX9BAysT3qjpS0Q5icn65RiaaBwWWzoib/0', 'oyP7DwMuw1YgyEVkWvhPz3sKdOdY', '', '0', '', '1', '1', '0', '0', '', '1468123327');
INSERT INTO `tyms_users` VALUES ('677', '①笶侕濄', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1wZW5N7zf2k5LMOTX2VKCYlksUoq9e5gbORESjvAu7y73lGrRNBZrlDdXCRWNNgcoJByJpxHsqvw/0', 'oyP7DwHe1CPExbkTC4Fz7IOFD8Is', '', '0', '', '1', '1', '0', '0', '', '1468123448');
INSERT INTO `tyms_users` VALUES ('678', '低调的嚣张', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2U32hCa6wey4PbeZC8xoQiajZic6Z75iamwjvm7j0bfdd6r9m1QBmtSic3WzelQ2rfoYIrROjbd2UpVw/0', 'oyP7DwNXNDCTgnrVQl8GcA8sGOcs', '', '0', '', '1', '1', '0', '0', '', '1468124850');
INSERT INTO `tyms_users` VALUES ('679', '青炫科技-叶青', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZFZoLibibju7XKrD5F22A3khmKI6CiaNQzJYeEfX9TIYsc7Gicv0Uv1brPib1skErEhiaviaFOM99FFv1P/0', 'oyP7DwOiTqzAeFKyVy0RoxGgEytc', '', '0', '', '1', '1', '0', '0', '', '1468126591');
INSERT INTO `tyms_users` VALUES ('680', '王亮', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0UdXsZdUnq1yGYGf0AfpVhzz8qicHYQyg6P58O5OnDjgQKuFp3J5icJfc1OwibYUzESXSmWQhLmqLEH/0', 'oyP7DwAMzXw8rQq6UtYOHGpAWBLE', '', '0', '', '1', '1', '0', '0', '', '1468127988');
INSERT INTO `tyms_users` VALUES ('681', '杰夫', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeHLo8ffU2otvIe3IBLCVx3pJtOOz29MRmQaibCia9ricWzTG7w1TiccrT23zicVC8VuRtyglTIcqNTZRw/0', 'oyP7DwPkvyyGW5g-5wmLTZli-__E', '', '0', '', '1', '1', '0', '0', '', '1468128025');
INSERT INTO `tyms_users` VALUES ('682', '龍', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4kt2lygJUmkiaDYb92BSZlcHIJicko5C4KBJjNzCsWgzJTCKtmhiaVZEOGxuqh6Gia9jxgmh9yibWw3YS/0', 'oyP7DwNcfrroMO9pXbmKjm6nIBJs', '', '0', '', '1', '1', '0', '0', '', '1468130824');
INSERT INTO `tyms_users` VALUES ('683', 'arenmei', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eEsORicT84VlLFWRqFiaUXeWDrQsvY0FjYkTxG6L2YQ0eKcV4FVCzUWCAh0RcCfCdftFWgfFSycPibf/0', 'oyP7DwIEYtmsQmnYOlnMmJ9yTVtI', '', '0', '', '1', '1', '0', '0', '', '1468137517');
INSERT INTO `tyms_users` VALUES ('684', 'Childe', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdUxyaPUKQ3iark0Mmwl5XUfuXofuY4OZWlcetM3sDLCibAOFia90c3fYURg6vT8Ql6aAb1CDdmJ7JpE/0', 'oyP7DwOzRCcGMNuw4A8FsbxsYMhs', '', '0', '', '1', '1', '0', '0', '', '1468143434');
INSERT INTO `tyms_users` VALUES ('685', '风起云涌', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIkQkZ10s4fRE1lrH5aQReLia554YmZFKCtkMXaz10jJU885143wgUM6iaeQ6bpYblycPib7fKsclFAg/0', 'oyP7DwLvLwsbsTSo1v2nX6lLXR2k', '', '0', '', '1', '1', '0', '0', '', '1468150098');
INSERT INTO `tyms_users` VALUES ('686', '独特yinzicheng', '', 'oyP7DwPm_tz691evMkIg54lS77Dg', '', '0', '', '1', '1', '0', '0', '', '1468154543');
INSERT INTO `tyms_users` VALUES ('687', '吴远军', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY57iaC6LscFicnic8OOHfIEEkoUZXVcKBE2HJrMFSdKP8vTCvagjTdf0jpZBxDVNJnODhGpVDy0DDjHO/0', 'oyP7DwDdMoXAJqoAhUiTz6Nov9OI', '', '0', '', '1', '1', '0', '0', '', '1468156177');
INSERT INTO `tyms_users` VALUES ('688', '彦青', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAnjGjicqOErVu7shsklQvCicZmV5GgB9714U9MevC6tncjPBD89MReJrLk4CE8xTkxlX5K0dYw2t1g/0', 'oyP7DwExPPZ0-vRuS3q_Z1y254A8', '', '0', '', '1', '1', '0', '0', '', '1468156460');
INSERT INTO `tyms_users` VALUES ('689', '王会18191043093', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawqxEPejFyjxFny41IdOiacT0Kan60PPzOvJKV02VuEWlekdLakCyQzMIcK4ia7yDHI2GR90Mic2ln2/0', 'oyP7DwCoFXxmyCSrgxYd81VPIGgM', '', '0', '18191043093', '1', '1', '0', '0', '', '1468158570');
INSERT INTO `tyms_users` VALUES ('690', '中华币免费挖矿App推广专员', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKuhwHic3FWAERcMPsuP5Picnfjdv0hnSd2lqycEPRpJ64auPLISVfwsmljAGb4NcVzIPRL4JU4mIX/0', 'oyP7DwHLJx4dqFkmvvuU8lEMOe2o', '', '0', '', '1', '1', '0', '0', '', '1468158852');
INSERT INTO `tyms_users` VALUES ('691', 'Kevin', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlHDNnv8w8UO4Bjze72sicUVnFZGnIMjv3OFXUia6syQdG2E55KCoTQPtwMbic6UsB2Y9vibnh4URzOrb/0', 'oyP7DwJWLpqAAzk6kWlHtHxBXlbY', '', '0', '', '1', '1', '0', '0', '', '1468159668');
INSERT INTO `tyms_users` VALUES ('692', '一切随风', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5yUH5WzFA3ux1ocqkrKo0YMicv3TaUGMX4XQzEIZcDUTyWVhLZuWJL9JZO9cwZrvLCXO7ZiaJF8nEA/0', 'oyP7DwAtGGk4owGFr7rQWYxP5EF4', '', '0', '', '1', '1', '0', '0', '', '1468160828');
INSERT INTO `tyms_users` VALUES ('693', '邱广新', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZVgJMzGA2YyFmKtGOF9EhzMfS8dBHdKXb5soAmx4rXfTtZwlQWPJqIfAcwNTw1FquFWd5OoJicUa/0', 'oyP7DwB6ipV6KrAzifuQl8nPS6mc', '', '0', '', '1', '1', '0', '0', '', '1468166844');
INSERT INTO `tyms_users` VALUES ('694', '合盛科技南', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7dODxib4RGGey8NubcrapzyRGRQDfkBicGc29Jl5NLewwXmllBT63viaF9ALYumMPf2RjrTJVic7sbHw/0', 'oyP7DwFzEbcAWeMDlXQmio6712So', '', '0', '', '1', '1', '0', '0', '', '1468166918');
INSERT INTO `tyms_users` VALUES ('695', 'PP', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibefDfkj1u1R0vql80jNG42dEcGJykichGP3phtXmjJ3l135uMJmy9IfW9lHkJcKibF3QyiacZPrK3iaicQ/0', 'oyP7DwKxleMWNSDUxYKftXNnW1mI', '', '0', '', '1', '1', '0', '0', '', '1468200555');
INSERT INTO `tyms_users` VALUES ('696', 'Cai', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeiaWkkmZrF5axeUrliaPicN9CDBaZFmua1M9bQ5NcclcsIn5kZoHHTAucSOKHwf6hVXbuN7yxyoROXQ/0', 'oyP7DwEuyPByqKrtHZf3K4jitJkw', '', '0', '', '1', '1', '0', '0', '', '1468200704');
INSERT INTO `tyms_users` VALUES ('697', '尤长亮', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZLuNQxW2mib1vVJDuiaicmL9GKfUWq6Q1HPPXmljfDQrEkVWf04L5LibgicHPEx0dpMe8hDFrpLwJxdp/0', 'oyP7DwN3lSwmClp3ggUudmnrwBTE', '', '0', '', '1', '1', '0', '0', '', '1468201142');
INSERT INTO `tyms_users` VALUES ('698', '学文', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2iaBwp4Tbv6muJF4uOuzzlvgjusITibavN6QO0CpnUhom2WgcH8oRC5jUSq0wJvEVUicE89aOZGesp/0', 'oyP7DwKna_kFC1c_wRzmYT0BMjFA', '', '0', '', '1', '1', '0', '0', '', '1468201217');
INSERT INTO `tyms_users` VALUES ('699', '老贺', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB7gnlVHic3a7SH49Bv9DuUEU1SdsSvygUQtQA7vBX7ibO4y8aYZtQF4U2STenEV9moNuamcFxygLibg/0', 'oyP7DwKqScYH51-GG9Ok9_xBzr2A', '', '0', '', '1', '1', '0', '0', '', '1468201390');
INSERT INTO `tyms_users` VALUES ('700', 'Maker', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDs9UGnZBPmxg7TKjKLBb0rXAy4tytJOojJVh3hiccAHWqXAS30c1zenib2op6b40udrOLhUz3NxNKw7T2ojiap2Fn3OQlM1LHXH0/0', 'oyP7DwNqKm-T_bkbVrHABo0TgaLU', '', '0', '', '1', '1', '0', '0', '', '1468201426');
INSERT INTO `tyms_users` VALUES ('701', '帅锞', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIFpjNFAwMtaVKL2IR7d5tfSI7Nic0FYmw7sibnBXhicRniaoWFhrteibMCibictBfX4e9dD6HW4daztINeQ/0', 'oyP7DwP3SLaVf1xDLemDUIbTNSX4', '', '0', '', '1', '1', '0', '0', '', '1468201773');
INSERT INTO `tyms_users` VALUES ('702', '鬼医生', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4Qj5IdgHYJnMIiaH7uUgZN4dXY73hN0kzLRriaJmWNSibaOJGicPz2tvarxDSaW52uw9xQ6MF1nrOXRDsHFViaP98MQ/0', 'oyP7DwKeeJT5Hsfc5P0v0nc76CPE', '', '0', '', '1', '1', '0', '0', '', '1468201846');
INSERT INTO `tyms_users` VALUES ('703', '飒佤', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ZNzGlbPUECSJhkicOR8Vh2YRlCaapQcUfYn78kFBg07Y3jHSknbHlQGQCG7qfWbib3pTeAXMb7CALR9s8cUIlaG/0', 'oyP7DwJ6FypeMgdBFuL1DgY4GRk4', '', '0', '', '1', '1', '0', '0', '', '1468202077');
INSERT INTO `tyms_users` VALUES ('704', '黄纯飞', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7KxFVKdUXfkPjtviaXfiauRq5uAgIor3Q3AphFBIN7GlxtpUicRiaD5cX841CyjXmoOwmyNMjudwI7ic05pXq18bzLc/0', 'oyP7DwAp9Q_GPVbhN2EJNBV98VyI', '', '0', '', '1', '1', '0', '0', '', '1468202605');
INSERT INTO `tyms_users` VALUES ('705', '乄', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKqgWQDlCyTW5Ua0zfUQhxuPwwCDxWJWSS17e8SMw6Stgniat7vgqicjxzzlicpxMTBTYico20oJe7ArQ/0', 'oyP7DwJKZtrcQhM19LF3eSNOz3TM', '', '0', '', '1', '1', '0', '0', '', '1468203084');
INSERT INTO `tyms_users` VALUES ('706', '吴进田', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKFYgiaxgWvTvrd68oT7P9atptMGIFR5RUOiatbEWKtpm4jpJ2YYDuicta68x8UQNRsXTDWziczVYbN4A/0', 'oyP7DwBB0IVHZHRxypmHw_UNbHoY', '', '0', '', '1', '1', '0', '0', '', '1468203847');
INSERT INTO `tyms_users` VALUES ('707', '死神007', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJ7hZ6Cgam1M9u4yA2dbOU6VnEhktM3EB0EApdiaONVxyEyaN6AiazxZ6kdFeueY0KMV4pjq1qGCkU/0', 'oyP7DwCadkJBxSHS9MhB7SumFBLI', '', '0', '', '1', '1', '0', '0', '', '1468204166');
INSERT INTO `tyms_users` VALUES ('708', '*神*~翰', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0eYZmxxQoRrHNBicQHk8bSaB8tnFqial6H8pIW2sGcsjkrBCOOEc2yTZgjYk0lfzDRMZ62d8FZE8Wz/0', 'oyP7DwOZlP2E-OGMQJ3XXdKx4PmA', '', '0', '', '1', '1', '0', '0', '', '1468204609');
INSERT INTO `tyms_users` VALUES ('709', '琥', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK69jgYp2B1c20QfkX3rDdmKm8AXXqDnIGBTjHib5Ct2SCE07mK0f6TXGCnqsGnrusLEiam8J6gObOQ/0', 'oyP7DwBK6Gkcf3lSHB0GCX0AHYMY', '', '0', '', '1', '1', '0', '0', '', '1468205720');
INSERT INTO `tyms_users` VALUES ('710', 'left', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3TrsA7IiayDkxxyicLXSdphibOG5PiaSo6UE3xGTnfABEcUkqKWOOXqGnVDjOYX8yAGFODFTia2mbZa9SKJDIYIWrXA/0', 'oyP7DwNy4mqgCX1-lTf2CQ3zyd3A', '', '0', '', '1', '1', '0', '0', '', '1468205943');
INSERT INTO `tyms_users` VALUES ('711', '李红帅', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJkv2EGKJiasIqXX4micvsujKy5ZHCA6QknuSkztyRoDj6t3jJcmg9CBbMeDicjnH9eGD8pibgJJiadAb2eHNjdStOUe24MZEnYNRuE/0', 'oyP7DwJPnhuE7qFCASwrgnObqmdQ', '', '0', '', '1', '1', '0', '0', '', '1468206918');
INSERT INTO `tyms_users` VALUES ('712', 'Dison', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2qrUicLpbqSZIJTkIAccgViaQRsnUG8RKiaxantUlyOBr3A9CSXnKjVQqMNzib791B8umppMibRiakKQ9H5GDZI5qtJK/0', 'oyP7DwL74eKylMWvcJeaGfQ1xtmI', '', '0', '', '1', '1', '0', '0', '', '1468208156');
INSERT INTO `tyms_users` VALUES ('713', 'A一键转发清僵尸粉诚招代理', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UHJDzZkyiaD489jC15sr2cXBseM7cDhe6JMux78vocYibib7VRShdpts32VVWXge7UyoMC1dGwwk1sz/0', 'oyP7DwBfr9hGs0DA-Q6lmKwYTMVk', '', '0', '', '1', '1', '0', '0', '', '1468210507');
INSERT INTO `tyms_users` VALUES ('714', 'Joevan', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibc10SXQD1JmlictmYzc7xh8stPUMwm6PIGjib5N8F8cheibiaS52LPJ2fvAhELzkrKoZlbyb6cTZQzTHg/0', 'oyP7DwKEoxS5nzQpcmPh0qn8k5n0', '', '0', '', '1', '1', '0', '0', '', '1468210929');
INSERT INTO `tyms_users` VALUES ('715', 'Lait', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD3WTKsrsP94aOVQMCxDLBzj2dibfuZ4MhG7fbhzb05ibvEiblT6evfIhflRwSL8SjLgZVklncPeia0rOibicTS2e9bvomCB60UKrkDc/0', 'oyP7DwIh7bpOJpfKkTKk7u33Ho58', '', '0', '', '1', '1', '0', '0', '', '1468212831');
INSERT INTO `tyms_users` VALUES ('716', '诺讯商城', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBO8UhAtd2ic0ukqLDdmgkydPgspdjzEIRCeoicpmwCts6VtDeNc7VcRMR3ibwpUf85UqXtKiaECseddA/0', 'oyP7DwOxHALUEB6vqxgXQo2hb5Co', '', '0', '', '1', '1', '0', '0', '', '1468215043');
INSERT INTO `tyms_users` VALUES ('717', '海的味道', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2H32Ryhvaq2HAEN0wsqiaedIFwWm7ABY4qldBGxyUmuelLejiahIwa3uKBZEK2TibQVf6Y6BCwX2peLLRfQ8smicib4/0', 'oyP7DwG9UYdfsp-VTMRb7NRqjXwM', '', '0', '', '1', '1', '0', '0', '', '1468217129');
INSERT INTO `tyms_users` VALUES ('718', '凌云', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4kI3D0XgA1nOI0KRjz4W9qbEibPGA5QQW8XEibT1aqBtfrRorVC9YZqxv5iblBnNDRD7MpOdu4qhYVo/0', 'oyP7DwCdZaVa6PB-fg53aLyzxa2s', '', '0', '', '1', '1', '0', '0', '', '1468218522');
INSERT INTO `tyms_users` VALUES ('719', 'Maxie', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKMHdV7MZghyZDMv96Lf1ia0SjkFMv1thib2FYiadXzvKWyNA7JBvSBDFyIXgOehv6BYCa575PbOyNjQ/0', 'oyP7DwBvMHSJ2bKB9gjy4Vw86wx8', '', '0', '', '1', '1', '0', '0', '', '1468219233');
INSERT INTO `tyms_users` VALUES ('720', 'hx', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1xvic812FPOqVWZ4e7j2V2oWZxX4AAuO2pdvrXicuUE9P6s1ENXUrvm4LuZBicb5uLdr9RZgibwiaB6RA/0', 'oyP7DwDlIYtVARe0w0jYAlabIxUg', '', '0', '', '1', '1', '0', '0', '', '1468219410');
INSERT INTO `tyms_users` VALUES ('721', '定律', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCLA8d1a0Wwowk97BhIlWypVFLvq9B5FibCyNFPzicOaicBxx0qYMPpXserVK9MEh7UYX5hKx9Ztt92A/0', 'oyP7DwEgGzepPPg-4Oik5GDapUzo', '', '0', '', '1', '1', '0', '0', '', '1468220592');
INSERT INTO `tyms_users` VALUES ('722', 'zkun', 'http://wx.qlogo.cn/mmopen/Z4EL7omFbLHhWYibcctFAv2FtuXsbhYtNxpiaJuPTXV27UaqJdeScZjXt6iaL1QFXniasDd0oLE1AWwR7iaiaNDc0q4QPBVgM9QJYf/0', 'oyP7DwIOo0cJNZw6JJH67AvVxt7k', '', '0', '', '1', '1', '0', '0', '', '1468222870');
INSERT INTO `tyms_users` VALUES ('723', '梁涛', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0yrf8KOBoydF7U3zpcYCZSa1l3eUBzOXhUqmia2neYBgDFFMXEyP9ytlkNvia3EVWWEEMSrnIu4U8pb58cfiaAWjD/0', 'oyP7DwLvG8voGGlDsHKb4dG5YbUU', '', '0', '', '1', '1', '0', '0', '', '1468223903');
INSERT INTO `tyms_users` VALUES ('724', '山的那边', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM63aEK06KTicfvotod7IKTCCuibKSAzJlANBQgiblIEBiaib8C0QXccDp9udHiaOian0E6tdTIJRUqAnSx8Q/0', 'oyP7DwKQezHXflAD7ieZvvcJH1Y4', '', '0', '', '1', '1', '0', '0', '', '1468224600');
INSERT INTO `tyms_users` VALUES ('725', '胡润甲', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELG2ZHDEunop0R6WCw1ACfhIrZbHc1HUribzHZG51BWWGMe3KYJApDOjHTa8TUtClntInsoZzgRdI/0', 'oyP7DwBpioxfIlSGwGvJkcof9H8I', '', '0', '', '1', '1', '0', '0', '', '1468226349');
INSERT INTO `tyms_users` VALUES ('726', '韩小胜', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIeS7G27vyyJc5WMIGOcK6wNf6uSB1AFj9J8H2yX7RR2XngDH2RoOw7o9iaULKk2pKA76tjdjLPZt/0', 'oyP7DwJ_SxZGJ3aH0nxzuh-FceWI', '', '0', '', '1', '1', '0', '0', '', '1468230345');
INSERT INTO `tyms_users` VALUES ('727', '无名', 'http://wx.qlogo.cn/mmopen/aaHf8EoUUTiaBUUnNC5bibiaPia21PBNAHDPicTS4jJjTBmPjBcW62qA2zmUxJZeQttr1RDNUXSc155XfeSEHtJZ6GQVZUg4Dm9aL/0', 'oyP7DwL4HFhRg6JJros56QT9d2lk', '', '0', '', '1', '1', '0', '0', '', '1468233026');
INSERT INTO `tyms_users` VALUES ('728', '容者', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1iaWrBL8wsJQcsibnRfeeWMH8HWYzbnRDibEqh1zxoj3bEHClX1pG2vzGD3T1SoaQA9nVT8EJRmCxX9Okj89gsJ3m/0', 'oyP7DwFA94mjR3EhGV_ebboiC50o', '', '0', '', '1', '1', '0', '0', '', '1468233846');
INSERT INTO `tyms_users` VALUES ('729', '诱诱鲜果执事●微信、商城、APP', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7u9EicdLJgZx2A845uHktoDKQ0Swz1yzSZHsLE6kXNZK2zjjpR7lP31lRy2hX5Jm5SjDnMuwibQwq7v8QlYibibNlf/0', 'oyP7DwO9euQcdSBnl2dckw4bAozE', '', '0', '', '1', '1', '0', '0', '', '1468235847');
INSERT INTO `tyms_users` VALUES ('730', 'Semi', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZjT2JHYmpD2VUT8JtbgPRre0NiagcGmc1SFGDBF1hOFbkPfY9hfgskqF0PJ829wcnJGl2ibdeB5wv/0', 'oyP7DwMJpSQL2B0xA757FxYAZcgM', '', '0', '', '1', '1', '0', '0', '', '1468236082');
INSERT INTO `tyms_users` VALUES ('731', '五福临门', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7Aa87IdSvE3BiaIdcic2HXHUuEOVsIzDZfOKEzsmbqednpicplMcnt4ke3hQVSuxed2k9zN849lubAO9LyxFwR7Oj/0', 'oyP7DwBIiLMCxX91_-S4Y2DwPWA0', '', '0', '', '1', '1', '0', '0', '', '1468237496');
INSERT INTO `tyms_users` VALUES ('732', '知心语', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEN5Ae2zpia18XUaA5GZYIX5B8ZWibWG7sNXsTEvCIc73L7Zicm3hVE7A18o7lvhb14UVpEmFRCrRMaC/0', 'oyP7DwPa34cIJGV-deDpyTtBwsJk', '', '0', '', '1', '1', '0', '0', '', '1468240731');
INSERT INTO `tyms_users` VALUES ('733', 'Yù Míng', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdrVeP0hDrT0TqBT13Ob2pusWdguX1zicOkkam4wnrLYPx0QnX7dQeibhxQRvVfZ9hBickdQ5EJWxEEg/0', 'oyP7DwKu4zjW1psZSIRxGl_j5W4s', '', '0', '', '1', '1', '0', '0', '', '1468241938');
INSERT INTO `tyms_users` VALUES ('734', '余小渔', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayeydBHYJ9bVbibL5HJdNQEByuibC9RF5x2Og5XVLABfVA95oI9s7rdrYbZMszFjPI8RL3YPia60lpa/0', 'oyP7DwJbr_b3V8S_pdk6-4fBxPFk', '', '0', '', '1', '1', '0', '0', '', '1468243112');
INSERT INTO `tyms_users` VALUES ('735', 'allen(周军胜)', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53aic8Ef8x4ia724Gho80FarOVZHMUPqGBSHgxsa9heVJdBLCB4upYC5n6sibhhaS96AUBTgDibaae3ia/0', 'oyP7DwEKknxffBVoqTFg0_Nmp1uA', '', '0', '', '1', '1', '0', '0', '', '1468250956');
INSERT INTO `tyms_users` VALUES ('736', '青国平', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDbg7CxXDibGEGICtaXg9E2oemTS649qpTQ0ZniaQAJEBZuPhoFKo8E9kQoebqTbQl8DQSyuB3kcX2/0', 'oyP7DwFLKIeE0utvLaiaE5XWHL0k', '', '0', '', '1', '1', '0', '0', '', '1468251325');
INSERT INTO `tyms_users` VALUES ('737', '双面', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eODRZbjRR5z6ad3BlMgCGCNJk1dtMbjdyxx887kfmaoQ1v9gW6aAu6Hibku3m6MbPib0APppXX0nRs/0', 'oyP7DwMLgUHOhVj2AiqhMt35z4w0', '', '0', '', '1', '1', '0', '0', '', '1468251493');
INSERT INTO `tyms_users` VALUES ('738', '林培东', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ibYZ2RTVxib45IXbTAOQUibbQicOE5JBxbkYphlGGLYuw70VvKeTKj0abJolAcAo81nafus6DEFk15XQtk6VL1bibd/0', 'oyP7DwMyo6371wnjW1Df7VgDnYXU', '', '0', '', '1', '1', '0', '0', '', '1468252671');
INSERT INTO `tyms_users` VALUES ('739', 'IsMing', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlDZBlFPRhibnGLhZNTt9IUSwncavAe6NfmzTOQnGEU0LDJDy6kzKOlLSJZslphWQgfFM9xA0r91jP/0', 'oyP7DwHbd6kU5YCQbnPWngIUTpxw', '', '0', '', '1', '1', '0', '0', '', '1468253529');
INSERT INTO `tyms_users` VALUES ('740', 'Tongliang Li', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3oS4iaCJRUJVlZnicuVnibbxWrvqNRoIic9DhhNUhuFGwhLj6uZGgfBc4Sud4EEmOJpghMEbCKCyNWjM/0', 'oyP7DwIMq8-C8ugPLWlfBt4wSXds', '', '0', '', '1', '1', '0', '0', '', '1468256006');
INSERT INTO `tyms_users` VALUES ('741', '1771', '', 'oyP7DwIKyUFPu_fPcNUHtha8fy00', '', '0', '', '1', '1', '0', '0', '', '1468285401');
INSERT INTO `tyms_users` VALUES ('742', '笑忘', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKULMG6ZFnTgqwLNy6TluZo7gdtl0hVfcFpMnNvZRKzkX4CTZyBUz3cZHAb42mwOibbAMDlUp1CsD/0', 'oyP7DwAWr1gcc01Syz1w6fM_Pjts', '', '0', '', '1', '1', '0', '0', '', '1468286598');
INSERT INTO `tyms_users` VALUES ('743', '爱微信小贺', 'http://wx.qlogo.cn/mmopen/8hSs3H5r6sYIuRUOdGWJYcUIJySBEXaP31tvKC8DFhOv4KuFTFuEDuhqibZtBycA85RmJUMTiaRAqskl5WVpzUnmuocpHPUm6P/0', 'oyP7DwNkm96XA1MxxZGF6pbgeGF0', '', '0', '', '1', '1', '0', '0', '', '1468286661');
INSERT INTO `tyms_users` VALUES ('744', '那只小小猪', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMj9sddmT6nO1F8ew62ibgvmDufjlZTbLjv8SkaWkgQrBrf2icsXnchPKM9KfBCx6GsQqNOtSF57rK/0', 'oyP7DwAys3pfQIbYY4NJAPPKt04c', '', '0', '', '1', '1', '0', '0', '', '1468287607');
INSERT INTO `tyms_users` VALUES ('745', '原源', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UNGLVLvJffm8FqQ0oUaGyxouCayYic2yu6c18RXGOdY8ticflmicekic2ozSPoZgXCK0w7Dyu7tPSnkI/0', 'oyP7DwF0PiZCEW_njmE1ZNT87Ycs', '', '0', '', '1', '1', '0', '0', '', '1468287654');
INSERT INTO `tyms_users` VALUES ('746', '虐心少年', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1n3qehXvuw5v30KK1Sx9KHgNpxuHHXicULEAEFwbSndXFwLSIbDVWXnml8d1aeDmmick7GgWt8fux555E2hfDmPn/0', 'oyP7DwEo9sADvbYzC31t6tvXar8Q', '', '0', '', '1', '1', '0', '0', '', '1468289280');
INSERT INTO `tyms_users` VALUES ('747', '紫气东来', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY52Zbc5bibERwegMYw4R1aice2VianFcnVkS34GG9tcNffb8HPCUoyibZcqbY1D6iaIKwY91LpTicOVBOY1/0', 'oyP7DwMx-xwgGt5fHo2yVNDHCTBY', '', '0', '', '1', '1', '0', '0', '', '1468289373');
INSERT INTO `tyms_users` VALUES ('748', '__Ｖidvan、❤', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFnRv6ic5G7FLaHRSM8mwJtzrW36pYjPAdkqsicyowibnaBx0rIAJsibXZ7LZ12tSu2KYGmnxRDfnHH6/0', 'oyP7DwLwf3Dygfiy7JsR5skeIRTg', '', '0', '', '1', '1', '0', '0', '', '1468289972');
INSERT INTO `tyms_users` VALUES ('749', 'Vevay', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBnOw5BLzq14Io4WrYrX75gN9CZcnJscHZtGTEjUHoZcx6n3x7k9wB99WOpFNOzs2k3rAlW6EiaXSA/0', 'oyP7DwEfgjVfyefLwky3SHVszh-A', '', '0', '', '1', '1', '0', '0', '', '1468290500');
INSERT INTO `tyms_users` VALUES ('750', '爱不羁做自己', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1ePnLjhgkg2xAib8jXCURIxhiacyF8UhodiaLPx3GUDI6kQnJPhSVOxMsjLSjefFoyt9zVnVsUcXEcbia/0', 'oyP7DwLZSbr_uPOcQIXvLH-XHJMw', '', '0', '', '1', '1', '0', '0', '', '1468290872');
INSERT INTO `tyms_users` VALUES ('751', '念你如初', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4j1ZLfYUT1WPic52s8Iiardy1RPAgbqSXDraphvr8NBGwcSpsibota9u3xz3UJFG6eHT1JSjiasx5Uj/0', 'oyP7DwA7-3GLqXSH6_1CAFMzys9I', '', '0', '', '1', '1', '0', '0', '', '1468291752');
INSERT INTO `tyms_users` VALUES ('752', '无所WEI', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP386OfJKsDOTbj25oNBEykW5veZH6hdcvvz2C8wTgwic6StM48nvHbxT6QFTcmUDFJjjvRn2emDVrQ2acicqRDj42/0', 'oyP7DwKzuKpJAGQqHJATl9vEo1dw', '', '0', '', '1', '1', '0', '0', '', '1468293423');
INSERT INTO `tyms_users` VALUES ('753', '丰哥', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPCzibtuxzWX6ZvYvCWCO0WbicP4At0hHZLkhRAuictzkx5ywQ0yFXfPpbo18lHB7Gicib7mqcQ33Lw6F/0', 'oyP7DwPRMc2vCHJbM_OInYa6Jvbc', '', '0', '', '1', '1', '0', '0', '', '1468293898');
INSERT INTO `tyms_users` VALUES ('754', '喵碧咪', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfZmP4wMys2woBorEByas5kSSdnBCSgLCdP2dVRiaUk6GvWIZpBxh1jeJd4AUeDQC3KYKSKg7hbNYQ/0', 'oyP7DwGmj3fjRoegXRD9IUsRNe2s', '', '0', '', '1', '1', '0', '0', '', '1468294570');
INSERT INTO `tyms_users` VALUES ('755', '黄靖', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1u6EiaKkibiaTJxvjAHlbr2NicriaEIiahPm5QRGdEretUyaPLynsfwlEyEicfdm958kqjDzbD9Ym8iajqW/0', 'oyP7DwJ_Ib8oAiRMaCvQS-Jl7E3A', '', '0', '', '1', '1', '0', '0', '', '1468295426');
INSERT INTO `tyms_users` VALUES ('756', 'YCP', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eCxWgDRCP2hSZEfoKwjtEfSF6x9cw4PeQfhoKUXWuaoqowvBddxxVMYcXOFWkJyUNyvFvhIVhQVY/0', 'oyP7DwItUoYXw-K0LgbQoHubcn_E', '', '0', '', '1', '1', '0', '0', '', '1468302174');
INSERT INTO `tyms_users` VALUES ('757', ' 人生', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCibmibGmeo4wYghKApKY4wFaaiagNwa7YfErJdXkATtjvs4ATnzes5iazFHQuciaIXJC52kqxJOSibWGIA/0', 'oyP7DwOnahbf9RHwUV05MLoh6Bzo', '', '0', '15728743912', '1', '1', '0', '0', '', '1468302530');
INSERT INTO `tyms_users` VALUES ('758', '王兆义', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAzTHmYI6rbvkiaD9YE5Sddykcdl9OoLOp93iaVGna2K9oD02AuqT5Id0DNH6icGFbHOFYvzm3d9VHOg/0', 'oyP7DwK57rcLOMh9xsyBAvWYnP_U', '', '0', '', '1', '1', '0', '0', '', '1468302585');
INSERT INTO `tyms_users` VALUES ('759', '王庆业', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2GZYL6vdKsl7jRtXyIVh1KUGbHwY5yAcddpwJV5PQ68IPeHN5lsGSGfNCcxWfWRJKvXe0QVcTCkw/0', 'oyP7DwJ0apMeZNaDw63SwZ_XFEUE', '', '0', '', '1', '1', '0', '0', '', '1468303217');
INSERT INTO `tyms_users` VALUES ('760', 'qiugaoying', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4dcCVm2449CdXoLwhuMx6BJLJHt9PtHaTDStbbRR9DKVSIOS8JAC3UYbvOggqx4YLoicuzZEqRQziaJt0PWklSyw/0', 'oyP7DwE6OON6EZ-7C9Fm9yKXcjUc', '', '0', '', '1', '1', '0', '0', '', '1468303926');
INSERT INTO `tyms_users` VALUES ('761', 'burt', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53N9ibgnuMaede4pCbKDbuIqKCUSoBzo2lkHO6riccA39iaBEOW2WibYdanKZQlHVuvmUib374yrAoGt5/0', 'oyP7DwCsi_TrH5nxCHnBjPEZd8aU', '', '0', '', '1', '1', '0', '0', '', '1468303975');
INSERT INTO `tyms_users` VALUES ('762', 'A兔子太太小面馆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4O8HZxHnne2MPJuGH6YoSMKxqasMGYdaf2pVSZib1lCiaN8NrZFHUPJmdibtuDL3CA51nsPGCzA3wgLwRHdp0Okdb/0', 'oyP7DwHzbBjatA-E9g01eH7o_rc8', '', '0', '', '1', '1', '0', '0', '', '1468304571');
INSERT INTO `tyms_users` VALUES ('763', '安静的活着。', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlCX2PYkm6qBCHUIDe98fWDpdQzNQGqHiaHxficPz7dnDIV5IkpwyjqbXibtpZXCQxm358nAnBvh1j4m/0', 'oyP7DwNFiEAV3EYVnwPWMSLOsWGM', '', '0', '', '1', '1', '0', '0', '', '1468304614');
INSERT INTO `tyms_users` VALUES ('764', 'Mr.Zhang', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFniaTqtVLicAOzzZel8jJ2OynrxYJEYv3SZbBUFIkosfryzuzrgyByqDMy2wS0Y74q3BOqeYUb3VA/0', 'oyP7DwCyHhzA1A5hLwNzBl-XsBfk', '', '0', '', '1', '1', '0', '0', '', '1468304700');
INSERT INTO `tyms_users` VALUES ('765', '彭立诚', 'http://wx.qlogo.cn/mmopen/LSQ0gl6NMgbwCpiaxqhlnq1jxqWuqtFGuK5Re23nIYuiaUCymBRv8fvrZ2FScTmXKenJqhauHGkv64XXtoAxr1tHbicEXIibWicCy/0', 'oyP7DwNWIFv8PtxPCoxDANo3ZkPA', '', '0', '', '1', '1', '0', '0', '', '1468307326');
INSERT INTO `tyms_users` VALUES ('766', '饮水在山', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90DmEmVmiaYBugNAyAB1iaXwsqwPpuP7oq1lE8vJUnupLOBicGXT5gKCdCAwSwOKY8hZmkalGiaPkjBoS/0', 'oyP7DwNywlGwotNkLIUD7kQoh0p8', '', '0', '', '1', '1', '0', '0', '', '1468307604');
INSERT INTO `tyms_users` VALUES ('767', '心烦意乱与谁言', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZkhLoCkjZ0FOTd1DZMXpxJs3bRjqwibSpU7T2KFC3lfbEickrl0gerSpxFE0mMvmJd1MNLQkN8X3u/0', 'oyP7DwOHKBEmcfNxTYkOvhtJjpyg', '', '0', '', '1', '1', '0', '0', '', '1468308649');
INSERT INTO `tyms_users` VALUES ('768', '土豆酱', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2x1RtNgMCdkul2BnT2nppo82VkRicNWCrKgSYcUYCRpXy55mKNsbXoKQFRy3SLtq3vyg25RRTeqAA/0', 'oyP7DwK9qqoPN6bWmFVtxnqiGX2w', '', '0', '', '1', '1', '0', '0', '', '1468309432');
INSERT INTO `tyms_users` VALUES ('769', '阿丁', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIvrZ1zKq7QsibOXL3dz0GRyteRfEfmmBbZB7TlicIeXh1SuyUg0q7ypviby6vgL4ZVODptaiaiayr799A/0', 'oyP7DwH2xqrT4YMwsydzcgfuheTs', '', '0', '', '1', '1', '0', '0', '', '1468309483');
INSERT INTO `tyms_users` VALUES ('770', '李岩', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAbgQFoqIyiazMEr8AK1u0jnoOGQ0hMxQzJVicHPz3WHxlD5oFvosYLdicD4qmuKBrdfCXrrHABr0A5g/0', 'oyP7DwLVOw6aZRVXH4ypv_KP2dqo', '', '0', '', '1', '1', '0', '0', '', '1468309642');
INSERT INTO `tyms_users` VALUES ('771', '十堰未来商圈@宋杰', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdgq0BFBiaicgjU2wHQRVcqOOoDteeZoiaYC4iacG6l9dlBZEntOOFmnD6V3OCIYVBiaGI6edCW0Cgukz41U6oDIeBWIWjTAsduKyac/0', 'oyP7DwLXB7rbtErO_5a-hF6qBE2o', '', '0', '', '1', '1', '0', '0', '', '1468309966');
INSERT INTO `tyms_users` VALUES ('772', '薛盛杰', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia5pKAibHiabXuJ9ctgVyiawyreNDl1DjR0Aib9a9z5ztLvfumr4dvG0gIAuVBNHOGSJTtytD6JJmppuF/0', 'oyP7DwH3qZtjWBKWd5vio-RCxL-w', '', '0', '', '1', '1', '0', '0', '', '1468310111');
INSERT INTO `tyms_users` VALUES ('773', '张志阳', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdAicPGxtOVtWg09ZtM8K5RONmHpjf7KXZuMTd66IzUwkbhzGxq4BqWH2704aME9MmSEjMxiapm8gMU/0', 'oyP7DwOXNK8xR7WsY2PUQ-PuJB14', '', '0', '', '1', '1', '0', '0', '', '1468310320');
INSERT INTO `tyms_users` VALUES ('774', '平凡之路', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ84gUvibmqxsWKRBdwuvDkn8faFBHXaRGhoOa24SvE3ZaCqCPeD7BBybia9vLAAPPFztzdZgGWVib8w/0', 'oyP7DwAosq1JFI1ZcpN6fNGjUMKU', '', '0', '', '1', '1', '0', '0', '', '1468310526');
INSERT INTO `tyms_users` VALUES ('775', '不谢～', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeh9NpqfziaCtmDLF08BgWbbV0BAIy8ziaVUsiaTukY6IFVE5gZMCibWqkT00Lj1BopxobW8verOuk74w/0', 'oyP7DwPtsfAL6khDx2CJE11a8kr4', '', '0', '', '1', '1', '0', '0', '', '1468310636');
INSERT INTO `tyms_users` VALUES ('776', 'Azalmancroft', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibevKEhRF2KQDo3f0e7icEEqRYnTOw4yibpatfKhES8KYhNT4l1RB43nqEyia4ZicsfS4Lcka8AMkPuicicostCTxbXwiar/0', 'oyP7DwOGZZy9f5rwX7zsabht7cPY', '', '0', '', '1', '1', '0', '0', '', '1468310690');
INSERT INTO `tyms_users` VALUES ('777', '为自己伴奏', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3srcywc9mJicJY4iajkQ44tvPHdvKaXzP5TibylEicDiaJvFqZ8Z590aV9ddRc6JzMyNvtLuMiaWbRCxkib7mlLSDCmQd/0', 'oyP7DwPi61Y6FvD6wbaM6sC6s690', '', '0', '', '1', '1', '0', '0', '', '1468311541');
INSERT INTO `tyms_users` VALUES ('778', '咖啡豆', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p01fQ6g6gfMg4ZzvxCf7EkWXonMCR3jb7RO0Gh7lVcicYFlicPRibEp8fTjcOYwSEibAPFjpv1vT8HOovtMxxDwMHPA/0', 'oyP7DwHyz3AdIqQr3cYMjVVmC_sA', '', '0', '', '1', '1', '0', '0', '', '1468314218');
INSERT INTO `tyms_users` VALUES ('779', '花开花落只为蝶恋香', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6SKHibZDu6gM9Eg8gE9C5GuHp3Y6XPicr33z0ZGcWmsZVXxDBc4sv1YMCcTphPFsq0fogjcZ98w3cwMbMKrajVZH/0', 'oyP7DwBcFxLRDnUXw0TUsUZsKlro', '', '0', '', '1', '1', '0', '0', '', '1468314240');
INSERT INTO `tyms_users` VALUES ('780', '应来科技', 'http://wx.qlogo.cn/mmopen/5mKxaq9tZpHh1pIjTzIpibktFvxAqChmjXDagrC5WicrmGJ8Djiaoq5qibabUKp77C0fibzI61ibV4M5mBuCj7y4icdqOF354yQNzcl/0', 'oyP7DwD3rocXgaOIxKRw06l1LbHQ', '', '0', '', '1', '1', '0', '0', '', '1468314422');
INSERT INTO `tyms_users` VALUES ('781', '黑白世界的悲伤', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UOSaWT8S7RsYuwcgENdaWPibHCrLdxQZhmaibKk4GahmkDupgRMK1ucicLPDf5FwwGBYrR7nNE9V7xX/0', 'oyP7DwC6wyof5ziyRMr7LosFu7To', '', '0', '', '1', '1', '0', '0', '', '1468317842');
INSERT INTO `tyms_users` VALUES ('782', '过客', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKmciaib3KRLaAL15SEpXVHBiaia8cDRUYoviaeJXgljE7tib7V0KcmZPerQqRWv46ial9ETEsnJoHmHZpvB1Yj2EntARuCWic3nvic9Tico/0', 'oyP7DwKp7v08ewg8JEBJNmSKSplE', '', '0', '', '1', '1', '0', '0', '', '1468320521');
INSERT INTO `tyms_users` VALUES ('783', '我想照张彩色照片', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayHaSbaYFYCh1G0n2aAfvdzJL8oEYAm9WWQKibCLjYJ4xynoBXQ2VrQjMBaqacM8PZ3APYeYz1UNF/0', 'oyP7DwBuatOigmsxaUxVN0_Nnlmc', '', '0', '', '1', '1', '0', '0', '', '1468325662');
INSERT INTO `tyms_users` VALUES ('784', '张子楼', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6nW38102KqkUaC3suD8TicMM2fIlYsE6Aia5x6dMWI9YnkLJXqGjqV0Qz2ro3xpZicz402quJ4p0RV/0', 'oyP7DwH42Bs4c7RrqMWCQmTtHRQI', '', '0', '', '1', '1', '0', '0', '', '1468333511');
INSERT INTO `tyms_users` VALUES ('785', '老猪皮', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJiaz31iaAp4wiaUBiaJumU3WTmnoSPSc8qBK68N6MW0h5onOH0XiaFCS1ug5IThhbal7uQs5C07jcfK7w/0', 'oyP7DwGD-amQ6-QzODSlzBPWZCP0', '', '0', '', '1', '1', '0', '0', '', '1468338702');
INSERT INTO `tyms_users` VALUES ('786', '夏晴天', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4OHaK3Ibgss3Nmcad8R3uCVDvXbrz3VTw6hVezuX5sDHcIqetJ6oWxuv55Ttujz5BbfGibCaJujMia1Nt0za5LfxQk9lEDx5rPs/0', 'oyP7DwJPQ0zVgDB7-uCUCWVBeuR4', '', '0', '', '1', '1', '0', '0', '', '1468341890');
INSERT INTO `tyms_users` VALUES ('787', '黎林辉', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1bEIWI8CKjnokFe1ke2NRlYHL8r8ekl175mbw9z689DygXG7WEia14cG2Y670WpDxZRajZVRbPu1ymic230VPWCJ/0', 'oyP7DwEjrAmVuiHpqPJbjR-nMcbA', '', '0', '', '1', '1', '0', '0', '', '1468345004');
INSERT INTO `tyms_users` VALUES ('788', '云尚网络科技 袁丕庆', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDfibRqA0cVWrI5mtgGcXFOvakCGvRs4qylY0EJyRofFjvwGEgqWGZNVZYSzib28uNHSUIcnCugdibwA/0', 'oyP7DwNCFFZ1Fxvx0NOIVZ2Wwpwc', '', '0', '', '1', '1', '0', '0', '', '1468345386');
INSERT INTO `tyms_users` VALUES ('789', '翁祖燕', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0abibJKsTO5T9dJK8W0JeusQRwPtZnbUuoN9rDbzIs2M29CqZbl7btyClvTniccic16L2q9s6dKB2Ll3YGHwI1LFI/0', 'oyP7DwHNhb6Ph0BdaTYqzpy8L1wI', '', '0', '', '1', '1', '0', '0', '', '1468372616');
INSERT INTO `tyms_users` VALUES ('790', '陈安钦', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4ojm60XVibk0E3hYYVc2hIWxibzKkAKibLeiaymoXe4ETawCHKkkReAYCEUkt8MN11WEnVCYAP5OqvVF/0', 'oyP7DwNvcxseyqFgxSExPmdBCoqg', '', '0', '', '1', '1', '0', '0', '', '1468372906');
INSERT INTO `tyms_users` VALUES ('791', 'TAO', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0RD3pj5KQH69mBAmfVkEqjMnHzLJwYPg5iclsNKK0meM6fAxZknicSXE367OiaOmZx5vicTIVwgIFibLt/0', 'oyP7DwD3S7SoNHZn4MA4gtJZyn3k', '', '0', '', '1', '1', '0', '0', '', '1468377062');
INSERT INTO `tyms_users` VALUES ('792', '大港', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3K1UA9sSp66MEPQWz5ZGSicEVVRTxeBZRRN1UowcZFiaOib3hyNdDVqzBnjf8JwQ3qlCaz4vO19vucA/0', 'oyP7DwP8A1GdI-mvYXT86n9xeCvU', '', '0', '', '1', '1', '0', '0', '', '1468378478');
INSERT INTO `tyms_users` VALUES ('793', '赵', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3ciceazEnmMUaO12HeMhED11MmSc2JOia1iatqCicic6ReUUIbmZbBNy3EN3smjibOic9v5lrqI24YSpyfA/0', 'oyP7DwM4-kAGektUR6MxLrtfEzvA', '', '0', '', '1', '1', '0', '0', '', '1468378701');
INSERT INTO `tyms_users` VALUES ('794', 'Qin 健豪-创业助手', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAy8vHnku25SDXS8HBGibwHrTVN99owQy67ORjDLrtkoSL805P1fzGZRZ5sp7PgYw8fYglJJHfCYDg/0', 'oyP7DwETYGHD7rvQF0NtGGz94M_E', '', '0', '', '1', '1', '0', '0', '', '1468378831');
INSERT INTO `tyms_users` VALUES ('795', '', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3PMtRreajW8j7Tl0ibGvVrHIUdC6IPKTYqQHibQxqNf0sx2u9cfXsDvaTeuqPCRmiasziciaPwXaotCl/0', 'oyP7DwHggOVcLX6NeIoOQbW1N8fo', '', '0', '', '1', '1', '0', '0', '', '1468379027');
INSERT INTO `tyms_users` VALUES ('796', '冯梦健', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ7KOpUOliaZTb4qZStNEgNVcrUJPXBGFciazVTVfkETu7czXSzHmPicYgnWDJlSWZrds71VReT6SzWA/0', 'oyP7DwMhIt1oD5bge4IQ6wbOU-rw', '', '0', '', '1', '1', '0', '0', '', '1468379437');
INSERT INTO `tyms_users` VALUES ('797', '贤戚良鱼', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdWgA8RWib7gDVe7zQkfYowtvIIC1I9dskBm42QTxUHtTffgXnQ10pYnE68x8ict2ImFelG189hWypQ/0', 'oyP7DwKlwE3PWCEAiPleUbSoH-qU', '', '0', '', '1', '1', '0', '0', '', '1468380645');
INSERT INTO `tyms_users` VALUES ('798', '骑猪上高速', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9W8zo1efb1G66js3iadx8xeLYxb4WcGyC85SFtRM0pHQtxjiaRzM917ibID8HjyIYm1qeMicDpiaaqw7/0', 'oyP7DwCN30d4dYUooX1ftaVC8G9w', '', '0', '', '1', '1', '0', '0', '', '1468381341');
INSERT INTO `tyms_users` VALUES ('799', '18656351070', null, null, '', '0', '18656351070', '1', '1', '0', '0', '', '1468383225');
INSERT INTO `tyms_users` VALUES ('800', '天涯', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcT2jWIibq3Fdyjia0icNx2iadRRqjnAr6ibl5ibeokuibq3Smt0qFUyXVtibsaXEVTCI36AicmmemmAmH7ibSg/0', 'oyP7DwJ15MMwM54XGzrJjIEHYKDU', '', '0', '', '1', '1', '0', '0', '', '1468383582');
INSERT INTO `tyms_users` VALUES ('801', '添', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90D29wia6FumHicWnttwYOuibDGpueTxzAYmFl0yiarldZib1WJeUvXGiaw6HyR832IozrqENdibmeQIVuVZ/0', 'oyP7DwL423XtgC5oc9QVVbgtIFjk', '', '0', '', '1', '1', '0', '0', '', '1468384866');
INSERT INTO `tyms_users` VALUES ('802', '旋落的雪', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEItYrQTHz3jvegN59RpyCMic8Saj4WuBKpwEWooTicTHcytUqGQUe28TAb4d0CGlLHfI59HnkpbPLHw/0', 'oyP7DwKD0ArSC18Xr60c_yuGVRDs', '', '0', '', '1', '1', '0', '0', '', '1468385084');
INSERT INTO `tyms_users` VALUES ('803', '笑笑神州', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL53jKAK14HxVVyvL8mlq8JXIA0NRBrPNcMvvqFYiatK2l8AOEPIdJF137eY2lGXN2RHzoet8nBWvBc6pnQcMHgKv/0', 'oyP7DwCv0FsmShvL2bGpRMf3F2Bo', '', '0', '', '1', '1', '0', '0', '', '1468385242');
INSERT INTO `tyms_users` VALUES ('804', '王超Camus', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2COzTHLqeoVzk9BicpmBicN84W6wCPMLEvnU2MlwAsaN7ubkOtF99jmibiaMibS2RWUcroEceiblgfjyMQ/0', 'oyP7DwCmuyTd3chR1W87b25mnOV4', '', '0', '', '1', '1', '0', '0', '', '1468385265');
INSERT INTO `tyms_users` VALUES ('805', 'Nicholas Kat', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3O2j6bSxBuCABj1f7TMKPUduUtNvYib4N1pFwiaiaRibsMiaialmAZd8Stps5Gwb46SUj54hfPXA2TZyp/0', 'oyP7DwKHa_6w0Fow7lkOmnxlg4oY', '', '0', '', '1', '1', '0', '0', '', '1468385922');
INSERT INTO `tyms_users` VALUES ('806', '随遇而安', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7fEnV1nuZF7ceEVDWnLGpiazu1HScwHCWRaEFNbic1S8393tvQIkA9GJSnGPY0EXBpJKOPjPuQibNuA/0', 'oyP7DwDEwMtf1c2elO8cMGI-K9ko', '', '0', '', '1', '1', '0', '0', '', '1468386598');
INSERT INTO `tyms_users` VALUES ('807', '客家同盛（零担、整车直达全国）', 'http://wx.qlogo.cn/mmopen/RiahY6eEcIGsNygtjY2zaxTUEiboOfiawm1Y0kmmia8yuR5j6ogpXibn2cWp1kQAdDw9slIppHxLKkbeTexnIicub5CiaGhW3x6hcpI/0', 'oyP7DwEweJA4fhSPv74wPa_3-LGA', '', '0', '', '1', '1', '0', '0', '', '1468389961');
INSERT INTO `tyms_users` VALUES ('808', '鹏鹏家', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6PUySR0Y2qgCgRB1JtwCn6ygg3QLcGEXUyoDibXk6E5yQdEshbrR0AmSaliauXXf1JASAhtIp8iaqDkGWKvtGWWfA/0', 'oyP7DwDeYxqQKMfIOKEXLHgJBGOc', '', '0', '', '1', '1', '0', '0', '', '1468390962');
INSERT INTO `tyms_users` VALUES ('809', '期待爱在明天', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPR37ykmUS0jNYeZT6gweKibKKGqmAo76MaLDtUa2UmdrQibGf0mRria2jYVpMBib4XicdvpLCwywx8Tx/0', 'oyP7DwCl4jMrhHsJiAplsnfrxji4', '', '0', '', '1', '1', '0', '0', '', '1468392795');
INSERT INTO `tyms_users` VALUES ('810', 'xxxXi', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eOku6KMFAIwZ7umFestV8oDxQHIjCDcRR46aomtQfx0DXohYNPoZLfvEgibvEbf524Spc0fnhW5Re/0', 'oyP7DwHLWbK9Jf7opcjdwmyLV3Rc', '', '0', '', '1', '1', '0', '0', '', '1468392926');
INSERT INTO `tyms_users` VALUES ('811', '清晨5点半', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELOg5DtW2Wau7Eibon818RpSYh9iamGZc9JWXYMyO1hpPfK0b5v6q1zz3QlbEFbHZibw7yFG93COAIibQ/0', 'oyP7DwOu_bDL_kHm5eec-8bJDVvs', '', '0', '', '1', '1', '0', '0', '', '1468392973');
INSERT INTO `tyms_users` VALUES ('812', '瑋', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDPHicAMG8TFtM3DH7Qjpmgd9zN57smVvAvT7yMqU1D2IZMTGg9ktFictr6Hj33NmkCOOwHTD3NaxE/0', 'oyP7DwAmDoS8qA52BX6FLs8DnBKQ', '', '0', '', '1', '1', '0', '0', '', '1468393054');
INSERT INTO `tyms_users` VALUES ('813', '成龙', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iax6b8hxytmx3RPsLHMPSWgv0sNhWLuNTHaSDa2IuYnOFzvtt7EpTTtDZzWZkPvgicBRGK6ic2NM2Pd/0', 'oyP7DwPvE_vSwkorPdixMxKLDtQ4', '', '0', '', '1', '1', '0', '0', '', '1468393170');
INSERT INTO `tyms_users` VALUES ('814', 'AAA义乌振越展会产品批发', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia574YWmWkmctVRzd3FFFELFTFJYtB0MPSq9kibnfPS1fAlyKQMwLMf5S7MBEyVekl8tSMDbG7BB3e/0', 'oyP7DwJWctRUbmQXn3GxCibW5HsM', '', '0', '', '1', '1', '0', '0', '', '1468393222');
INSERT INTO `tyms_users` VALUES ('815', 'Wolf', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1ePgQcicXiazc1wpXaq5iaFHXaBJbLoVBz6QrDkF78m3l67ialGROppV8uhiaBqULicKHTcbPKNCDQVxawlBibgibVZoUB/0', 'oyP7DwO4TsI89eh44lHLUpRDMHc0', '', '0', '', '1', '1', '0', '0', '', '1468393391');
INSERT INTO `tyms_users` VALUES ('816', 'Cyrus', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3aNjkdkEoNiceLKKlIrRic76KR0e6iacFJIWzNMmv2LKXicMEYhMDO2AzwbiadnwngVeFnhxX1gAvKAcr3xBlTe6qzg/0', 'oyP7DwAYdwuCeilD93vE8ZLwA8wg', '', '0', '', '1', '1', '0', '0', '', '1468393703');
INSERT INTO `tyms_users` VALUES ('817', '七张机', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIEISHibbemyxjpuVjlLQaTx9oTCz1yamaPsBxsuBh89hQTiaJHCQYbkUtAu8qBqrGaAyqOwPYg3XiaA/0', 'oyP7DwNvwFS26wlVHzB-XMRnafpI', '', '0', '', '1', '1', '0', '0', '', '1468394749');
INSERT INTO `tyms_users` VALUES ('818', 'Myron', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELkfibpiaiclUy3zAm4iaYGfHPOr1icxUOYQCViaWCKI91hEM2ujzdOzl8IvVibMD7UqNJibjVz1Xib4TYbZvQ/0', 'oyP7DwBL5LO9w9wLi587Ff2gokHs', '', '0', '', '1', '1', '0', '0', '', '1468394882');
INSERT INTO `tyms_users` VALUES ('819', 'MR. Fan', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90HqSBINIkE6FenJ25PjWm7ibldRHgBLiasdTqo9hibLafsv1ZpDdM1XwsfFrfVlcrP0xkgfeQKzlusv/0', 'oyP7DwO1qD1ouPW14jbzkgChdjMA', '', '0', '', '1', '1', '0', '0', '', '1468395196');
INSERT INTO `tyms_users` VALUES ('820', '伟新', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaz7awCcEy4hOwhwo77KgoshGiaLCicFX65PyvkibcrX7Qg3EMNd5N6HecnItF2MqLamqNVgmlUuTiaDh/0', 'oyP7DwEGJJVlyjoK9S6FWvixqrYI', '', '0', '', '1', '1', '0', '0', '', '1468397458');
INSERT INTO `tyms_users` VALUES ('821', '随步天下', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0entNiawKxIIBl4ZE4weayibVz0G2d9dibG3iaIRiccvSSrLsRRib2Q5W7UReE8gyGjnP4icf8FiavLdXtZe/0', 'oyP7DwDxeRSqTqPyk5L9HF7Lh3G0', '', '0', '', '1', '1', '0', '0', '', '1468398957');
INSERT INTO `tyms_users` VALUES ('822', '张士明', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBAuibXicrf3NTkufdoAWgrzyemPCQYA8YP6AT9icYNibbZQBF9Eotp9PGohl1p8BdHS9hKe791NpHjog/0', 'oyP7DwApGxWKzBJUEIS3N8KmHm_A', '', '0', '', '1', '1', '0', '0', '', '1468399243');
INSERT INTO `tyms_users` VALUES ('823', '实力派', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDd5vvAxgxmhH6f6Cic0w2o6a3rVtTdialkibhtESCictDfz1Gu3n1ak0N4IqBrj8CrQa5JCZLKtTa3HSg/0', 'oyP7DwBcD_eWbWQc5K1K8Fuf0IYI', '', '0', '', '1', '1', '0', '0', '', '1468400165');
INSERT INTO `tyms_users` VALUES ('824', '陈菇凉', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2tNtibZHadCqs4Eh5yUgE07EzOGVqm8LIsHRojwnJakrS7aavC1Zf9oUrsG6TO3r1b8bfCm7IBfrnXbiaiazE2mmn/0', 'oyP7DwAFO1TN33tqT1CZymQUbnI8', '', '0', '', '1', '1', '0', '0', '', '1468400167');
INSERT INTO `tyms_users` VALUES ('825', '-', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEEpFlNjJqx1tKqy8x3YUMxFzs6ick2P9lw3kDuYiaEAqCiavU7La3AkYsuFWDxWSwpUAcrph21S4GSq/0', 'oyP7DwEvNoEmGPXVsiyqJm9C3qfs', '', '0', '', '1', '1', '0', '0', '', '1468400171');
INSERT INTO `tyms_users` VALUES ('826', 'Jenny', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7cHkV1ibqCHLVLs8RfvBr2ARGVkl2L5IORZcBNMMBicCP7oCS6tMo3QwPzAKlEOCclztXKdoohWN3/0', 'oyP7DwKKAsD0QePLdWYBa9uLQwD0', '', '0', '', '1', '1', '0', '0', '', '1468400314');
INSERT INTO `tyms_users` VALUES ('827', '家和万事兴侯进军', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIP6pnj7hAaibYbhrFhQWu8PVFvA5VT43RwxybX3ylckLsiciaWRQP8Ew5K7nxgcCe0sYbd34ZtTC0vQ/0', 'oyP7DwF5o4T1hAPGnA1WYD_QA2JQ', '', '0', '', '1', '1', '0', '0', '', '1468400427');
INSERT INTO `tyms_users` VALUES ('828', '玄玄', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WuqxOMF3sHiaFxMel6TEMhWLHcxeyKtsicKcQO44sXa6Hibb9TTFlxAykfIINaaahxzI2MnSica8wFl/0', 'oyP7DwJzFdI5Jp0tMOouo9WYRLew', '', '0', '', '1', '1', '0', '0', '', '1468401606');
INSERT INTO `tyms_users` VALUES ('829', '马文腾', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0et4c0ASHHr1g0ibvoTlPUqABGPQrm1xE7QYS3R2IZy2JrT6kJ7EZA2qrnfSlIf8RnLe0XUicnbNLA/0', 'oyP7DwC7O-IptqXoemZu0yKPN_Ys', '', '0', '', '1', '1', '0', '0', '', '1468404195');
INSERT INTO `tyms_users` VALUES ('830', '鬼龙', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3m3enHpZ8ztvHvF8ra6jDME7HXUh7cKsiaIyfWicKMobWichdPRBZ2YicEhr7cQia1jYatYlplSnqH1yKHymibXk6dJ5/0', 'oyP7DwDTi4fpel_4s8iiOBqOvK7g', '', '0', '', '1', '1', '0', '0', '', '1468404986');
INSERT INTO `tyms_users` VALUES ('831', '狮子', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1VR0jI2XWXKArRKsQx7Z849aicbOe0OkbAktSeyacryxuQLdHRibr0tWjiaTSXXWicmee4GZvFbW2KicqDnDB0vngba/0', 'oyP7DwEVeg4CmQEMarbw4fEcSNlg', '', '0', '', '1', '1', '0', '0', '', '1468413845');
INSERT INTO `tyms_users` VALUES ('832', 'fat', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibduDl5iaia6lqFjmWjuEJaydcCHXnLicPRyEjrLC0ib4E8H6TiboddvH2pTDZCEcxEibCia5KIeEjyJqgoug/0', 'oyP7DwJBpAg1ik8WtTQvCSOy-poM', '', '0', '', '1', '1', '0', '0', '', '1468415297');
INSERT INTO `tyms_users` VALUES ('833', '朱朱黑莓专卖☎️13535055507', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia8gctVlliarFNzWUjCH0h61dmhvQiaGibyW7uQz4zpEKpJCNGaZHPhxhKtKMUheic6YRibRSrEiaibdpk1ib/0', 'oyP7DwFRFMouqGpf0GaIPY6pgSUg', '', '0', '', '1', '1', '0', '0', '', '1468416046');
INSERT INTO `tyms_users` VALUES ('834', '老男人', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdymNicox7iatGDapkGBKoCn88vfsrJ4wGKxhgBeF8t0HYG2uoZgibfz0rw8LvTG0fRrargmJFXYqTd7comicQovIrC/0', 'oyP7DwPUERdNTTjCoJkTgS927QT0', '', '0', '', '1', '1', '0', '0', '', '1468419586');
INSERT INTO `tyms_users` VALUES ('835', '凉白开', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfCzWXXA2lYknlynicrFXVpiaDp6C7rcm3S28RJgXPeiaAIcE7N5pFADklnBlZ9YPUQXeHLzrib3iaACJAibhmQiaLhd2I/0', 'oyP7DwKTJkCzjmFnDZbG63xax1OA', '', '0', '', '1', '1', '0', '0', '', '1468423348');
INSERT INTO `tyms_users` VALUES ('836', 'LingerX', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6Ko81UnqVbYejSOdXiczEcZicxvWekOFqHf8eF5DE5NTOlPZdP4Mfz6onSZKv7ImUVPNXibFoB56tfA/0', 'oyP7DwEwmJQLfFbxaVlK7gvWlVKM', '', '0', '', '1', '1', '0', '0', '', '1468425561');
INSERT INTO `tyms_users` VALUES ('837', 'paneer@夏', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p20SWUKqV0oscZB7s3Y3MdF3UpcBJpksHb8A3RiaQQLLnsRsTGQBBmg9mAHlwE0Vdwp0vX452oVejsnoJNL6FasN/0', 'oyP7DwOTrJou1qjdxAIdCPHAnCeE', '', '0', '', '1', '1', '0', '0', '', '1468429373');
INSERT INTO `tyms_users` VALUES ('838', '王鹏', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD6XcDvJ6EoCR4JicOhcMzxHHicH05MTL4dk36TajAu1P1icrSYJAxaMCFib0GSwNhLzP641T4yjso1SA/0', 'oyP7DwAj-mEVVCjGLa4QKltUGdWM', '', '0', '', '1', '1', '0', '0', '', '1468429766');
INSERT INTO `tyms_users` VALUES ('839', '诚泰软件-项陆平', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECfZOHRibMGMDUtxRHE8b0m0dISpgCwhK1QY8E0PnsSPPSKb6rHSHbgQCKKmibkh4qFjKiauLAQqBlZ/0', 'oyP7DwBIpPiU1i6cgpQFXnb41pXE', '', '0', '', '1', '1', '0', '0', '', '1468434718');
INSERT INTO `tyms_users` VALUES ('840', '李乐天', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0TB3Js6Fswg3NBOrTJ8JsuUVXsft6yhQTNjfztS7ONiatllick0hIHbia1kzLQmw8FR253xib0hpe8Do/0', 'oyP7DwLg97P_vz6bpwoocO0rloHg', '', '0', '', '1', '1', '0', '0', '', '1468458837');
INSERT INTO `tyms_users` VALUES ('841', '才叔', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1yjeUhngAnSLRRYPylzVKgvE1453NxDYnzgD1I8IzkQlbY5GibDw4ZYUdDrPQsOGnpNF2WIg6xzYn1NMXu2eEgV/0', 'oyP7DwFfb_jwm1rqgwtSYl56ri8Q', '', '0', '', '1', '1', '0', '0', '', '1468459336');
INSERT INTO `tyms_users` VALUES ('842', '无际的天涯', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDwXjoqyCnb0PyFFcXzvqugay436ia6MghvldHb4b8I8LaENLBPPtAwMtKEh641c0nSgb8mJbQouZw/0', 'oyP7DwCrump8IBTZ1s9G7sB7CxQM', '', '0', '', '1', '1', '0', '0', '', '1468461748');
INSERT INTO `tyms_users` VALUES ('843', '邓武杰', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdmuE03iaVKFl3icib59MZ2jSI19nt3aSfZeA9ibJg3L58NkOLF1eYkYg4qsQPKYOaddSsQ3XBvjpfKXQ/0', 'oyP7DwOJRH6JaHB-oxYjkU2QKyyg', '', '0', '', '1', '1', '0', '0', '', '1468462209');
INSERT INTO `tyms_users` VALUES ('844', '和', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB99daJU3ZHwvvDPAB8sW3SpURkRpfqK6Pd4rT3UN0rWDuJYZ9waYDKpxuFv18YB3LLLTXntQoylQ/0', 'oyP7DwBhHa22U46J4gLS21Puvxpg', '', '0', '', '1', '1', '0', '0', '', '1468462329');
INSERT INTO `tyms_users` VALUES ('845', 'success', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKLr9fWqcAQItGP1g7rWXwAMwAmvTmwdWY592ia3x3DiaiaYZnyRYekNwczef1PL7icGKqicx7UXNZS7XA/0', 'oyP7DwGhTvdIs7KY9OpJLgQer_k0', '', '0', '', '1', '1', '0', '0', '', '1468465718');
INSERT INTO `tyms_users` VALUES ('846', '小宗向我行了个礼', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0XMza7SF6jEdktGRbo8feB4zqh65fpCn5giabAPzfoaE7FlbCSyk3e8qOciacwcEjAVSZW04Abr5sP/0', 'oyP7DwFYd2bQe2EQFnwwF8c8vRCc', '', '0', '', '1', '1', '0', '0', '', '1468467769');
INSERT INTO `tyms_users` VALUES ('847', '悦道', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VoRvGsBVPBzq7EU3Wguu3wMZEAM798R7Via24UWRZk7zNSbKU51PLaPSHtibZRIzVVicb3y9KZVOv8/0', 'oyP7DwKlyoh3yYRuAev4zXydJjaA', '', '0', '', '1', '1', '0', '0', '', '1468474778');
INSERT INTO `tyms_users` VALUES ('848', '急流的鱼', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7PhMROgUeiaO9stg1ic70EWkWgJQ0yLguKqaKSN4LXyGhSxfic1fZ3Gpke50NdcsW9IqTKibK5RPcKWicOSv3Zg7AuS/0', 'oyP7DwBqW3ibRErDdZxdFmgcpJvw', '', '0', '', '1', '1', '0', '0', '', '1468475174');
INSERT INTO `tyms_users` VALUES ('849', '毛毛', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfdicXmm95XevA9ZaxzqplTic32NaqlByhiauK2OvrECp7jiaIibh321jqodnxAHlGKDS6U90eG2icdscpyRqGy45YwMcCrrUaXuptI8/0', 'oyP7DwEHWmmxQTYZElFeLxIQ4NY8', '', '0', '', '1', '1', '0', '0', '', '1468476200');
INSERT INTO `tyms_users` VALUES ('850', '①', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90LzRjo3hB5kWWzDGiaGYGFU7eVibGFmXVrKWGIEFgVAJRsOyNw9iafMHgQgxkYiaLcvu49HqLQSEjtf2/0', 'oyP7DwOJczj_ti1CSbbJluUs40Xs', '', '0', '', '1', '1', '0', '0', '', '1468477148');
INSERT INTO `tyms_users` VALUES ('851', 'HelloHi', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB1Z3AfqCcEicnHwJlQiaAveDozRIk15nrBwYD5ibGY4Jy9rnVfTGOj34K8UjUlDT26braqL3n3ickrKQ/0', 'oyP7DwK8ODAEZhYdTTTK9wxueNvI', '', '0', '', '1', '1', '0', '0', '', '1468477610');
INSERT INTO `tyms_users` VALUES ('852', '继', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7Bu7ON43iaibibZRSDJ8roAibaGDDMRokQqSbaCIREtVaFB9bxFdkFlJ30JYibgiab2egXyW8bQU9KwzibIzketPCtmGE/0', 'oyP7DwOC9du2WhOFirjBHHDNyfCc', '', '0', '', '1', '1', '0', '0', '', '1468479170');
INSERT INTO `tyms_users` VALUES ('853', '酷酷', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibe7g1rSKKicE6DWkxZicqDKv5Ls0Dr33p6FCroPLzYGFa1ud3gJBh3ibCttDS2jGZpDSIokbFRXyTwfg/0', 'oyP7DwLIRujwx1gvSf9sJ34kTQK4', '', '0', '', '1', '1', '0', '0', '', '1468479449');
INSERT INTO `tyms_users` VALUES ('854', '缘', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6nHG9BlAAmatOlC6tB5kkWgxTknfuxPMSibicdm9Y5c6cx3KsFbAUic0ichgUbvqKUUZ6JDp1IiaJTnqw/0', 'oyP7DwGEmNheJjSLTxCcN0xJXogw', '', '0', '', '1', '1', '0', '0', '', '1468481923');
INSERT INTO `tyms_users` VALUES ('855', '钦驰明^O^', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3GySWJVRvBdW0OiaQ6SoticWNDywzfOXBkHEcOymAvZmN3rYpPmheaFdibBD5tnExetOXBfVasUuzCQ/0', 'oyP7DwHUIDjszrQKB9hdgUM5Ax9Q', '', '0', '', '1', '1', '0', '0', '', '1468482106');
INSERT INTO `tyms_users` VALUES ('856', 'yangsir', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0aTibQaLHeDIHZEOmb1QcexbaIuMBXvIJVZ6iclQ0LSs508eiawjKCtjzl4WbufpOicy5sQ0hFFTIny1/0', 'oyP7DwKpZjfq9yPH-tMfPU9_8fr8', '', '0', '', '1', '1', '0', '0', '', '1468483631');
INSERT INTO `tyms_users` VALUES ('857', '弓虽人', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibepCmibCwKw35IPgZ25eal9sZVia0raKWunGPtee7nXZty7xcLRiamvsysFpAP3maIO3P0caRLEibw2og/0', 'oyP7DwBC3OnL4KUS_XSsmSa7v3Os', '', '0', '', '1', '1', '0', '0', '', '1468484118');
INSERT INTO `tyms_users` VALUES ('858', '空白゜', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia5zmfcZUURSW4Ld1MH8wjgDHmSjGFaBVokSHFPADsBjOuiaxZBDog9CReT7o3eRX0emybIdPX5QGN/0', 'oyP7DwP9rew5Tq-lPIhReknW5stw', '', '0', '', '1', '1', '0', '0', '', '1468484849');
INSERT INTO `tyms_users` VALUES ('859', '阿浪', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL70WXtpAuQQjjODP98N7wKr2NVsEU2jz1cwv3yxpmuibwkA0ckejmkRUfRZ8EXic1GAXJGZOtuJZwqg/0', 'oyP7DwEt1kjE8Fi5qez2x92r4l3I', '', '0', '', '1', '1', '0', '0', '', '1468486935');
INSERT INTO `tyms_users` VALUES ('860', '有朝一日', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eAFMOSp3GJlW0GpDshTLL3icWeJcHceGcNZdOvLvshmfib7t9zn7cUxdtia4tbP022Cf6wOy1OH9gHM/0', 'oyP7DwFoUDMxm4aVHkeGdxdPutMI', '', '0', '', '1', '1', '0', '0', '', '1468487112');
INSERT INTO `tyms_users` VALUES ('861', '神仙', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDcF80MZgPggUia6ib2ACGsfY98nK5uvtiaNtXqx7thjic1FuOMnSVfWEib2YrVrib9PQSUHiaNWzNmgriau/0', 'oyP7DwDYoyDiNRBvuIKq1AaS6a40', '', '0', '', '1', '1', '0', '0', '', '1468488273');
INSERT INTO `tyms_users` VALUES ('862', '梦为努力浇了水', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfC7HUnxcZvicI06c9QPsmwkZbNxSa0yBMLicgt2JTUUOz1aPutNoNTJ15PicyLeH0tAeZky2Ev8hQ0cNbJeSpcAG6/0', 'oyP7DwH0QUZrRb0PKYGS1_iQi8K8', '', '0', '', '1', '1', '0', '0', '', '1468489596');
INSERT INTO `tyms_users` VALUES ('863', '', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4hANwHMLkBwiaNpCWct72b2ibLwMRNpQ4wMR0NAyOqA3pnfUVGZ5vR7QWtV5kL0vGWu6G39y761LI8nBa6OaY1Fx/0', 'oyP7DwGREsgLZEeL1LLAVrB4hNnw', '', '0', '', '1', '1', '0', '0', '', '1468491193');
INSERT INTO `tyms_users` VALUES ('864', '霖丰挖机再生制造', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEHEjCYRqbLWF9LG7rQlVFqibSlqh6I8ZNibk7mfbQHdtSosepQGolEdFoJoFv5udcWczb65qticgkUJ/0', 'oyP7DwEpgbHF0v96noeMe74viAIo', '', '0', '', '1', '1', '0', '0', '', '1468493234');
INSERT INTO `tyms_users` VALUES ('865', '罗', 'http://wx.qlogo.cn/mmopen/Z4EL7omFbLG0ksjx81smto3IIicB4Jmxg8y3kGcuicLj1suu7GRCWSQmN3AHU8Qo4xqOLCNibBqCKvNDU7ib4ibgJb0MaCaFuuLcn/0', 'oyP7DwMO8t7mP6PuTmcoe6nKqwiE', '', '0', '', '1', '1', '0', '0', '', '1468493333');
INSERT INTO `tyms_users` VALUES ('866', '垣志', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB6ib8Ju83KEsDcoDjl4IAqeY2yXxIrzXLGA6FWqa9SBFW7kAdFAfVZYkBiaicUPTWHu1gGC3wROY8ZA/0', 'oyP7DwG-eL_Wdf6jKF88PWD4v204', '', '0', '', '1', '1', '0', '0', '', '1468497237');
INSERT INTO `tyms_users` VALUES ('867', '龙腾九州', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIMURiakv2948Lg3wZic2oZzGtC445SWAiciaR9hMW8mOmPt1TLAia2C5iaXckfet9zVIkEIaUfdTuP9ibXA/0', 'oyP7DwFHy8zn8PCukzZ03LBl13Ls', '', '0', '', '1', '1', '0', '0', '', '1468501318');
INSERT INTO `tyms_users` VALUES ('868', 'A全国移动~流量充值', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2zFZH7UIERiclPHQr2afFo0miaQia9dFl4yfenw1SoMfwIxUva44pD7K1ye98HjsQg8iaXdtJT5YIMqPboL0YoQX87/0', 'oyP7DwO2Fu41YdQ4e0rP3A2b1DK0', '', '0', '', '1', '1', '0', '0', '', '1468503707');
INSERT INTO `tyms_users` VALUES ('869', '安创达', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4vA4MBjM6jBN9wYokFbkI6mvSVDcM4rAsKtbJnTX66WewG7iaJAjicoutH8LhSsZl0REQvB6jrMgjW/0', 'oyP7DwJrAVQNZAcRh8AkzgU6Bz4U', '', '0', '', '1', '1', '0', '0', '', '1468505243');
INSERT INTO `tyms_users` VALUES ('870', '朱树煌', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5JoZIjOKh3pJdja2SOgX6zuedfopNibrdQTpaLqs38gFAtCGVtCLhzMFQ9Vibl8vlX5ibe882ymS9re8RkDodYMTw7vLd9rDAp5U/0', 'oyP7DwHE7E0sYQS0P6Bi_68EsWYI', '', '0', '', '1', '1', '0', '0', '', '1468507338');
INSERT INTO `tyms_users` VALUES ('871', '李格', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEA8Re0Cf7oTDgmUdK2PL6ibTrTjiaTsiaMgOv98pmRAHvias3icAiaG2Te8UapKvPkc1gSbwtX7hnO7cCU/0', 'oyP7DwFb30koUnCiRYFeGpulSRBI', '', '0', '', '1', '1', '0', '0', '', '1468507483');
INSERT INTO `tyms_users` VALUES ('872', '跑鞋爱好者。', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eHluxhAc1D2cMbpDnZHL8pUP3pPTpsdX9Sv3peheushLyicQhzyTKyX5zkkrjzzzjaDibMhqM8g9ic1/0', 'oyP7DwPU2H94j0epiGfVUYV5zKm0', '', '0', '', '1', '1', '0', '0', '', '1468509185');
INSERT INTO `tyms_users` VALUES ('873', '刘子韩', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eAD2waJLiaJETuibdIxzqia2ibBXph2Le2EEViabONib9K3M2fDSiaotdzHnMpia4CLB6yB96N7M1icKqC0jX/0', 'oyP7DwLcIUJyH4NLluxnV4Rdl-ds', '', '0', '', '1', '1', '0', '0', '', '1468511412');
INSERT INTO `tyms_users` VALUES ('874', '王林春', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPGYWf05mzy19ictdrHnonhyvtaav7aOPodpia4xs2yfWkKSbkhGp5ibMfkCtdsXxbicVpz1EJ4fcX4F/0', 'oyP7DwE-Srs7Chkn90w200-4nAmg', '', '0', '', '1', '1', '0', '0', '', '1468542142');
INSERT INTO `tyms_users` VALUES ('875', '王海-鄂尔多斯海瑞科技', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDkmgIHhIicOuql1kznknfQzaynvWnZab0TS42lOAOV7qCkYSNWYydicSAouztp0tYyjwqgS2wWyHcQ/0', 'oyP7DwA0K4NzRDMVi6nF-fwIjheo', '', '0', '', '1', '1', '0', '0', '', '1468548255');
INSERT INTO `tyms_users` VALUES ('876', 'song', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMS7bIQsz2FsYCr9iaN7XibBSxeUiaRicNm8d39NBnTRhgicKARDTurdAibDjwpbmSibkMPbmXsXRf1zqgX/0', 'oyP7DwOOw7xxq1Fr8mzQSJSIx8AQ', '', '0', '', '1', '1', '0', '0', '', '1468549081');
INSERT INTO `tyms_users` VALUES ('877', '李龙', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEP5mibN1UhyCxLcKIpGeULa7FQzg8ga3sA1CsLoibd0ib0pZBtTNESGj33kugibNfgPfNxT75Sq2q294/0', 'oyP7DwA8pNmerLnUXZB0jJSTGcsA', '', '0', '', '1', '1', '0', '0', '', '1468553400');
INSERT INTO `tyms_users` VALUES ('878', '孔丽萍', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELoEIzs4741mkScZRaQ5OL6ACRxy6EDzY9kLnm7lic6KX0z83icY6zGFiaKt3cGrrkPjeh5j6icR1ibdAQ/0', 'oyP7DwAF-VVyFQDV7LhiRM_OUjfk', '', '0', '', '1', '1', '0', '0', '', '1468553633');
INSERT INTO `tyms_users` VALUES ('879', '小陆', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0RPAdP77yeFGP2OibnufpzC5jxKfl8HNsALDpDVdBjwlD0kibHlx30WHOkkOkh45A17LxnAYhC79NDbojfwTAqu4/0', 'oyP7DwAR_5pef0F6dlkKY1eFBYF8', '', '0', '', '1', '1', '0', '0', '', '1468555051');
INSERT INTO `tyms_users` VALUES ('880', '众薪人力资源', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2n22OMtbOIJh3XCzd2LIuDRiaZRx6whrLHVEBXlCR7iaFZKY1LVfcg3UmwlRZuctRMFtd7F1tCvQVFeS9DBdrQmh/0', 'oyP7DwMk9zUCP2-tVQDbNJlb5Xd4', '', '0', '', '1', '1', '0', '0', '', '1468559450');
INSERT INTO `tyms_users` VALUES ('881', '爱尔', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6FaWhUCmqCRm1ocXicrU9ojNVDZNpj2bWWFUus7hme0uM8QaxZTjibaxEvouXdOKQyoJC9AX9Aicib0Gf9yqibRLjlc/0', 'oyP7DwJV2SVuh1WCwaXYodlonFf4', '', '0', '', '1', '1', '0', '0', '', '1468562674');
INSERT INTO `tyms_users` VALUES ('882', 'Koant', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKh1qHfvHLQSfV2TEH2s9ULQicKxJbj775CfN6RTJzG3mzExAEJZibAP0ZztiaPI6skGyLuaY3xzPEug/0', 'oyP7DwGiSigMX-NvDuwvDthiaBUQ', '', '0', '', '1', '1', '0', '0', '', '1468565078');
INSERT INTO `tyms_users` VALUES ('883', '吹花雨', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKU1CrpicbPu1WpBVBiaafcWUHaaZ3yJUKx691lchTvOZHxib3k32czJog0oRoyWlI8EqbR9IaqafiaI/0', 'oyP7DwGkpRQZPKQb6SuET-aB_FGE', '', '0', '', '1', '1', '0', '0', '', '1468567639');
INSERT INTO `tyms_users` VALUES ('884', '十里路', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL53jKAK14HxVYqPzTXJ6BiaMMA0U25AST8SrwDofX4bbGZ3rcAIt19icVSCMDF6wnpLEEgPLbgejSkmLhCPEOSdXb/0', 'oyP7DwBVyTwvzWjpEH8HOwacOeew', '', '0', '', '1', '1', '0', '0', '', '1468567830');
INSERT INTO `tyms_users` VALUES ('885', '白双东', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDd1nKl7YGae6avhPwwvGE6DmmqbhhqT75QClX1d3hT4Piarumd0CqjVdWBX43xibVPwibcHpR0R7OLXs/0', 'oyP7DwBzsf80hPCcdQrJTFsZ9ZfE', '', '0', '', '1', '1', '0', '0', '', '1468571485');
INSERT INTO `tyms_users` VALUES ('886', '鑫', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdia5KS9icArr6EUpC4jKUl2q2EjgECuBWqsqeJk3pSCqfPnOuHKVLc4EVibtpJrbhYRibnccA7A2BH9E/0', 'oyP7DwMxColNtTeo6UC1tFaWEMLE', '', '0', '', '1', '1', '0', '0', '', '1468571782');
INSERT INTO `tyms_users` VALUES ('887', '红粉粉', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90IVnicRZtZkJNfZRgYyQrYKbp4icy8WVKU3R2P5DiaoRO07ib1IsM0oB5TeN8KbC5YL8caghwxV3SYvP/0', 'oyP7DwPwa1xcsE7BdAvXvd6pOvCw', '', '0', '', '1', '1', '0', '0', '', '1468572455');
INSERT INTO `tyms_users` VALUES ('888', '7：45', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7YpOXicaS3KByAjjPHkRfaGJdK2nibDOS0rgZBVA3TusklCNnibQnKHWn3EYCMnRJDa3NW0k102WMicw/0', 'oyP7DwJz_VOOxO7tKrYwHsI-nfpc', '', '0', '', '1', '1', '0', '0', '', '1468572803');
INSERT INTO `tyms_users` VALUES ('889', '韦刚连', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP18WBpecLUcXtVniaJ1RE4wvRcB7fH9foxpj5ueKdlRYt32LHdK5wTVGxvUsKjKGTyeiathO8hdMKiaclfUicpGMaav/0', 'oyP7DwKIih42V70HbmXOojDfxnNA', '', '0', '', '1', '1', '0', '0', '', '1468573082');
INSERT INTO `tyms_users` VALUES ('890', 'cloudy', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4gxx90JFlbtC2pwrxSQjpDhIo8MZG95PPBreLFbGo4xvIhHxLtTKMjU4muXtjHF39yX1dgiaAcU7G/0', 'oyP7DwJ_TAppvPZ4wzCz_D4LqkuM', '', '0', '', '1', '1', '0', '0', '', '1468573568');
INSERT INTO `tyms_users` VALUES ('891', '刘瑞林', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iay4wuSla2GJkicsAJ5N0QmUepicNJfLfzRuicUgWBrDVQtVqSrIEIiaq0Z0M64by6WBGL74LcQqBEQ3ib/0', 'oyP7DwBRQ11gAH8J5LgFqVXOFqV0', '', '0', '', '1', '1', '0', '0', '', '1468574934');
INSERT INTO `tyms_users` VALUES ('892', '(´･ᆺ･`)', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2zhaTBBR2iaGGKVKjzKjTjBPMVibpkt5QW6ELhObHPibg70c8HvUe1hrck6rIl2GPiaTcHCTGGJN9TDQ/0', 'oyP7DwBpDlBx4Fayt5x0KVfiYZaE', '', '0', '', '1', '1', '0', '0', '', '1468576226');
INSERT INTO `tyms_users` VALUES ('893', '糖宝网络', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJb70qDicibGxHaVib5uPATSk1YnKubSdnx8OiaKBbMBqhoTwWrcWe7AMDH1L0AqPRuxGojzY5raEd4d/0', 'oyP7DwH-clg8yk7ZOYn31Yd8MRks', '', '0', '', '1', '1', '0', '0', '', '1468576414');
INSERT INTO `tyms_users` VALUES ('894', '陈建武', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECgJNUFEtX8UiathE0j3BFKWeibibgOW4O93ObrV8rqcoMErx6Jm2KuUleLjR4N3o3S1RR8zzlUmTj6/0', 'oyP7DwPkQpXzN5lt3uSq7uDcIV20', '', '0', '', '1', '1', '0', '0', '', '1468579751');
INSERT INTO `tyms_users` VALUES ('895', '洋葱', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOEsmdc5icaUwic0yrvAMP3lzyaRBAJx0vcTKVca5fKxibwCtKawzdz8bFtb3ISawcsnYU3EKUAtq6M/0', 'oyP7DwK8xTeWYEn9pFod4jxxyiPY', '', '0', '', '1', '1', '0', '0', '', '1468580653');
INSERT INTO `tyms_users` VALUES ('896', '网络经理人', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDvNMmL5xPXcHGHYsdIBJrDhcqvA8kycBtNA45ehgLeSD19jGJxa3v9rJxXgW2MqibkoLGxQHg7l1/0', 'oyP7DwNRgib3_GeT2993iaRp8SVE', '', '0', '', '1', '1', '0', '0', '', '1468583410');
INSERT INTO `tyms_users` VALUES ('897', '兴和盛金属字工厂', '', 'oyP7DwJhgSZbTywgbb7X6I7ktJqI', '', '0', '', '1', '1', '0', '0', '', '1468591668');
INSERT INTO `tyms_users` VALUES ('898', '时光旧人', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL58prs3NvyRb4pHDlMyT6jmxZQsSfCuEMqVVx7xsCB0A9Y1pep0eia2PfR9XlTjrpibFX6nsicXprgqLK230gqlKjS/0', 'oyP7DwKnzbcRuPL86bRTs-fsbO88', '', '0', '', '1', '1', '0', '0', '', '1468592013');
INSERT INTO `tyms_users` VALUES ('899', '天下', '', 'oyP7DwBBWTuPuM84StBaIrtr20Co', '', '0', '', '1', '1', '0', '0', '', '1468610352');
INSERT INTO `tyms_users` VALUES ('900', 'wangk', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4P2ibe6DIw1flz8qC9iaSaLE6I11kVJUv09FJUcXHfagWJyFxzwSJyjyMEX4UibaM2bYibUggeLGlJ3pdt7q6x02eSaAl530gBtwA/0', 'oyP7DwNPOpBJmHpOn5nLOcsg_Vog', '', '0', '', '1', '1', '0', '0', '', '1468624289');
INSERT INTO `tyms_users` VALUES ('901', '子聪', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p25CI3df8xoKZqt0F6oxsV4TK9C1K0mcp8911m0e8kfa0BRVHrgx5E2CngdibO7QicnFcUd2sMm65aDAMjoQhUF93/0', 'oyP7DwOMlQ7_MDPSPi9ZFZ8EGX2I', '', '0', '', '1', '1', '0', '0', '', '1468631965');
INSERT INTO `tyms_users` VALUES ('902', 'so', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELjCiavbM9dOwQsUe6GZiaTm06Y2aV14pgKCC0kQ4SEqSNnUWwe9r3mduvic7mdoicnEd2MoR8APA9SRw/0', 'oyP7DwIY8KC---UjwAP3L0CxQAwA', '', '0', '', '1', '1', '0', '0', '', '1468632973');
INSERT INTO `tyms_users` VALUES ('903', ' 随心就好 何必烦恼', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCuummaKXJGibRmrkicfBteVnm5tZEohnkias374WU9F40vbyyb6b5UpnraPTibSUEjMcZl8QyVgLA3Hw/0', 'oyP7DwPeAj-rsgpiRkZcsbMsbmU0', '', '0', '', '1', '1', '0', '0', '', '1468635661');
INSERT INTO `tyms_users` VALUES ('904', 'dгāgōη', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELUkDAg9ruhNEhoMAia5syQkNpLaDDiaibs9icKdgOpyZ0WIxOWhc1jq2vV3VapGsMQ401KvSAWR7OXzw/0', 'oyP7DwJpd89Ut4NQdRYB_cVXgrbk', '', '0', '', '1', '1', '0', '0', '', '1468636049');
INSERT INTO `tyms_users` VALUES ('905', '甲第', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6FibyvYIjfibOb4RtGjUSLfklD7Y0ciaMlU27clKdaMdz3zxOibbhJQX3tcxURU1licG0RNedxKBO3S7KG2fb3iclfg6/0', 'oyP7DwNaSPDUT4hbMXAVOTVV8IAE', '', '0', '', '1', '1', '0', '0', '', '1468636068');
INSERT INTO `tyms_users` VALUES ('906', '152****5252', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA17n88K4htQ3xHfJjXibf0lxDoI0fJqwH7c5nH8Ykw8U6O7ibzicwqkbrvh6SciaERWjDeicZMPD0wNZQ/0', 'oyP7DwEyBAY7d4QonPVCpDeR_Mlg', '', '0', '', '1', '1', '0', '0', '', '1468636497');
INSERT INTO `tyms_users` VALUES ('907', '张毅', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6ERZMmiavuzRkicb9qe8RKT6Q33P4Af0VbC50AECjYZy0p2lJ4ALqTibV5hg6vdiaNnzXuOgJdOOy3NRasNdTnrzicE/0', 'oyP7DwGxNYoovfyxocYl7lgJZADQ', '', '0', '', '1', '1', '0', '0', '', '1468637034');
INSERT INTO `tyms_users` VALUES ('908', '七之莲701王姐姐', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD2X3iaNxPBchKA2Be6BCB7ia7l6mGuy4HUiaNkn4gicYBMrDwYDfOr1Jf1gGa7lwl4Z7icpBJJicuuPN9Q/0', 'oyP7DwNzyhvQJWhuLtisJrJFtV8E', '', '0', '', '1', '1', '0', '0', '', '1468637177');
INSERT INTO `tyms_users` VALUES ('909', '小零食', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL8JOxTLFQNBAyLKziaSoLoInsut3UA8icR1qNA8ZNRbou2M0N2m4slQfSuFvPFCMR3lCdxMcEDKOiaw/0', 'oyP7DwPYqcCCUAgV4yNT5YrIBKxU', '', '0', '', '1', '1', '0', '0', '', '1468639392');
INSERT INTO `tyms_users` VALUES ('910', '占先生', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90JDbTS6JH93KeI3kWFYgvWujrUiaCUytTmjfRkErUDXkuNicB5KEr43I7sUTAvVU415uBx7TkRfR0D/0', 'oyP7DwEXzBd2zeEj9yCapl6lzxso', '', '0', '', '1', '1', '0', '0', '', '1468639738');
INSERT INTO `tyms_users` VALUES ('911', '飞翔', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1dF8YGM6zxGpiaNDoZASnSMAsTOvx9SPb4HzX6NticDc6oVoxTOTDAvzG32jEAKXOQGNFUpP28GoIfEL4EtjG9Kq/0', 'oyP7DwOEIdIeN5yBDdQznfL0kxiQ', '', '0', '', '1', '1', '0', '0', '', '1468639776');
INSERT INTO `tyms_users` VALUES ('912', '敏仔', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDVcULqk0XwBobm20ZbJtHRC06vPib8egWqnOXFM7g1IJtAJDV5B90BJY7ZzAzOVpFLrHuP7sbcFTQ/0', 'oyP7DwC_tDQkbRHvvBwH5LF5Y3Vg', '', '0', '', '1', '1', '0', '0', '', '1468639925');
INSERT INTO `tyms_users` VALUES ('913', '丹阳', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1smXTnTYN18LIE3HNaEuhAic2K5yicx2UeQYwdDxNHQOjCPcDmvEAzSE8epjM4OTmegWUqILRmyMvU1IYibCteVYZ/0', 'oyP7DwO6yRzrlERdPtUxI45OatEs', '', '0', '', '1', '1', '0', '0', '', '1468641828');
INSERT INTO `tyms_users` VALUES ('914', '独孤志', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1FIKvGAxFR9gv5s2qhZr2M0bOicG1DUGy7Py0aITGpEo7OIqjmHvticDDdZ1VS8LQfMkJYpKU5aicvW9q4WXItM8u/0', 'oyP7DwCb1n7Q5QxPultVqtR0Z6kE', '', '0', '', '1', '1', '0', '0', '', '1468643417');
INSERT INTO `tyms_users` VALUES ('915', '我是一只小小小小鸟', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP329deTp5f9WhKg6SxdUyHXkpiaYtVOuvcfCCE1uvliaAU8ibWCECVicopFehr0RTKSwHqWT2TiaEamk3g/0', 'oyP7DwMuXe6r7AGviQEtE9vB-ERA', '', '0', '', '1', '1', '0', '0', '', '1468645861');
INSERT INTO `tyms_users` VALUES ('916', '陈大人', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4t9E3BqccOAAWgHXYbYIFJRNXLefV5BwIpezwiakibQiaribj6iaLGaGA5feUWvE08KF1kzJdq5q7r7Cb/0', 'oyP7DwFZjgz_KsPTGeld7HaxzCCA', '', '0', '', '1', '1', '0', '0', '', '1468647662');
INSERT INTO `tyms_users` VALUES ('917', '李巍', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4v523RUldHBicXFJj40BQ16ibeb2PicA9FiboqPhn7T80VLBRk3OY0iaOnm1NibRMLqia2G3k1nIf3quLbZ/0', 'oyP7DwBTcZBqpW1xE96jX9oJqEKA', '', '0', '', '1', '1', '0', '0', '', '1468647928');
INSERT INTO `tyms_users` VALUES ('918', '为了遇见你', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeKEUCY38DdNn8pK3RXlTXZt1p0n9Rsc5OiaXNe2JQRKmRyCcLhvz8BKxro6azrEbz3oUm6bcgWialA/0', 'oyP7DwIo93A0bPZHWKD2d3nFXT6o', '', '0', '', '1', '1', '0', '0', '', '1468648146');
INSERT INTO `tyms_users` VALUES ('919', '萧凡君', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6pBVskWayVST6MNS5EnXLa0iamvy1yUiacC5Krib87oO2a5pbnBMpX2XPETnj4ZTKbjNMjeYGdCwJVdx7IpDcXKaE/0', 'oyP7DwK47Tgsh5f11Kwa_bxNSoz4', '', '0', '', '1', '1', '0', '0', '', '1468648454');
INSERT INTO `tyms_users` VALUES ('920', '演奏家', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90KibRXxaW2jLrSbGKb1GP1gpmnETwtYn5Ry9L8rk0GgJZAZMjcsUdAeIIu4FRYS7QefhDdlgSjzmX/0', 'oyP7DwLNcWLvEpo3zpaPBa7s4GWE', '', '0', '', '1', '1', '0', '0', '', '1468649719');
INSERT INTO `tyms_users` VALUES ('921', '叶凡', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraeub6ChZ40YwQs2Qqmr3NYfEjMoaFEnKiaffbfPwOiap6mCZicRaBk0kGO7fcX8eORhM0711gX3RL88/0', 'oyP7DwJDIOeF1__ownil9BkGqOaA', '', '0', '', '1', '1', '0', '0', '', '1468650698');
INSERT INTO `tyms_users` VALUES ('922', 'Umlik.cn', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECvibodd4wiaSU5OnR8OzVBOfHteuMw9iag3LDtJyzv8wKhen8wYNJ7xNzops3wshmJFErPhBlibnYn5/0', 'oyP7DwGYekQakZ9FGA88wM5s7lZ8', '', '0', '', '1', '1', '0', '0', '', '1468653415');
INSERT INTO `tyms_users` VALUES ('923', '请叫我齐大大', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDExKvnoI2sjUVfHSibvg3WiaPKIklaFF1yjWAqXdes3cqc8sO89UibeGbEwAAP1XS85xBS1msHDtWM/0', 'oyP7DwBO0MjUisHIujAqVtGmT4IM', '', '0', '', '1', '1', '0', '0', '', '1468658340');
INSERT INTO `tyms_users` VALUES ('924', '文和', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJEg6f7hm29OJ7BtxrjmQfS8WfO77ncPstmGrYAFQz5CroPHulVY8HaB4QNmXqHd2icHu1yZJKg9j/0', 'oyP7DwGK18QzdL2UTPMAOwNM4ogE', '', '0', '', '1', '1', '0', '0', '', '1468667017');
INSERT INTO `tyms_users` VALUES ('925', '沧海', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECodUgHY9gpcbzJGbbgGY8BuyUIic6zkxTyObYjwyqXoias5iaqCCP4VTDYZFWC5fWFic6ag9RM2vnPM/0', 'oyP7DwNbgZPfWJsUOglWeaiQkVMs', '', '0', '', '1', '1', '0', '0', '', '1468679980');
INSERT INTO `tyms_users` VALUES ('926', '可苦可乐', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBdrPibiaVuOZCBAvdqACF1BiaRHRjcrQ4yb4c4HWKEXeaktCqZ47qdSnUHtcN6JrGMdzRkwWGfdVSmA/0', 'oyP7DwMnR41tmX4iXELjDa9ibXEM', '', '0', '', '1', '1', '0', '0', '', '1468682817');
INSERT INTO `tyms_users` VALUES ('927', 'As', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90DW9oGD08DUYHcSyC6fBpmMTrZ26Rzu9yzELGjOA2oKIiaNvw7aZT7TLpOo70nicxOuDdqzRXPcSOF/0', 'oyP7DwJT62a9smGsbUKNVQxj1wak', '', '0', '', '1', '1', '0', '0', '', '1468682918');
INSERT INTO `tyms_users` VALUES ('928', '小灿', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6KXC8XicM1PdGhF1a2vNxBayl7updg0RloeIxV6hQjdD3GXuRb5pFTa73Nstukd9iciax5UxpGlwm3jHWBMt7mJL9/0', 'oyP7DwDf1I1vYB3uSs80_HIQlK6Y', '', '0', '', '1', '1', '0', '0', '', '1468687554');
INSERT INTO `tyms_users` VALUES ('929', '非请勿扰', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eLaSvXbPOjXEWD4Dv142s7BcNcy7q5yeUf6YYP9sLaTTWMp2fnsHiakTlJfM9hJyejYXJicqdZTIdk/0', 'oyP7DwIGbr_Fo354UvZvJkXAak2s', '', '0', '', '1', '1', '0', '0', '', '1468705550');
INSERT INTO `tyms_users` VALUES ('930', '╰(￣▽￣)╮', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4cNRwoqEYMCpteXyBpI8yjiaibJBoo6nexjsQepedEYibJmFnmgONEMibuFESibtwCF7rhicHiax9HCnBYA/0', 'oyP7DwDjd2hqt-y__Go-GRPq_EYQ', '', '0', '', '1', '1', '0', '0', '', '1468727159');
INSERT INTO `tyms_users` VALUES ('931', '源图', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEA53IlzS8AhscE4tSqmU5dyVl09zJ31JSlibvfjAQEPBy8hEYZVoGicxL9ONouebHRs1XEZ6DnhKnQ/0', 'oyP7DwFSwlWS4xkTN071-hrzFTiU', '', '0', '', '1', '1', '0', '0', '', '1468727307');
INSERT INTO `tyms_users` VALUES ('932', '静月听湖', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfiasaf7OpwWeaqcuI5gexCZYu6IX5dJWiatzACRXsd5SLnI2FB7h4JAArQcIz2wIWemGzp1BFt34Qg/0', 'oyP7DwFCZdzO-gyxjwUrRLdJ8cDY', '', '0', '', '1', '1', '0', '0', '', '1468727433');
INSERT INTO `tyms_users` VALUES ('933', '米乐爸', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPKnDXib9MWU8qzVDGI179cVPqiayLnMMY3cLiadL537MQo8AGCkRt1dMcqXX7ic6g9SianXGsVub37EL/0', 'oyP7DwPZZYwnGLSSL6Ts431shMuI', '', '0', '', '1', '1', '0', '0', '', '1468729319');
INSERT INTO `tyms_users` VALUES ('934', '谭师傅', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMCHs29bOtk8VP0ut0lDkB8awaqLjqdNJWyI0u747ticGVllKPeQ0kBT2ibkaonTp1wWzuv1gwIvRL/0', 'oyP7DwIw7r3a5EW_tMzY_9kCv39g', '', '0', '', '1', '1', '0', '0', '', '1468735248');
INSERT INTO `tyms_users` VALUES ('935', '土木木', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEP5ibx5uwGx4Q51GXC4LpEictHiblzEcIhGB4LZgEALKaKY5FibaSIKJKOuoBSAHEIgRkX8RLN7AEQqV/0', 'oyP7DwDI49IYBc0aVp09tmMS_VTU', '', '0', '', '1', '1', '0', '0', '', '1468736361');
INSERT INTO `tyms_users` VALUES ('936', 'dodge', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0C43Dn2xiboVhgow9LjKAKwUjFwoicIPFAc7lT2pksTINmXSTmKAZlV3cvDtQ7s2kGxkMJPBiaicoic1A/0', 'oyP7DwBlms8CUAFT06w9eE1r9ffI', '', '0', '', '1', '1', '0', '0', '', '1468738121');
INSERT INTO `tyms_users` VALUES ('937', '赵 逗', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7G80jMBV9AYl4MP0bauELRvtSnIpU6pJQ1gMrfxDXyrksZvLbNr9dt7F5r4AaRnwMPZtsGNpVc7g/0', 'oyP7DwFZTgjDLKr1x3iFMstRjLa8', '', '0', '', '1', '1', '0', '0', '', '1468738468');
INSERT INTO `tyms_users` VALUES ('938', '金融先森™', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0nbZTIbJVkl16YKBnZMMzQguHsx39jejKrsFFzMbibDEibmVoEcJ5bEaLwJdEydq02BVAf0SE9tRBfa8ibXQvVqjk/0', 'oyP7DwH_KrKsdB66bDAwrKI7u7Js', '', '0', '', '1', '1', '0', '0', '', '1468741583');
INSERT INTO `tyms_users` VALUES ('939', '陈炽', '', 'oyP7DwO9YEFg6_ZIJXpYQfG17t4g', '', '0', '', '1', '1', '0', '0', '', '1468744425');
INSERT INTO `tyms_users` VALUES ('940', 'Simon', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeNYAibsV04SbWhFT97ezDDqBgdFvZN8fCz1MDmGyicHPMHCFbtBvVoBQicu3xdQQ1JZWicX68XvtbRXw/0', 'oyP7DwL2q_keQxsDanOXA2IygByQ', '', '0', '', '1', '1', '0', '0', '', '1468748714');
INSERT INTO `tyms_users` VALUES ('941', 'a刚-承接App研发项目', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFDnOziaJaVJCHiapvHgibpI8X7ZIiab5asOLicrBFiaichPMyYU59FWNR9vL3kMkv0VcnKiamN4G53gicTgS/0', 'oyP7DwGRCV2VehGjwW1r3kh2B-aw', '', '0', '', '1', '1', '0', '0', '', '1468749838');
INSERT INTO `tyms_users` VALUES ('942', 'Satan', 'http://wx.qlogo.cn/mmopen/iaic26T1Lo3pFicI5Mbqk6dCPLSpMe0nm04zSibzlIUU9KDhCl2p4IwRxqlCHAT1iaGJBzDrbEE5rkO0Eoq9b16ol28TDq2vbckE5/0', 'oyP7DwIMltlYj20SjJgSX1rIDDgw', '', '0', '', '1', '1', '0', '0', '', '1468751721');
INSERT INTO `tyms_users` VALUES ('943', 'adi马金子', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfKNVQetNCaWEm5ICZ45ETnx4ibE93sH3VOwvGNbV3bRqJwDJph5y4diakuW5DWlWsheSg9PFRHbKKA/0', 'oyP7DwHbA3m9ntHJOg51zrpTheTI', '', '0', '', '1', '1', '0', '0', '', '1468753058');
INSERT INTO `tyms_users` VALUES ('944', '穆沂华', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4kAAfy8iatQynX7kBT4ibRV15ibpf3LqK4mDmLZRPWPU0LwsYOPq77TxQxt1TaiaUoUBDeO2mJU1Akicl/0', 'oyP7DwG7msfGY40ciyWqeFnkNBkk', '', '0', '', '1', '1', '0', '0', '', '1468759035');
INSERT INTO `tyms_users` VALUES ('945', 'A网络托管【吴良针】', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p21ib0u81WA6ygIibURL2gZDu2uzF8gvggZWBWuWOiavxmctEBVCPOVzXpwkdb2B4IuXzicrCIYzycEf4mwz2o3tsyP/0', 'oyP7DwFPJPrRSi6m_3z98T8jUiTg', '', '0', '', '1', '1', '0', '0', '', '1468766677');
INSERT INTO `tyms_users` VALUES ('946', '○¹³F○sWiFi', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0esZfMdDRIRmBaMdVtZ2AqwL2WIXm7QtQfr8oQtscG6m8N8OcIUQJML7J2VWhcYBLxusxib0br36TDETo86ibuLb/0', 'oyP7DwA-c3hOZBDKXfpnpzrZW17Y', '', '0', '', '1', '1', '0', '0', '', '1468784025');
INSERT INTO `tyms_users` VALUES ('947', '周洪-吉林森工霍尔茨', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKLGcR6yaickhR9iartAaLiaqarTYoOYAmTSCS8ib5DShqAPwGokW8u2ibVbHH9lc5SlKKVXWu10WXkwoA/0', 'oyP7DwH__imSWgQ_UbklqwggM2wI', '', '0', '', '1', '1', '0', '0', '', '1468800352');
INSERT INTO `tyms_users` VALUES ('948', '没事豆蛐蛐', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4eHvJBYLVG9dO7MOHPqCVLSlq4LI2nLT0TE2CxQjMhmXLZn86eEwibch7J8ichNMzt6mkCicibFh6lTQ/0', 'oyP7DwCi6A-_C4Px-0BM7maClCdQ', '', '0', '', '1', '1', '0', '0', '', '1468802308');
INSERT INTO `tyms_users` VALUES ('949', '工体东路', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIjWQOCJ8GQRZicUs8hJeG1Drwc2J874DAr3z3ES4Uib5nK9NlrgzTLK7SA0SgWFU3BUMIUO1ibvsPMQ/0', 'oyP7DwKjcANv3OxBljHqCSZcDUsc', '', '0', '', '1', '1', '0', '0', '', '1468802515');
INSERT INTO `tyms_users` VALUES ('950', 'feizhuji', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIiberZib7rXeBrdkz4N342Owo6SpED600Mq8gJmXAJK6X1ANaR2KQ6fwRLhOzfqD6qv88e22rPw7fN0dg1kpQUrtTR/0', 'oyP7DwIrdvyHYxNqPb5LwtszemjM', '', '0', '', '1', '1', '0', '0', '', '1468802919');
INSERT INTO `tyms_users` VALUES ('951', '晓伟', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibes8tMhDbnVelK4L9MJfqKQicfkZCn5RickOK64RzHyQ0rZguOWuPzFeiaACozZu7Mnib79qHiaAWajgog/0', 'oyP7DwAFdG4y2tWNPc46cCEbKWWI', '', '0', '', '1', '1', '0', '0', '', '1468803818');
INSERT INTO `tyms_users` VALUES ('952', '北极光', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UI3ibNZ9w3G4TTcRpdLTTDHjWwKbhfWEwbSUlBZkDAoOVqXsyIeRjwNAh0Tu6LtzulVoPPaNg0TSJ/0', 'oyP7DwJgnWnq66oLyNhAGqYttMF4', '', '0', '', '1', '1', '0', '0', '', '1468805418');
INSERT INTO `tyms_users` VALUES ('953', 'Adam Yang', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UOZetbh0sAOlmK0GugohQZiaFj2kQXt46HW4ErAJGfLU30VlBFPlKiaZhPsVtEc1wFEqr8x6nTicq53/0', 'oyP7DwEeGzkKsELz9UHXOWam4dCI', '', '0', '', '1', '1', '0', '0', '', '1468805546');
INSERT INTO `tyms_users` VALUES ('954', '浮云', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDpWudvNuiasptyPuJ8aZB92ibh3DaoohkzqSpza0PFkU0M0VpkhiadE3doV0S7xX6PHibWdBlHsewMVA/0', 'oyP7DwA_EoYeMi71-wMo9HGSdEWU', '', '0', '', '1', '1', '0', '0', '', '1468807397');
INSERT INTO `tyms_users` VALUES ('955', '游海聪', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazxZdUStWHBz9b49hQ4VR8C05ICGf0bb5iaDBMuGibbog2vYm5qCr4NhJzTorQQyOwWrcxA8x7HPkd/0', 'oyP7DwE1TAhPAVD2Y6B6XEsBJ0-E', '', '0', '', '1', '1', '0', '0', '', '1468807590');
INSERT INTO `tyms_users` VALUES ('956', '小皮子', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicic4fzDF1Tu5V4ialtViacZqRiccftsgEpopd5sorm52DBQTLp0N9aypDrIyIocL265OeWsPNTQ38l9/0', 'oyP7DwNzzxswIy9qJk1_sO1t68jM', '', '0', '', '1', '1', '0', '0', '', '1468811053');
INSERT INTO `tyms_users` VALUES ('957', 'Micheal', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eBwUbuW9sc6NuLERm6Hbty0JuY2ibgELGN3DVibibbQA7sCdUrVIdtmoqb3FJMaykG8erYmGfcRYh2Q/0', 'oyP7DwCZ9wv6PBgQ5wKVR6lYblCs', '', '0', '', '1', '1', '0', '0', '', '1468812008');
INSERT INTO `tyms_users` VALUES ('958', '云中行', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1yjeUhngAnSEEn47OwTcdldNMQwOdx1zvowiacPbRTGMfFpR1sKBYZ2XoKGKqa4ibibDiaoxbmhsVPW7nybKJ2KdmG/0', 'oyP7DwBNnujh1MQrwbRJ1PEKG42k', '', '0', '', '1', '1', '0', '0', '', '1468812378');
INSERT INTO `tyms_users` VALUES ('959', '智诚网络', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIHicYuZLbIowhgwaGlP70voGAstHk8IkbDHILsXcgaf4oYJCYMvxJPjUdYqSqJq9gBmic7yxyfOGLg/0', 'oyP7DwG8km1ZjMSsD8lkHZe6ezCw', '', '0', '', '1', '1', '0', '0', '', '1468812399');
INSERT INTO `tyms_users` VALUES ('960', '陈鑫', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4WIHCE9g5KPpJbkg7CAP2gXL9e5a6FLCJWh8ic834eAWX2AM7LKlb4iaUvQC6zsmibUa38TclMPicShDu0ibqZq8MfD/0', 'oyP7DwN2qzOWGeP5b5Gwf3iyRu8E', '', '0', '', '1', '1', '0', '0', '', '1468812514');
INSERT INTO `tyms_users` VALUES ('961', 'sundy', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UFXGFMSVIeDZSriaHLKKtK1EYbYFLkY30esv3Wz8pMlfwwpvk8G5SIhdbydmyC5zRefG1YRDySFKc/0', 'oyP7DwA1tZUohnFldOlaNEL-0h9o', '', '0', '', '1', '1', '0', '0', '', '1468814447');
INSERT INTO `tyms_users` VALUES ('962', '爱迪孙磊 18838108976', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Z2qwC5wPmghFWU9mcwvvdfMwTtibeDaL2nkC5NdgoBKNZos3uicgvdDATTiaFpooozicM7J6S8VvWIp/0', 'oyP7DwP8EA-67lZHFWKglB7GdK24', '', '0', '', '1', '1', '0', '0', '', '1468814540');
INSERT INTO `tyms_users` VALUES ('963', '你好', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0KLNBac8hLjaC8e8Tx8fbRsFou25xenVUTI8OPdiaxTKAyib3R4uugjEIjZz5fuFTticVeao4oeU2qmdhuwHDU4h5/0', 'oyP7DwA94kOqZD-1ZYfuehjlX_wA', '', '0', '', '1', '1', '0', '0', '', '1468814748');
INSERT INTO `tyms_users` VALUES ('964', '钟意', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4Q9UNOBaoo9iaVxicMkq3xqRWW6vdicL6l0YgX4BVMgzrK5ezNOVSKPFybDxZZibp8l8icNj97DDqd6QaLVibx9QPDIv/0', 'oyP7DwFIyLjCCAStwZUTQ2Qwsqv0', '', '0', '', '1', '1', '0', '0', '', '1468817272');
INSERT INTO `tyms_users` VALUES ('965', '罗汉果＊微分销方案公司', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0dv5p3tzdEnAJ3PhVXpGIibMtarD4mH3hTfm7mWKiccic6R8NX8upJia1V8Y7pOBhffBNB6rcia4XVU9P/0', 'oyP7DwNCFxGscAbM1zaxE1tZiICk', '', '0', '', '1', '1', '0', '0', '', '1468821656');
INSERT INTO `tyms_users` VALUES ('966', '小欣', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VKRqMtibpk5rm8ibwgTbLyR4JkjkKC3pXjxr6icfqJanBGibJor31MEchadEHRBvwa5YXiazzjtgibeae/0', 'oyP7DwG71YutG_0lB4_nOWPCwo38', '', '0', '', '1', '1', '0', '0', '', '1468821745');
INSERT INTO `tyms_users` VALUES ('967', 'jason', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELbQnH4xQuoBdKc0tqKy2niafdRS5zF63gJdngpOBkPDaaVfjRz5z5xfgOz6zMp9PX2vK6JmibP2LOQ/0', 'oyP7DwLppGieAYGoSXGxYjwQCVgI', '', '0', '', '1', '1', '0', '0', '', '1468821790');
INSERT INTO `tyms_users` VALUES ('968', '老不透的我、冯', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGibK7BLIb6b9zMYHWMPicwkiamqTgd5oHCLAlzdjNBlicEwJCbjrfz6cZIiadvaNQ4Gh6pccYCQMiaeNt/0', 'oyP7DwELKcENuyWhNPpmVYHyxQGs', '', '0', '', '1', '1', '0', '0', '', '1468822573');
INSERT INTO `tyms_users` VALUES ('969', '诺曦', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90KWEVXGjm8EzfpZicaJXD80TIUicGBaib0Dib00iacxrYF6jhPIly4AzrFPRIHlFKcXfSQ26hibLr7AjtS/0', 'oyP7DwHnelWABQ0CmAuVrh6e2j1E', '', '0', '', '1', '1', '0', '0', '', '1468822825');
INSERT INTO `tyms_users` VALUES ('970', '无敌小青年', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGFLPz3zOSM5lrmPP9Hq2GWq5YGdAVJaZ1FvKgaFvBz4HExFBu7oPznFGJrC16icQuVp9LvicQsFj3/0', 'oyP7DwMxLoOBs_6tgOuiHj9vIAlA', '', '0', '', '1', '1', '0', '0', '', '1468825827');
INSERT INTO `tyms_users` VALUES ('971', '許 昰', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazLicPBnOlYsic8NBoNuUz3CgpRAFBsElobO0oMDzEKswdsuicSerkgc6y5W6NwOYz82hxlhwm48wKD/0', 'oyP7DwDlBULIj--7AG6U1UnoNaIM', '', '0', '', '1', '1', '0', '0', '', '1468825837');
INSERT INTO `tyms_users` VALUES ('972', 'Collin  到来。', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAeN9lqic0XZuJthGicTibnLziaFrWNjcnicUQyVDEYanNz8v4FkrJnwVQasqn2RbBsfDdU4TO0lTuphFg/0', 'oyP7DwELHWXgIt87o4BFntTjoiBM', '', '0', '', '1', '1', '0', '0', '', '1468828196');
INSERT INTO `tyms_users` VALUES ('973', '程亮', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDrhntQic49nIbuib1uwr2pmJ8l0zlNWuclmyiaVuMbUQhPljrkwB2I7I3bDDXNYsDL1tXLoLnrJwDh/0', 'oyP7DwNVKw6BxjDE7YRWh07RaoQE', '', '0', '', '1', '1', '0', '0', '', '1468832114');
INSERT INTO `tyms_users` VALUES ('974', '葛磊', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY54HGo8gRf8H6GXqOu4mYpZqqoKFgvWSJoURrMgonrESEtiaTQH3UCPRzcNtra007lpzPfrRsm410I/0', 'oyP7DwNlMWO3F95XQ1UWQj3OntFY', '', '0', '', '1', '1', '0', '0', '', '1468833679');
INSERT INTO `tyms_users` VALUES ('975', '아저씨', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKnLnQej8Eor91StuGicvAHEibEnzqssKbRBAzymhNibtCMzMEEtOiaf2dPUYQ0WVEVdjs0yibPYN8Qb3/0', 'oyP7DwO5gSPmFYhy0KHwHQX3VBEU', '', '0', '', '1', '1', '0', '0', '', '1468833730');
INSERT INTO `tyms_users` VALUES ('976', '新农业', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP31jXXRN7HH54CwDqtnqicWAHDj9J09X4fGJCaicWN7H8FoO7Ele1XcL7T4gGFLNzzw8unO7KwQbBiawd3IcibOc8fa/0', 'oyP7DwPlJkpFh_wrII-HhCrjqink', '', '0', '', '1', '1', '0', '0', '', '1468833732');
INSERT INTO `tyms_users` VALUES ('977', '白水', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEASx3886iaTusDzALsRzt3BvB2LfKn0lGMmItiaDG7XcEstEOksfc3RZTdAvLkzohQT5hzUTATK7v1/0', 'oyP7DwIQ3pjcLqf0ahruydXm1Png', '', '0', '', '1', '1', '0', '0', '', '1468833952');
INSERT INTO `tyms_users` VALUES ('978', 'Nic-Cai', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAMSLwcLKptWaMRUT9icmhibNxkNCA7cqtfqdSdPMoxbblBib932ZKnbUOiaAucRkUAE1odToNaicsvmGg/0', 'oyP7DwPrGgUrnteJfQ9hV0jYxmAw', '', '0', '', '1', '1', '0', '0', '', '1468834227');
INSERT INTO `tyms_users` VALUES ('979', '瑶瑶', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eCp6463Vkyc8FP4BYNvibSYmhcBtjUPqUZmDpibiaXdMydIeeYTjcEK7FlFpVr6htqQNp4yNMBCfMjj/0', 'oyP7DwHbpkQTJPErx68zXapsFU9s', '', '0', '', '1', '1', '0', '0', '', '1468834265');
INSERT INTO `tyms_users` VALUES ('980', '13466359968', null, null, '', '0', '13466359968', '1', '1', '0', '0', '', '1468836064');
INSERT INTO `tyms_users` VALUES ('981', 'Manic丶Aries', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4ENhpQMibB2ch6rmMnkPxKICOqgibXqC4Qf2VddC1usjpbqWK0P6m2E1G8kDsBVtzpGIp8qxebJjlA/0', 'oyP7DwEy8SJn5SAyqO9tCft8kAl8', '', '0', '', '1', '1', '0', '0', '', '1468836381');
INSERT INTO `tyms_users` VALUES ('982', '威尔', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4WIHCE9g5KPs6rln5Ap8Pdeicibne9qzEMd9qNavwOgAZOjbNhw567rqTe2cXm5mhdYiaTiaoFzNAt3JlNezorftad/0', 'oyP7DwLGIPRZ0PkuMS8reWl-gsbI', '', '0', '', '1', '1', '0', '0', '', '1468837086');
INSERT INTO `tyms_users` VALUES ('983', 'Gaaloks', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL51gLGkLoWiadqZwTnYv1VSQK5SaKbGyBFDT5qL8LNnDkw8vfyWhYS0GR1GxJ1f5ibWjkLmFdyBDsvaPwrqSFVNnU/0', 'oyP7DwDRdfsfOES70UK4poxArJC4', '', '0', '', '1', '1', '0', '0', '', '1468838700');
INSERT INTO `tyms_users` VALUES ('984', '水上飘', 'http://wx.qlogo.cn/mmopen/8hSs3H5r6sb5CfDaLVxFPH4YeUq1RILRopZFR393JgbNa68xnpaAmdc3FaYJ1icXk5C6wMAyhWTlicfVJUsic0z6dlNg1ljXVcl/0', 'oyP7DwMMl-tbwjxJfEnyvH9eXafw', '', '0', '', '1', '1', '0', '0', '', '1468846266');
INSERT INTO `tyms_users` VALUES ('985', '•﹏•', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6pAdV8Sy3KkL3SSFibWsAhxqqfb60KIQudWOB7UgmXiajGtAcpO0Fmic0YDNofAT9e9SvvcNdMpBfP46Yh9Cu5Haib/0', 'oyP7DwA2ekJaOV-NmmuNRq8pQqSI', '', '0', '', '1', '1', '0', '0', '', '1468846832');
INSERT INTO `tyms_users` VALUES ('986', 'fishyu2016', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7r6LTGnfCuyH0lfJD6rEYSxwZmIuNZcN6bGmf1QfpoqZvEOV20Wd3ptXO4ibBzgkQs4IsfSCKzoBP5siciccf2eLx/0', 'oyP7DwEJCjCbTyVagYunvyTMN7f8', '', '0', '', '1', '1', '0', '0', '', '1468848847');
INSERT INTO `tyms_users` VALUES ('987', 'Aº   Mr.杨', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBj7ribm8SecMbUicHjhcLxRgBf1jVrRjPbW73nMFUC2VCtTWCDMfdVH7T6EhoJnZxrH0R5fE15ictibA/0', 'oyP7DwAhr8JLG3gHGVPTGriki9_g', '', '0', '', '1', '1', '0', '0', '', '1468849624');
INSERT INTO `tyms_users` VALUES ('988', '沃尔文', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM79HLw4jCWTOzVf3VqiaeV3yMDd7dI7I4YK30yvl9UNlZ1Lseghnldckk0779uY3w9xa3Mic9z5yzeg/0', 'oyP7DwH-MsU8kp9RSJJxptu6fNXs', '', '0', '', '1', '1', '0', '0', '', '1468849793');
INSERT INTO `tyms_users` VALUES ('989', '大风', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL46IgEpIqfkje4X2yCyfTbSMSZB0ibqsicvBI51mQbvMUPwFz5qDtnN8e1NUQ24gTwVc3YDGc8LGqWNOSUYNNOTRf/0', 'oyP7DwD7KEQFLxW_pG-qGTrhsnOo', '', '0', '', '1', '1', '0', '0', '', '1468852782');
INSERT INTO `tyms_users` VALUES ('990', '小雨', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcQFYdboFY9kQNx3Zbdy7Detp0I4E836vm439czZicdibZNNRoBw1OnhH6lLP7mSJPaLrMCcicKl6u2g/0', 'oyP7DwBp4lSrT_UFkiOXOom6uwOQ', '', '0', '', '1', '1', '0', '0', '', '1468853573');
INSERT INTO `tyms_users` VALUES ('991', '青春岁月', 'http://wx.qlogo.cn/mmopen/hY02C90AvzQMy7ZAfjgBHTDq034Qkj5SFmjY7fV29X9yDDJd2ZQkNAjRicENVVgJY3kEaP0tgLrianhu66lDvvXRnPW7OaaGdK/0', 'oyP7DwAABD03U-JWmGcZAN47dyNE', '', '0', '', '1', '1', '0', '0', '', '1468858729');
INSERT INTO `tyms_users` VALUES ('992', '陈俊威', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eATKXvEPFLkKJYU9nUCyibdsoI06jWW7xXTYZklrvs3Ry9AqicoNFXlSTFwzU25CVaMvqdaiatsuMPt/0', 'oyP7DwM8HXbtYZR0BIPXnP76sEaw', '', '0', '', '1', '1', '0', '0', '', '1468889029');
INSERT INTO `tyms_users` VALUES ('993', 'Dorothy°', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1jVYiadiaIregqqycZqyMgaPxrCo1k0IJ7GNI7ibhWXgAicf6CbaGIk9BjVYT9QiajziaU3AANII22iaqGNBOFaeT567W/0', 'oyP7DwKV4G50bVc3SdO9h5ce_3IQ', '', '0', '', '1', '1', '0', '0', '', '1468890115');
INSERT INTO `tyms_users` VALUES ('994', '☀SunRain ', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEISWlwFRiauCnWxlxczgyaegajVNiaJAib4d60B8K935tnMfbFBDn5HnesxdAZicMmRUU1DWXnDsWBL2w/0', 'oyP7DwJM4T2P6LZnBMoB-wQlN9O4', '', '0', '', '1', '1', '0', '0', '', '1468890344');
INSERT INTO `tyms_users` VALUES ('995', 'GREENSHERE', 'http://wx.qlogo.cn/mmopen/5mKxaq9tZpHh1pIjTzIpibky01m3yn7tiaer8XGMQIJ9L64oX42XGibYpBTk8niaTexElFXW8OICqOTZ8oLcE0Xb34TAQVPYZeds/0', 'oyP7DwE77AcUVSQp15kurmMC9I4U', '', '0', '', '1', '1', '0', '0', '', '1468893080');
INSERT INTO `tyms_users` VALUES ('996', '　AzMaT', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawUf0C2R51I505ibichZNafkIcxhPyUN8faIBcwAUObUpzdjGgnzOtFTibNtPLMLgI8QItswpB2CW5f/0', 'oyP7DwKP00xHOxbFWAjuWy5IGZJE', '', '0', '', '1', '1', '0', '0', '', '1468895189');
INSERT INTO `tyms_users` VALUES ('997', 'iPay', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6WmkSqicokm5vTRZa1ylOxrmw9gVmZoBBQn7X6HIu1mZ5vRFeLpE80ed4KcZic3JhFnOTUQdWOicd8Q/0', 'oyP7DwKU7M_e0OdnW7OPvwahJc_U', '', '0', '', '1', '1', '0', '0', '', '1468896679');
INSERT INTO `tyms_users` VALUES ('998', '984239932@qq.com', null, null, '', '0', '', '1', '1', '0', '0', '', '1468900132');
INSERT INTO `tyms_users` VALUES ('999', 'WLK', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eFRl8vccps7CwSl1MQKJhwcBTJzEjqiaAkYvuTGEoJxurWIj897bBrPvgvbBX3OsrvvMqIVDibSRGL/0', 'oyP7DwLBSqDcQTTR2dXiAH3zlhzU', '', '0', '', '1', '1', '0', '0', '', '1468902004');
INSERT INTO `tyms_users` VALUES ('1000', '柳泽', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4oVnT5rCicpRLK3eRUzSls0VrlqvsJibIt5Am8V5VWYwJowqCvTMv9eia1NamuFGtMb8skUiahBwYQkK/0', 'oyP7DwKLta4deuryNLQYLZwBzlpc', '', '0', '', '1', '1', '0', '0', '', '1468902317');
INSERT INTO `tyms_users` VALUES ('1001', '小志', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7m98a6yjDPiaygwBFbKd8ibpwsXOTl8xMIoFrkSm93OogHGzFR6uFg0ravkqb3oNGrbaxec5gphAKHrXsPu1AOiaGHU6wCxpuKh8/0', 'oyP7DwIEI6WyUkbrLt0I9DzE2bdg', '', '0', '', '1', '1', '0', '0', '', '1468903619');
INSERT INTO `tyms_users` VALUES ('1002', '兮陌', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELraJxx7AH41FDdo1R38uibfE7V13REgAJ5fJlqW5nmSAFCzPmdaVl8r6O2mEQb4tfz4LpmbsBdmlg/0', 'oyP7DwLLNC86gyiA7IwDXKK-Ijoc', '', '0', '', '1', '1', '0', '0', '', '1468904552');
INSERT INTO `tyms_users` VALUES ('1003', 'Jerome Hong@1CM™', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIqk8Sqe0gNg96h1WfeoOP7dPFRNIiaEI9UFOvoriaxKQPtqe0rBCUOgR1Fibqian8w0LOiauKhTYgKAng/0', 'oyP7DwLBIhklg7jlt32p94rfajcQ', '', '0', '', '1', '1', '0', '0', '', '1468904620');
INSERT INTO `tyms_users` VALUES ('1004', '郑华杰', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0uT0TTVvmW729QRuWvIcB53iaYGMyicOz2FS7RkvqLPYk834r6ibl3uKiaDcFjzmGwh8JhweiaPgPKIiarZuBXUwF9OJ/0', 'oyP7DwN8e2U5J5JrVv3naSLKLqlo', '', '0', '', '1', '1', '0', '0', '', '1468906230');
INSERT INTO `tyms_users` VALUES ('1005', 'MarcoRen', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3UQQCibibIY2kYLQNaKTFpbk4B2N5DHnH5pbvWxNOibO3icrGeFJnm5N8Axv1GTMbjVH7QpdFwTDh4g4zJRRe03WHU/0', 'oyP7DwA7oAWtDc62DD--37bfKiaI', '', '0', '', '1', '1', '0', '0', '', '1468906390');
INSERT INTO `tyms_users` VALUES ('1006', 'AA刘大叔', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5x8HsrJkrkoSmzvQTmNHNw1tFgjNvTznw63Wxg9PfG3tQIP6icoHCicicIEsoqEP9YlX9XQ7enXYHqO/0', 'oyP7DwNh-WkznhBMnXyZm7LQPxtA', '', '0', '', '1', '1', '0', '0', '', '1468908764');
INSERT INTO `tyms_users` VALUES ('1007', '辉辉', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6puV7SkMbxvU0j1O7ibjV9AzpTkeEEolojzqGyKZB9IJcB9qTDtbme9wUAeRdRtia3590NuYVbicsxw/0', 'oyP7DwB4y4yPQddEfigvwuO0ZiEQ', '', '0', '', '1', '1', '0', '0', '', '1468908905');
INSERT INTO `tyms_users` VALUES ('1008', '飞你莫属', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4Qj5IdgHYJnMt5M5PG2pOBUFvkiam69s46ex34PeEHBHNrvS69Hv6wffcku8atTIicx06SuDN8Covgcvte9akU8X/0', 'oyP7DwM9i7ArTczxqtD11MjlUXV4', '', '0', '', '1', '1', '0', '0', '', '1468909799');
INSERT INTO `tyms_users` VALUES ('1009', '轩', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7g2rLeRnp2EYfAdnW4Px3kOB1ahm1Y3wmfV0myU0L1neO7ZgMbQrSECKyY5oJGLtHhicBl0th1VrTAAjmibKGURn/0', 'oyP7DwBt1Pc4xqB_IqcP7G52E9YQ', '', '0', '', '1', '1', '0', '0', '', '1468909869');
INSERT INTO `tyms_users` VALUES ('1010', '尘埃', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibf7fbzYMTia3uiafmWlBn5zPB8V8NsnBhEFVHx50o6sCNgxlxnXuuI3UBnWveB59D3q8bCRz3AruvFw/0', 'oyP7DwA4XrpAyI0AnEp4_keIjfeE', '', '0', '', '1', '1', '0', '0', '', '1468911733');
INSERT INTO `tyms_users` VALUES ('1011', '金石斋主人 邹天星', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5xohq0Z2ac6QOV8WTjT8AVdH9iaXemG7Pef1VfEpPhxz9Go6iaRfLKaDYvpAVhBic1xGMhJWwoBPyLg/0', 'oyP7DwCC0FMJ-bS5XbHuEq4RtkhE', '', '0', '', '1', '1', '0', '0', '', '1468913149');
INSERT INTO `tyms_users` VALUES ('1012', '小狼', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1t1y1c66lnnlElX9qrZ17Wy2iboTemHwXHOgAZALJaOXZ8qPkibqLCf06MSZQPQNVlWGoIbFMP6Gk5dEMVHblaat/0', 'oyP7DwA4hk32f5zwbV6s6iAb-llY', '', '0', '', '1', '1', '0', '0', '', '1468915367');
INSERT INTO `tyms_users` VALUES ('1013', '路人甲', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1NJ0ONRufhLo4iatnFY9kSmPXTOouNZlL5GQuiagCUurXj28QtuvdUWrSku6O5kD9X1oC6csZItSx8f004cZqHpa/0', 'oyP7DwLRqpYmfNwZFm3ktLOOSNnY', '', '0', '', '1', '1', '0', '0', '', '1468915492');
INSERT INTO `tyms_users` VALUES ('1014', '车行远', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4B1IGHPnFGC4dFyqc3M2OmPtBgC9NXUHTbGibnE4gKT2BZv2rnlwpBkCTcQhTQUPprvRFAa8FCPgQ/0', 'oyP7DwFtNy-AESG8sj4hDyfI4_cc', '', '0', '', '1', '1', '0', '0', '', '1468915499');
INSERT INTO `tyms_users` VALUES ('1015', 'CXZ', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3EAyyKZYDOicW2y3VxxU7Awbetjy9UM5PBl1tRHFB1m9Qz2FsLksTA7cxeo1RVzSxEp6PtSGAU1pZHR1yWv9sxr/0', 'oyP7DwEba_CM4Loh6oATYibPuNkk', '', '0', '', '1', '1', '0', '0', '', '1468915707');
INSERT INTO `tyms_users` VALUES ('1016', '_\" 圄年', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdKfibTERGqx1q1qMYQ0icIeo6jx1jhJeDj6DUPlKvvDtdHictP18M4M1URIGj0jqdAJytRiay7e4S5Lw/0', 'oyP7DwHUoYtF9_lnSyF3l2ArY9Ic', '', '0', '', '1', '1', '0', '0', '', '1468917164');
INSERT INTO `tyms_users` VALUES ('1017', 'NickName', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAjaCicRnQWEv2NVJqiaDkMG06icibN9kPvEs7EJL8d3ria9tMBibONMQ3Jb3rFZFEwz45Rxu9s9uAt5HyA/0', 'oyP7DwAn5DLqrGz5aax9yjUB5LQo', '', '0', '', '1', '1', '0', '0', '', '1468919419');
INSERT INTO `tyms_users` VALUES ('1018', '孙', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0TrLfywwAgVQlo9wmCGbRhUibIGSCcfiaS6BYJJ7ao5z4GfmNAFsQTlIMbC9mrND5BiaLJPh6IPpRdf/0', 'oyP7DwOI-prfvrk6XyZjaltdy_0Q', '', '0', '', '1', '1', '0', '0', '', '1468919695');
INSERT INTO `tyms_users` VALUES ('1019', '二哥', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4iaxvicBorq3sIRMEYJq6XPZd8GWWwJWgbcwEpS1UbTpiaiaoRHQfS43MydqMyI2GKp7jvZV8pbh17Uw/0', 'oyP7DwDCy0rQDKkilot8vj7XDZoI', '', '0', '', '1', '1', '0', '0', '', '1468923028');
INSERT INTO `tyms_users` VALUES ('1020', '侯   琼', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eNZmvvficXqYvpL1jXje1tAFnAM4XiarspUrYjtfZQC1b5ls0ibXTdBlOjibTVSKmT98XZ6ILJ8WYZhW/0', 'oyP7DwFDvk8EBag9TrD19G5GxOyQ', '', '0', '', '1', '1', '0', '0', '', '1468923117');
INSERT INTO `tyms_users` VALUES ('1021', '128乐图', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJdUOMhYUJGiadcJUV1iamnQ6xAPQDflrRs3bzOtcibdHXKdNsL3tmatVvUs99CBwhC25icVw4rJYXGw/0', 'oyP7DwAnp_HfTRebog_vjMyuPYqA', '', '0', '', '1', '1', '0', '0', '', '1468934393');
INSERT INTO `tyms_users` VALUES ('1022', 'IT之翼', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pklfhiaXwricUiavPpN63yfxYR5dsPX2autj5McV5K3A3TfJNSAd6BJT6UPRH4pdSUka2cI7ib6kROUKWMjvladhDziaM/0', 'oyP7DwOLDvD1a0LhHE2HfuYPPMNM', '', '0', '', '1', '1', '0', '0', '', '1468935963');
INSERT INTO `tyms_users` VALUES ('1023', 'speed', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90HTvF6ydZsZ4AuVd6jmJgY4fh5p2qpziaWLicwqSqeBMESP858bXs9IZNcAUGWMibFhZaoIQkQgWlGA/0', 'oyP7DwBqycAMg9puDQJbGtugW8vs', '', '0', '', '1', '1', '0', '0', '', '1468940806');
INSERT INTO `tyms_users` VALUES ('1024', '石头', '', 'oyP7DwA8DHH6ziyuSyT3FivR4Vbc', '', '0', '', '1', '1', '0', '0', '', '1468940962');
INSERT INTO `tyms_users` VALUES ('1025', 'A0', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaic8natFaQXBEuJxq8qdcia6Lz2HSepLiaCLiaztyINTEWnepr0IrJjIq0ICYyYTOMYqtDXm2KTGfxjs/0', 'oyP7DwPjBrErjJE1p0iIKj9nfqTs', '', '0', '', '1', '1', '0', '0', '', '1468945513');
INSERT INTO `tyms_users` VALUES ('1026', '荷包蛋', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4vicorZibkhyE3akpzelHra9PcFOD6coiaO4wXTXkoI7U0j0EN3wFfI3Gh8xicYmmFI8PNhe5mGwgibPr/0', 'oyP7DwBmQr3DXDqLg-lvoFf8G63s', '', '0', '', '1', '1', '0', '0', '', '1468946168');
INSERT INTO `tyms_users` VALUES ('1027', '封心', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UCB02cAQgbyWVXhwDnGustlescvFeA21LkIkbkKMlRVTmga08FeRmcq5rhBhZSgtTYKL5KhTHfXV/0', 'oyP7DwIAv5p3CQmgR07W3qdYIGmY', '', '0', '', '1', '1', '0', '0', '', '1468977348');
INSERT INTO `tyms_users` VALUES ('1028', '鲁元', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4R4GfJDdzty6WlsWa4GNAEmtpLbBRb4ibWHEZSLdVic9UoUl8ewJZxQMvoJnP7nfJ6clG3jjnPX0zA/0', 'oyP7DwNG19XnXjr0Y7jySDUjpEAs', '', '0', '', '1', '1', '0', '0', '', '1468977627');
INSERT INTO `tyms_users` VALUES ('1029', '开放教育-学历提升中心', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3QZHsX1Ns7YWH1aBP4GvKy9bTQtfADnlJC8dfRh2g2dH25qXNL6W88Htkdm4V5aPoW4XCibHc3CwvYOvib9PCHQk/0', 'oyP7DwFMlJspzaivtCiEwlLePCJU', '', '0', '', '1', '1', '0', '0', '', '1468978420');
INSERT INTO `tyms_users` VALUES ('1030', '刘家兴', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3ReeJLVr6MhbGuEacKu0QgR1XfR81rn58MpEj5gMQtaSkH725ibyzLiakCo2ndlfVHKqXZHJv0gPe/0', 'oyP7DwH67LEuDY7aA1YArS5MBrao', '', '0', '', '1', '1', '0', '0', '', '1468980225');
INSERT INTO `tyms_users` VALUES ('1031', '王一飞', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL0KfkWtFhtFXet2W0gric3VkdSOT0AgicJrGn6PiaGIETmVyeI3ia4pBQlc2Oc2sQNEezkVbkFFXKibfQ/0', 'oyP7DwCe47js2J5Aj5-RpFEj-I7s', '', '0', '', '1', '1', '0', '0', '', '1468980456');
INSERT INTO `tyms_users` VALUES ('1032', '驰', 'http://wx.qlogo.cn/mmopen/Qk2WicPplRQhwa33CnaL5Vs8nCuBYlkmdMv2piatyjEI5dXKfn9V7x3Af0pWIibL5mictHyHvPbqXsXGJNfk60ibibZGK0icFHJDI3U/0', 'oyP7DwIzWvCkCc8EemXrQeaR67kY', '', '0', '', '1', '1', '0', '0', '', '1468981848');
INSERT INTO `tyms_users` VALUES ('1033', '呦杨', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7IO2o2zMQ6vUibB3MKQhrRtqvkHHyH92C3rMVxCGnianOruKXWWGnEibXRXHtj4TrIcbmuatr3Liar0Q/0', 'oyP7DwBiqeoiPVTTaJsFfNZOF6KE', '', '0', '', '1', '1', '0', '0', '', '1468985320');
INSERT INTO `tyms_users` VALUES ('1034', '段贤根', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1n3qehXvuw5pMKOuGg55HlibUv3G48BAUjGVFB2GpqSpCa9Y7cwy2iafKQicibJ0knbwPY9pWDAt4cNrVj2pliam9Vt/0', 'oyP7DwNBraaKUqCr4EYWwnE7VGTI', '', '0', '', '1', '1', '0', '0', '', '1468985636');
INSERT INTO `tyms_users` VALUES ('1035', '就这样==你', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0Tk9vRJ75tA5mUodmGicL2UibhCvjtZKfPU5Ua0hpSE0sP44mUEic7fQOe5YG5A5xcmPRKP7N3oHHFM6uicnTzchWM/0', 'oyP7DwNA2cy1Wxwd1oFtAte-R2xA', '', '0', '', '1', '1', '0', '0', '', '1468986072');
INSERT INTO `tyms_users` VALUES ('1036', '亚当的肋骨', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4r5NcdI8XyaM6S1BAI3Bk79pCfYtC4v81uR4RYaD72dZElfA9UicBAdokdDcE0oK1biavlLGzT5BoG/0', 'oyP7DwGcDx6dJs0J4fW8H47CUzVs', '', '0', '', '1', '1', '0', '0', '', '1468986538');
INSERT INTO `tyms_users` VALUES ('1037', '贝乐园母婴+抗菌内裤', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFoAMp4eWQcWfPRQDRibx82qSAhUZ4yUSsoJTL40vrTzBVIIicvHJjGQWroHefibPIkdENxBewc86lx/0', 'oyP7DwF-heurPJ5Vf-A7gkjGQ7DQ', '', '0', '', '1', '1', '0', '0', '', '1468987238');
INSERT INTO `tyms_users` VALUES ('1038', '陈家兴', 'http://wx.qlogo.cn/mmopen/xfxfWLHmo59aJqSzKBz7BwHeFqyHxWCeLHV667LRadFZ5ZKgvHONXoGLc46bo2ITtlR1vXZHAwPpP3t5ZPClgCRChOcKibowF/0', 'oyP7DwI2ihNHoOKARP7ncjFH3-b4', '', '0', '', '1', '1', '0', '0', '', '1468990452');
INSERT INTO `tyms_users` VALUES ('1039', 'abelping', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0OfyCiasfhgRnW58t9a7zWkwHghDdSibCUzJ9DXcqV6tFMKf5WNEo7XM7tUuIh47gDeKPBxC91NcCg/0', 'oyP7DwH7Q23F-1ejF-dlijgEdHjA', '', '0', '', '1', '1', '0', '0', '', '1468992219');
INSERT INTO `tyms_users` VALUES ('1040', '乐逍遥', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaic37mr7oMqcy3ylVcI7ic55Yg9oErfEmn6Ug9nbHxRwt5Yo8DzQHPGrmA6Tfm3J5icwYs3dJC2I2wL/0', 'oyP7DwLlKuCqAAHA3NdOr6QuERgM', '', '0', '', '1', '1', '0', '0', '', '1468992706');
INSERT INTO `tyms_users` VALUES ('1041', '双龙', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4CMDQdrUwzFwCRZDxw0NibDQ4PsY7USOEz3B2nqRGApRJxIW6tSJo5XBDtCbibZrubS4Xt9y5Odo5w/0', 'oyP7DwLplpkYczlp9DTOajRjqKJs', '', '0', '', '1', '1', '0', '0', '', '1468993933');
INSERT INTO `tyms_users` VALUES ('1042', '泪染裳ぅ', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eO3eQiaiao2xUY4Uax3evpdjUvG3zWSUFGPUcqniack5ibOQmfiaTanjlEJuSFlIsTqnacltwvHI0XhQu/0', 'oyP7DwC_KJNQkvh-rEqi689JZcSo', '', '0', '', '1', '1', '0', '0', '', '1468996147');
INSERT INTO `tyms_users` VALUES ('1043', '   ', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdK06WO0azy7EFpPdJ3jIfc3NcZTRzxVmoS31DhpH69Wsmd1FVrTGfCskU7I3Xrj7SJ1ibhQWDneibw/0', 'oyP7DwMQhVjacKO8mLaVJdAr98kA', '', '0', '', '1', '1', '0', '0', '', '1468998322');
INSERT INTO `tyms_users` VALUES ('1044', '米斯特.李', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia885DSF7ajNlguFuuGaGIiaKkeBpOO5F9QYgU27FqBZg3waTsgfhGIT4K8pWJuV97u708z1tWkd7a/0', 'oyP7DwEoaJgICjTSUG6GsdBE55HE', '', '0', '', '1', '1', '0', '0', '', '1468999270');
INSERT INTO `tyms_users` VALUES ('1045', '杯子', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEA5sy8wayW7EtI1ETqledHwGYpSibs4Hs9nq3dBJ4bUPpPfT19WFMib8aml7iav6mJNzW5PkTs0bo9b/0', 'oyP7DwC8bbmqodYNtq8MPwL133Ws', '', '0', '', '1', '1', '0', '0', '', '1468999904');
INSERT INTO `tyms_users` VALUES ('1046', '徽信用户', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL46iaTPFKsqMZiakkc1W1QcOHBmaVkRpacOxIhblJ9ESHTwxweMY6ND01ZNvCPTRnichJ7DopA6UZGHHVYe2O0pwXC/0', 'oyP7DwHSX8JiWDXJuY0IFMHabDak', '', '0', '', '1', '1', '0', '0', '', '1468999923');
INSERT INTO `tyms_users` VALUES ('1047', '邬小斌丶', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UKTiaRdmXibhMXgjlJeLT9fictg7zkGl2ApvX6sp6jzV93y6m48hDZIGVtlFf4GumDC4HibEQMBKbozq/0', 'oyP7DwJtS624Nf3knVfvuBjr2Uk8', '', '0', '', '1', '1', '0', '0', '', '1469001652');
INSERT INTO `tyms_users` VALUES ('1048', 'elins', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4snTfUr6PTUDXybeTll2Y4a8weLWwKVthl6WnwaCR1icQTxcx02b6Y4HYtRZJ37Q4foaqbypYyU1U/0', 'oyP7DwGQ1qQSA09mLaGSY8Fv6FJU', '', '0', '', '1', '1', '0', '0', '', '1469003030');
INSERT INTO `tyms_users` VALUES ('1049', '会飞的猪.。', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2e9cz16X9BVYvnP7rJPAnEicZUjibw4ibgL0QFckAHtxklokMM0OicJUHwLqFl3yAuMNb1v4LyuQhE4WzFpickjkMRW/0', 'oyP7DwPppxwa0B_g7h0F7RigjYxM', '', '0', '', '1', '1', '0', '0', '', '1469005168');
INSERT INTO `tyms_users` VALUES ('1050', '陈浩', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3NqwPY3U1ysRbCIsI4sU0gpGAftUSX8IPuEECqZYB2At66LsLpwX6jlflFZBpvD5E7ibElsMzGrcg/0', 'oyP7DwODW7_sschAzKZWqBtP0PLc', '', '0', '', '1', '1', '0', '0', '', '1469006884');
INSERT INTO `tyms_users` VALUES ('1051', 'A@舒慎林', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP386OfJKsDOTb1V8oiaibqP6ibWX3ic9DmQZn0DlC3iap4LgpH0NiaibdNp9CS7sTvvAxUKkwn7bibRIozaebqc2r595goA/0', 'oyP7DwBowb_OYyJ-uSZ-W-kBWxcE', '', '0', '', '1', '1', '0', '0', '', '1469007915');
INSERT INTO `tyms_users` VALUES ('1052', '王琦', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1ibE80ATTUWcVCJZ7THLicKr3hTwEee3ibE2ChI6MthY33licrQCfZ364YbpkQIVxSDy6K4fxTT060B5EORccDcKsh/0', 'oyP7DwAafPbkvhyFumFtMp_po71c', '', '0', '', '1', '1', '0', '0', '', '1469008117');
INSERT INTO `tyms_users` VALUES ('1053', 'Vanilla ', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1VjZicM18VZ474TZaaibN72X1Wy9NxFY03JMLJuIxia3TJvCXUFFJzInokbMBiaKMICbCgPfQNliaFqiag/0', 'oyP7DwKpJSiIHhXbteYutaVo9oyY', '', '0', '', '1', '1', '0', '0', '', '1469011469');
INSERT INTO `tyms_users` VALUES ('1054', '15128853663', null, null, '', '0', '15128853663', '1', '1', '0', '0', '', '1469013885');
INSERT INTO `tyms_users` VALUES ('1055', '小米y', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawHxsjFmzu4uqg2vk9G4h5Bbibicg8gjyOACllY7qK6nFAu2dcicExP2Dwc4Uh3z1ibv0Wbc4LdVSPKB/0', 'oyP7DwI1StEdZEULfgDE7uPSyi6c', '', '0', '', '1', '1', '0', '0', '', '1469016432');
INSERT INTO `tyms_users` VALUES ('1056', '蜗牛', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIDwCaib12vBXpr5GwpUmiaYFN89UnXbHmtcEH4cp4W2M9sthEVDG6KdZiajrMK4sibp9ibVRgar9VY6d/0', 'oyP7DwP8IGGMbKAhQB2zwF6b3XYk', '', '0', '', '1', '1', '0', '0', '', '1469025344');
INSERT INTO `tyms_users` VALUES ('1057', 'A柯尊豪', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibsmibOCPibVYmUibjhsyyg3AK3iaiaUQAezVFt5UzicDNcqicCSBTiaibVEIFkOGplMJLT6PS6mDywbUAcQz/0', 'oyP7DwETCG_XpjGxvKPCG-MB1mbs', '', '0', '', '1', '1', '0', '0', '', '1469025757');
INSERT INTO `tyms_users` VALUES ('1058', '不懂', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4Q9UNOBaoo9vjNBRylcP22loyqPtT3CXU7c8xxCuicocMnv0PT4OEl1wqQ4UtyIFFkJ4z8rC60q2qSMFRjd9G6b/0', 'oyP7DwHeHKJAN3mandBpkxHTzadQ', '', '0', '', '1', '1', '0', '0', '', '1469028214');
INSERT INTO `tyms_users` VALUES ('1059', '！！！', '', 'oyP7DwAx1QtzseiETFMg6a-DBYag', '', '0', '', '1', '1', '0', '0', '', '1469033105');
INSERT INTO `tyms_users` VALUES ('1060', '峰', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eBwS9XsDRN7WjtV4wku0ibHVCwyaDMQSvQdCPA60PrQI2w1O0q2VkxtDrMQCM19Gk7zjWVp2R37iaib/0', 'oyP7DwMBKnMaDv5oNgeSOD9i9bfw', '', '0', '', '1', '1', '0', '0', '', '1469057507');
INSERT INTO `tyms_users` VALUES ('1061', 'A.鱼刺', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLArAX1uiblgiaA1ibTc9u0jU8ibbF3STlIzX1odh5m8Ho0rdopYG1GfkgZbGzVaD8KHg5yQUwaKryNm7w/0', 'oyP7DwDDWk1P96llL_wlxGTlmz70', '', '0', '', '1', '1', '0', '0', '', '1469064670');
INSERT INTO `tyms_users` VALUES ('1062', 'Perry', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0VoY83n6bVO8Z90AWRvm5BhOeXY63Qc6LPWoOiaicZs37FFibNcwVBt5oy0kJfNEA5gUaMVkzPwmxl/0', 'oyP7DwIlajNmO7aGin2P67KRUmgU', '', '0', '', '1', '1', '0', '0', '', '1469064823');
INSERT INTO `tyms_users` VALUES ('1063', '草蜢', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7Lmuib6VbtA0MicoKlRWWicurCcbQAlhPtvcnqIGrJjV5r50pEjplj2trGapyaLt4NBepP2gDMa2Ouw/0', 'oyP7DwL08TxvksuTyrQhTNbnh3p4', '', '0', '', '1', '1', '0', '0', '', '1469065430');
INSERT INTO `tyms_users` VALUES ('1064', '娃娃菜', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIv4vvnkyxdic8iaKdXaOwpYkLo8Q8jFyFDdwvRAzZZgOmx2yVlibfR1oLlUzZgW9LMKWUqzu4oL8zYg/0', 'oyP7DwK4EBbh8uDdox4zt3AaUjiY', '', '0', '', '1', '1', '0', '0', '', '1469066109');
INSERT INTO `tyms_users` VALUES ('1065', '左月潭', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0SXvIibs25uU6Cq26BmXQUxy6Bjk6qib290ZMuf811WWK3FZoVt8Yq1riaSkoxqsZ8gtbNz4RD1ySnA/0', 'oyP7DwDSVybfisSEFAuPthgGEuGU', '', '0', '', '1', '1', '0', '0', '', '1469066632');
INSERT INTO `tyms_users` VALUES ('1066', '尹佳庆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4Qj5IdgHYJnJ8oxFa7wvpEqCPibsibichnCic7UrLh8ZZniaGeBcLUBobLY13vMeENISYdVOAVqbchXYeQmH5bIibVph/0', 'oyP7DwJf8XjMohzPq61LHRMj4EOs', '', '0', '', '1', '1', '0', '0', '', '1469067303');
INSERT INTO `tyms_users` VALUES ('1067', '✨SuperMan', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0crHAlrWbqnBV8m9aqMdRzEQVDkjlibOc8mJhDib3wORZnTWJTRdzZf6XN0eUicej6XvQDVIwyEicM0B/0', 'oyP7DwGZ4KNSCzQYumYZvGxWZjd4', '', '0', '', '1', '1', '0', '0', '', '1469067555');
INSERT INTO `tyms_users` VALUES ('1068', '侯达华', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY59tC9uCrPcHLmvFmicedNwZG26Yw6GnKxp4Y6IM9tgGZUKpxicu3GqzQRsDF9Gj0mt4ozic3TxQCG96/0', 'oyP7DwEQj4UfmGCCLvQe4KWThFZE', '', '0', '', '1', '1', '0', '0', '', '1469068384');
INSERT INTO `tyms_users` VALUES ('1069', '随风滴滴答答', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia54ia3ibfGtPZQIHLN02rnIaCdkeX0xVNFeOn3giaoXakKICmicWibcaWDvzrJPMApekpZSjm15IicfAY8/0', 'oyP7DwJEa_hs2YgsT7VEVvLYZ5pQ', '', '0', '', '1', '1', '0', '0', '', '1469068410');
INSERT INTO `tyms_users` VALUES ('1070', '哼哼哼', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayz7e5DLUpZITJplBeGuiagZ0xiaLQDcL71xoSEVEWyD5Vp4h7k5ReE8W7IBd9KNBnr16ja5Ygrd5d/0', 'oyP7DwNLjmdj676IVb3ePo-NOfH4', '', '0', '', '1', '1', '0', '0', '', '1469069772');
INSERT INTO `tyms_users` VALUES ('1071', '升', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9PVDibdmS6HBia9diaFapFKg1SHjicA3lib6GOEwU8F6znQTZOAtv4SGNGc7fhbD21Ao2GxV36q3aiczm/0', 'oyP7DwDx_wOuC5gpwwSih8lLw110', '', '0', '', '1', '1', '0', '0', '', '1469070228');
INSERT INTO `tyms_users` VALUES ('1072', 'Jagu', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0uBlibqZNuoyLyBzaicTDkYSqfiaicBl4ZCH5RpCda7sYL3dOCzS9snWW2s7jkwYK2EMykCgsff4USFA/0', 'oyP7DwHCafqlOSujez9b3vlW-cUs', '', '0', '', '1', '1', '0', '0', '', '1469070504');
INSERT INTO `tyms_users` VALUES ('1073', '001', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOvuNAmQylVOI3tPddibqCaAFFQVabfgI5OdqYK9oMO58k87K4fSG9XvicxU5VJpSKaOGLBniaRz1ld/0', 'oyP7DwB0PjTH67Qadtp7URw7ffEU', '', '0', '', '1', '1', '0', '0', '', '1469071071');
INSERT INTO `tyms_users` VALUES ('1074', 'Hua', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazD7kXLJRyxOSUpthFXicMPkia5hicr8hWDjtROBfL76amsmSvm3sSHCxib4OttUFazbQxq5R7Eq9EY4/0', 'oyP7DwB0A6PWBVjln8TkwBHm7oHo', '', '0', '', '1', '1', '0', '0', '', '1469071406');
INSERT INTO `tyms_users` VALUES ('1075', '微•观世界', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1PBu6wibSspReFlwUFlnJ4T5Kt6KicXJ19icub1Z4AxTBOCgcUeNRIibxV8YwQKxw3OlvoLwFyeYAIARsWIOwUbxL1/0', 'oyP7DwF6Vdgm4F3nW2mkaqNRCA4w', '', '0', '', '1', '1', '0', '0', '', '1469071869');
INSERT INTO `tyms_users` VALUES ('1076', '白日梦想家', 'http://wx.qlogo.cn/mmopen/Qk2WicPplRQiakBc4FXAlo9tBUpCwIQc9HOrT53gLxmVtNrUTDLRwbWQ9Frl3ZY6LxRUCJXW0Zvvk2svBTW0Hfet9TJfD7lZD8/0', 'oyP7DwIK3OSvOZeoskaha5Jh3vE0', '', '0', '', '1', '1', '0', '0', '', '1469072460');
INSERT INTO `tyms_users` VALUES ('1077', '神奇滴', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEINocBD44Z3pY5ohicUV60uOYWlrUgQSvzw2GpnNo5OqGDBer7C5ibXgX7ibn6WGlT6uS7OeU6tmFHyg/0', 'oyP7DwHJ7OjPS6rd93Pua93jHjh0', '', '0', '', '1', '1', '0', '0', '', '1469072632');
INSERT INTO `tyms_users` VALUES ('1078', 'Y   h', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfNXRibB90neN7ST1oibwicqMmKp1vG5icUiboSZvfUlKHm0yZx1OUzLNyn4URN8x4G40RWhwBA1WOgGiaPA2jxcyon7O/0', 'oyP7DwIgMsLtClf2ZGO1FpmlP2NE', '', '0', '', '1', '1', '0', '0', '', '1469073008');
INSERT INTO `tyms_users` VALUES ('1079', '农村娃娃', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6NUMDPSaBYlWaTC3uBHgZkrVcY20EjWib6ruSiamaKnMMnqiaxhw3LogmHMoZEtVavPdu4wRq0ocJhjLeibxC8ZicvD/0', 'oyP7DwIp2cf7BB1rV7xqmuvMUX2A', '', '0', '', '1', '1', '0', '0', '', '1469075962');
INSERT INTO `tyms_users` VALUES ('1080', '东哥', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UCQ2ep70bEcrx9cyteCSMia5dOwQxX2V4ucFibh8zJ2gT4XE3kE3xvzzpORBKdaQgiczxYbUbt0Ejnd/0', 'oyP7DwE_SJenEpcIP0NgwS4XbsU8', '', '0', '', '1', '1', '0', '0', '', '1469077057');
INSERT INTO `tyms_users` VALUES ('1081', '方', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKuMezTPFpJYQLqToUeWpWtgBFBPez6uiaHoHcg4fF8c9ry1Gqpqicd9l273Lfh6HicbFQZ6Yr1Ke6L/0', 'oyP7DwK1F2OYtmZQhqvFcp9cyMpc', '', '0', '', '1', '1', '0', '0', '', '1469079415');
INSERT INTO `tyms_users` VALUES ('1082', 'Augus', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Sb5iagtMqw9hkl5DCBvvty05yq8IsqEsbYXepBMfW9mx5g9mRic19yVbDsSRER1oBgxUbUXpPGg20/0', 'oyP7DwIV8Yh8dLcM0VYpPctZWnZ4', '', '0', '', '1', '1', '0', '0', '', '1469080594');
INSERT INTO `tyms_users` VALUES ('1083', '碧贤', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfpoe8XF1wHZzyg8QcR8XGBQ8jUAjEYoX4m5e0Kqz87FZgYVVic47eCH9Utia0KuDaxD1KzF1QpSB3Q/0', 'oyP7DwI8OWLDPE3c_qH0QRaptFbw', '', '0', '', '1', '1', '0', '0', '', '1469084376');
INSERT INTO `tyms_users` VALUES ('1084', '王一飞飞飞飞飞飞✈️', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKicKdYib5uVP4JRibdgA2xNAYfhiavvpOIqIc2C5ozqgvia9Ru0qZD6EyiaOfTIDuXrENmnb17QVwnamXA/0', 'oyP7DwNxnYWF3xEQ2yWg5FVG3ctI', '', '0', '', '1', '1', '0', '0', '', '1469086211');
INSERT INTO `tyms_users` VALUES ('1085', '张邦', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eCuiaLMB92GffCXa8XUlaAjl4pRP9WLbWnjf0fDVGueNm1VdYKFFNA5RiaeAgJAHga4EAmLEwjGWpM/0', 'oyP7DwFf8OWDVnMuA8FArAs0uS68', '', '0', '', '1', '1', '0', '0', '', '1469087237');
INSERT INTO `tyms_users` VALUES ('1086', '萱萱', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJJWgibSRrJ4hlH0XIeJtfLxeU1RIGE6sccAwGcDZmYQTFy8R9icOFibeMXqQIBpjKG8Q29hSqmA5z7/0', 'oyP7DwKBkMPh2p341F_S1zeiwOhw', '', '0', '', '1', '1', '0', '0', '', '1469088460');
INSERT INTO `tyms_users` VALUES ('1087', '格子云网络', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90GpSy8tWsfY4gK0PR4yTaNLjlRwd4h6VsA63StRlVCaslk1iaXj9VeGibEH2BXJOKYVmibBicZLqheb6/0', 'oyP7DwDi4cg89ecerOs-sWK7NvBc', '', '0', '', '1', '1', '0', '0', '', '1469089227');
INSERT INTO `tyms_users` VALUES ('1088', '5Au³', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeljx2rKXQxgyic0l3EMRbjSnATa1WrjP17AqTiaybyia7hgGibhQCpxf5ooZmzRqv50xZojHzKNBxRTw/0', 'oyP7DwOVs9zq1UVo4CivS9EjrX1w', '', '0', '', '1', '1', '0', '0', '', '1469089720');
INSERT INTO `tyms_users` VALUES ('1089', '马克_SHI', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QB1mm7GQE0XWCghY4FoOtpDT0oiaS8vCqFchoiboJ5ibat7gWL5hECX6icaCcCSzrUQxY0KcbibafH6D/0', 'oyP7DwLVafU9VQCPp-7H22izJJqg', '', '0', '', '1', '1', '0', '0', '', '1469090243');
INSERT INTO `tyms_users` VALUES ('1090', '廖逸智', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY509cESKztLibDuLhUyApe4esHU43sapMJURg7icGTZelQM7fOwn1kzPY2Pvnm2bjBp021PZEvWM9icX/0', 'oyP7DwEEFqLAnQ5Wekyp-JfW1EAA', '', '0', '', '1', '1', '0', '0', '', '1469092386');
INSERT INTO `tyms_users` VALUES ('1091', '※Jonning', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2tM214xaAZibJfRQ1O1Bf9qmKahlJicpNjpibwuicsDJibM12VErtlNTNdm9QgJRXicC3Z1Gm52YWicic3Ow/0', 'oyP7DwBtf8K--qSYOngVyJv7G3Wk', '', '0', '', '1', '1', '0', '0', '', '1469094061');
INSERT INTO `tyms_users` VALUES ('1092', '微笑吧', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1Df6TVgrY8LQjvNhxiaL7YGKI0KicKyqn52QsjpbexqqtXx5A4nWTNOXJoZlKJ0UwZna9xviaIEwGD32qp3xRV3ic8/0', 'oyP7DwB7bdDxEHUqwUOEZxtMJhrk', '', '0', '', '1', '1', '0', '0', '', '1469096467');
INSERT INTO `tyms_users` VALUES ('1093', '张睿', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0pxapdjkfhr32r6dPiaLIpibV9lN8l4UwxOKaribb6jOscUyFwdhZXtndOlTJbWt5yCRpAzKX6qINQ/0', 'oyP7DwF4cxRyGO3R11VlnPX8CQTw', '', '0', '', '1', '1', '0', '0', '', '1469106206');
INSERT INTO `tyms_users` VALUES ('1094', '吥怕', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6m9clA2SknqicMSlHJDLlQVybl84j9JlTdSWoEKQUO1Jym15dHQbkbFrk4bB3icuYmYzQYfFYXfLcw/0', 'oyP7DwGjCE2-obxaIn6nnBUDMNjk', '', '0', '', '1', '1', '0', '0', '', '1469106403');
INSERT INTO `tyms_users` VALUES ('1095', '琴心剑胆', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAVen2hia2EszvL5ic2rj5pkD9YIlV8DlE0k0MTicjBSbHPoE3WVn8hTPnqdXXqjebkdRBpnjMdhLqRw/0', 'oyP7DwDehl6f7KvwQmpAYZnhJGLw', '', '0', '', '1', '1', '0', '0', '', '1469106999');
INSERT INTO `tyms_users` VALUES ('1096', '周公小窝', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIJ6FAqeggRODjXTsLUt8cqFQAUjyo2h4rFamszpPSYJiaP7wqq8IGwwbcxkZobia5UfFLIA5xeE6ibg/0', 'oyP7DwPJD_wCbfYBUCqWP7pOYmrM', '', '0', '', '1', '1', '0', '0', '', '1469110849');
INSERT INTO `tyms_users` VALUES ('1097', '一巴掌还拍不死你', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cqR69jkVd3kiawLLGypA2ro3oAgwiaA6MRthX0KRT93WoWmT3VE6HThXzvwZ9TqH8aUy8EswD5IKn/0', 'oyP7DwKxP55O9K0fB3xRhY1UE1o0', '', '0', '', '1', '1', '0', '0', '', '1469116356');
INSERT INTO `tyms_users` VALUES ('1098', 'Thans秦', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0f0IUtANicFTibLNuN8Q5nm12DbqxZ2EN7olNSbMKRKErxAX3iaFK0PgOD6MKSqwHIAHFOEUibvscM9Z/0', 'oyP7DwPIQs3xpTqOIaP4SPaA9uEo', '', '0', '', '1', '1', '0', '0', '', '1469121935');
INSERT INTO `tyms_users` VALUES ('1099', '猫腻儿', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W38PQexHSZLqhJib3ThwiakXOwXkIGPs7F3dgMq0EFmakZYaCV0LIopS0xvOZfEAga8mHByIGCsFicibg/0', 'oyP7DwHe1AQbkL4KLCUNgO6GQx2U', '', '0', '', '1', '1', '0', '0', '', '1469146832');
INSERT INTO `tyms_users` VALUES ('1100', 'じ枫叶ベ林夕', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4dcCVm2449Cegib9JLJjNgtI3AEalXQCZXAksMwaVcJFZOGmTmK1sX8WNia2n1QzamdricFjHUydQTcrZbEDvElB3/0', 'oyP7DwMenwiWzggrTCm99cEJ7Xks', '', '0', '', '1', '1', '0', '0', '', '1469151383');
INSERT INTO `tyms_users` VALUES ('1101', '甲海', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJqibw3W5pw7Gv590BbGHu6bkNDorpuLWVbJYm6yhcl9AdGdhcgxFrt4xRV6wVFsMibKTyibATXmolN/0', 'oyP7DwE5JANAt4MaG6ik_QOGdLxo', '', '0', '', '1', '1', '0', '0', '', '1469151437');
INSERT INTO `tyms_users` VALUES ('1102', '深蓝', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3UQQCibibIY2kfibRWgqdRsVntUBzjSS4KRVW8lZlnHibAoghElZ13u3XWUhkNJ3VLLpibibIm6HPibqHn6RMGoSChA3W/0', 'oyP7DwBLAwrks2Ely_zfKI5S0mTM', '', '0', '', '1', '1', '0', '0', '', '1469152454');
INSERT INTO `tyms_users` VALUES ('1103', 'Serena', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Fib7ydF18zYAWNibyTqsiawgZfCLgdk94wt39CNmK0I2IuOU34GZpurXRg9tfcDfWxVfYxH1VGNSqR/0', 'oyP7DwDU-giSDAmnu54q_VxocmDE', '', '0', '', '1', '1', '0', '0', '', '1469152718');
INSERT INTO `tyms_users` VALUES ('1104', '令狐笑笑生', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7HtI8Nl87RPT6yE6UibiaAVGibrHuAalMh99ApBqI8QpEUmGUyCtDMvnZXN4m3yPOrfK6Qm3qNaens/0', 'oyP7DwOtEb4Ec_GbwuUaCWWW0Pjs', '', '0', '', '1', '1', '0', '0', '', '1469156141');
INSERT INTO `tyms_users` VALUES ('1105', 'a0华丰', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90MFkBGDLibcMlc0ckw6nB9eEv9GYuUric0BTg7VEVHWjncmuOKic9ZKhlpOL8v9qhl5NxlCQzFgLe4v/0', 'oyP7DwNRKw1dAfBxyNNXvVC2HRtM', '', '0', '', '1', '1', '0', '0', '', '1469156446');
INSERT INTO `tyms_users` VALUES ('1106', '静静', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY56EibibunPVeZ8Voollf2wW6hKmX9QevDJ7ELTC2WKhuLBw0R2hkSiaUU4ZOLsPSCHp1CAcQdW3PzSL/0', 'oyP7DwL0CV_tMR_ygDGhg-U4YCsk', '', '0', '', '1', '1', '0', '0', '', '1469157368');
INSERT INTO `tyms_users` VALUES ('1107', '我会告诉你吗，呵呵', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK6FMXSicwzVib7dGLk2DibIvVvSzYOkbLQoGmMWto2f5IeBMQJzwDG2dAvFkKvdKZtXAgGUWCS3cIcUA6AbeeF08ZbwFtem9OibbA/0', 'oyP7DwIzBLw6kkda821jr5YXbMaA', '', '0', '', '1', '1', '0', '0', '', '1469158212');
INSERT INTO `tyms_users` VALUES ('1108', '你不认识', 'http://wx.qlogo.cn/mmopen/zHOFcUcjCFlBTlUXdgW0IqQpYv5LZkrxPicicabicNXj6kC0YRmRv9MEAbvxbYQooQOMibDqJ0cRzyp6ibknDiavt1vtpWolgENhrx/0', 'oyP7DwAUbgW-NeqMS0zbI85sX5EA', '', '0', '', '1', '1', '0', '0', '', '1469159040');
INSERT INTO `tyms_users` VALUES ('1109', '水煮鱼', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia5KlQ3AEtHxyILqtRdXhDvbq5Y3BSg0rZgLCwWIeP1qmnJwBwAiaj0PAlyjFfbtgkcAn2ibhGSS9Mk/0', 'oyP7DwMTMuaK7UkPLr32jO-Ozsoc', '', '0', '', '1', '1', '0', '0', '', '1469163498');
INSERT INTO `tyms_users` VALUES ('1110', 'liang', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEHaO1mHYatm3sQuDZqtBNfrheH6oJtDZicfBics9pKiczC1GhSRY481amtyskVrrrK8qqhic6UiaUNd2q/0', 'oyP7DwI6rgsFsoZQaRWp9lXYKkwY', '', '0', '', '1', '1', '0', '0', '', '1469165956');
INSERT INTO `tyms_users` VALUES ('1111', '向露', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eK466QcrHEFqvA1UvIZsUYXPiboUBexX894Yd39UYxm52BEliaian53oUdaNGPGIZsibmQ962SxssgZI/0', 'oyP7DwInRMiiXgjj6_IHn0Np7UN0', '', '0', '', '1', '1', '0', '0', '', '1469168941');
INSERT INTO `tyms_users` VALUES ('1112', 'wfs', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7GXibxMel5Xwo2g1TFoY5DInGsUiceKcOK5VVd3H4vf61dQoibTT4n6VY75iaVlw1Nns5Jj3ibLPyWFL/0', 'oyP7DwP3qFf6pDeLMNStlmMzVuKU', '', '0', '', '1', '1', '0', '0', '', '1469169789');
INSERT INTO `tyms_users` VALUES ('1113', '发家88', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1ib9Cqp9kDVhYUPXhXJr1rc2rIWDfYg6yf8D2MicwyLwrR52PUsO29TsbQM2UVTicMoeF68jibMbzNawL0QshwxAuT/0', 'oyP7DwF-4mge6UtPVlSq_E6MsV6g', '', '0', '', '1', '1', '0', '0', '', '1469170167');
INSERT INTO `tyms_users` VALUES ('1114', 'Sκy落槿', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90IQ5LDDdKqMhHq3l7WTfSEic4MV4lwicFvk10Ma5nvxWwC5WI9tiac6JGrdGqIeR9Iib9UnZoZlz80ss/0', 'oyP7DwIRqwe3tdq0WQX2wExCaty4', '', '0', '', '1', '1', '0', '0', '', '1469170517');
INSERT INTO `tyms_users` VALUES ('1115', 'David-商城+营销私人定制', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP23zSg88leAPuRsFhyRSykuRFCC4LjPa67gLZppytJuibhQBDmMvmJv0xU3DzOKr5WcffewibxKMvDp3onVyGYLne/0', 'oyP7DwBTE59yP2TtFr6eLswfoIfk', '', '0', '', '1', '1', '0', '0', '', '1469170871');
INSERT INTO `tyms_users` VALUES ('1116', '耗子', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDDlIRiaDFRqqrLQEL3NWMgh6ETEEu3l4bGTeP74GiaGtYolkWAfzD9juCCt6G6CA1PmfqCia54F9vNQ/0', 'oyP7DwBshk7r-jaAqnkt1eIZaHT0', '', '0', '', '1', '1', '0', '0', '', '1469172025');
INSERT INTO `tyms_users` VALUES ('1117', '大马', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAAVOl3p6ltWdmGtVFibaGyyVTEUC5yU122ud6whelFRDRChKEzviclLf9VKLmjG8JxZspWEF648ztw/0', 'oyP7DwFkSAEBswk_qJuYO7tUAVt4', '', '0', '', '1', '1', '0', '0', '', '1469174875');
INSERT INTO `tyms_users` VALUES ('1118', '渊停', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9uO66f5WeMQyszN0XEicekicJd0yK9EswHG9YYKcZHwd2fOFKlvF98fibEtv1pm0gnFicYdj9ZicEZSY/0', 'oyP7DwI_QKgn6QFlpvRUYiJ1k_tw', '', '0', '', '1', '1', '0', '0', '', '1469177210');
INSERT INTO `tyms_users` VALUES ('1119', 'Visual Q', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7qVYCBScY9EiaWBXqxoWNGDIkamK020jRuKeu0MVr3Djt9SJcib93lNC2zwre2NicLH2WiaL49eh2I6/0', 'oyP7DwOCPPw7yUWsepDJ8vQ7SqJg', '', '0', '', '1', '1', '0', '0', '', '1469177781');
INSERT INTO `tyms_users` VALUES ('1120', '郭明征♛', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4EZGwIsWWo2Yq4eYHIfxFlaKOvNsEQsONA3RRT30V8z0FibteEPDUcwMFbAQEia28aPODp7YokJiaE/0', 'oyP7DwPC8jSn-4K24xbB9khzslko', '', '0', '', '1', '1', '0', '0', '', '1469178146');
INSERT INTO `tyms_users` VALUES ('1121', '未来的未来', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UH60VW4mjdPibLR8xSQKtkib4jqQPibzxyLVtGQ3tnc4KHP2mQYNN9DHV0cZh2rZ2KW0EdjjeZFYogO/0', 'oyP7DwAlQLe-JjLFNIZhTGu18k4o', '', '0', '', '1', '1', '0', '0', '', '1469178946');
INSERT INTO `tyms_users` VALUES ('1122', 'Mr.Hong', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJmqEPNmJY6MrMzMMudOJHEFattibWwQdYGq2c7eMpY4xdUOlnBl0P6IvZ2kQRx5E2SSlShE6icASM997tiaGic3tSiasn9BibmFnrKQ/0', 'oyP7DwOZf0H_jusRR5VtfXgdzJIY', '', '0', '', '1', '1', '0', '0', '', '1469179740');
INSERT INTO `tyms_users` VALUES ('1123', '海灯笼Yccc杨', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4awfTtLKwV8OykDbMibhnIXXuqAbvclIduubwP6Alf8Cp9Tu9vXZQz6Y8qUB7jx8Na0QnWQEHezmw/0', 'oyP7DwIAMYolvbmjaNClObP9cDD4', '', '0', '', '1', '1', '0', '0', '', '1469180536');
INSERT INTO `tyms_users` VALUES ('1124', '大魔王！', 'http://wx.qlogo.cn/mmopen/Vau3ibmjJhic393LhW8WDuGQ994q7JnlCLQTAuL6Bd3Oak2RAtSynE0zusmtdmicCKOibtZyk9m4QJUPQa8z8KibA0lAc2MoKTTlZ/0', 'oyP7DwKLHhgGln8rmNIl_Oxq8fGw', '', '0', '', '1', '1', '0', '0', '', '1469181090');
INSERT INTO `tyms_users` VALUES ('1125', '(°ཀ°)都是套路 ', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5tkMGekhvicVzTkrYmp8wdq20yerfTWagVKjKpKGeL6YibBIqNueDqrGmfeKqEMWr4iaFbIAX4uj5KJCRYC7nPpYibBfTtdqiarqc4/0', 'oyP7DwFcs_tmve8GVAd5kBvYuPK4', '', '0', '', '1', '1', '0', '0', '', '1469181185');
INSERT INTO `tyms_users` VALUES ('1126', 'CLU 酷', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4hlu2BujQ8TBts20snKGJmRzbP0ca0bIX95XxK37ZgZTnpvjz9BOOrLAeWJnLGGSAD8Ed9MP3skC/0', 'oyP7DwEZLyEHkAyz8T0uuOExNjxU', '', '0', '', '1', '1', '0', '0', '', '1469188993');
INSERT INTO `tyms_users` VALUES ('1127', 'BMW', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Ia4bfkmHOypGqefqag1iaC1aYXaLiacuf8lRAEK1nQspOuxK6Uvfiamtdj7edUG8HVFNLkR7RcWmib9/0', 'oyP7DwCuOctxiTFYMMmvgOYHDs9k', '', '0', '', '1', '1', '0', '0', '', '1469189367');
INSERT INTO `tyms_users` VALUES ('1128', '快刀老马', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcyfn0wtR3tDGDeYdTvx1ot3u72ncky041a2rRVNOXLNvt9EhpBCX84QoQuzAHTf3OlNUVs8unLNA/0', 'oyP7DwAcQuSW0w9ipcxNSinVG5rM', '', '0', '', '1', '1', '0', '0', '', '1469201308');
INSERT INTO `tyms_users` VALUES ('1129', '', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Sruric2A9MPaCvq6qVg4p3soZs67BqTRbBibMQQNVfpOqRH1ySm4a8QDf2zENPsz2mUSbKa3FyRue/0', 'oyP7DwMip0otwKkbsFddDWuS6Q7o', '', '0', '', '1', '1', '0', '0', '', '1469203278');
INSERT INTO `tyms_users` VALUES ('1130', '毛虎', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY54krP2brcw7CnlhhA33YYhEjaiaWIm8fPJUSXdJxsmFiaBdqvfTonVcIMbySZyG88uia7xxcDiauicPo3/0', 'oyP7DwGgE44ecoetSJsAyWl-nztU', '', '0', '', '1', '1', '0', '0', '', '1469205572');
INSERT INTO `tyms_users` VALUES ('1131', 'Serene', 'http://wx.qlogo.cn/mmopen/Xh3zaoqlqQicVyhI7jfdcFW5UDZW62DAN9uqwSicImQ9kicz1P355wnAgZWGnzSFPwWfZHEqDlqEDPxRPRAY0cf3l3FcOEHleQu/0', 'oyP7DwOE9x--oCQGgboC_-f8Pzmo', '', '0', '', '1', '1', '0', '0', '', '1469210298');
INSERT INTO `tyms_users` VALUES ('1132', '王秀平', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELJDTtXxfVU9hJ68xm6niaiau2d42ibYmYwBO5XWyEcHxjSzXaIicnU0Ta51dBcwmrZllbibz6ZGJNjouA/0', 'oyP7DwNTdQO4aDxZZ7XZEL054Qhs', '', '0', '', '1', '1', '0', '0', '', '1469210663');
INSERT INTO `tyms_users` VALUES ('1133', '樂孝恩', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ibmfG0OXvvbibLrib2kcq9hoZomPkWmN0EdAAzbhHGjYwIgBRCp8rCUVBJJCFbiajulPvEoR0ZOxRJS/0', 'oyP7DwMFJQqr1x35TVLLaBB7mL30', '', '0', '', '1', '1', '0', '0', '', '1469211129');
INSERT INTO `tyms_users` VALUES ('1134', 'Constantine', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEH0raRA5VgrEhUZQoJUu0nbnkeU4b4cgeh3Se9Sjlod091lgoESE5wjicWaRnwTBo27Kwh1slYbRT/0', 'oyP7DwAFlBxU1gtX8QF4FWu_JgCo', '', '0', '', '1', '1', '0', '0', '', '1469232298');
INSERT INTO `tyms_users` VALUES ('1135', 'awake man', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibefCmvGRdVRy5uTialXmtsic0WWD2iazX7R4sbcDcBDfRibbJZfJjBfJItuNTYtWCdsAqWKfmKicqGGV7Q/0', 'oyP7DwOjgnrBAYeuJVGBF2qNJTGw', '', '0', '', '1', '1', '0', '0', '', '1469236015');
INSERT INTO `tyms_users` VALUES ('1136', '龙行天下', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayC0lweugGyqeoMrKYhOkqgLIqbuQicWwRnicibcPQfQky43icn9MibWFqLNc1KJfjEjIiapdkzY50svoY/0', 'oyP7DwIIySZtXKp2JuQbPu8Ip53g', '', '0', '', '1', '1', '0', '0', '', '1469236095');
INSERT INTO `tyms_users` VALUES ('1137', 'interface', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIV2uud2Xstmob3ibHichDxiayx1G1gsyiaB8BXiaWqUlHHqz2GfGibm6CISZvvYicaaicRiaEONQakm4LNX3A/0', 'oyP7DwLgl_hTv99PhTaLfWPtBM0U', '', '0', '', '1', '1', '0', '0', '', '1469239198');
INSERT INTO `tyms_users` VALUES ('1138', '、', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9baDpwtUNKKoKRO3UUicJ9r62tId4KtKeev7N6uibu6H42xMyGsZXPGJ3YOBmrZYKZ7Des5hHWH7Q/0', 'oyP7DwKMNnlUq983Jn3Hk5bpfPkw', '', '0', '', '1', '1', '0', '0', '', '1469242575');
INSERT INTO `tyms_users` VALUES ('1139', 'AAA lvxy', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eFhNk1tGlSdAPTEe4rNp2dmSSVTlL2hHqYhGCHJjaPSXVjHRGRicSRwV5fmoomNkJv0pZ5EV7ibTgF/0', 'oyP7DwHPTaX5uYRShDhYYGTf4NQY', '', '0', '', '1', '1', '0', '0', '', '1469246419');
INSERT INTO `tyms_users` VALUES ('1140', '紫瑜', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90PECoibhKIlO1ofiaDs2OMMANicQ1Kbzeibp1dJic3HvnUiaI23OHmlZsrMuicCVrFhFJlEThuC455Aicvgic/0', 'oyP7DwK7Ze-2916GlaBydDB6hTfQ', '', '0', '', '1', '1', '0', '0', '', '1469246469');
INSERT INTO `tyms_users` VALUES ('1141', '慧谷', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFib4o67d7Jiak3YFb7fv2ibMDQEfXjjms5ntlllVmiaVibdK8Aa7dOTujSxm7PpwbwQiavd0tIlrPOQGJ/0', 'oyP7DwG1tMT6LFG17QaIuKcaGBrA', '', '0', '', '1', '1', '0', '0', '', '1469250166');
INSERT INTO `tyms_users` VALUES ('1142', '毕', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeicuaxm06EmeRCxsEiagpmUv4ZAdgWmLoonHAwqL47xORjX8YOJeSbW3Bvxy4qcVAO64zH8Zy6ldbw/0', 'oyP7DwIkg3yYkF8Zf6vnbjTgSCjg', '', '0', '', '1', '1', '0', '0', '', '1469250476');
INSERT INTO `tyms_users` VALUES ('1143', '', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7P5qbZensUJMhwciaxSqibicwrPCooEMpzDoicvOAw3FT4PB3ICZIia9dLzwmK51bP6ibITcPERNibM393/0', 'oyP7DwMopNhem2IOAYxIXRZ3tV6Y', '', '0', '', '1', '1', '0', '0', '', '1469255848');
INSERT INTO `tyms_users` VALUES ('1144', '空山鸟语', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3nCLeiciatyWISIjtdSVbljoKr6DNiaXNNWhWWf8obicicpdXYIUOOLZHgLtEhNTy1tXJLbyGiaYIyMLJtyx9Per2UzC/0', 'oyP7DwGZrOiiTrzpktPAMu5aE4CM', '', '0', '', '1', '1', '0', '0', '', '1469258530');
INSERT INTO `tyms_users` VALUES ('1145', '\"嘿，伱的益达', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dED6SSQq4U8SJtZgGyYKETCRc7fcLupUhoemurdsxMJZgC2iaSrCeaaNoZhc8dLyJNqF8cednrnLbz/0', 'oyP7DwOeA7QkJw8QCcwK6mILrEy8', '', '0', '', '1', '1', '0', '0', '', '1469260242');
INSERT INTO `tyms_users` VALUES ('1146', '王晓义', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3cpERba3B4P7cDibicVLHBVibIxT2NB5AbxZQYGZlTMfepEZ69WvedGaibbicBC8ibHxWSSyL1Urj3whTs9TAZHNNaE4/0', 'oyP7DwK7qasu_h-BPYaYwQwo_5ZY', '', '0', '', '1', '1', '0', '0', '', '1469266787');
INSERT INTO `tyms_users` VALUES ('1147', 'Y', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJkqMmMeyKYd5SGMk0EaXgy8sBiaZqCJQgPmcTM2SSIw5fJzKkrgB0HYVUSibfkMSoyODkP4LS46bL/0', 'oyP7DwJvw9d1m5VPIy8rJF1gw-n8', '', '0', '', '1', '1', '0', '0', '', '1469267369');
INSERT INTO `tyms_users` VALUES ('1148', 'lol', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCCrFjp4UcDUX19RCianCylNhiaHvRPmP2Nh4dPXqTuYxPEibgxdorX30Mf8hplYneo6MU4gibU7BV3PA/0', 'oyP7DwHQiEy19jinftnOpjRUUGtE', '', '0', '', '1', '1', '0', '0', '', '1469274022');
INSERT INTO `tyms_users` VALUES ('1149', '张杰', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UJOFxTgHhjZLV6AuU2skXhv4bxlmQOKgFS80V7B4LZtG0icibQ2xSRGibleOSF8WWgN2e85HWqupC7E/0', 'oyP7DwM5ImT4s5EVKuDlML6NAbDI', '', '0', '', '1', '1', '0', '0', '', '1469282631');
INSERT INTO `tyms_users` VALUES ('1150', '奕水', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGia7Zic9XR92Ry3CEwVuOv6DMLv4SkMhsQLtdB6s7icsZ7bC7ynnLJSaT8UibtNOUejiaQBIkFeLkXNV/0', 'oyP7DwMxYkJWw0CTD-6SpfPw9f2Q', '', '0', '', '1', '1', '0', '0', '', '1469289506');
INSERT INTO `tyms_users` VALUES ('1151', 'AA_影子', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0jx8AEiaKQgBwpw2M9DDicdFxxj6VqplXaDlkMRKWL27NMcvWXpf6BHMS4LTGRLQsnD08LM9iaVQcujjJwgVAjuJN/0', 'oyP7DwO8KT3zKPwMwmgQgMHN-0uc', '', '0', '', '1', '1', '0', '0', '', '1469294533');
INSERT INTO `tyms_users` VALUES ('1152', 'A000狗剩', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Yhd94oyjRXLcmXic29TiaR60tMibgl0uHyoheObgqbvmx4GFhS5OBibZLpeACWNBib93QMmsogeL2PHx/0', 'oyP7DwJHMNfhMU-MtFN2cUfMGt-8', '', '0', '', '1', '1', '0', '0', '', '1469297340');
INSERT INTO `tyms_users` VALUES ('1153', '沧州立美网络科技有限公司', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlHvg5clG1ia6LjqBHsicU5eajKQRrogDs71dBRXbtdpmaicd5ws9DRQr7SiaiaQZQheopD0OibUd9vSoF5/0', 'oyP7DwBXjoWnoYS51gFd8FAc-ed4', '', '0', '', '1', '1', '0', '0', '', '1469312093');
INSERT INTO `tyms_users` VALUES ('1154', 'Tony', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2tNtibZHadCqmZUTsKYic3yduqdYLY0GjRTFtVFo1qZpiaPbQu3MJiaGGbgxrXrzJTu1gbu3PFUwpTMaXVhR3RMV7C/0', 'oyP7DwCabWOG89uh5Jr5fGrPVEc8', '', '0', '', '1', '1', '0', '0', '', '1469332183');
INSERT INTO `tyms_users` VALUES ('1155', '箫声断', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4wccwCIovkZbqKU9y88jVd3yuxTh1HLWUeYvcOTnx1ibcibf1RNpglMJqhlAWn9789zxSQiaKUJ9uMA/0', 'oyP7DwBbaL6y2Ffv4Nh1uXOzTY18', '', '0', '', '1', '1', '0', '0', '', '1469332485');
INSERT INTO `tyms_users` VALUES ('1156', 'SＭǐlêヾ封心℃', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2VfqevYfRkEK2LKt1kcJAsGnypKyMvjnYp9prpcHIS3Slqj6CWMxdgUmT3tXtOaPEqibo34fqSzMA/0', 'oyP7DwLG5V3MrOSTyhSCGnnNJwWc', '', '0', '', '1', '1', '0', '0', '', '1469332736');
INSERT INTO `tyms_users` VALUES ('1157', '易善满', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4nYXZT9FG7Oico835y4L6U73v6LqCeLy7qql3YibeTrjwqHXNLSoysGv0D8zONnZ5goADxbSL94o9Q/0', 'oyP7DwAK5hW5p11Q0aMSWTm4K9BI', '', '0', '', '1', '1', '0', '0', '', '1469345350');
INSERT INTO `tyms_users` VALUES ('1158', 'API侯杭圳', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UNg8dgIL85hYOQye8GQPjbt2RBPQ7GlOIuK4NwiahiaH4Wgk5UkiaY2agQ3h3P9v6qicY0zeBybONdy9/0', 'oyP7DwLb5cWScThKs43vQFeNNu3c', '', '0', '', '1', '1', '0', '0', '', '1469345676');
INSERT INTO `tyms_users` VALUES ('1159', '松', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEISPYEFX0tPFib74zTTSHVxP1z6LyWwsdwnb6MPaHEsLWTz9yqLwOVAtoy2akoypsYwjZHkibuEIicYA/0', 'oyP7DwBy9HhKvIlIypzycjWcNoa4', '', '0', '', '1', '1', '0', '0', '', '1469350883');
INSERT INTO `tyms_users` VALUES ('1160', '大', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0W4qnsGYOZdEHy6tia55vzDHZJxk3j94rZTEQcMEL5yknpjUOiadwSuOyovyTh4Mwe4ViaxnlTRUVTE/0', 'oyP7DwGoJiqnop_XO0eQmLx4GJ_Q', '', '0', '', '1', '1', '0', '0', '', '1469355565');
INSERT INTO `tyms_users` VALUES ('1161', '天晴了', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAA6JFucoFMvqW7zWNH08hV8vur2PLKiabMkoMGhwAw0m5z1YpHoBbecfltKJibQH7aWXzeUde0Eqww/0', 'oyP7DwKT86nfa7IzajCZTry6xorY', '', '0', '', '1', '1', '0', '0', '', '1469360900');
INSERT INTO `tyms_users` VALUES ('1162', '如果。', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eLQZR122wkia5ibzAEQHeic23gn3NcoicrEX4WqtQ3ly1rZNl5vrU2movsk4eX9lSWs4JR5DASiazhfiat/0', 'oyP7DwKyv9srnnubcwz43UeubnWI', '', '0', '', '1', '1', '0', '0', '', '1469361286');
INSERT INTO `tyms_users` VALUES ('1163', 'H', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1fA2hKVheHJecsVmcSX7do9oc9S7yL0lzP25RiaOSTgZeaKqyX2nyzWT0TMlD4Db6Gk7OkkgUjbHwYKiaIgCBW8D/0', 'oyP7DwLGtMGQ-kYXO0tXGHJedZ0o', '', '0', '', '1', '1', '0', '0', '', '1469368235');
INSERT INTO `tyms_users` VALUES ('1164', '狼狐恋-吴同学', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELhunmEuw8richYBfmTNrZ7z1GgahOXcHxbjl2dahgYQGwVibv46Zopbv3W8MCvaQArpw2p2qYPbwnQ/0', 'oyP7DwFUI3BbxCb2rTU5R6GoTbrw', '', '0', '', '1', '1', '0', '0', '', '1469368986');
INSERT INTO `tyms_users` VALUES ('1165', '逆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7xpZ66b4HTOicymD1Z32C5Z6icDx3OUuGCd0UtOLbdcG5kn7bCEnJnG8QGAqgpFxTmQ5zYV6Z9Q1Zica7liab5Nxsj/0', 'oyP7DwDHqnQidZ46XrKhBNOyTXH0', '', '0', '', '1', '1', '0', '0', '', '1469374012');
INSERT INTO `tyms_users` VALUES ('1166', 'Denim-杨扬', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90OYeFDn7BchpxyNJ13YXBv3zje5kjV7leZftbMANibB2wKxrr3znYpYlLdtfey0PF5YKThuibqNsrs/0', 'oyP7DwPnlZzMs14flbJhcObA-KTY', '', '0', '', '1', '1', '0', '0', '', '1469374705');
INSERT INTO `tyms_users` VALUES ('1167', 'Austin', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Dj8z2NsKrlCZC0jvD3gCzTfibgHFZxVAoNuYxOqg7Tcr8K5uh57GLgGXKAtamntplzAHLuo16tZL/0', 'oyP7DwN3uyg2PQWy1m5egEFxqlg0', '', '0', '', '1', '1', '0', '0', '', '1469409368');
INSERT INTO `tyms_users` VALUES ('1168', '谢川', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCUt8rQIGniaJgGPOzCAs1Go4ib22hk8a6LVKAibranw7IdEk6Sia2ibXhRDrc2J0g4aCibftnDG81MTncw/0', 'oyP7DwIPRwXHBrrJfM1mAVJz89AA', '', '0', '', '1', '1', '0', '0', '', '1469410449');
INSERT INTO `tyms_users` VALUES ('1169', 'oldliu', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6pUKWwBTDJc4iaTdC12tHdmBRTHePL8n2J5WTqmjUiaSeCI0iaAeDAsUn5xyKNc0vLvgM5FLrWoUsdA/0', 'oyP7DwHEqzQPbEl0DvNEDYWbat28', '', '0', '', '1', '1', '0', '0', '', '1469412526');
INSERT INTO `tyms_users` VALUES ('1170', '何某人', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3AVWLIm8sWGqKuOURrTaicr0QFoUl5deAdQOKGJnhBLd94sVVq7hpv9KpCfVYx32WjpRpGqckva9ibJm564beXUl/0', 'oyP7DwIlfFgTmJmnOaChcqbVsjq8', '', '0', '', '1', '1', '0', '0', '', '1469415305');
INSERT INTO `tyms_users` VALUES ('1171', '春生', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP35K9PznClRcPWK8iaictTJdR7rHqMT1aYK9FuoEicIxYDXy5mKOCTd666qUSs1LFx78tIozLPxnUNYg/0', 'oyP7DwJMUJ77PZykq6AGulKjkapY', '', '0', '', '1', '1', '0', '0', '', '1469415458');
INSERT INTO `tyms_users` VALUES ('1172', '晏丹强', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7TtkFKDztuaWqLpicBmWq6pmDG0icXB4xBYjOibFUYZzwicFnXiap4TeHE4UInFYlDr9FZicZGkvUNe0d0jfz1kKxO1ic/0', 'oyP7DwFhivYPsipMoehI5VxmsR-I', '', '0', '', '1', '1', '0', '0', '', '1469419114');
INSERT INTO `tyms_users` VALUES ('1173', 'A智慧医美 魏晓生', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAdrDAlfyD8AbZ3PJB0uV3xJZoeiaxQpEpvLyuMsMtBXrK73KhvHHecnSnyy7wJk7KpKwLQAxicHZhw/0', 'oyP7DwHfe2WqcjMnIoEPllM65J6c', '', '0', '', '1', '1', '0', '0', '', '1469419129');
INSERT INTO `tyms_users` VALUES ('1174', '陌上花开。安', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0eHEfBSuyvmd5H3kfRFQ8O8GaaQg9mAU2NV7jf6o7sVv9z30ibWL523HIicib3w0DIsz9dN6lAjTlJr/0', 'oyP7DwJ8la0q1nLEBj-K4oClYDD8', '', '0', '', '1', '1', '0', '0', '', '1469420987');
INSERT INTO `tyms_users` VALUES ('1175', '道録', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAOabjib5nlLe8Dxs159PXb0cicvtKKfBeb1eNaU77MnvJVoZz4jhTpnaD6Y1hlcQobP05euEm0yHFg/0', 'oyP7DwAuQt4oanyoqDlxy8HuXGxE', '', '0', '', '1', '1', '0', '0', '', '1469422079');
INSERT INTO `tyms_users` VALUES ('1176', '愚木', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibe4T7lrYGQ1K3FpibAUic8ICBX8kSHpsUJnCm7naYzLunWiagGpR6h6KLSCG5tAudERwzJEf3zmgn0cw/0', 'oyP7DwB07hLueIUzxGtYHv1gqAOE', '', '0', '', '1', '1', '0', '0', '', '1469426168');
INSERT INTO `tyms_users` VALUES ('1177', '君宠', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UHTwRr2HXTw6HSTZ1VnesIyxviaxw176KrBfSfNgRVh8A3ZiagD3QUfgKvJodaxJYVrBVs2cedYomP/0', 'oyP7DwB0wkBFhx6pSaIgWJP1sKL8', '', '0', '', '1', '1', '0', '0', '', '1469426513');
INSERT INTO `tyms_users` VALUES ('1178', '阿苏_Soda', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2zO8PyhEqJPR6mib8IVh7CFicjWmS9UP6ruEULlA8XtNyBwQmZGkiax4K1ibGARnddIlm00icC0RkPiaExRYe3qKuOZP/0', 'oyP7DwC3xSmJDfxakZETyXvrO0Gc', '', '0', '', '1', '1', '0', '0', '', '1469429463');
INSERT INTO `tyms_users` VALUES ('1179', '威尼斯的眼泪', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia48O81TAySaspj9NQqwxL3Ea9qswvfKorUZZF5B2CickQWPict1KLYCw2Ciaw1sI8IXQcQCvREiaOrYZ/0', 'oyP7DwL8NeNTTDZLHixMhOyb5Fho', '', '0', '', '1', '1', '0', '0', '', '1469430088');
INSERT INTO `tyms_users` VALUES ('1180', '铭建', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECwr2nfssOcagiaEALv7hdshjZSTK4wtGVyfw2cqWdOzGcAAGHP74u5iboIOUE3SYTktDaX5Ht3W0T/0', 'oyP7DwB3Wt7yPbpMWtNddUvlN4C0', '', '0', '', '1', '1', '0', '0', '', '1469433438');
INSERT INTO `tyms_users` VALUES ('1181', 'Superman・㉨・', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdgq0BFBiaicgjXqfWic8VIV9jOVTkL0eX7daaGpu6yZIia4DWBkePeB2B8S3ncyfMvXScowWdzr42TIiaeUF53Xib12tv4yHPHnOtPw/0', 'oyP7DwCSzYIQwsIimjd_MmMg3iHk', '', '0', '', '1', '1', '0', '0', '', '1469434413');
INSERT INTO `tyms_users` VALUES ('1182', '智慧沂水', 'http://wx.qlogo.cn/mmopen/8k2ic7h02SFJPGCHGdO0Q5eMKMje4aYlgiaRsfia0NQiby7yMtxYvr88tiaOiaicdCP4spKIeJHCYkoQkvRxicibiaKDDpWcxIcMeDQl58/0', 'oyP7DwN3k4klsAOGgEuTnJ10AM9E', '', '0', '', '1', '1', '0', '0', '', '1469435279');
INSERT INTO `tyms_users` VALUES ('1183', '思”甜”', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2RTDWXibQpp11DUeKLcyOXns30ghgppeFr7HHs4hGrOMPv5BNnkOZbk5dvR25rfLZbnX8dpEeXGzGuMd8Aer27T/0', 'oyP7DwJ2HgjcDKxAIYGlmdJzyR3w', '', '0', '', '1', '1', '0', '0', '', '1469436305');
INSERT INTO `tyms_users` VALUES ('1184', '小西', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJhYEUuIMWURhPwfkUShjibcibJrDRXRpgONMQyibhDEjFOpGttxYydbeFtpzT6JRjv9GjoU23gX3bX/0', 'oyP7DwJ_DlYDF6hiNchnlrYMR3Cs', '', '0', '', '1', '1', '0', '0', '', '1469449776');
INSERT INTO `tyms_users` VALUES ('1185', '张祖武', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2OpUK2W1vqrSBTulyX3PVZyrznibgErHyiboArf4k6b0qicibA8bibWXm7X2DemNf6xfG4LyicL2QkAceUNQmh3icI7bic/0', 'oyP7DwNMbAX5KCmDqhJVSOBD5X04', '', '0', '', '1', '1', '0', '0', '', '1469449789');
INSERT INTO `tyms_users` VALUES ('1186', '杨怡婷', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6FaWhUCmqCRtvK1CwuFQzwpa5xIuG6MBukoMBeEu6ib5fc7aJZZnSSF0n5taTkQDW2zpI0icFmrCh2WLLvZnEjX1/0', 'oyP7DwLEIygY9OheP-gJP85aVYNA', '', '0', '', '1', '1', '0', '0', '', '1469449974');
INSERT INTO `tyms_users` VALUES ('1187', '智诚', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia19BOgLtRhfdSpt6BvPIgmcTyBeVicDeF0ibhfjrVOibmtZCJ6xQPv9ZDdtchkYZ2ehdSzn5h3wcFOZ/0', 'oyP7DwFbacoW3sJWDycTkQTBeEgc', '', '0', '', '1', '1', '0', '0', '', '1469450110');
INSERT INTO `tyms_users` VALUES ('1188', '尚雄伟', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia97Uv9WvnCvpx2Ncn77w8nOZRzSMicVKv2yKiacCSCgE1VTiarDbzVHbVmS9U8hsX0qUic5Bk71yH3RA/0', 'oyP7DwDQ2d2ZcJF8noz-1N1MZsQc', '', '0', '', '1', '1', '0', '0', '', '1469450705');
INSERT INTO `tyms_users` VALUES ('1189', '紫蝶之纞', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UGgvIyZIvaTEGyekU0VH5wgrAeZIMCtAXgl0A1TmaicYCQpCvHHhDZFCGajTv20Fiau3PQxKdzAEXQ/0', 'oyP7DwM88lIaAr0Ma593LK188-tY', '', '0', '', '1', '1', '0', '0', '', '1469450811');
INSERT INTO `tyms_users` VALUES ('1190', '（default）', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3a9oPHv7OguvneK4g6BibLWsVH4aLmumL5G2icAxBH9Q73icxbE95vsTNG2qbGCjJD1YjPkLaWZVku9IBOGU1tP7d/0', 'oyP7DwNm3TlCC0xOSfrcoNCBgdQw', '', '0', '', '1', '1', '0', '0', '', '1469451459');
INSERT INTO `tyms_users` VALUES ('1191', '张国苹', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ZNzGlbPUECeAWCDKZgfr5dF8LoGsgnFQsg9PRK4d4N30UJuuRibROCvXgxbnD5S6dKGkJsYEBWX8ibOeXuRPibhq/0', 'oyP7DwLgoU06Oj-BeQZZMJsSorAE', '', '0', '', '1', '1', '0', '0', '', '1469456252');
INSERT INTO `tyms_users` VALUES ('1192', '夏日清晨', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2fwkU8ULUXsjdUfcIk3z6S9aY18PjcpQ2b4rk1T2RwjA0IibZIQIE3EiaMcryoA7jNqL6vheLJEDIUsNj563rpO7/0', 'oyP7DwF8AqazuKhSBQIr9hUGg1aA', '', '0', '', '1', '1', '0', '0', '', '1469458776');
INSERT INTO `tyms_users` VALUES ('1193', 'り獨寵♡潴婆', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBYOJwAel9KwPrzMcjEPs0sIpZdNYiafqwv9yZpsop5XhtibwH9VvmTWJmnTVNEfV1tA7FX8demLncg/0', 'oyP7DwHijn2xp9DWrdptZRERuYzA', '', '0', '', '1', '1', '0', '0', '', '1469491234');
INSERT INTO `tyms_users` VALUES ('1194', '雪中飘', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibe1G9viaLcYb6oFlNlam6zHzaFWkdBMvj6JBoTFBM68tkXCS909quiccyPiaMicecyibBhlcibzk2bKicD111t7fhP7icbm/0', 'oyP7DwJ2XhVqnKjALB968j-5ktF8', '', '0', '', '1', '1', '0', '0', '', '1469494686');
INSERT INTO `tyms_users` VALUES ('1195', 'random', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibe8VaEVZ8Nn7vZMqDLibNaN699baZsPhdXDicjYJyDrOAjVPhhQBV6T8TzAucTQzw0est4CSd7xd8Lg/0', 'oyP7DwEdp8dNjIKO523zUSDdwrm4', '', '0', '', '1', '1', '0', '0', '', '1469495464');
INSERT INTO `tyms_users` VALUES ('1196', '邱斌', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0E5alz4hy8ibicj8HhJPbFSibmYcmGtDfg7ibK0dFSuEhmpeJ1hRUybIic3UggcLgGjMUQDPPONiczApMGWLPcQ4ZZaQ/0', 'oyP7DwIlYXJKiaomAfi2Xm-jOX3M', '', '0', '', '1', '1', '0', '0', '', '1469499641');
INSERT INTO `tyms_users` VALUES ('1197', '雅柏菲鉲', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeY6SZDVsQgHGDyVX9e0IC3CpD95mibXwqOZ9jcuCHPeftIuEzow7tbbic1NSqxsjtSUxLxpFicHDNwIJZQxkgvIqO/0', 'oyP7DwLcCXOV4qj1BNkU4NBLdU_I', '', '0', '', '1', '1', '0', '0', '', '1469502162');
INSERT INTO `tyms_users` VALUES ('1198', '微虎电动-黄树振18552851111', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2nD4vmrvxvzaTJYSxx3JdibquVGgoUZeDwUAZ5Hz8bZBapz7UotmN7Tr5ZEyRziaRU7EibpbN5QpiaCA/0', 'oyP7DwKRogsE8Kdo58raBmwosi1U', '', '0', '', '1', '1', '0', '0', '', '1469502457');
INSERT INTO `tyms_users` VALUES ('1199', 'Wei', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qra6fYgEAPloWOGVv55Mk5aAnafZjFHuLwh1BJiaGL10eqib0Z31oq8muIm2Z80d4xHqiaYhhdyCnbWgE/0', 'oyP7DwCSnrjlo6Yrs2iZB5OTZRsY', '', '0', '', '1', '1', '0', '0', '', '1469503342');
INSERT INTO `tyms_users` VALUES ('1200', '童公馆 强强', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3pqJw4106ZDQPiaRtdicTe0YW91w4V3okjXoHr9eqBCoClPf3jsv3QW0ZCqM6nEEqxeeG5lCkNAvRlrrDOjmJM6R/0', 'oyP7DwD0ZleaSnqjPjv18Lg2Q40s', '', '0', '', '1', '1', '0', '0', '', '1469503837');
INSERT INTO `tyms_users` VALUES ('1201', 'A+刘远宏', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53yqsgZR9c2uAyM7iaS0aWwe1eAuP9xnYWvKu8O5Ls7VxS4KT9xB8QllQTOWAib96zgsPCMtaA7pZN/0', 'oyP7DwPDn9seQ8rIJ-RtKKO2KyR4', '', '0', '', '1', '1', '0', '0', '', '1469504365');
INSERT INTO `tyms_users` VALUES ('1202', '演绎别人剧本', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia5TsGw8eVyDFoBtfj2cToSgKr9E5wJaKlnSym3q3XLAGDZrmkjmNlnG6L8vWrXI6F7NguMPg9JUz/0', 'oyP7DwKnX3k3_QwQHGV9FK5yZvZ0', '', '0', '', '1', '1', '0', '0', '', '1469504469');
INSERT INTO `tyms_users` VALUES ('1203', '张工', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4JRgAp5blkfWkrQDVRmcWthVz4zuNrs2iaj7Um0q6GhSCbo1aMfy48X7nuWWQIzwaxFu2BtUhlRnt5UWuxIicvibz/0', 'oyP7DwJwrj_ptbY5V0N6Ldzmsf6I', '', '0', '', '1', '1', '0', '0', '', '1469504489');
INSERT INTO `tyms_users` VALUES ('1204', '王成春', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Mt1wgwHpCDUSvuYpx24ED9AmzFdg41WE15DKa7Y63l3WUfUnH5g7QbTXPS7AdqicPeQpkGMNANpX/0', 'oyP7DwM2AWZPC9mJrhoMex459TMU', '', '0', '', '1', '1', '0', '0', '', '1469506121');
INSERT INTO `tyms_users` VALUES ('1205', '顾健', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawHQgUTOfWbQUnj7HoibnqGXKtYTYWWsCJNWDrQV0d8lO1YNH2nUMia3WZrnYn2Sm3Dl2UjxrnbicP7/0', 'oyP7DwGV8AwRBQSwhIs6Hp6aXH54', '', '0', '', '1', '1', '0', '0', '', '1469506268');
INSERT INTO `tyms_users` VALUES ('1206', '王鹏', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90PrvkfnzFeHicL9mTImZVWTE0Cj5jtjlcem6RyVUxTBlEEJAFOqCwvOAFLpIu6CemyPEpVgxbhET1/0', 'oyP7DwOfYAZ0FHdlmaLI4WE-fZzc', '', '0', '', '1', '1', '0', '0', '', '1469506589');
INSERT INTO `tyms_users` VALUES ('1207', '安途生', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicrlWzRNyt6nziaWo9sHE6YicibQVCBicU2KV9AaJkzI2ib3eNO5zq3WJCuibgjJicPPlQ8bRqaAvwHqoRZ/0', 'oyP7DwPetSMiJHKjoiPfpj4TA2_g', '', '0', '', '1', '1', '0', '0', '', '1469511185');
INSERT INTO `tyms_users` VALUES ('1208', '枫叶林', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELQPD4MDfRow0x3yMwc3vBsJ7ibrQiaHnls2O8c63C2QWQuo0IgnRYlf0snHDmLS38NafMkxKFnjHGg/0', 'oyP7DwO_I94nyzFzroLczX-W8wpY', '', '0', '', '1', '1', '0', '0', '', '1469514641');
INSERT INTO `tyms_users` VALUES ('1209', '李昌平', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3UGiamCvd8JUmJ6BxicaI4UShTiaKwYnLSx9y4hcU4RFeCyNicgvDQaq13B2HvIC1oU2f4IFzCR4L3mA/0', 'oyP7DwCOnf3nSb1ipJb_IYehOpnY', '', '0', '', '1', '1', '0', '0', '', '1469517459');
INSERT INTO `tyms_users` VALUES ('1210', '宝金', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKPeyZJLSNPHsRB6Yot7b453T6OyeibbiaRgP5F8B2QzejXia39NHy7eZb7WqsfLp1R99T4WPEYiaTRs/0', 'oyP7DwM-b3DidfuPIURIN7MRfOzA', '', '0', '', '1', '1', '0', '0', '', '1469519024');
INSERT INTO `tyms_users` VALUES ('1211', '遗忘的回忆', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ftX6UU0xPSeiaIibIMTBZVZJOqFIxcex432W5J38pyTQESjBmVURUriahRKGb9qN4KyB107JxdSySQ/0', 'oyP7DwAJSdHLVFHUrpTBZdczryb8', '', '0', '', '1', '1', '0', '0', '', '1469519987');
INSERT INTO `tyms_users` VALUES ('1212', '韩韩', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0cfUJeSfxgywXBUaiaiaceTVQcyZGwsBFOrUJQVGOiaZEJNibPmeCHtl4Ts4O6db9OnxibxzicQaHoPTlZWdDSAn1Cic6/0', 'oyP7DwOoyKjQ7bdROFls-RGdOFfM', '', '0', '', '1', '1', '0', '0', '', '1469520284');
INSERT INTO `tyms_users` VALUES ('1213', '唐僧', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0T85d5qlW2GrXrXfvuRfjjHR4u90NjYta2oibEDSibAPeBPCFD1G01B8E5g5LSDz10ME7Ra20rJXoqd7ZMMicHrwy/0', 'oyP7DwCl4U0HYmkbDYcIrocz017Q', '', '0', '', '1', '1', '0', '0', '', '1469520327');
INSERT INTO `tyms_users` VALUES ('1214', 'yu', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibtHJQ7mPY6OsZd0Xq6jMqHT6x7y2YgvyqFIzLCpo7V3J5wu9cEg2kUkvtKkQItGAjHiaVSrrvfDk/0', 'oyP7DwJxl3i9GWguVLIQ4rUysH3k', '', '0', '', '1', '1', '0', '0', '', '1469526452');
INSERT INTO `tyms_users` VALUES ('1215', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7YZq1qfYnpSXuWqre55Le14GmGY51JiaHre3zjpbBS6SSD5I3ypt8ibEfcFyhEVnUgAH5h4Eu3mfDBwbtC6TjTEUKJUKa3myQ4k/0', 'oyP7DwFIWqAp8a3KVJXxJVZ05AKA', '', '0', '', '1', '1', '0', '0', '', '1469527997');
INSERT INTO `tyms_users` VALUES ('1216', '勤硕电子：U盘,固态硬盘,移动硬盘', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0kLqYjBLyrtaAG1xia8qGvkIickNWvo2bVNuKrIozqJ2mCCvOxGnQKd4tDKZ6KUfCOyaJ0sUblTS77LnVjtTd8WP/0', 'oyP7DwCsn_lktl-HZs5-o5eHNRV0', '', '0', '', '1', '1', '0', '0', '', '1469530167');
INSERT INTO `tyms_users` VALUES ('1217', '李峰', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VbicQtQskNfUamF9QageR5d95AcTlDdwP8yWeic1OZK30scG7YGCrgs9AXnibXC9PicrPhlchhJfNtm/0', 'oyP7DwFBpPjZHq9oAl0uEEbLE-G4', '', '0', '', '1', '1', '0', '0', '', '1469533105');
INSERT INTO `tyms_users` VALUES ('1218', '尹山雪ms', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKQRRN6kwNJlTiaUrX3Xtbxicah8drT4zyVJGoqKOmPVicvX6qv6j3gVOamia40goZYwibCXsALZKcLpiaQ/0', 'oyP7DwNxlW6VjHg3vpgkHqjTXZXo', '', '0', '', '1', '1', '0', '0', '', '1469537797');
INSERT INTO `tyms_users` VALUES ('1219', 'A0阳光', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eLQNQwAFKGPY2ezu1RKVNEMvQWyMNvP1mia6icsBFrmKg7xibTJ9Ma0DRFBsmZ2SGfE09icOIlh6Z4VE/0', 'oyP7DwLSOOUdA2xp-PEsiidwvg1w', '', '0', '', '1', '1', '0', '0', '', '1469538384');
INSERT INTO `tyms_users` VALUES ('1220', '今夜将我遗忘', '', 'oyP7DwAfMc_JgkCbn2Z834MWu4O4', '', '0', '', '1', '1', '0', '0', '', '1469542294');
INSERT INTO `tyms_users` VALUES ('1221', '宇→_→过天晴', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5Jz91Z7PEJ5rho5tSLJXsu151QSzOickgJicrSL7Sls2IPgUibag86aLX4353ZmjJZKQ9w1P0LQHC2icRLhRG2VWdP/0', 'oyP7DwJJo3-FlvGuwlBjJEz65h-w', '', '0', '', '1', '1', '0', '0', '', '1469543423');
INSERT INTO `tyms_users` VALUES ('1222', '白燕先生', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Azc6J902aCl2paBNHiaFa576ckU9pJeYvxQp9ibJk1ojdbN6oWpQuGzyvgicKumDjggEqGkBIniamhe/0', 'oyP7DwPkyoZxZEU_wo1-IhYeCMN4', '', '0', '', '1', '1', '0', '0', '', '1469543974');
INSERT INTO `tyms_users` VALUES ('1223', '萬能青年單車店㍿', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5U2a3syJha8y2XfQpFQNZvAjfeIQja7vmnEbEP8WR5KKjVAPvt9JAN7OTQlhHYkMgTyIJ1ocqGPnxrlCicZrRHn/0', 'oyP7DwJUgGuJ-ugfNFNkv1cxeTUY', '', '0', '', '1', '1', '0', '0', '', '1469570016');
INSERT INTO `tyms_users` VALUES ('1224', 'Lethe', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4mvHMicq4EbxSCjUiapRrEPTBRkHXxvmenR9YhLeibGAaGAl2nv928XcMYPMM8anXNjgLE4riaHWgOqRw3JTewjOGv/0', 'oyP7DwP09KLnlFLr7UB5YYPKav0I', '', '0', '', '1', '1', '0', '0', '', '1469578082');
INSERT INTO `tyms_users` VALUES ('1225', '小旭', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1iaVItM9UVXxQQLmxUx0oFicRGp9noy0drruOq9SDNkiagqv5Tof0PE6BZHIWSdEribIolXoUXTe8MFleK9LK0w8R6/0', 'oyP7DwFWngRaZspDBrYtdsp3fInw', '', '0', '', '1', '1', '0', '0', '', '1469582930');
INSERT INTO `tyms_users` VALUES ('1226', '修亮飞', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0X2VqKNGzq6v95yG6YYF2sg7Fg0SL9x3DSr5zibQvh6OwRXxoNCFgqNa6NaJBRjRjOgGJ2oTBooXU/0', 'oyP7DwG1gX8rGU9YIFQfHUyPJMjg', '', '0', '', '1', '1', '0', '0', '', '1469586796');
INSERT INTO `tyms_users` VALUES ('1227', '开始', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6j81xv2k4gBMFkNTSm11GC3fhhnicOibay71GUU3daU7UIl4JRATicW1vyqrhtZibUmrvh5tVe7j2Ijqpq5X9VR3q8nhMLT6adrVQ/0', 'oyP7DwFiuU2jDsL2D3eH4xEU_A10', '', '0', '', '1', '1', '0', '0', '', '1469587513');
INSERT INTO `tyms_users` VALUES ('1228', '小米', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEM1b4HiasicV36v8Egic9bSDMiaYtthxsdOD6jzxk9f5wBuibZIz5HshblqsY0ibg82WXicwLQuGAgMg23h/0', 'oyP7DwDlMHxePk1PlqfQI6c6EYsI', '', '0', '', '1', '1', '0', '0', '', '1469587639');
INSERT INTO `tyms_users` VALUES ('1229', '祥祥', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlIIeTEv7CWKwicVOknUxGHxUcKv0e4jRosfFglWHic2tibnYR1WCicBXe1TBJvib7lWZH1tiaoyct0XwfB/0', 'oyP7DwOQUPOYO-rIP6hAk9OBlo8Y', '', '0', '', '1', '1', '0', '0', '', '1469587801');
INSERT INTO `tyms_users` VALUES ('1230', 'Judy', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayJhjwpOpUyOHflbibKKsqvoBfoQEoLuPV6CGAJqf9SiajzzNhrkicha8rQl5LA2sExtUVyjjyhFcCR/0', 'oyP7DwFNGsrIMsehDRARVHY_iPXI', '', '0', '', '1', '1', '0', '0', '', '1469587814');
INSERT INTO `tyms_users` VALUES ('1231', '程昆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMSDXOrmIQNric99DFvIl2trxz1HYJxibC5Vzzg30ulKknICenJ7paxsDEHCdfTWsBfDIqRm81b86q/0', 'oyP7DwMurbu8cEkOaXp8rvbStjJk', '', '0', '', '1', '1', '0', '0', '', '1469588557');
INSERT INTO `tyms_users` VALUES ('1232', '骏捷洋货商城', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1GsgDEGMUiab2s0djZwx1kOGnYmIE883n4GxsKs5rgHWtMpwOVJYmVIzXAKJ1nmrZQW4hO7abN5o/0', 'oyP7DwIDzflGXMEZP8FfQIoffj3Y', '', '0', '', '1', '1', '0', '0', '', '1469589194');
INSERT INTO `tyms_users` VALUES ('1233', '☆石磊', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBIicDibjwhd2ibmV78EhPwlTOHBPkpkhZ8jNpIzBNXZlLHFLvsriaYiaK2gxMnxPtMdSLvHDogymyG4tA/0', 'oyP7DwJ5FbcT17AQxyLHw2va0yOo', '', '0', '', '1', '1', '0', '0', '', '1469589779');
INSERT INTO `tyms_users` VALUES ('1234', '谢甜', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0m3ReWhXJUHFRZricPVVGTIpzx0ot7CJCHJSia1BVqK18iag481wNm5nmzp5kU6hx9q4HVOFK0rbjLD6Gy5pDrvcA/0', 'oyP7DwLwOG9m5LS5YLXrwU8D-wYE', '', '0', '', '1', '1', '0', '0', '', '1469591698');
INSERT INTO `tyms_users` VALUES ('1235', '范俊广', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eFc7fib6lPBKZJ2HxWxBzDL1mjzoRcTvXIniaQMN9qzJeYLfZEPjEaAScPky0e7avodxjyuttBLpVC/0', 'oyP7DwL0bA2znrMwD2aCAxWmE63E', '', '0', '', '1', '1', '0', '0', '', '1469592978');
INSERT INTO `tyms_users` VALUES ('1236', '羊羽', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5x2CCSvYynOjdvH4CMBiarnOqpjV8rvRnssEviawlQS42ZNU15KHxvCkCdnJ0UjPgC5hDH0ezxTiceib/0', 'oyP7DwEz0GGt_qgxmLCW21l1kU9o', '', '0', '', '1', '1', '0', '0', '', '1469600562');
INSERT INTO `tyms_users` VALUES ('1237', 'Free', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0mOBaroBROeicIANZ1KTv1THMzJsdQkUVic5aPsE1puHeP2FXN8DLb9BPjpGqEM4k1NuziaZmxqicH3X179GDiarwicU/0', 'oyP7DwNRRUFaC4GDBEVGMnBGwXbA', '', '0', '', '1', '1', '0', '0', '', '1469600670');
INSERT INTO `tyms_users` VALUES ('1238', 'vic豆', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0YxtWCAc43syn0j0iaCtqyzRrcxzHicX2LcAmQEmCMXlYkYbYpggcjicHK3Ap7bS5icjcdJT5PUn4p2y/0', 'oyP7DwPrtDhjBTBHYI3gSGsiWBro', '', '0', '', '1', '1', '0', '0', '', '1469601235');
INSERT INTO `tyms_users` VALUES ('1239', '6300306@qq.com', null, null, '', '0', '', '1', '1', '0', '0', '', '1469603338');
INSERT INTO `tyms_users` VALUES ('1240', 'qinposhi', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7g2rLeRnp2EcFuNPwicrh74ydueVNLUrHDAmInjYkUu77aobiclu9rpEDq8iaxic7lcTmwWBENhyACPlSrdWStbIdg/0', 'oyP7DwMkewTF3Xs--faODJDEngss', '', '0', '', '1', '1', '0', '0', '', '1469604919');
INSERT INTO `tyms_users` VALUES ('1241', '杨老师', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBPfDBSOeRoDn5cjC526PiaCZbXf9mkhukAn8xXFDBftrwyxVqjvvFic1ickqY3pLTEAeFUtticbhZQqd3TkCnR8CBn9Tj91QmLzBw/0', 'oyP7DwG9bA8lcV-sEBzcT__AeVOs', '', '0', '', '1', '1', '0', '0', '', '1469607910');
INSERT INTO `tyms_users` VALUES ('1242', '真心寵妳ゞ', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7bPjYgViaAWUiaHZxiakhP0GvAeMvYySF0LFo8bj6W0mret7TmskZFqWsO4E1eX5jO1UNgoyO6biaibeQOq4WkjGTsY/0', 'oyP7DwGjfxDF9vZp0I75qJcQ_ecA', '', '0', '', '1', '1', '0', '0', '', '1469609017');
INSERT INTO `tyms_users` VALUES ('1243', '项陆平-诚泰软件', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p21ib0u81WA6yk2pibmNoAnZ8X3gIjQqxE9G0NRIyhrzdibdhbCUbQF7aj4eraVzyITQmWRvmOCvP6oZt0WllBekYh/0', 'oyP7DwHZE0gayT54vq6AUIkuiUb8', '', '0', '', '1', '1', '0', '0', '', '1469610255');
INSERT INTO `tyms_users` VALUES ('1244', '', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL48XFAPibvYNMQGDtuhDvHL6w17NMaKP50JzolU1Wk12oNLzFSZHjmtzf8um40C6ia8pY4J3z5CJbPd0QD9IIjIne/0', 'oyP7DwBigsWPo-YmGIhVsAMvFUPI', '', '0', '', '1', '1', '0', '0', '', '1469610829');
INSERT INTO `tyms_users` VALUES ('1245', '彭有劲', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qra7b8yjb4OiaibVzUuoklnEDuCvkO6AeXONL44Kr58YeXiaQldv5W0Zz84ExmFv6S9rJTNAtT7Zia5iciaw/0', 'oyP7DwGKZ-QKbfknFmPcTcJYfQno', '', '0', '', '1', '1', '0', '0', '', '1469610846');
INSERT INTO `tyms_users` VALUES ('1246', 'It男', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4XYFXltxlR09Cia7UO6amHHsFia9wMesseQDriaozia7vVGGDI5o1qYj1R7pj4rxcNPWPd5EPnKia2DzMpWHQrMsSHb/0', 'oyP7DwB3aVIpmRpNjq0b0_20NFwg', '', '0', '', '1', '1', '0', '0', '', '1469610915');
INSERT INTO `tyms_users` VALUES ('1247', '褚晓强', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9RL3V2SKYJhcSU217sibTUXROpW79lWBHKlfagdJnHLgnKqvdKibia5kBwpuGKYdXYMiaRpyTROF9Ln/0', 'oyP7DwP9NxXZYKIBtfoEZa0a17XU', '', '0', '', '1', '1', '0', '0', '', '1469612685');
INSERT INTO `tyms_users` VALUES ('1248', '安泉桶装水行', 'http://wx.qlogo.cn/mmopen/U84MtpMvHnXicpDa82KEMOibwa8efYpT52Nn2VicNhCv3anmpbrwrJanOcrOBEqO3mvBkicib9ONq84ibDCiaGB5XrrcdPZJMa4QPc6/0', 'oyP7DwJFqCSfPBzoBPiwNpHsYzv0', '', '0', '', '1', '1', '0', '0', '', '1469614794');
INSERT INTO `tyms_users` VALUES ('1249', 'zinsser', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5yUH5WzFA3u6lm1pJs3lvBTcjonKSTiahNiclFcyxrcTufleBjpA0MvQax0EW1NcZicaYt7ZZkJx5DQ/0', 'oyP7DwIbqPAjsZFswIrKPcwXhNN4', '', '0', '', '1', '1', '0', '0', '', '1469618234');
INSERT INTO `tyms_users` VALUES ('1250', '杨磊', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB9BOWdT4x5N8mvktQWIRjiaIBDc7aiaelqcENhcFOEgibu4jk4O2CiaXXJI8Ay6toyuxv1cJZwcofjLw/0', 'oyP7DwD3YO_wsX1mIpF-xGP3DytI', '', '0', '', '1', '1', '0', '0', '', '1469625583');
INSERT INTO `tyms_users` VALUES ('1251', '　', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCicqd4MvuxyC4GEpFrJJllia52iaMwlDN5vs69H60h6z1EIpdBK22ZR5FRSxSzGjGEKfShJreof6DoA/0', 'oyP7DwOY1SF4_vBqDsAV-sZRwOjI', '', '0', '', '1', '1', '0', '0', '', '1469628167');
INSERT INTO `tyms_users` VALUES ('1252', '属客 [ 涉外及电商部负责人 ]', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP25eZ6UzHSvWiczjDdeRpFuPX7gTX0rCILGchicBqG8TpQVcWmlmiaC3VXESzkR4BscdrYppIGVPk5hz4KOSxQynDo/0', 'oyP7DwAtz3Q5pcqQVfNtSsrdY-DY', '', '0', '', '1', '1', '0', '0', '', '1469639759');
INSERT INTO `tyms_users` VALUES ('1253', '挥毫写意绕指柔_', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5o1Fca8WgU1iaqcVYuJKBZjricJ58gGSqyeGpA0rkuHiaWM1nOX9cKoCys9OMT4zn9yxdKtgtwCcEvg/0', 'oyP7DwGyFoGzCjWW28Z47BNjHBE0', '', '0', '', '1', '1', '0', '0', '', '1469667543');
INSERT INTO `tyms_users` VALUES ('1254', '廖敏', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKXm5LuIzSxk0nGXC2WoiacO3ANkGHibyaDEwXEFOj2QJRibvJ7nqlxSADWg7mIOEcs0N1ibTu0rABiaeA/0', 'oyP7DwDEjcvOfy-Th-1pHa6Z_rbU', '', '0', '', '1', '1', '0', '0', '', '1469668009');
INSERT INTO `tyms_users` VALUES ('1255', '无边风月', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1FIKvGAxFR9onlvdkqeVmZG7Dj72UCA8ibdMDwicsFU2usJicibU47K6RdT4g7RD1jcmyDia0g9ibcrAuCkE2hdowial8/0', 'oyP7DwAaTPh2wqoG5c8K1NU7s0Vc', '', '0', '', '1', '1', '0', '0', '', '1469668160');
INSERT INTO `tyms_users` VALUES ('1256', 'liijuu', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0YgUPXCbba1xjbXU8TyrjicDke5yLIcpRjX2iaor4icXM15jryUgsD5w9bzstMTCnSqiafyBKQo3TDtz/0', 'oyP7DwNFn7-7rJcfQVhvwVi0VS_I', '', '0', '', '1', '1', '0', '0', '', '1469668621');
INSERT INTO `tyms_users` VALUES ('1257', '『夜雨』', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraibAAUP7eT4CK1BcRFHPnbYhnmAPgdiaNmz5bZ1VJBpMibn09FISfsWQv2Z62iaREIJ3FRlg4YZswXdg/0', 'oyP7DwK5uTp1Ns95M2oUc8oeCQWI', '', '0', '', '1', '1', '0', '0', '', '1469668652');
INSERT INTO `tyms_users` VALUES ('1258', '心的方向', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7Aa87IdSvE3PMWalNb7Wdl1iaB1MFXK04Y10NLPgcmibmkcaickLkTlazngegwhPgghNichQbGggmdpQyWx9Y9IRpib/0', 'oyP7DwIiezNQFLG5Ua6YV7agbVMg', '', '0', '', '1', '1', '0', '0', '', '1469671311');
INSERT INTO `tyms_users` VALUES ('1259', 'FAJ', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdbQd0mHIwTsZaK8ZhyVVh6O4Ukhvr58Wuk3z5V0jZ97oycvrWVN82jPWBPFic3jK3VTVTUjAHWuNw/0', 'oyP7DwLhR67Nj3jfPRxPyeNkCGvQ', '', '0', '', '1', '1', '0', '0', '', '1469672816');
INSERT INTO `tyms_users` VALUES ('1260', '阿尚', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJIPsTLbNN1JDFfx2cRiaMf4OCv1sXRq1RXodc3Kgl5am9g2zicpiaAHWQAG7XY9rUJoKicv9nay2iaLECvF71pYqfkXpIg6I41gNzU/0', 'oyP7DwHbqW12cvzpJh9lgUx5weM4', '', '0', '', '1', '1', '0', '0', '', '1469673452');
INSERT INTO `tyms_users` VALUES ('1261', '阿布', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VcZ8deR6Fnj9cnoNhBZHhqOc9xpxvlzP2ial2QLc5soGzMIgZEictO4AH6dhJcibAh8mxUh1ibpDqZG/0', 'oyP7DwAcUvsMaiMUullt9qPH2kW4', '', '0', '', '1', '1', '0', '0', '', '1469676099');
INSERT INTO `tyms_users` VALUES ('1262', '张大毛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4R7D7YfZPay99yAVf5WlwnQpkWMJfa43Kqdg8KwnY2ljkm9ic9ybE20OrrDDYO0G0ZW8MyOG3XP0Q/0', 'oyP7DwAP02tbnNAeyGlM4ZST-lmw', '', '0', '', '1', '1', '0', '0', '', '1469678213');
INSERT INTO `tyms_users` VALUES ('1263', '王玉耳总', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibibvSIRX8q64VfdbS8lhDFa475dBUDbsuaoH4MC2JljDyy2H2bQkq13tKOMaSP3t7eLpO7xo57dN/0', 'oyP7DwMiNcqbk6cNfb6FAoRZPoK8', '', '0', '', '1', '1', '0', '0', '', '1469680410');
INSERT INTO `tyms_users` VALUES ('1264', 'juesi', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP39rdyKbBHibRRib9AJsKuhx3bKX9ibm42MLjSwHaDQsJyNaiasb7ryOEXIRicSGrkAb2MgdHexQicibpBdZhW7ibcHqDyF/0', 'oyP7DwEKRFV30Seghq8ALiehsylo', '', '0', '', '1', '1', '0', '0', '', '1469680630');
INSERT INTO `tyms_users` VALUES ('1265', 'stanley', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VqMx7B9Df8z5WdMxEiaoQvvydrvQMklZia68IVGgnMNkH1sTaqXx7NfeaMiaAbVTicH2qticJzKrnx0B/0', 'oyP7DwFyqxn6s9yk142z1RdDcS2U', '', '0', '', '1', '1', '0', '0', '', '1469681562');
INSERT INTO `tyms_users` VALUES ('1266', '郝事成双', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90DvzLcMe6PF3ChlmuuZiaibGtbia2Jv95Htibl51eC1J3njkOvabJVVOresYsBvhaeMukdozgubp3AQL/0', 'oyP7DwN9E4fJTtLmOcCEi-8kGsUU', '', '0', '', '1', '1', '0', '0', '', '1469683128');
INSERT INTO `tyms_users` VALUES ('1267', '喝醉的酒杯', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6MjHoGaZH4icBXYgoRQLRNooBKZx0YJJjC8fA3f9TZNL0VyColtXpTwy3TsNhcbbzvSSE7ibkibNQsA/0', 'oyP7DwPowmGwRCFzMckZbaCyzAzw', '', '0', '', '1', '1', '0', '0', '', '1469686802');
INSERT INTO `tyms_users` VALUES ('1268', '鹏哥的涵爷', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEF46TZxfUwrzP1uL0BIlxCzsXO2In1Ps4IwfMCuT9wfBdhibbdvY4tWIoAqoXYuCUib0zuVfEJia2Do/0', 'oyP7DwDMya2uaKqy_xi5zqohaOOw', '', '0', '', '1', '1', '0', '0', '', '1469687319');
INSERT INTO `tyms_users` VALUES ('1269', '漫步者', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMz4ckuiac80lItJ24Vjgua1aic4Xic5U5UgzrR3b0opln5kibwX0u0UrzpomJSyV66nfaT4FRrEwy7M/0', 'oyP7DwJKvx240zxmTfEAInagqi_o', '', '0', '18237127922', '1', '1', '0', '0', '', '1469688565');
INSERT INTO `tyms_users` VALUES ('1270', 'Jerry 华之韵', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEIDT4iakn0upicvhX8pJf7VMGjHlEhBQNmdn4fhqTHH3DQAjW50pgLiaF4VRUdxxkB50Z3U3dA3dzv0/0', 'oyP7DwIZnaSYNZXec_boUPU-JZwI', '', '0', '', '1', '1', '0', '0', '', '1469689092');
INSERT INTO `tyms_users` VALUES ('1271', 'East', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJSwUEpNOrukCCVFzJicJak1mGXPFQRicfFvMeH2BVgXhEexRfaV6ibcuerZPkSL6oGruKC68X4eSQBA/0', 'oyP7DwCYhYCyHsaUMATscCD0hBTo', '', '0', '', '1', '1', '0', '0', '', '1469690261');
INSERT INTO `tyms_users` VALUES ('1272', '王晨', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIsnHe9oooDib6mJp7jIExicJqYcqL5eoRjyiamhib8Lqvbbd2FBQ2zqfIiciaAs0mhDicPWDdTxibOgsvMhw/0', 'oyP7DwONm76FfHEnObdcC4D9J7iU', '', '0', '', '1', '1', '0', '0', '', '1469691052');
INSERT INTO `tyms_users` VALUES ('1273', 'wow', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPWBufp0uKKt437ECwkt2CM0Eh5GYibHE4kGx3dYRgwCI02dUtU5rgUqEmC5QCI10XAbOUUySBXmD/0', 'oyP7DwEdQFMJ8-lCqad8Q3rzy2GA', '', '0', '', '1', '1', '0', '0', '', '1469692490');
INSERT INTO `tyms_users` VALUES ('1274', 'null', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKFoaiaHB4uqC3ib8fNIcEDUgAonXztAt8rESPJMNCPyLNtI2LXrc6iayyBRmPwzicq8cHjBFFhDQsYoQ/0', 'oyP7DwKAWOgRDWiaJrP3WqvpRJTA', '', '0', '', '1', '1', '0', '0', '', '1469692934');
INSERT INTO `tyms_users` VALUES ('1275', '何志鹏', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UMZiaxxz3sCUbZetutbqVCbSov6Atfh0uTfSPT1wnS7koutxwMbd12ksruWP9gWds9IMsK877O4eQ/0', 'oyP7DwE3Fdd3qk5XC89BzzNg5ghM', '', '0', '', '1', '1', '0', '0', '', '1469693585');
INSERT INTO `tyms_users` VALUES ('1276', '猜不透', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4pibQRh0hHGmAbQ8wgzRYn9jr2RDPtTUdthc0laMVugcFxibMobmvEYuGM3mic1FIbGXZvL317cY95XVkXOfQfCP99vKZrRDDc9Q/0', 'oyP7DwBZnlb1eYMnNakYqV-ruEtQ', '', '0', '', '1', '1', '0', '0', '', '1469694095');
INSERT INTO `tyms_users` VALUES ('1277', 'apple_tree', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ibEJLXI5ejcibkfBFM5vEDeib0ZvQrSv5FVLwGfcUp5WAM92gbBC6CFT9OzsicIvLBHtQtUXp7mv2UW/0', 'oyP7DwLHNV7LjuF-G7anJgVWm1U4', '', '0', '', '1', '1', '0', '0', '', '1469694336');
INSERT INTO `tyms_users` VALUES ('1278', '纯子', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdicZmZb3WvZN7Bc35CbU5J29tibnIibvSNh4HKszJiarsGLoNK03OzO5NwCnRhV8HFU9ElSKyibhv09lw/0', 'oyP7DwJJnPSEtcwRNSdS6ivPFF_E', '', '0', '', '1', '1', '0', '0', '', '1469695488');
INSERT INTO `tyms_users` VALUES ('1279', '6⃣️六六六六子', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0p2BhkU5FlgkZaZcN9RpDvyE9VcLtX87hqoZLNxwDW5aywniaUzaqpERqFfkqV6IdFZx4T9doiaOh/0', 'oyP7DwLUl70t8BJxAjOxCBhMP_cY', '', '0', '', '1', '1', '0', '0', '', '1469695535');
INSERT INTO `tyms_users` VALUES ('1280', '屈阿闯', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7RKoibTd3icwRBx1sp9F8UL5ZMfuxQNyj0u8mkibXPJkibFuMFk0CkKfICiceYhfxZS6dlk4bOTYEffCp2SETDiavVhW/0', 'oyP7DwBTQx2WBhN9dqiRKBePTozc', '', '0', '', '1', '1', '0', '0', '', '1469696930');
INSERT INTO `tyms_users` VALUES ('1281', '唐唐', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazAZJbQoVibhH56Hkxh8qCCLxY77MzjUATUwdwIx4ysgLrMnzWDv0XhnOAOnFDWnvCAhm3PYnYz9H/0', 'oyP7DwGhrPUTSncKFaXacGacimLw', '', '0', '', '1', '1', '0', '0', '', '1469696972');
INSERT INTO `tyms_users` VALUES ('1282', '穆志涛', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia5qSfDxX97O3ciael2e81lzVwiamiaKic6Aib1RoV9tGVo4m2Il7oO98xApiaoECKfl3MLNAwgckiaOud2s/0', 'oyP7DwF-KTJZ70PNuwcEbJ8SBcTo', '', '0', '', '1', '1', '0', '0', '', '1469697547');
INSERT INTO `tyms_users` VALUES ('1283', '平常心。', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pkho69XgJZJA0hLibgrkrhw75jEicZ9ZNlajD9T9WF1zd0OOgYx9qE3fHVEjmERgicgGkQuxA6Ve40bGsu2CwZQKHMk/0', 'oyP7DwKckoJHuOTv19nya6Lr4Dfk', '', '0', '', '1', '1', '0', '0', '', '1469698318');
INSERT INTO `tyms_users` VALUES ('1284', '打野人', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJrEC6aNOzJoanDSgaZrmEm6YSXsJUfib19bUdchkSrJ0yAnx20oTeMO5AAXMbkAxCClb6MZ8T6ibHA/0', 'oyP7DwHNNZ6U8TjgZlcgDKnMexQA', '', '0', '', '1', '1', '0', '0', '', '1469698383');
INSERT INTO `tyms_users` VALUES ('1285', 'cooperding', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaw6ibgwVvvEZpeRBftf55hhBia4axYgUeODBCb5wXdn4ZBulHqmpJSluoYHczWwMVPgLAQahOEUE12/0', 'oyP7DwInwHNftai_setTHNIYNaVY', '', '0', '', '1', '1', '0', '0', '', '1469701288');
INSERT INTO `tyms_users` VALUES ('1286', '郑', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI7eFHxlIQial6hPNt4zzg7yZL3HEH1aeNBh82tkmo2jgpr4UgGKFHO4wFiaJjUFRpPHemnVVtQTicXA/0', 'oyP7DwAsNTKGgsS_5MCkyhqCuVUM', '', '0', '', '1', '1', '0', '0', '', '1469709326');
INSERT INTO `tyms_users` VALUES ('1287', '张杨思琦', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0TsjGSIYzfiamEqXJX5ZfFBJYNM4mVxW0mKSLB2tW7T9zhHBj9Egp5rODXkcE05WMiboFK7icHhiaCFW/0', 'oyP7DwPPmKAjHqZoBsVs4hgB15F8', '', '0', '', '1', '1', '0', '0', '', '1469713791');
INSERT INTO `tyms_users` VALUES ('1288', '479666317@qq.com', null, null, '', '0', '', '1', '1', '0', '0', '', '1469714335');
INSERT INTO `tyms_users` VALUES ('1289', '柴光勇', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5xjzPc0p9YXiciacBWEiadpIMwkzd8QzIQpxX4MnZGnYLibzA254iaqiaEXrVbMwQYhW8qAtU6YzrFF4Zy/0', 'oyP7DwKkYO1tboXm2fywCLu3y2MQ', '', '0', '', '1', '1', '0', '0', '', '1469720851');
INSERT INTO `tyms_users` VALUES ('1290', '山野之间', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ibe5BIsUkkH5kqQRQrg4WM8YX18mk0uRibA09F6HovxcE9sY0ouUeVAHJxrC3tRiaEVeeZulayT9OC/0', 'oyP7DwEqctybreCDPmFNtaMETayQ', '', '0', '', '1', '1', '0', '0', '', '1469722643');
INSERT INTO `tyms_users` VALUES ('1291', '邓才杰', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ickaiak5oo0ehEGQFNHOgbuDnXBNZGcQmQVL1LdVibF23CSguib3sCAzbWFg2QrzGMdjGHAYhzrm7bS/0', 'oyP7DwOheYShzc6JMZcpSOUrO18k', '', '0', '', '1', '1', '0', '0', '', '1469724737');
INSERT INTO `tyms_users` VALUES ('1292', '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELMozmOlWtRBoFk983vYYmZPxbt21IQ2984ZaZHKX447CDHUPZyiaunY41eEMA3qvsXLZTiaKekWib1Q/0', 'oyP7DwPt278t-06RPny5Wv6AVQvA', '', '0', '', '1', '1', '0', '0', '', '1469726017');
INSERT INTO `tyms_users` VALUES ('1293', '邹亦明', '', 'oyP7DwNTdrQqKzuzWG-ZJwE_9jtE', '', '0', '', '1', '1', '0', '0', '', '1469753593');
INSERT INTO `tyms_users` VALUES ('1294', 'Deep breath', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKsIiccibXTGTKJphUy2VC4zIBXRu8p3JUdHzibLjiclXLibxk3fstSgeq95MIrAa50HdJmPCQTSCp9iaHg/0', 'oyP7DwLs0afZ5iNGDwbN-ey1bu6Y', '', '0', '', '1', '1', '0', '0', '', '1469755341');
INSERT INTO `tyms_users` VALUES ('1295', '战神', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeY01c3Zo6cazWvRHhrAnicicfp8icj6DJmVAXILujzrWPJxVE16LSq3viat5RxqOhKI0ciczzxqO1ia3zQ/0', 'oyP7DwPSWT0whbO0J_RW0_Y-0rgs', '', '0', '', '1', '1', '0', '0', '', '1469758209');
INSERT INTO `tyms_users` VALUES ('1296', '在途者', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5KNUODEyfiaQLo2wjiaibjQa0YW8yTvQ6ufnnQejTGftltZx0AQ35d6z7A2F41ibiavsNhC3WDr9wW0KAkTxUNA7uOG/0', 'oyP7DwKTGUZXW9r5_dO67EhSIzHA', '', '0', '', '1', '1', '0', '0', '', '1469761445');
INSERT INTO `tyms_users` VALUES ('1297', 'fantasy', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5cNXcv0dOoO7RtibJzKUCmHJ2gG3Ovh1ppHUfhTDIhIcjh1v4HL3kjhqLEfok3c1KMYGv5GMqaedkedJ9FSicNQ4/0', 'oyP7DwH0ZpwPErqcwyjG68P0sL0M', '', '0', '', '1', '1', '0', '0', '', '1469761654');
INSERT INTO `tyms_users` VALUES ('1298', '小刀', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKYaib70gyFEdjfYrq5zyxVicX64XTfMv545vZqvxG5ArxE9SDUTFoTAmXrwggDzJ9th2uMARPKELO/0', 'oyP7DwIGNS3xI7yd2g3m1C9ZwB08', '', '0', '', '1', '1', '0', '0', '', '1469761797');
INSERT INTO `tyms_users` VALUES ('1299', '朱守俊-智能派', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlFbydvq8rt01HicEzrqXmXJzgUv0RCibyKS5GviciaZo3ZdnwSGjgVBAGialZoyxsrYEn46uJ7ZrZ4JrC/0', 'oyP7DwL0JUsE3qkdTPLur4fuqFps', '', '0', '', '1', '1', '0', '0', '', '1469762682');
INSERT INTO `tyms_users` VALUES ('1300', '小陈', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3w2SBu4oN7L1fQ1Lkmpdicj9hcnXngSUnr1TEswSwtgTCORM8bDwXuYibWichhZLyN8ZkMd9meVk0mpiap2c6ZcCOk/0', 'oyP7DwDVVSdG_X-ucegKiYhXpUOI', '', '0', '', '1', '1', '0', '0', '', '1469762911');
INSERT INTO `tyms_users` VALUES ('1301', '龚继', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP06xat484LrxeIiaMicJJ86E3NQ53SiaNbW6r91RyQtI0OslibjQL7ZgYECfAHBIjJSA7bTqpwYzialwbg/0', 'oyP7DwP3ba9Q6TuHlQ-KrskEKNQM', '', '0', '', '1', '1', '0', '0', '', '1469763905');
INSERT INTO `tyms_users` VALUES ('1302', '薛松佑', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2U6Yic2UWvtWLnhH87DYsFRfUAxs4IlPZ1ySHGMYs1ib8vE0mNb5Z2y2IFmQFrQp6ujXiaY9Cv6O5ZQ/0', 'oyP7DwKvm6ypf4HnnAMIWKFZjMI0', '', '0', '', '1', '1', '0', '0', '', '1469763999');
INSERT INTO `tyms_users` VALUES ('1303', '鸢尾幽径', 'http://wx.qlogo.cn/mmopen/3eiaArVnjG2HnEzibiafo0mZibybX6v8SWImB9Vu7lmYasgQa8suMJV2lehhntPjVdbCvhwdxMqxMibIldMVrnookWTOUIOEhEepQ/0', 'oyP7DwEg2YXgTSltiFiopVRNUgfA', '', '0', '', '1', '1', '0', '0', '', '1469764711');
INSERT INTO `tyms_users` VALUES ('1304', '土豆先生', 'http://wx.qlogo.cn/mmopen/Qk2WicPplRQiatfNw6fiancFkFpDR4wicsrVuvRhcMRoVYp4Nz4zXQFe1UanUReXqskiatLzDGNGCjzoYMNaK3uFDH9lWHc0Yjszd/0', 'oyP7DwB8VGFfyshLwMG7mg2i-Npo', '', '0', '', '1', '1', '0', '0', '', '1469770241');
INSERT INTO `tyms_users` VALUES ('1305', '.K', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL6xDW09amiceNtjxibg60F8edribSD6UBzNvISLD1Yj9X9JaWfFDU10vv8ZJVcJH6JD2RrBqDBibnSaw/0', 'oyP7DwO7OPbpL5F6prkzVSOfwsnM', '', '0', '', '1', '1', '0', '0', '', '1469771882');
INSERT INTO `tyms_users` VALUES ('1306', '往年', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlASV0u0xkia7voFZVJaXZYCXr3fX6dib4ibcJDxu5yiavUhnRM2ia4MrA7NGRpejiaFNXhBDDP1hFZLZ5f/0', 'oyP7DwGHcn8Q00lPQECDf33YyyqQ', '', '0', '', '1', '1', '0', '0', '', '1469776024');
INSERT INTO `tyms_users` VALUES ('1307', '巨檬科技-曾忠', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UCrPmD01qoHd6y2azrSRNlYKp4uToIU2mQpnlOrYrYy4pJaM95Ov7tC0Qdo7vfic05ztXYHKVPsBm/0', 'oyP7DwNt9TE3qZOh1DD8cIZKiDwU', '', '0', '', '1', '1', '0', '0', '', '1469776126');
INSERT INTO `tyms_users` VALUES ('1308', '拜拜', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eNHs8aFSHluaqDxojX914KwD9tcXxIicZjKKlrrVKvsOcx7eicnO5jVD41ibFCywRQaFD3n6TuUxErN/0', 'oyP7DwJziNvKaFjF-qGflgAJCy9U', '', '0', '', '1', '1', '0', '0', '', '1469778618');
INSERT INTO `tyms_users` VALUES ('1309', '__．乜許′', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0TyfImQu1NfoHN0u1FJhckpXiaMslp8Oraic0kXVJH4Vbib6KkBVuiaGTKvpZseadWrOadHXawaZkbnW/0', 'oyP7DwKtyzs9ptJ7ln9Gkt6VYfpI', '', '0', '', '1', '1', '0', '0', '', '1469779025');
INSERT INTO `tyms_users` VALUES ('1310', '成冬', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2efXDqHFucV6pcNIOadCUyy1Rw3y6eWfjYDaVCg6oncnestE88e25k1CUJglOpWMAOPibo74BuOic/0', 'oyP7DwGun550eFZGUThseS8EkpV0', '', '0', '', '1', '1', '0', '0', '', '1469780264');
INSERT INTO `tyms_users` VALUES ('1311', 'Paul', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGfhhRCWhKsg2icdYe8TSpXCJk6X7rzZScm244xO5186jVp0NpR55nslamF7ia0icYIJDmibgnQCq3DY/0', 'oyP7DwFh5fwcIZ0ra7euJ9NmiOek', '', '0', '', '1', '1', '0', '0', '', '1469782066');
INSERT INTO `tyms_users` VALUES ('1312', '夏初临', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibc1BHguY7HAfcDrGyicpOuNnO0hpVKZXUvWMoTdakwMgotK0E5dEFcFQRkWOChGM9uenbmnSO6vZQog4QQKxdMgF/0', 'oyP7DwMxzhrjuAkJBAxuNKGoe-Ws', '', '0', '', '1', '1', '0', '0', '', '1469782415');
INSERT INTO `tyms_users` VALUES ('1313', '陈伟淦', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90IfP3eK9icUBIZdwmvQJb95CTj0x0IynAoUibJTibwuhLsP9xk7zQ09zVWrtdngTctBAcwjCiaaIQ1xB/0', 'oyP7DwJ0r4QOILhz5kDcZtTSgLLk', '', '0', '', '1', '1', '0', '0', '', '1469786349');
INSERT INTO `tyms_users` VALUES ('1314', 'Mdanes', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCXKsDeJs1gUsajY0yYuFAIfa15iadDBlkylQX1sDbpeq4JC7RpgQiaDnTywrrPCD74o5z0bQgY0abA/0', 'oyP7DwN46PjQ8CL6zCe5XMaTXmQw', '', '0', '', '1', '1', '0', '0', '', '1469786811');
INSERT INTO `tyms_users` VALUES ('1315', '晴天小猪猪', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90BhjX3GD7D5Bicicvb1iag1NMZmI27rCNRm7Zicdhhhgr75tC61BBI0XVicRvEezHB6iaglicXTmUqPk0gE/0', 'oyP7DwJNo-Qmy3Knop3wZebRMSnY', '', '0', '', '1', '1', '0', '0', '', '1469790805');
INSERT INTO `tyms_users` VALUES ('1316', '攀', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP386OfJKsDOTalGC2hiaSldqHRLS4EDNEeRe1V4mIuxicVVLDUSZX1H54EKCklfZdicDl72WgibaNgzeV3KmYYWW4QT/0', 'oyP7DwFO76bXLQDXUqoiH_4WdcYg', '', '0', '', '1', '1', '0', '0', '', '1469799901');
INSERT INTO `tyms_users` VALUES ('1317', 'A1李明志', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELlExibJkTvoeMSb6icov8IRW0eC3DmicF9TbAg7RChicvf1icJrm9rT3Me5rmEGM6WxGoKoRAXGylgAkQ/0', 'oyP7DwLlsEBuMrdxMdEv0VTxEBas', '', '0', '', '1', '1', '0', '0', '', '1469811323');
INSERT INTO `tyms_users` VALUES ('1318', '玖珑玉石', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90LkIxtSKrwAFljkY2WE3bLDsYcojuz62G4iaCDCFVESzWR0NKxHZQRrIRncTqsVibGibPn2ELjFOgr6/0', 'oyP7DwOzgBIQ6DRbI30cfWGjanTs', '', '0', '', '1', '1', '0', '0', '', '1469811610');
INSERT INTO `tyms_users` VALUES ('1319', '柳智健', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2eD4n34NX75m7SyrFTofvdbJicAsKdYLldEF0f6ibaAg58lAvXWFXxn9ibDwjvg0kFwic09aV7P093wQ/0', 'oyP7DwExpERZjTcaGWbmPTUuEbWw', '', '0', '', '1', '1', '0', '0', '', '1469843722');
INSERT INTO `tyms_users` VALUES ('1320', 'Joe', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0nbZTIbJVklicMicXgjSGyFHFDLQEvwgdUt0M3uyQhDNDG5OR47vA53WyWQwE6QD8PTlsay7oJWnzQqB7BOf0FIO/0', 'oyP7DwFoMEzzFaYlql0nJqDpXFy4', '', '0', '', '1', '1', '0', '0', '', '1469844470');
INSERT INTO `tyms_users` VALUES ('1321', '字的序顺不并响影阅读', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdT5mogZP9bBv98abibhXLwdd4hiaElyDCRU3iaFpYQLicaBErZtficp0iaz3opX1CFQtHHPk1nBUDDuwGQ/0', 'oyP7DwLIMsHw6kzfUZXPuvgklIbc', '', '0', '', '1', '1', '0', '0', '', '1469850508');
INSERT INTO `tyms_users` VALUES ('1322', 'ly', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD7MMJfianUVXicZUniahp0msKl7mOLJPxVVeNWHHnC1DOlwI7NhCbZmbBoYyaaKHu98xficuhDvicBic1w/0', 'oyP7DwBDjAFbHJJprWiS1Ur2tqq4', '', '0', '', '1', '1', '0', '0', '', '1469856670');
INSERT INTO `tyms_users` VALUES ('1323', '张洪涛', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCnEbzWkaGCPn2LQia5a4L2I4s3poh09H3ctPWL5iaP8UPFNCIR7xohZAYyriaZdXWhyqdhG1CrTsFiaA/0', 'oyP7DwMGN6MsmCtVFTBVb3kJ6Loo', '', '0', '', '1', '1', '0', '0', '', '1469861890');
INSERT INTO `tyms_users` VALUES ('1324', 'Mr.King', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4iafgsjicSk2TOdLGveI9Nv9QXLtZ0zqNtwsotIHO4AFxtiasJXib3vWINgskjNlmtTyAYQliaic4T4fpk/0', 'oyP7DwNDkengB1vlItUeeQ2jlGPs', '', '0', '', '1', '1', '0', '0', '', '1469863990');
INSERT INTO `tyms_users` VALUES ('1325', '(朱晋)', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCibL0BogribHrVkQIXRCkSHF1LYnw83fzatTibofxOv6bHFfiasBrSPwEKHpiaiboxpBoPQ6FM6VbpCicGQ/0', 'oyP7DwBEiicfVVuD6mtvzWxwz3Ks', '', '0', '', '1', '1', '0', '0', '', '1469863992');
INSERT INTO `tyms_users` VALUES ('1326', '改变下一秒', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5ib4xysS10rHugnWtmPsqnG3tD0O3UTrcmX303vMGvicZopSZTq0kMjeDoVhWZney7QydAeaJHjJtsecmBQa0xWp/0', 'oyP7DwJ1Ih1QYDpE3MrvPPZixYu8', '', '0', '', '1', '1', '0', '0', '', '1469867157');
INSERT INTO `tyms_users` VALUES ('1327', '   ジ°唯她命°じve', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1lst3roag1JSoiaic3dswjibraFvUvDjhZTjOv1fLNWjADw4ib8pkRKVaia6KoXibNSibECiaMGCA5xdM9z/0', 'oyP7DwIiiKR3xwmvc6-WuiwnHS8U', '', '0', '', '1', '1', '0', '0', '', '1469868923');
INSERT INTO `tyms_users` VALUES ('1328', '忍', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2RKnURI6mg4WCKKx6M0GFTFHaCFtic3g6DqWRH2Dia3rssmdYgW8w0XK5gjIJznHN2Hxia4Vl7f24ZsThicJ4hudzM/0', 'oyP7DwKcGgPYHQKWzBnpLWj-Ghms', '', '0', '', '1', '1', '0', '0', '', '1469878048');
INSERT INTO `tyms_users` VALUES ('1329', '创思文化', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM69HIGOelQy1ULAoZBXQia8RviaBFyFh9Yup2QP5aSkAQ1LEj8QrIdmILsZDP6pEF9ZXy0bib4VxYaDQ/0', 'oyP7DwNLzUcvyfErPU8gaFGfUNdE', '', '0', '', '1', '1', '0', '0', '', '1469879637');
INSERT INTO `tyms_users` VALUES ('1330', '金夆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4lKMOQkggZYP0ibI1A9wxndGTkd4QicQPYst0N3eLJchfotGQVPBDLU9djlhNd3VgXhAdNFRya6WD0/0', 'oyP7DwP4lJwq0Ts_jrcMtreChHz0', '', '0', '', '1', '1', '0', '0', '', '1469883983');
INSERT INTO `tyms_users` VALUES ('1331', 'sonmnus', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1XGnJWQF3ibNjDicrJ8FZI6EibBg1QSxQbvWh5YuibFlIEicA5ucBOsgKHWXKaibpTBPhmSGGZW0bCbTKWYaLCgrp3dA/0', 'oyP7DwDkrnMUzs06nUnLe_N1VOcI', '', '0', '', '1', '1', '0', '0', '', '1469889395');
INSERT INTO `tyms_users` VALUES ('1332', '累了，让心吹吹风', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP36U7ADOc6pfCicjJvnBjseG2aWrzfP7VnQMufrv470GviaOG3voygZG3MC4or3iaMUWYohwHvdMPZqG6TnggnWtUJ/0', 'oyP7DwDOW0SSJ2u6sVTS3wI4p6_Q', '', '0', '', '1', '1', '0', '0', '', '1469890886');
INSERT INTO `tyms_users` VALUES ('1333', '右侧还好吗', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZIGmnBBUxgQ1uMWRtibpics2zibibfPt9SKzEcPcLTsbqLTfGgwMhU0rnj0Umbdk76XqndquMBRicCul/0', 'oyP7DwOnpnbVy-af-vrtK_PvQep0', '', '0', '', '1', '1', '0', '0', '', '1469933011');
INSERT INTO `tyms_users` VALUES ('1334', '艾斯', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4Iu6ibZZaianhVdwVY2d5lmBA8fQx8n5ncVL3QJhiaicfSIy57I6BgtOIBf4PgefecwFygYjPanAyIlQ/0', 'oyP7DwJSVf9Q2U_Vc_nHg9-dXOV8', '', '0', '', '1', '1', '0', '0', '', '1469938974');
INSERT INTO `tyms_users` VALUES ('1335', '十一维', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7wNdM0a6Xn1MYVQGqyI4Q0RXomGHV9ibF1pThOwyibdYnwesg1TJbHXPROpcAK6yVklmQ9Dq5kTaCQ/0', 'oyP7DwKhpZfVFjHckS--Mp_Y0Mmk', '', '0', '', '1', '1', '0', '0', '', '1469946380');
INSERT INTO `tyms_users` VALUES ('1336', 'Me俊', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCj5WaULBYAjB0s3KbdmiaVkDs96zCv8p2JmGjC73x8LLt73Mk69bBNmTPKlicTbSqBJTJZ9wWrpszA/0', 'oyP7DwK601QDRPk3O0QPUnpo707A', '', '0', '', '1', '1', '0', '0', '', '1469947205');
INSERT INTO `tyms_users` VALUES ('1337', '独行者', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJKY4Gtecqk5NkDwys86siaxiaBZ1G5X3eFG9cfYyP8lTgBfibh13D5r98dGib5CmK88Pb35plLUf0xQ/0', 'oyP7DwII5xwZSakqqYN4bIr4UoWo', '', '0', '', '1', '1', '0', '0', '', '1469968531');
INSERT INTO `tyms_users` VALUES ('1338', '高', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdLrWSCb1ll8ciaFlEyQrvObJpSeGicobfg1Zzce3L2VV3AjKlvsGyd6PL1ibj3nLlMoQkCcSWCY2UkQ/0', 'oyP7DwFJQbIvNgNxjwnMtMFvnoIE', '', '0', '', '1', '1', '0', '0', '', '1469970105');
INSERT INTO `tyms_users` VALUES ('1339', '魏娜Anna', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eNNIUQ2icrhtUibyJbQRVCU479JYJmcTsziasasGvONqnziaPFg1kVjic7f7IqMVTCh5nhpJm8VSTLofC/0', 'oyP7DwGEh5aoAqU-ChPhHrPOLEhc', '', '0', '', '1', '1', '0', '0', '', '1469972627');
INSERT INTO `tyms_users` VALUES ('1340', '碎成粉末', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eHu1mnhI4Vj5szco7InP7LW2wRCY5Nk2exT7NBHlug8c1DV28kp3gWJHtz9AggVBGvbgxibNicwSuX/0', 'oyP7DwCbX3HS5GC9G3MgVJfPFa4Q', '', '0', '', '1', '1', '0', '0', '', '1469975531');
INSERT INTO `tyms_users` VALUES ('1341', '老船长', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W30kMtwhy68ZQeaWma5ibsTWtdTaVkyhTWzUHYFuZZnfnQhCXSLUDiaDtn9SnWGN9tuDF2UQV8bWibhI/0', 'oyP7DwFpJiZLXTT6IRK9MpP97V1Q', '', '0', '', '1', '1', '0', '0', '', '1469989561');
INSERT INTO `tyms_users` VALUES ('1342', 'ryan', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WgbNJVPlicKRnohib4bBib7csGricVcEGIibDqbrf38ClOQ8ZW8MfN2UEGU57sPQQ86riccNZic8XmNHvE/0', 'oyP7DwPeY-I5cIpEao7vROqp6vC4', '', '0', '', '1', '1', '0', '0', '', '1470010795');
INSERT INTO `tyms_users` VALUES ('1343', '天道酬勤', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eHIdPXv4nZy5aSDIWTpNUZu9lzURX9HIPIkpZTbSjdKAu3n9p5bG6mGumBI0AfULvLb7ObZib5aOL/0', 'oyP7DwIATrMDcB5Zz4IQ5q_o8ZyA', '', '0', '', '1', '1', '0', '0', '', '1470012133');
INSERT INTO `tyms_users` VALUES ('1344', '鲁静飞', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3FN49wg9xCAJLZnPImv4J70qBI577BoBbl480kun1Iic6bOGbSibFT88YLctjWdVfJwY2p3qeWjTxjoOCfmOTqks/0', 'oyP7DwISpA6Yti6FWrCWG9UsnOsc', '', '0', '', '1', '1', '0', '0', '', '1470014153');
INSERT INTO `tyms_users` VALUES ('1345', 'Carry_axin', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2VYIBdAicoNnyMujjzdaiag5TnM3S3sFGU4BoKnicsd6iaPXl12UhYlwtl6JQHsVrSmRLjLlsicF22IT0NPEYSKA6Kg/0', 'oyP7DwKO_IFwpdD8t_d33_oz9a74', '', '0', '', '1', '1', '0', '0', '', '1470016547');
INSERT INTO `tyms_users` VALUES ('1346', '进击的葫芦娃', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2gIUEslRW2ItSLyfXDWk8WnjaWjqIFLibXTNyp8IQiaq7WF58Z0SO4AuvpME573kSzJfHs2FEAUib4DD1IDPn1m0g/0', 'oyP7DwFuMwprbDv96GANRV1Gu63k', '', '0', '', '1', '1', '0', '0', '', '1470016938');
INSERT INTO `tyms_users` VALUES ('1347', 'M.o', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7icDU8B3wJHHv2m6G0SAJhWTice5tRDJ0CM0kPvezchcbBH3ylaLicyC6E3ndXsWicEIVHFu3WuaKLYibxXdMiauUfOZ/0', 'oyP7DwK_OpfrswFKqdvBJBuRKaQ8', '', '0', '', '1', '1', '0', '0', '', '1470018082');
INSERT INTO `tyms_users` VALUES ('1348', '朱总。', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEBdjB1OwbSibesiaoLDs4OVTr6JDkEdQwfv1Goia2wsQS4RlL3icgDH01z3OMficTqZPY2BE0KPFapibDx/0', 'oyP7DwGXXxWabv5GxiQw0M4fjdqo', '', '0', '', '1', '1', '0', '0', '', '1470018989');
INSERT INTO `tyms_users` VALUES ('1349', 'w_nop_', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2qucib3hiaH280yW4fVkmD9eCuvdYFAZrkvn3w8Qtod0fTo84QByDq0Z0VDNcP37ktouBT2Z5BfHZ/0', 'oyP7DwDx8aip96sBOfF1W2M7vMUw', '', '0', '', '1', '1', '0', '0', '', '1470019193');
INSERT INTO `tyms_users` VALUES ('1350', '北爱', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL46iaTPFKsqMZtlrn3kniaJv4d11vOJBZBHxypZN4n4YN5NdBAxSlDm9kPqdwiantYDIGibH1zRYHRWpTtCgOtDfIB0/0', 'oyP7DwJ8WI-mc2TUWANalAg3338o', '', '0', '', '1', '1', '0', '0', '', '1470019442');
INSERT INTO `tyms_users` VALUES ('1351', '闪闪', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1o1Ctbib4gwjcqZowzYPWhbCjBzIFFGvSfpSwkib5WD6GhnNEF8FicLu7XkvFRj2b4MxibVYuAOhtwm/0', 'oyP7DwGTj_TZU_026NJl1dpMtKW4', '', '0', '', '1', '1', '0', '0', '', '1470020407');
INSERT INTO `tyms_users` VALUES ('1352', '一生的爱', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdQbpOa2grCdVnYzgp83okVe6ug58gHm5qTgXVShJDIqvxGSFGOluK1u2RHzInJ2ibiaJlhTgDtKVek/0', 'oyP7DwDfYzdh-W5yLozDyUtfkkHs', '', '0', '', '1', '1', '0', '0', '', '1470021837');
INSERT INTO `tyms_users` VALUES ('1353', '村长@钟艺@三茗', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90IluiasOXFiamcgvl8PUXf9bib5ad3KciahO7tKclv3b8M4wqtyeNoKfoXCKZbbibZa3FsYzDG2tbhQxg/0', 'oyP7DwD6AX_HsVygwBEKrHbipeFk', '', '0', '', '1', '1', '0', '0', '', '1470022794');
INSERT INTO `tyms_users` VALUES ('1354', '谢主隆恩', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawdYL0un1IGSRXE54qPUnWSGyITtMNuwy4kpBho7oPXAH9dofGjjAKibo6ZjhaQWXSe4x7C4MwdTB/0', 'oyP7DwB4Cvue5PH5sV9Aer9oINrA', '', '0', '', '1', '1', '0', '0', '', '1470028151');
INSERT INTO `tyms_users` VALUES ('1355', '黄文浩', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0eeWpyNGicx3W4EAp7U93JQYmZ1V7K4m9gWh7ibcp5tMSialBuYkdia1XeFokW50xINicddz9RIean9TAicJgeIzgC2w/0', 'oyP7DwLaphBigR4qMS_WnASn7vKU', '', '0', '', '1', '1', '0', '0', '', '1470029786');
INSERT INTO `tyms_users` VALUES ('1356', 'zeroLL', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK5SJQRTBalBtSUdqXiaDItjiaomjq8EURIhjIJhGibmyvt9VHOAEKxp7ic06pAReE6N0Mvw52TQ4kRzA/0', 'oyP7DwG62XJdr3J7um1Kr7QQcfos', '', '0', '', '1', '1', '0', '0', '', '1470029818');
INSERT INTO `tyms_users` VALUES ('1357', '奔跑的小乌龟', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraMPz0csSRa05TzMjjUFUS5P11G5phZELXctaMJjlpevvKFBh1icVcvDriaPNX8ba7hgd9y4t9PfjKo/0', 'oyP7DwPlU_mdP5ewji4kgIQ2dpAc', '', '0', '', '1', '1', '0', '0', '', '1470034240');
INSERT INTO `tyms_users` VALUES ('1358', 'A.姚振营13938501132', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY55q6rMlzA6bjicCL2VdEGlqzu9PZMFyNBt23k1FWJp4EOxvtPiaMGq1Jyh30lMxtKT8vdPz5yCyytm/0', 'oyP7DwCyhjElCvVdQT214oCzEXhk', '', '0', '', '1', '1', '0', '0', '', '1470034535');
INSERT INTO `tyms_users` VALUES ('1359', 'MISS', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIJcfUwT9jRTVzQseXmDhKC5yKG8TG3zmNicGBMGVO6oUN8J4Qee4G8oH8aCA1bKibcCN5fvia42EQQA/0', 'oyP7DwGSHSOnbHT-sXpNaNRRv54Q', '', '0', '', '1', '1', '0', '0', '', '1470038171');
INSERT INTO `tyms_users` VALUES ('1360', '旁观者', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDnkgOtefoLRLgJeVFFyLKaKV5WJibXlfiaqia4PIW8gDwWDsvv3aULalaNmLEp1RHPeiamDjGjqZ6AAg/0', 'oyP7DwMI7kbm09_bsQUulNWmopEs', '', '0', '', '1', '1', '0', '0', '', '1470039538');
INSERT INTO `tyms_users` VALUES ('1361', 'LL', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6ulhhlTibEHLHjpTX2XyN0T3PZZaSWKmYib7JgpXfUfYOicACsxqSTpz312rx0LPwSTgfnCVb77a4JA/0', 'oyP7DwGAn3n5-bLDD_oTkTIX2zOo', '', '0', '', '1', '1', '0', '0', '', '1470042073');
INSERT INTO `tyms_users` VALUES ('1362', 'Demon', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibd2d0pTGcGyWskRg16ksm5wlWiaw8PnxlG4al18z0nWlRNIEcibSI4b7UibaB4Sxn7KMiaFRyRGKQIVfd5NqxQRsEWl/0', 'oyP7DwFUofJW4HecUrhQ3B07Ap2I', '', '0', '', '1', '1', '0', '0', '', '1470043090');
INSERT INTO `tyms_users` VALUES ('1363', '崔立朝', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia87AXOOjFkezZuiaLfM9ibz6buEryyCtsjibfJOHzw7FmseicAic0wJgQby6oIstfhcQ5s4p7x5I6TgtO/0', 'oyP7DwKm-mjFUm1yawC-_c6led8Y', '', '0', '', '1', '1', '0', '0', '', '1470043110');
INSERT INTO `tyms_users` VALUES ('1364', '高大为', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlJGjibRX2KuRVEJIiafQicJSpvAicIcj2g2SRicZQoQMLk8ohOhI6FWYTvrNZboOhwefsKB1UENIq62oY/0', 'oyP7DwFoQ92ZThN6ZvlXvYctTn9w', '', '0', '', '1', '1', '0', '0', '', '1470045200');
INSERT INTO `tyms_users` VALUES ('1365', 'HawkSharp', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90KNh8bFPf1Rd9lJ2PLgy9EVBzzRVK0Xe4INKziamlYIpibdJCjDXz0c8jD3hPpeSklicW4nCCbOlO9V/0', 'oyP7DwLR4pkBQ73AlPWXqH47aF0g', '', '0', '', '1', '1', '0', '0', '', '1470047339');
INSERT INTO `tyms_users` VALUES ('1366', 'amSammy', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7qmLlkDcib6F75Oj6oNsyiaibZYNvCicgTE5cdVa731WiccbKFabQYytdfy0Gm08NiabeBibRmuU8Fy39TfQibeWSia6wVm/0', 'oyP7DwJunN2VtFezV0-pFN3rgG8M', '', '0', '', '1', '1', '0', '0', '', '1470048344');
INSERT INTO `tyms_users` VALUES ('1367', 'A小易 ', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2u4ibZ1PxIDHzcHySbpbY7sS66CmeCsibBljVVcAStAxHSibsPiauLh5iaydzBdzBIV6hwXViaDkAGvH0rIyZVAcprxB/0', 'oyP7DwMPY0TlyrOo1t56Nvz_1pJ4', '', '0', '', '1', '1', '0', '0', '', '1470048385');
INSERT INTO `tyms_users` VALUES ('1368', 'ئەلرىشتە ', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3zicHmLgqvNkavcic9v905RLR69tRM52HrPiavs9o3x9epRbnibjGiabDaicBFlsTUDtMibv3WhvKI4ryVw/0', 'oyP7DwOaQN8l1egTtDJyIF5TPyC8', '', '0', '', '1', '1', '0', '0', '', '1470051229');
INSERT INTO `tyms_users` VALUES ('1369', '轻风', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4sbSmUJbdyiaTrfks5ZEy6SYultMkpjzribLeIYs1ibZAZhIfQC7LfsO67yyF25rPCgaaGYyzjoxH9A/0', 'oyP7DwC2sGXItvx5s5LkgMwmU_d0', '', '0', '', '1', '1', '0', '0', '', '1470054958');
INSERT INTO `tyms_users` VALUES ('1370', 'A0温控仪表 Riko传感器 低压电器唐', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UDlQ4hxicGHjZHbDEbyO0g9sLmBTiaG9VibCZyAia60eJsSksVicQoWCozlZhGyq0DRwlNQCMwbWIicafK/0', 'oyP7DwMifovwPlWxGe_18zfV1S-o', '', '0', '', '1', '1', '0', '0', '', '1470055622');
INSERT INTO `tyms_users` VALUES ('1371', '本尊．', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90O8o0lIbibsZ093olnwesicd1JrJCibXiaXMkJ1SaS1dIZoBQkJOPxbxn6vGhCEq2kRMAkyGKH6FJmqib/0', 'oyP7DwIMHmLrVltrW_9Qsyga9Qtc', '', '0', '', '1', '1', '0', '0', '', '1470079646');
INSERT INTO `tyms_users` VALUES ('1372', 'Mr.赵', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI3q4dQq0lAqJJXeXiaicLVIAfiae41WyMPsPaQ0hHjCAwUhTFTXZbCRkBTgiatSAicVxRiakHicg2QHecKQ/0', 'oyP7DwFf0XDpl5x1GcPQPmORx_ps', '', '0', '', '1', '1', '0', '0', '', '1470100895');
INSERT INTO `tyms_users` VALUES ('1373', '王磊', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlBYbNRknBFFnalcTKGsoYdANbudlM9R0hJ0mUqYOwSzCLibiaE7zeY6vicfoyeVAtyDZSWQR6SYoTiaW/0', 'oyP7DwL9mE4Ysk_3QdkdvOXF9ehA', '', '0', '', '1', '1', '0', '0', '', '1470101099');
INSERT INTO `tyms_users` VALUES ('1374', '快落', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDd6KaPXrrKR0nxPdbhwt6fHbg52vicBPEcpRA6qPDPGYRZ2XUJM1SCAKGP6ZoOxgLzlLaeCVia5Sros/0', 'oyP7DwAqjuLJLuNTBO9nG13ixgi4', '', '0', '', '1', '1', '0', '0', '', '1470102461');
INSERT INTO `tyms_users` VALUES ('1375', '罗耀生', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY54KyvpPuy6Zfkicx6hLnJmZ8hoq21t0Y0RU1Sj7P7S3hibBJtYAywKQHrUHRO3LH4Y0wumPR4jiajae/0', 'oyP7DwEP-bKXXC0xQp0BldqbQRBU', '', '0', '', '1', '1', '0', '0', '', '1470103811');
INSERT INTO `tyms_users` VALUES ('1376', '金表网客服001✅已认证', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLChibeVtVI7SamSsOACnSdRFDGGiadAdmRuAVrtrnOPX22kbRnDTzVHISmPlsyPJUiafSYwnqv3XPVvg/0', 'oyP7DwOykztwODNAG_bQeBjlZYQc', '', '0', '', '1', '1', '0', '0', '', '1470111568');
INSERT INTO `tyms_users` VALUES ('1377', 'Kevin.Qin', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5ap9ucvqLqwRthQ8R1rNFXQib1d3lkF9eyhvqUwESSmhGkhSRjHjZjYz2ibVju44HBFzO4FUPagbgg/0', 'oyP7DwMRWLxZeS5LnPbE2eBRjPNc', '', '0', '', '1', '1', '0', '0', '', '1470112889');
INSERT INTO `tyms_users` VALUES ('1378', '裴彤', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELErlY0cH6Mw29rejeu48ibgUXickXdmK1eHrNzh4Flviactfiazd3hhtBMPTW8zJTgzjHSkYH1ic9Mv1w/0', 'oyP7DwDI9lzWMVHQmlDYG91QenfE', '', '0', '', '1', '1', '0', '0', '', '1470123033');
INSERT INTO `tyms_users` VALUES ('1379', 'A0阿罗东华', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdXQJMXgjEib1OHQy5KJBjUyQnLUUiccDy34cmvMNSr7mJ7iaP9AbS6dl7qHc83Rf27nw4ef0ibqXrNCw/0', 'oyP7DwFI02NrHnBZlhzG8R5y-KEg', '', '0', '', '1', '1', '0', '0', '', '1470123567');
INSERT INTO `tyms_users` VALUES ('1380', '~_~', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibKcvrHIcG53sbb5GlHF5GutptuRfR5NY4nFRNhdJ7RokeQoibbm04BnRS296VzJzoCXibfAawn0LN/0', 'oyP7DwI-ZZzWkvCZv_qSjI4rYupw', '', '0', '', '1', '1', '0', '0', '', '1470123889');
INSERT INTO `tyms_users` VALUES ('1381', '陌上桑', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6ERZMmiavuzRvbBKVvicJqRvpLSWyetwRSWPk36uGeSW41YTke7D7lJC4vbu1Hk01sva75GiaL0CAnKacVYCYBect/0', 'oyP7DwIg3ImP12LA-m3BKtV_8Cnw', '', '0', '', '1', '1', '0', '0', '', '1470123971');
INSERT INTO `tyms_users` VALUES ('1382', '陈军', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WiakGKZlSwZWRd8Krzaic6rnISIzmlTHfPSH5icQicOGjkbu1wAia1byViciaZfkNuxUoRicpSiaaAUo7m2I/0', 'oyP7DwEJRDm3y6l5at_AQehcEBX0', '', '0', '', '1', '1', '0', '0', '', '1470125120');
INSERT INTO `tyms_users` VALUES ('1383', 'huangy', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dENwNm85zxBGp2WrLOtgbQUYjDWoc41NB7PwTjarxVC9ibLzOqAeeJvdpzWWn2iaEyJdOr3qic488k9X/0', 'oyP7DwCbPjmiDjS3Z6RXR_6hcyGs', '', '0', '', '1', '1', '0', '0', '', '1470125764');
INSERT INTO `tyms_users` VALUES ('1384', '变', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY52LkwJuLma27pK1wUaicQHmnTIatycKuMMHFxjOsDFMia3uJC2Lusuias3rMewQicBw2BoZvrFvg3B8C/0', 'oyP7DwEprNTQOFGvVt5Bdu-wvvjo', '', '0', '', '1', '1', '0', '0', '', '1470125769');
INSERT INTO `tyms_users` VALUES ('1385', '秦鹏「微信定制开发」', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM47mngsVDsl5RsFs0AqUL7IwcHoyKwR81rDrtDLtl9hlLZeL8JdysItgSTSgJm7T9RtQWsKia80gEw/0', 'oyP7DwA4sdwmFzNji2vCMIGL4h-M', '', '0', '', '1', '1', '0', '0', '', '1470126905');
INSERT INTO `tyms_users` VALUES ('1386', 'Pupu', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKW0EyPvz8ianibfNmgOHtv5SpnjDibgpyvuQqicTJgH6RicgfQQnPI8OicxFJUBXkbq7hHIYRXzx3A96icg/0', 'oyP7DwJs734Ntb2FSt2vQv1umOcU', '', '0', '', '1', '1', '0', '0', '', '1470128243');
INSERT INTO `tyms_users` VALUES ('1387', '周军', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ibYZ2RTVxib46y3TuSovFjUTjBN2iaKkhOiay7SemJdnPIrVEWRKkf8ibpL96Hua5CgxwDfcEicYJiaJtIWQvFKXmLey/0', 'oyP7DwJNJ2iuOT9MkXasO08PzDPY', '', '0', '', '1', '1', '0', '0', '', '1470129243');
INSERT INTO `tyms_users` VALUES ('1388', '', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0f8iaAv7qh6RRtNQIs7zIC5KuElYLBaibQlBsSXwENFnDkq6ia2P4z8NkE70GSTW3ZN1ic6LnlaKNExj/0', 'oyP7DwGm_X6FqNZx6jcHCPFzAL10', '', '0', '', '1', '1', '0', '0', '', '1470129856');
INSERT INTO `tyms_users` VALUES ('1389', '努力＆＆嘴角上扬', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90IrlqAtaMGXialXkLcAXUaOISm7sff6FPUSowZSrSIjl2qUiaUlrTOHibcKIPjP8FicsuYT5ib9vn3YjL/0', 'oyP7DwO0EcSVPT3951fhm9fmh8HU', '', '0', '', '1', '1', '0', '0', '', '1470130147');
INSERT INTO `tyms_users` VALUES ('1390', '陈照伍', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QOCmZfdouqRaV94F9D3yrVqRk3icvrtp4rjN0YldbThuYS0NAHrb3GnjAUpKhLicYDF9dRcHciaDdJ/0', 'oyP7DwLpdKcHyf4Be13iWkTn8tN0', '', '0', '', '1', '1', '0', '0', '', '1470132702');
INSERT INTO `tyms_users` VALUES ('1391', '风之子', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UDPwSWzZKbfrQibic580MoNIQwFdzQvM1dcby05icFPbsJhTrnibEsTkUWo00r78jrqbicDvMPbTOnmIY/0', 'oyP7DwEpxEyye6uObZQ01-gzJeqk', '', '0', '', '1', '1', '0', '0', '', '1470133148');
INSERT INTO `tyms_users` VALUES ('1392', 'Mr King', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCQNd7WfGK6CpibjWoo180fk8Kwpx9VobjnuEAJD7pT6eLPOpRqicDqoc6U4sKs6p3aGFVls5ArH67Q/0', 'oyP7DwOjXvKfK4kgESyNvyrnd-jc', '', '0', '', '1', '1', '0', '0', '', '1470134377');
INSERT INTO `tyms_users` VALUES ('1393', 'faquiR', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4pPxoga16bUibFJ2xB53q0eRTb3z2t4WID52lUSn1bhTU2LWicVn2UdTib6icMZB66MR0r7LFmqbAPxp/0', 'oyP7DwEVVQbgXEaYSvbQ2se1BaB4', '', '0', '', '1', '1', '0', '0', '', '1470134385');
INSERT INTO `tyms_users` VALUES ('1394', '我是肖宇旦', 'http://wx.qlogo.cn/mmopen/LibNrIz6OEOojQ1Me7WewgZyMMXicqj0ibEwia61wTId1Z6bCIP0ia5cfzE5C6cID16ZBibe4RDanzOWEeGIgeJNPkrSlsPLCia5Xxl/0', 'oyP7DwGyRmMX4kmZ4i53vnHoRaNk', '', '0', '', '1', '1', '0', '0', '', '1470140994');
INSERT INTO `tyms_users` VALUES ('1395', '森言心语', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4pvIiaSzPyQBFEm5IGuvYXC7WfUKqd3jVGp77AAn2JkaAAVDCbDLlMo0kksmAwoMzSltGkFxVAv2ic/0', 'oyP7DwCw9-WgNCpxo9JR-JXo-I6o', '', '0', '', '1', '1', '0', '0', '', '1470141413');
INSERT INTO `tyms_users` VALUES ('1396', '云倾墨', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5xl7iaNWfzpibzE5pLvhT48EGibaYt9KB8yJcR70pDWEkZwWZt960KOcibibkusukrO71x81XDW4QdDmM/0', 'oyP7DwILbNVzPVBJgrzGWs908joM', '', '0', '', '1', '1', '0', '0', '', '1470141724');
INSERT INTO `tyms_users` VALUES ('1397', 'mr.', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLByldrGE2zicIQ4OiafjAaMPHo1D6K7NmtzPR9MwO3BASvXiaaheSQ41tZLoTclX5oJ9y84TEzYwwcxw/0', 'oyP7DwG4f4kRPsHWYVA77ZgOMcAU', '', '0', '', '1', '1', '0', '0', '', '1470146486');
INSERT INTO `tyms_users` VALUES ('1398', '刘政', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicAxPxDAEf629Cz1UGRM9Z6tCg0z1RopdlYRTlPp1utsMbjn79Fiaibh5xN5hbm2xX3TUJDmAfxsM3/0', 'oyP7DwDx9QpaY4iDyc19v9O1uE80', '', '0', '', '1', '1', '0', '0', '', '1470184058');
INSERT INTO `tyms_users` VALUES ('1399', '吴锋', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ6DAeCia5LNaeazb410SRshUwDDQa1Yq4j1iaebVyzv94hKk6Xt4I1Djyia1GFSHwgIlIvlIDG22CbyBdYjY0YVnZ8/0', 'oyP7DwIWb6oyYL9QsACxAwHM3DyU', '', '0', '', '1', '1', '0', '0', '', '1470187436');
INSERT INTO `tyms_users` VALUES ('1400', '似水 13215709876', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1w1xLcdFTY9rfncn8wxOam86rsibuT69uCrczUbKzE9bu7iaRQ7FpBvztjW3ppO9VA83yFPaVZGNlHFZmzib9Oe0g/0', 'oyP7DwD759irc4wti-yoptrtuKXM', '', '0', '', '1', '1', '0', '0', '', '1470187629');
INSERT INTO `tyms_users` VALUES ('1401', 'Nick', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADvLdd9F231PicD7DAiafib5FKIunAjlMzp5ZNPcKQnbvn06B0QnvFEXkWOfGk9AdCyOBhOEJIRISwg/0', 'oyP7DwJTlAuv6ZbGUOf4d9Kt8jGw', '', '0', '', '1', '1', '0', '0', '', '1470188755');
INSERT INTO `tyms_users` VALUES ('1402', 'new xiaopu', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53Ufw3DIoezfGCSav7sOiaTpZ3icfvVZJPics7OzQLoWjJvIw0jqRicGsVt1AYzgKKpjCKpnK2S6wlfX/0', 'oyP7DwM7l2EOkTfP4kCd3wJ3GtQc', '', '0', '', '1', '1', '0', '0', '', '1470189028');
INSERT INTO `tyms_users` VALUES ('1403', '馨香', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eNQ5W1wFTW6ia0b6ogDv1SVjYwIMib6orDbpJqVLm6ARB3yfo0XP275ibwpjhtU74H92UfGiamEpl8Gk/0', 'oyP7DwOIcReiIDiXFrx58M18XpF8', '', '0', '', '1', '1', '0', '0', '', '1470189202');
INSERT INTO `tyms_users` VALUES ('1404', '飞子、', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VucNzohdnPEBL4vDia18U7u86lZJlzohe9TDcG3pUpk7GAHNTGW3ahV06QKjtSvtPOMyhSqibhjg4/0', 'oyP7DwNVXh0GxVXhOoHXXFngy4o4', '', '0', '', '1', '1', '0', '0', '', '1470189711');
INSERT INTO `tyms_users` VALUES ('1405', '秦少', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eERx7gzCXOTlYsM4d16fs9ynZMvEibM1BYc6niaQ1CntRADSYMzJdP3LIyxfQkQ0rTmU0B03ibTp3gO/0', 'oyP7DwKcpkfFAgA7ghvneowVmgZU', '', '0', '', '1', '1', '0', '0', '', '1470190967');
INSERT INTO `tyms_users` VALUES ('1406', '彼岸', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKqX8px7pcgxYiaZytPZvhkzFicd6DDUdIDlVCw4YDB0LIotMHWVc2YPJLYjWjOJib9d9gqORpdiatuk/0', 'oyP7DwK9nBU8pMsv6vW_S_IhMjyc', '', '0', '', '1', '1', '0', '0', '', '1470191971');
INSERT INTO `tyms_users` VALUES ('1407', '文韬文萱', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5SibdtBrfWIBonQDa21RVQKmsVcKZYZW7MZBQD5h4gsN9iaicU5EAZsfPrU5iaMzAGjaibc4YpnAMOlDYicdOWEfCwF5/0', 'oyP7DwPtwBGde4bv0PePRDkkhYy4', '', '0', '', '1', '1', '0', '0', '', '1470192118');
INSERT INTO `tyms_users` VALUES ('1408', '王瑞力(ˉ﹃ˉ)', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5KScaR36AYwqIq5faa566SuGW4NgVyXwGJhquoWF0BdQ0FIibXedqmu6lon8DsBW1EBAoGMicj4vVcM1sTOdJbGic/0', 'oyP7DwHgXowonxwjSmWm0oK8Ow4o', '', '0', '', '1', '1', '0', '0', '', '1470192193');
INSERT INTO `tyms_users` VALUES ('1409', '吴鸿', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMskvrRlxabbhR3qE5A1yPaRJpVkqPL4XFNtWf8W55D8g9Ea6TRv7bwyE1P3ZFOD5QOoiaqplCia7n/0', 'oyP7DwLqSsV5SUSOtd7Opd4afh1M', '', '0', '', '1', '1', '0', '0', '', '1470202603');
INSERT INTO `tyms_users` VALUES ('1410', '测试', '', 'oyP7DwOCO42yPo40bFG55rXhSnbI', '', '0', '', '1', '1', '0', '0', '', '1470203074');
INSERT INTO `tyms_users` VALUES ('1411', 'Richard', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdecHm0gYKCiazg81KQPVSm8J47N0ibuicJ30ID7HlZd5POowasVb8UygjLZGMQ50QPhrmliaYb43KEEV6FpsJZGptJ/0', 'oyP7DwK8BDCemGjm2c93cUkX3PfQ', '', '0', '', '1', '1', '0', '0', '', '1470203302');
INSERT INTO `tyms_users` VALUES ('1412', '王强兵', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJXGubhiaYpicmicekiaCOytzykmpTLbtUy8RR5pt0NM6eYLXrbicjngnI3I8V81Z96n7Csn2CDC1vmD7w/0', 'oyP7DwNpd5XoZs1J2M8cvCC1_-rk', '', '0', '', '1', '1', '0', '0', '', '1470204051');
INSERT INTO `tyms_users` VALUES ('1413', '谈笑风声', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfUQdZFGZ4wa8sf6HiaibZyjvDIqeQ61DUJn0Yynl1ZU7icGoC4wNBiaxIicbQ4jCvKVd8ibRap2oC8SjzoiaiaDv46OuhF/0', 'oyP7DwJeX7HrWLcPvlgE7y2LPR3Y', '', '0', '', '1', '1', '0', '0', '', '1470204754');
INSERT INTO `tyms_users` VALUES ('1414', '蔚蓝的天空', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfw1N9GFNcLHDZwcyft6picBrrmliaQXmbk0eofDAgq5E8PmeRMPIMXcEvsWnMJ0nOvE36Ub3v1M6iae7dHXZDO8ibib/0', 'oyP7DwEagiI5cCFg22NhzuytEx5M', '', '0', '13452991919', '1', '1', '0', '0', '', '1470205933');
INSERT INTO `tyms_users` VALUES ('1415', '车٩(๑òωó๑)۶车', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7IuyTorP8Mtogf0dVaKRDx7ib4rP4xKfoq3YALYwgnJGcAHyBRjwK1YRowFhGkXEJJH08MFzedyP64pvzfNGdXZ/0', 'oyP7DwFRuXv78NSkm9kJ05feR5cI', '', '0', '', '1', '1', '0', '0', '', '1470209019');
INSERT INTO `tyms_users` VALUES ('1416', '黄秋涛', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7CyHXp3uCvxyT5XFIvngxx5spdbQvhIFruQ2BF4ibtCoJBYNDx5QF5LM1xaOdECxkibBaoAnEoHjTjOliboYIWZeb/0', 'oyP7DwJKTrpVcYfom5HMPONFg3Os', '', '0', '', '1', '1', '0', '0', '', '1470209193');
INSERT INTO `tyms_users` VALUES ('1417', '郑实有笑', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5kQ8ibXbdpkDZIT76qdwI4c5roGmnl46WvdmJevry3iaEwXjmj1yfulOQjEtFuEARAqwomsaV8exRA/0', 'oyP7DwM7B0Kl1x6ybi2zWMGSnBPw', '', '0', '', '1', '1', '0', '0', '', '1470209348');
INSERT INTO `tyms_users` VALUES ('1418', '哲哲', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3zF4AFiaj08SAPtxxyyULt3iaDzHYCmQVW48goBruwe9aiaWcibcMiaRoibgGjacmtMn0WZHuGiaZBYViaz4oS1jn8fMmF/0', 'oyP7DwLiJbyHoHemijlEXbpGORFU', '', '0', '', '1', '1', '0', '0', '', '1470210719');
INSERT INTO `tyms_users` VALUES ('1419', '杨海涛', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eBw3yk3bDoUkvibpUZLyXaCpJlsHmsCLWkA9yR30Ic8EoyxictjEutWriaCVExrZ7FIyTTolNbnFd0X/0', 'oyP7DwHIUZD73E_cd-xoNWRPmnhA', '', '0', '', '1', '1', '0', '0', '', '1470213309');
INSERT INTO `tyms_users` VALUES ('1420', '风翼轮滑～刘锐', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDHcFUyHgJtHk4ibJIypTv0MELLeWpEDGN1JgicrvnRKicAFov7EgIUibc1lWlPnSheibSpk0pQbfNwdE/0', 'oyP7DwBX7McNb2hllz0R5RRau6bY', '', '0', '', '1', '1', '0', '0', '', '1470213782');
INSERT INTO `tyms_users` VALUES ('1421', 'kerry.gao', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6F05F3vFUz3ucVXZHgW1m46p537V1U6YBJtaWoRTEb3VE7ybA3m09utqCOSaWCOY1de7Ic3vdEh2U5r65qfxtw/0', 'oyP7DwLKzy2hLKUS1SdUXgjULhkA', '', '0', '', '1', '1', '0', '0', '', '1470216186');
INSERT INTO `tyms_users` VALUES ('1422', '沃德天', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia8t8CvdEuOupw8uiaT5ric5Q7AfRia9ciaNCxhFT8nMDszHjzv0WWU4MRwcEAm63XqQUfgxysknibSMl3/0', 'oyP7DwIuUZK3dvddXWKrMc9ZWKEY', '', '0', '', '1', '1', '0', '0', '', '1470216419');
INSERT INTO `tyms_users` VALUES ('1423', '闫军', 'http://wx.qlogo.cn/mmopen/ogmFK26WYRT7w0HXib8QfhHJI0aN4o1ZURzYnicSPCZUtfIKhZ9jypnwlbn0jfNUqbn6IPvhKIc2kq98wv4MvQ5A8YxzJwXRo4/0', 'oyP7DwAzHHnyUAIspXdNo6lvHlC4', '', '0', '', '1', '1', '0', '0', '', '1470216868');
INSERT INTO `tyms_users` VALUES ('1424', 'Alan', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL51AXZgAQKn3jXy8I3lLw3uAoaH1eIAXmV50Ahp75BnROez5n9WogP8QlC7KYuKmm8nWlxzj1mt242zicQAhl8as/0', 'oyP7DwGTNhSEveS_SQV_G51XkrUc', '', '0', '', '1', '1', '0', '0', '', '1470218700');
INSERT INTO `tyms_users` VALUES ('1425', 'A let', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdpuj6M68sQuia3bE0JwRGOw1FXyh6LWtRjJUlLqYia9CZgMLDYW6eOuZquqkN28zCqhqQibTlEeMggzSibGRjia7krF/0', 'oyP7DwEEzlJLBtu8TAgyTCOqr4Y8', '', '0', '', '1', '1', '0', '0', '', '1470218879');
INSERT INTO `tyms_users` VALUES ('1426', '淡定、随缘', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Vic0bdUX2vRjb0KEiaVeZPh0iaylpAI1Iz1RzicoAhj57CwjDYD39LNdcOuGvcHojStr6V8ZpianaZEh/0', 'oyP7DwHC3sufF-LNjWLOV1Ei4rck', '', '0', '', '1', '1', '0', '0', '', '1470219618');
INSERT INTO `tyms_users` VALUES ('1427', '钟瀚涛', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0nbZTIbJVkl7siakwibHOv9CqG9UoGRaRUhrEaCWeQorO0xFAlM4sF4uQvJ6vCp9Zeu0E0JkvznZxkPOD69GMngY/0', 'oyP7DwIpA3WrWgxCrM36nfxnCXNA', '', '0', '', '1', '1', '0', '0', '', '1470220391');
INSERT INTO `tyms_users` VALUES ('1428', '亿阳信息科技', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEIRSl5ZYKhal6IYxOnDyC97OXSt1J9Br5ImLjnJNWGdg1TibHv2gIlJt3Ce1oLFAg1z31OAHYwkqd/0', 'oyP7DwB3bWLZfhCKaprR8eL63xU0', '', '0', '', '1', '1', '0', '0', '', '1470222575');
INSERT INTO `tyms_users` VALUES ('1429', '红茶', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL618A21dUtJmiaRRh0ckQ2cyXjeib59PibCzwxeog8aia7NyY0ydrWibgH4IJqs3Od2CqdPj8otuiaA3ibWCpLr60WiavCr/0', 'oyP7DwF5IxC0zXl5_0jKbGqH8_OE', '', '0', '', '1', '1', '0', '0', '', '1470223029');
INSERT INTO `tyms_users` VALUES ('1430', '华仔', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP22XtEA3JW8aibA9iaCic6lP8lN1cySnicv1XRpOjod9pL47KMs8u93ia7zDMiboISZ147JuJicWHtj6G1Xw/0', 'oyP7DwDLkHIIGdwcrmecsr4bY-Ls', '', '0', '', '1', '1', '0', '0', '', '1470229812');
INSERT INTO `tyms_users` VALUES ('1431', '褚国豪', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKvYHvAibBD3vSUl1fLzAII9NvDK6engh6LYJFJvSsnCgOOcAxGtFf9gcRt7kyERuClqMctOvX7Fqw/0', 'oyP7DwMzi1CBdWQIVh3q7amzLHXU', '', '0', '', '1', '1', '0', '0', '', '1470231793');
INSERT INTO `tyms_users` VALUES ('1432', 'Burning Myself', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAbZ3qPRuv4fhY0rvTR2Jrp4HYD7LZGSoDIOF0AAYBXBtb8kwy20ibibR6BOWEH5SMfkbxLLgfxgKwg/0', 'oyP7DwGsx7fvfV5bZ4XmSWgiuc_w', '', '0', '15696434348', '1', '1', '0', '0', '', '1470231984');
INSERT INTO `tyms_users` VALUES ('1433', 'wangfeihu', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6RZYyPRtprvfVyMgHBa8vMzxPdwLibMPIjIqX0g42PlGQicGeQavwKcbMMbGU5EgdgsSERTogfKHHA/0', 'oyP7DwIwmjZDMhSet6OxsLRwWRYQ', '', '0', '', '1', '1', '0', '0', '', '1470232715');
INSERT INTO `tyms_users` VALUES ('1434', 'Figo', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEBdHvYtgibB29mKYoKzic1IJicysaCpm7AoPVtcMicaqmrqtPGXkDQ1qhQCdQ3scpX8tAY5JdpJIy1vS/0', 'oyP7DwIYyZFsu2TBVEGV_-7IF--I', '', '0', '', '1', '1', '0', '0', '', '1470232983');
INSERT INTO `tyms_users` VALUES ('1435', '天下行', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9gG3CkicwGfsuxdEPMPQwlQCdYEUuLzZhmialrr9RgJWGS0JwHdqRWgxLpaH4SibPDCqMplRfRt3N7/0', 'oyP7DwHbYTYOE1s0Z70Gf0wxPT-o', '', '0', '', '1', '1', '0', '0', '', '1470233028');
INSERT INTO `tyms_users` VALUES ('1436', 'Arlon.Young', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDXmZZFoyY6cScPCw2hxIuEcsqvGsVJIciam09tovTkbcoTswKibYibTyrTjvGvXk3ib1SDhpX56Phc2z61lGckCdtsZvrl0ytibQsk/0', 'oyP7DwC1WnASxeTFszNKIUeFaVow', '', '0', '', '1', '1', '0', '0', '', '1470234732');
INSERT INTO `tyms_users` VALUES ('1437', '东凯', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ8e66ANibgLibO7ZgGJ3zeUk9YS0yHpft10LhpvndXZoA6ic1eiciaMCWNzoleOxjJL5dL25EpO6PQayw/0', 'oyP7DwABQ_HhZZ0g4NxDlhWHuY-U', '', '0', '', '1', '1', '0', '0', '', '1470235294');
INSERT INTO `tyms_users` VALUES ('1438', '晴枫', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5zufR9DFCHlGFss8afiaWrbF6A7dRExcLM4k4ziaqFiaHoRL8l22HZVsw6JLVcUic6sxgjDy44INLmH7/0', 'oyP7DwMhroMKNs-5nVj_uvZ8tE50', '', '0', '', '1', '1', '0', '0', '', '1470235698');
INSERT INTO `tyms_users` VALUES ('1439', '冰冰', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90FDNzOe1vw3d6Ibsycs2cicA2BeS4k2TQgWu50K1lyqx576LHtPkYnx4Lm2ftoVJtJFARBGyzS5QJ/0', 'oyP7DwNCcWLd5gi_oyZ7OfT6EjUE', '', '0', '', '1', '1', '0', '0', '', '1470241785');
INSERT INTO `tyms_users` VALUES ('1440', '陈敏', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCt0cVib2ibbB4F3xhUib6MdyrOXRpYdoBu1QTB7av6eyiaqFsPPqsty3bzjqYX1Wk1F28mEo4M40sH2Q/0', 'oyP7DwIKRDJF8W7V_qna7Mv-KJNU', '', '0', '', '1', '1', '0', '0', '', '1470244722');
INSERT INTO `tyms_users` VALUES ('1441', '空城只因旧梦在-', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7Bu7ON43iaibibe7icOiafRgM4eRkbLh281AcpFgzSSCcXw7FYH9GSghV29OomsR7Jp0UOI5oerNzF79vUicX4SraahN/0', 'oyP7DwMJ-b5ARJZuE0jHAyC07g0g', '', '0', '', '1', '1', '0', '0', '', '1470250668');
INSERT INTO `tyms_users` VALUES ('1442', '麦小小', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6BXbnxtic2BBw4aZ0oP85pMkvzNbjM6f3ZR5goquZAVVkPicyQpyjNmhrkb4uMeUiaZtqsrPQj2wv3g/0', 'oyP7DwGbd1Eo3oYgZlk5dset0Lf0', '', '0', '', '1', '1', '0', '0', '', '1470269580');
INSERT INTO `tyms_users` VALUES ('1443', '红辰途梦', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0Gz2wbU100ia96Tvfqgpw0jLwGicIdNUHMOMicuulVrPM9hEkka7INXtE0Lkk8veJqmZjlib7iaGOJr1NAYjyVxScXI/0', 'oyP7DwDeA6Ks4fh4ykji47COwlms', '', '0', '', '1', '1', '0', '0', '', '1470273803');
INSERT INTO `tyms_users` VALUES ('1444', '敬之若善', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0euMwSibp45Nk7GLnrXLA6rk3FdWgXsnAQyZHjdx8LBFejblZI8E0d0kEPvJdibWXjedJOibuMMSib3u/0', 'oyP7DwMJ-T4dM6C3mBtLJpFLxBuk', '', '0', '', '1', '1', '0', '0', '', '1470275891');
INSERT INTO `tyms_users` VALUES ('1445', 'Winter→_→', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4BeUic389NQceH2qRA5fUxgrhakh9SzPYGk7v3XiaVuSpLcVIiaPia4nn8Nicut6XZUbj1UN7QljYm4K/0', 'oyP7DwPFBAxNgESPlmq5I2ClCdT0', '', '0', '', '1', '1', '0', '0', '', '1470277736');
INSERT INTO `tyms_users` VALUES ('1446', '观沧海', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5P9jh7XE64MxrDLdHDRORIuZOfl5oWjyP6Dhu1uzuHyiaxPqga0ZU2D54iaFNdcib6M0LrGBDClElsliakR3tH12eF/0', 'oyP7DwHlYGqFNERju-SP-TfUHC0g', '', '0', '', '1', '1', '0', '0', '', '1470277839');
INSERT INTO `tyms_users` VALUES ('1447', 'jove wang', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELVkjQnKUVuRSicwp8UmnfJryxXSJKvyytBLwiaQjVt6GmSXlAqgssQmDt3Ud3CyITicXnN4eIUSAps/0', 'oyP7DwCBQO84PXkLNX0AvHTkIjYg', '', '0', '', '1', '1', '0', '0', '', '1470280864');
INSERT INTO `tyms_users` VALUES ('1448', 'app开发网赢科技', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eCkfgz0G36y0Kpe61AbHSDebjma82HoB30RgQdbjnb3nyOEoTR3FnQAsFiaSDW091ibodtlceBppgr/0', 'oyP7DwNOm0-Gg2RE_7M3ahjYIJAc', '', '0', '', '1', '1', '0', '0', '', '1470281808');
INSERT INTO `tyms_users` VALUES ('1449', 'AF翁剑飞', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p00hiaIbjHSE4vV0XnsPyfCyKywCljGdia7ff1iaJd9XoZggIz0U8xic7MxhjThysiakS8Vk3HRa3mfiaLIwCgmjcdDry/0', 'oyP7DwC6-PVtYRkMj_O2SR0xNvKs', '', '0', '', '1', '1', '0', '0', '', '1470282628');
INSERT INTO `tyms_users` VALUES ('1450', '转身离开', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1weX6UNVoSIE9S2FdELgYDHkCIoXSmS4B83VMjVpSbYeRx8IwTIu16o3NmSClngcojtiblMI96Owg/0', 'oyP7DwHI_ip8uj1kysAMXOBTsaFo', '', '0', '', '1', '1', '0', '0', '', '1470283337');
INSERT INTO `tyms_users` VALUES ('1451', '张涵宇', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1ib6kDU1hs76oBWQBficicVkeCFQNBGjs0nqeKqwxeXH8JfEkk0BTG80GVCh3kTZadiaB7y8vGiaAG6Xw/0', 'oyP7DwJDy3jOtlv1OQLWjAPbMDvc', '', '0', '', '1', '1', '0', '0', '', '1470283677');
INSERT INTO `tyms_users` VALUES ('1452', '汪洋1', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ZN9W0J4KrWPEhPZWcicCs8Io5udia3yzfCC9NhegAcdRwlGPI5Ara5RiblBZXFzvaw2GQUhSdcrBZNeicXOVNXyRB/0', 'oyP7DwA2RRwKKhH73fcPRC2eCUaA', '', '0', '', '1', '1', '0', '0', '', '1470289978');
INSERT INTO `tyms_users` VALUES ('1453', '小爷', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6VjaiagmQs4psuicAqQ8Qaibds5Rib9c5C9VpNvSIGpXUh1DhYS9NfuZgdWibmY77S3xAgkEXp4zg5CM/0', 'oyP7DwGQrRarJhy78QeJgOQmbvqw', '', '0', '', '1', '1', '0', '0', '', '1470293141');
INSERT INTO `tyms_users` VALUES ('1454', '鬼啊！还小', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3LS3cDDNZe0mwFibCV0yTq3D3icibfAf4NnJsRtZiciaJXGAy5mSDjLBhS0JRc6XxHXQpuntb7fbV2Auc/0', 'oyP7DwCJQRncIkWfo0hJdEDzQzck', '', '0', '', '1', '1', '0', '0', '', '1470295042');
INSERT INTO `tyms_users` VALUES ('1455', 'Angelia', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ibeLQjWb3SEylNpdOGIwkKYc6SyvDPxSlDXbYL4CqViaHaCjDa07oQ6CA8BuRLrg1mmTMDUcJ1mo5/0', 'oyP7DwD3d4zkB767gCvi0zeztUdA', '', '0', '', '1', '1', '0', '0', '', '1470295624');
INSERT INTO `tyms_users` VALUES ('1456', '陈红旭', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UFeblCsiczNU6tySaTQOJ0EwKdEgiaibuwFXxl07pJ5jK3tgMBiatt1icHh3wFKcyTKNbnQfTGJCFBW98/0', 'oyP7DwDs3R-0wz8XZp_eJIgbpBfs', '', '0', '', '1', '1', '0', '0', '', '1470296023');
INSERT INTO `tyms_users` VALUES ('1457', '刘亚楼', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5yib8OONWIMpQ7DbOFX6Eac5QnC1QP0y53AWhGSBJs61rN8QicQHuWlAfKmdC9oDCtiaBEItibuvqZEQ/0', 'oyP7DwLJjzQPTboYljYtWo63cj5s', '', '0', '', '1', '1', '0', '0', '', '1470296265');
INSERT INTO `tyms_users` VALUES ('1458', 'yanchunmeng', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibe6XPqr53e6NPaJtYrJ24g2ZNkPzvUSxXDvuHibbSqeeUFXicDcoE3MgibpSIBOIYhMzClcJf4rapY5A/0', 'oyP7DwAw6n3RloVAIO2N5eqRGE1c', '', '0', '', '1', '1', '0', '0', '', '1470296326');
INSERT INTO `tyms_users` VALUES ('1459', 'Julian', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ppiatUAEEPssaP50OUMQEVfic1WGKQgQnvzx9ZKWKvYuvo31icDuzPkhsB03iajK0ls26pdR6Pks0Tf1ZDvyiawW0V/0', 'oyP7DwIlIQ6lf5GqbjY-iRpi_xNM', '', '0', '', '1', '1', '0', '0', '', '1470297113');
INSERT INTO `tyms_users` VALUES ('1460', 'TNT', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3JmofCWUibibvSbnR1eGYiaicPvxTjc3SNIhoaX1ia6mEH6SkyFU93Ozibq3bu4nnPCggqGThmxbbaRGdQ/0', 'oyP7DwK1kuyFW5bNPhGT8tKZZAP0', '', '0', '', '1', '1', '0', '0', '', '1470297335');
INSERT INTO `tyms_users` VALUES ('1461', '小溪', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDshrhMBSsyFY05HJU1J1PhW2cJIicv3q3ibicA7TycDV9KTsicc1ZfSJKiceERmWnkQVnXNED0AFLeJHA/0', 'oyP7DwOMqd78Hyf-EKKrepMZVR0E', '', '0', '', '1', '1', '0', '0', '', '1470297621');
INSERT INTO `tyms_users` VALUES ('1462', '王冬春', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL7y1ddnvMnaGea2OmGjP4xTk17ZucjibibkPcSKV7Z7OwLCcwHzm3RkjHHibARfppPXucapUfzPotaQ/0', 'oyP7DwLwpl8wK2htYfZPQLvNdx4s', '', '0', '', '1', '1', '0', '0', '', '1470299031');
INSERT INTO `tyms_users` VALUES ('1463', '(ಡωಡ)hiah', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2hkGl7bWAw3HevgruV5GVglQHv9gict2C2wcALB4kvZHtW9olz7E9DlnpmickeptZfHTFZqCOmcglMkIcetNsBiag/0', 'oyP7DwDO8XtK4r1CRSIHuuu6Upnw', '', '0', '', '1', '1', '0', '0', '', '1470299267');
INSERT INTO `tyms_users` VALUES ('1464', 'Jack', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1nA81MpxyicLiaMUbCoISyJibuAIlXesXKrEFiaRLWofOLAOZDAlN5LykaJKelFeHiaHzt75zZOZicwmbg/0', 'oyP7DwF4RFf836kfrBdno27A999Q', '', '0', '', '1', '1', '0', '0', '', '1470300354');
INSERT INTO `tyms_users` VALUES ('1465', 'Topgirl', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGiae37koE8KlFZcANicrzJOOG7dd361iagEicHkA40ibyOibz9FDzWNOHkXsySDDiasF5RC51ulVu1U8P5/0', 'oyP7DwErbm4L6F3p8i1XewP4VGn0', '', '0', '', '1', '1', '0', '0', '', '1470300534');
INSERT INTO `tyms_users` VALUES ('1466', '素爱', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIqlc6n0WER2fCR7EOHAJfiacfsNEFjP930dVE9m7ZM1SUmhjicsia50XabnqnqfSk0bOFMTjDUD7ibFw/0', 'oyP7DwBp4zbd5lZ3rSTf5WisQO3s', '', '0', '', '1', '1', '0', '0', '', '1470302198');
INSERT INTO `tyms_users` VALUES ('1467', 'Phantom ', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4Fr6yVKZ4FJClAiaF0wDgAq6MwFlbtJfw9QM4HmkUHS9XuT8sTZRyzcINl1zKeRRlsJJamicfOyjnw/0', 'oyP7DwMPpyAJetV90DZq_hjQA1X8', '', '0', '', '1', '1', '0', '0', '', '1470303347');
INSERT INTO `tyms_users` VALUES ('1468', '淼泰网络1234567', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY56kYUKricvVLA3WtVbzPSVGQRj5sLjKUk9nlKGfoy7aJnhyh89fgIC44ibgtELPp0icQ8HPxRdA6CIJ/0', 'oyP7DwPbzNaUeMYYv0Fy9_XnWJ7M', '', '0', '', '1', '1', '0', '0', '', '1470313408');
INSERT INTO `tyms_users` VALUES ('1469', '走吧', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK8aXxrrDKQSNYKvu5yeGCPv9kmzNSmdyYUjibB5jfQ3nD8QsrSFXmZSh4G6L6LoOhvPj4T619oFaQ/0', 'oyP7DwEqhxrqT5TRJRThGs1wgzwc', '', '0', '', '1', '1', '0', '0', '', '1470315860');
INSERT INTO `tyms_users` VALUES ('1470', '扛枪的大猪♬', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELyDbiaMmTYmhGx4ZRa7SORJpfJIWcFtg9Jf4tcVtwQvH8KaAZVYhskdPsQys2PmqLaib1kuTGBH6Qg/0', 'oyP7DwLlMslRo5ZaCAT-anAdSXJQ', '', '0', '', '1', '1', '0', '0', '', '1470316863');
INSERT INTO `tyms_users` VALUES ('1471', '林雅涛', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGW09g278eqJuKcmXYaIon93g4bPJx2ZZaXuU7NhbE4aEzo5JwicvjGe5W1B8JKnjCic5ldXMMZAibd/0', 'oyP7DwM40MFUiyvExxadynGwVczc', '', '0', '', '1', '1', '0', '0', '', '1470317783');
INSERT INTO `tyms_users` VALUES ('1472', '张学功', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6GEZ3uXZuqV4rzkSJFCXCiaia0sZk4vxfP0cNlfQoiaCB1WzRa1XUnlFZENaBVVP1QJ4BiagOTwibq8npU5q2GiaaIvY/0', 'oyP7DwM_7n-aiDqaMJCjOQvjOcMI', '', '0', '', '1', '1', '0', '0', '', '1470317855');
INSERT INTO `tyms_users` VALUES ('1473', 'Danny Chan', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCCbFGvKmOVetKsVtuLmawSsiaqia4vj6MMoI8TsgIzVnEcVZS9R3MaZKR6mibmZ3ictkb6Pv3JoOic3rA/0', 'oyP7DwMX1B-eE1LVIrtrHhJlyOCc', '', '0', '', '1', '1', '0', '0', '', '1470318434');
INSERT INTO `tyms_users` VALUES ('1474', '无中生有', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBWMEXWiba96lYPCtSzDXvzib6pZEibXAic13Fanl4BsAIdwicsibW1bnibXQ2KObvjz5oo8xpVHAIgomSicQ/0', 'oyP7DwPut80l4Xo6zgvEoB66gajI', '', '0', '', '1', '1', '0', '0', '', '1470359413');
INSERT INTO `tyms_users` VALUES ('1475', '丁长老', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPvQhGiatQ3BURYkFZw8Wnm6yVrlqSAx9tiblnsqNAgFkt8O9jwAGqkTFicyaiapg6UVrf297k4d4PSu/0', 'oyP7DwGEj2FfUZ9g4RbgLH5zNMpM', '', '0', '', '1', '1', '0', '0', '', '1470362630');
INSERT INTO `tyms_users` VALUES ('1476', '华ing', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDJ61urgEPf2ZGXrL0paDlALePqWZoIT5WQ64ribtnEIicqnwNluMwczhPHFl8hUlEIASMXr4bvlUbKXM9K416gaPl9IcZfklCwo/0', 'oyP7DwPV5hLfyUKE7alxHcM2AiZY', '', '0', '', '1', '1', '0', '0', '', '1470362818');
INSERT INTO `tyms_users` VALUES ('1477', '赵楠', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4ukSMl3no2s9Iiciapibvu81DtPodYXjpXq32BXtlkG6mgHmwcp6erl9DOdl9reHgwJ40Cib4JvsmPmw/0', 'oyP7DwDE2y3yqZ_yMJorEshMu21A', '', '0', '', '1', '1', '0', '0', '', '1470362963');
INSERT INTO `tyms_users` VALUES ('1478', 'l', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGzwqtU3fwNNL5QvbUKPqACBXolI2oPmMaqZtgGYqIMz3cPo2NOH8NBBYNkV1Qoa98Z4SpelCEXK/0', 'oyP7DwLdNWR-ttAf7x-4VOJkfotY', '', '0', '', '1', '1', '0', '0', '', '1470364210');
INSERT INTO `tyms_users` VALUES ('1479', '180577190309', '', 'oyP7DwMQKIZFF_2070Exp8wJjbyE', '', '0', '', '1', '1', '0', '0', '', '1470366083');
INSERT INTO `tyms_users` VALUES ('1480', 'Mr.Wu', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5yXt7PL3fL9cYL1Y3qNNgUOwzL5QftT78Qr8jR7ZRibLT8OHmiabko1FNqYhlUdVyiceHbvn5SZPyhO/0', 'oyP7DwFVy-0lRchzfvRWLoB2EKB0', '', '0', '', '1', '1', '0', '0', '', '1470366321');
INSERT INTO `tyms_users` VALUES ('1481', 'Dr. 蔯二', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4tn4pOTcSOOYUoM7wqI7Hzwbeibu5f6AEHMSLemwUDySWzgtaf2ds1wmfRLVJaic7bTJHibpVXxmiaiak/0', 'oyP7DwGg3NI7bnV96brWyV3aaY4Y', '', '0', '', '1', '1', '0', '0', '', '1470368980');
INSERT INTO `tyms_users` VALUES ('1482', 'lucifer', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLByVfhDXxzYMZAgoBbibumG3yicBIHwOYfWf06bXdDjsU6QLdbx0rwibJJl2uk2AFQQIDoxDicQzolg7w/0', 'oyP7DwN9bc-Qo6Gx-U2d0Ajo_kHw', '', '0', '', '1', '1', '0', '0', '', '1470369311');
INSERT INTO `tyms_users` VALUES ('1483', 'lrc', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UN0hTkwL1JFasKOwRzUGnuKsiakoNfACj0GjTIZrCOt3PPlOs21icIxxVa5iaQK7c63MEHH7ibJMIEq0/0', 'oyP7DwCLL6akxnh6LQDV6kjYe1rg', '', '0', '', '1', '1', '0', '0', '', '1470370341');
INSERT INTO `tyms_users` VALUES ('1484', 'Apache', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7tDRtAkTEbnA1om8b6vgGYzg40K4HEL792DUkSKm6u5wONfP1zFKjjmy2FPDMH4PqpbSk7DreUwdAjqZkfDiaEib/0', 'oyP7DwFhySbXiEvNrLR9yByfxco8', '', '0', '', '1', '1', '0', '0', '', '1470371337');
INSERT INTO `tyms_users` VALUES ('1485', '唯平', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAWhxHRQEC9roYibxuoBHCoCSeeJg3LWcnpQ0zMVJ5qKIWGdx4qNZQhvU2JFskxdJy5vzTfxIpBzB/0', 'oyP7DwAvc-Y7y4lLTk0b0Zx322cc', '', '0', '', '1', '1', '0', '0', '', '1470373009');
INSERT INTO `tyms_users` VALUES ('1486', '柒加壹', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMC6OkMQUSwbyjpYxf6e5vChTxv6nep8I969bdEkcMnONXl6KZHTSoYhssTkfSfKrkymluOvlyw5/0', 'oyP7DwOZ1KQhoern3ihJD1SDFRSc', '', '0', '', '1', '1', '0', '0', '', '1470376009');
INSERT INTO `tyms_users` VALUES ('1487', '猫叔', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDd136gxicDbF95rKA2UvnZSAhiaRJveyLoGcGqamNzWD16yFxXYBSZWiaqWEo47as8FborB6e6Idm3lE/0', 'oyP7DwBQSFMOBP6q5nsXTp8YAzQo', '', '0', '', '1', '1', '0', '0', '', '1470376172');
INSERT INTO `tyms_users` VALUES ('1488', 'A00000余干便民网－电脑配件', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6hdNQS3PUE38AFsqR5xeY6oWXq99wBaJyRgG5riaVSmyKo3Sar9woAWjRhX5ryrdl0RCosjpybuSrurxjVZzZHm/0', 'oyP7DwBMocFNw_H_RVuT5cv4fJTs', '', '0', '', '1', '1', '0', '0', '', '1470377725');
INSERT INTO `tyms_users` VALUES ('1489', '徐锦绘', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4btHzFMUK6qhvQv4fnwGLKymt2f3iaiaxyEM85rdicDaHaeWjJxlWLxibzOR95QREzFwFVbBD6pz0Ys9aCv6aFNiaHQW6wvlhpREyw/0', 'oyP7DwD9hUz6L0Bmy8tEzgVXlQcs', '', '0', '', '1', '1', '0', '0', '', '1470377840');
INSERT INTO `tyms_users` VALUES ('1490', 'alme', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfnGlk25r9Vkxhuo3qOZN8ZXmcahO9ONNPunXv3a87KBKqhgRSsoSGM2djHvEIFicx6DwAvRMJ1U8Q/0', 'oyP7DwDf_TW3Y6ZLTOKuGG_0Q17g', '', '0', '', '1', '1', '0', '0', '', '1470378769');
INSERT INTO `tyms_users` VALUES ('1491', '莎莎', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKUCpSdxE9ShHyJDHWZKU7EwZfR8w3iaerAZcj87oeTiamWXmQD3m0FkwuXB0AWEJ2YdF7q0a3g0Ot/0', 'oyP7DwN5MzMbM6OHVRiESK4Z4fqA', '', '0', '', '1', '1', '0', '0', '', '1470378856');
INSERT INTO `tyms_users` VALUES ('1492', 'lü', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIM2Hd8d2mSiarqKkFZXjFYER95icesXJ9owLtcYfxJumSszDBg1m0MrBicw99JJYKjQTTf4AppgLAe/0', 'oyP7DwHbd15EBAjT3sDvT_xNVY98', '', '0', '', '1', '1', '0', '0', '', '1470380718');
INSERT INTO `tyms_users` VALUES ('1493', '博客健-黄志强', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJUbua2ZVtoR3lfTMUIcSibAiaCNocaN8UIq6MxCaAGdIzAu0RyhbJPuVFUn5YicdxZYV805NvB5Jibb/0', 'oyP7DwPPW3JaOcAha-pX82B74Ips', '', '0', '', '1', '1', '0', '0', '', '1470388763');
INSERT INTO `tyms_users` VALUES ('1494', '悸沬', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dENFR2puyjc0umLSe9d9mD6wj1ohdCBkHpDw6cZtdGLeR62Ftw5d1qiaYB8rTL9TpbWdApnJeQ9fwf/0', 'oyP7DwJtuFzBQg-Egjq33JWJYzA8', '', '0', '', '1', '1', '0', '0', '', '1470388835');
INSERT INTO `tyms_users` VALUES ('1495', 'Charles', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2ric9nXFxTBydL8DBr4aQ6rf7H5cGYR56RPUBO0PqZknSRtM1CN7s9bP7ggGO4apOdK9DUDxs0kz69G0bEIR7Hm/0', 'oyP7DwIHjxd6tM41ClMgrjuNaTjc', '', '0', '', '1', '1', '0', '0', '', '1470395413');
INSERT INTO `tyms_users` VALUES ('1496', '逆境无赖', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDq7Ms3bHdicGd1WYacwIRIf1lS8dmQBzNfRmJIkKyg6oEjyIOcKaicv71mIYytfey5w1W6EBZLOnYQ/0', 'oyP7DwObhRbbwgerAv3RRMKDPfaQ', '', '0', '', '1', '1', '0', '0', '', '1470396063');
INSERT INTO `tyms_users` VALUES ('1497', 'lfChina', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7r6LTGnfCuyA5V5bRGEeBpON9NF0ibEac9bYpkYHJaiceUqneqib7VvLqKA6oMW9uFx97WEGDKHsFlPa8tfbF0sm8/0', 'oyP7DwJfTb1PNvX1U8ewRyN6PPco', '', '0', '', '1', '1', '0', '0', '', '1470396187');
INSERT INTO `tyms_users` VALUES ('1498', '雅雅', 'http://wx.qlogo.cn/mmopen/y4ibhUzTEvX2SB69PGfwFqJ2FQVsCnyQWLEYibnozDMuSoo9P7wicVsY9K2uoGv80UEMyh7ETso6CcDVhibJHoBafDMKP8tpYfj2/0', 'oyP7DwP2ODw_p9gsmRoYpR1-6Zg4', '', '0', '', '1', '1', '0', '0', '', '1470399622');
INSERT INTO `tyms_users` VALUES ('1499', '波波', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90AODLWGVgaAlmGQU1qgRaSYUYQ6O3jiciaXbKQp73ia5WCR1azNn2icZRIdG9UNGs0cqPF7u5ZGmevzO/0', 'oyP7DwNiTM_ctc5PINXTJpBXc1M4', '', '0', '', '1', '1', '0', '0', '', '1470405875');
INSERT INTO `tyms_users` VALUES ('1500', '笨鸟先飞', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eLmrhtnY4PibfianVtoAAa95ibGyzBjqrWfCp5yABia26gAxS1hI0gvNZD2O7z2cKsOibviabYxJQfsItm/0', 'oyP7DwOx70ygwNS2F6XEp6mKgCUg', '', '0', '', '1', '1', '0', '0', '', '1470412458');
INSERT INTO `tyms_users` VALUES ('1501', '微瞬间', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDaFRCG0RpJ2GiaFsSUc5m7BkGj7b4hGZlyvcdj2bWYd7UHkAQ0WvCZZEckWhtyEMe5qRHaVToiacIzIdlHoVicYMibKwQp5vIu1JY/0', 'oyP7DwOAZgMxORh9U8aolVsp4kuI', '', '0', '', '1', '1', '0', '0', '', '1470446187');
INSERT INTO `tyms_users` VALUES ('1502', '周建波', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDd2ib7yowFBiawFlksXBPjpNyQickSOHSdOeuY3mKuC0ibAcgWPUlVqApRzckWWRaXibkic7bicsp96jfjO8/0', 'oyP7DwF9fjQNbTImslVMyxbzkvXc', '', '0', '', '1', '1', '0', '0', '', '1470449384');
INSERT INTO `tyms_users` VALUES ('1503', '', '', 'oyP7DwN90ZiSqu_upNPYnXuayyJw', '', '0', '', '1', '1', '0', '0', '', '1470451360');
INSERT INTO `tyms_users` VALUES ('1504', '4m', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBL3iba4JCAP692j1c5LzAGibfRYrv2TDgl1usoH2Xlib8TemYXgpwofDEovvEdugWRro6tHMNoWpwUfX5Bt2FtPy7b4hgXJLdxuU/0', 'oyP7DwNWkVGzc7gvlb3tGfKHRj18', '', '0', '', '1', '1', '0', '0', '', '1470453844');
INSERT INTO `tyms_users` VALUES ('1505', '唯爱p', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCCkIfDRw93K8jcTC3XfWapVI35h1Xgs53XdzxucoytWM1u0lCzqhDu4IE9ClhoYgFyHn1iaogmUfg/0', 'oyP7DwGAIRyUBvpjp7Cnnp0V73Ck', '', '0', '', '1', '1', '0', '0', '', '1470461676');
INSERT INTO `tyms_users` VALUES ('1506', '呆呆', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCYbJnhIq0dIvE6libNgVKgdibDWhia6oiaPr82YyfsXY2sIYkeerd8JBLo0I2pPUVO809JappBWtB0sA/0', 'oyP7DwOhCB0vIGIYM9HYjI0XpONQ', '', '0', '', '1', '1', '0', '0', '', '1470468130');
INSERT INTO `tyms_users` VALUES ('1507', '友谊的小船', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4hANwHMLkBwjyGSh8S8lcNib0YZYPEnhIicFaGUevHu9JomiaBrf1yDxUYD3thoW0UE5loNeFSNWVddaorjZRy0dH/0', 'oyP7DwKskHTs4yK1VoOSPiMEA8N4', '', '0', '', '1', '1', '0', '0', '', '1470468488');
INSERT INTO `tyms_users` VALUES ('1508', '婷婷芭比', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEIX4JNpGIyqaCgJKI6qOnJs9BDNuSzwB1CNrkiboibNh89xJJNhDmANcNpbZPggBZkh6Hqgz8rPVQn/0', 'oyP7DwODS0k_kUku7CUAxtM_6v4A', '', '0', '', '1', '1', '0', '0', '', '1470472415');
INSERT INTO `tyms_users` VALUES ('1509', '徐蓉 ', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcThDSTwWwS7sIXiaqSVdibcQLTdqqNPEWhR0wylvWUCbPEf5n93Giaspe3fmPrvicvJya1JUSffGlDwhe46NjQqnDA/0', 'oyP7DwDI0wGboqkTVpMKCHTbRAN8', '', '0', '', '1', '1', '0', '0', '', '1470475160');
INSERT INTO `tyms_users` VALUES ('1510', 'anonymous', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP148RLiaT9sMF2ElRHr7iaibSTM7u4owmXuRCUejv0D7SnUQ5dYdYvt2lbwKiaWTE9UtMkib25Yu0s65PDVs1MThSbmic/0', 'oyP7DwOlF1BlYZ4vrmgPDGRYXYU8', '', '0', '', '1', '1', '0', '0', '', '1470477170');
INSERT INTO `tyms_users` VALUES ('1511', '潇游', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCp437BLkQAqVmSqic4FPAeHc55S7Piciaz6tBYHFZtY8bdWA7r6FJay4cibTST7a6I529kVcHRvfsoGA/0', 'oyP7DwAHcPbfx3nZRhJZlFglWhiY', '', '0', '', '1', '1', '0', '0', '', '1470482723');
INSERT INTO `tyms_users` VALUES ('1512', 'Z', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6iaPUbypbNaaj6NJl2F8aQjzI3YyXeNRrp65DVTHb797va2nduRRHq8vxTRrdBXptic7PwHwUkpbib/0', 'oyP7DwAfpx59SD7SP2VzjX9GyoKY', '', '0', '', '1', '1', '0', '0', '', '1470483806');
INSERT INTO `tyms_users` VALUES ('1513', '咖啡屋1', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL62XbnSQFyqBYeDESFPZRtjXnDXQ1aQyNND5WZDabkQglLW0KibF4fRICFHySD4SUeKGiaPmXXyeeWnQu7kGqKx75/0', 'oyP7DwAG6EdJtXO192godiZCbV8Q', '', '0', '', '1', '1', '0', '0', '', '1470493780');
INSERT INTO `tyms_users` VALUES ('1514', '城南旧事', 'http://wx.qlogo.cn/mmopen/NFAYhmR4VUBEdWqLfWhWY8Px6Ez0fUb7uWFVCEZ4xZibxwOxe5apw0BichkcD7cicicuQMMUvLBImHXRqP5AbFcUQfJUM9sz6zJq/0', 'oyP7DwGuMPghSmxCf48PDsln02vk', '', '0', '', '1', '1', '0', '0', '', '1470530491');
INSERT INTO `tyms_users` VALUES ('1515', '邓志强', '', 'oyP7DwIWBJzWYZLblmcPYP_Va42g', '', '0', '', '1', '1', '0', '0', '', '1470538206');
INSERT INTO `tyms_users` VALUES ('1516', 'ChrisCheng', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELcTrvHa0ez1c9exFhxDunKWwFcFDJN9oFMF68ydjHKUzNQGunQCNSHInQc3KoUjChTkPZeDEcWx/0', 'oyP7DwLcquQMq2-hjJZh0U_bc3xk', '', '0', '', '1', '1', '0', '0', '', '1470539114');
INSERT INTO `tyms_users` VALUES ('1517', 'A000朝龙服装批发2号15010474584', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcQMibLznichF3RfiaqlsSy73WaFZBibSfI4aqNDe589UKD32vR4aiarueYf2hYgOib4g8ic3wSHbylDibwZg/0', 'oyP7DwIyMfBh6Tp98BZJriBQcaxc', '', '0', '', '1', '1', '0', '0', '', '1470554374');
INSERT INTO `tyms_users` VALUES ('1518', '王安', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90EadGu0XHSngSD0yIsG7EbDSnfBMiaIzpR1z25AS7icJr5AN4LzpwE6joEvszJicLyV8RDVw3utC3wI/0', 'oyP7DwKxEzUcA5OnZP3yVxlrNCSE', '', '0', '', '1', '1', '0', '0', '', '1470568519');
INSERT INTO `tyms_users` VALUES ('1519', '文傑 .Chen', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0TJVns8L3Zsj7QsicrODGWHQsTAD9pBYpiaT5wXDnnpI3lsmuh2Mt0FAVnDzbmoGXOEiaMN1rNbk9c2/0', 'oyP7DwHQ4m1ue-vih1nAufvjEay4', '', '0', '', '1', '1', '0', '0', '', '1470584291');
INSERT INTO `tyms_users` VALUES ('1520', 'Dormant', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4V5plricv3LNnzbCSQn6Yab8SeBU97Sdice0wWI51K0OuWuwdrr2by0nhSueiaG7IOkMTVU9TY1Sz6Q/0', 'oyP7DwLr-K_9IKSmo_4pnLxQEJ7U', '', '0', '', '1', '1', '0', '0', '', '1470587138');
INSERT INTO `tyms_users` VALUES ('1521', '开心100', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKoWmDK3aRZtqVHhcYELvAOQgwtBTVqKo3jckuibdthdc6iczsHiaicz8YKR4TVvqSkrbfoT2HcmdWf1/0', 'oyP7DwAiV3DYoydjEg_uzoLfzrfk', '', '0', '', '1', '1', '0', '0', '', '1470614037');
INSERT INTO `tyms_users` VALUES ('1522', 'legend', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayx4cqbNqmkubQpILpZQRAOskic1yrUzvOM1KzC4HSkYFvMzjP5chCIicmX4nibAicHsAqVpLibAx8dxA/0', 'oyP7DwC5hdBBJYmfxzSfuHkcWt0k', '', '0', '', '1', '1', '0', '0', '', '1470616657');
INSERT INTO `tyms_users` VALUES ('1523', '缘份天空', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4iaudibeqwqTZnFibGvC5lUuGN4ibcUuAp6TpK59fLzjkgUML8nsk8KNbOWyySRJOibxCM0uWibmVGEmwx/0', 'oyP7DwCfB3x9r5Qy47GY4ePZHGrg', '', '0', '', '1', '1', '0', '0', '', '1470618793');
INSERT INTO `tyms_users` VALUES ('1524', 'Sarawang', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIc6ERbbtNwiaIoHd7KVt3lmic7cbmphOqibBDEeYeEibumk6ksH6eOmvyQOctbJ7DLxHhpqy8THnaZFw/0', 'oyP7DwEI9vwnP4V3OqP3AiXoOU-o', '', '0', '', '1', '1', '0', '0', '', '1470619187');
INSERT INTO `tyms_users` VALUES ('1525', '大坏蛋', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK9Q9AXQ5ZgeftPqE3qEEQ88k7iarXMGnMMVKIiaeeW2Kbug5Voxs0b84JZPS1ibMpjHGudWrwRZ9zibQ/0', 'oyP7DwG38qVvvHX7qrnmGin3mVcg', '', '0', '', '1', '1', '0', '0', '', '1470619395');
INSERT INTO `tyms_users` VALUES ('1526', 'QiqiStudio', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIPX77pQPIe6BSBhQRJD5gCMzS7gib3m1TMhicmJcibQFj0N2EWY1cIg661EqC47I8icUxsoXpGPWkX4/0', 'oyP7DwLWs-40BDgc3B50tSyhfjjQ', '', '0', '', '1', '1', '0', '0', '', '1470620848');
INSERT INTO `tyms_users` VALUES ('1527', 'DEx', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1VR0jI2XWXKJNS9hrTavGq7WibF5jDsR3I0Gwtc4AEAt8aduCPqqNQZD3D68nGTSa4gIRqD8MzNLsiauUXI8nBicq/0', 'oyP7DwAvY9xCrfkB_x8i-7EhiaPI', '', '0', '', '1', '1', '0', '0', '', '1470621030');
INSERT INTO `tyms_users` VALUES ('1528', '', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4fQfUiaYH9cciaqshibE9XV5wOdXMibbh1WC8h1cA25MvunCNDYZj4ReurFbRYt8ZFCn3alfRTAPnLqbc8fNEHTTSu/0', 'oyP7DwB8aLxSwRoi8ifuWrQZoBFU', '', '0', '', '1', '1', '0', '0', '', '1470621172');
INSERT INTO `tyms_users` VALUES ('1529', ',Can', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD0sPWTDnhab2AicxeY8PpX4fPPOaZiac8R7TwEicU8AMaZAv65gMxiarbPVDa5rF0ictqbrQo2S88IJcsGBJbjWQejYjSGD024QAS0/0', 'oyP7DwN7ZRwzabJW1uqZvZ0G9-9k', '', '0', '', '1', '1', '0', '0', '', '1470621218');
INSERT INTO `tyms_users` VALUES ('1530', '李小锋 软件开发', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBJVUIUnJPT6lrn56QHkC3YpGgicVlH5ibwib2icTAapaibbRrZ6Nf1RZ7x9hCQUAojq9kyM9FUftSad6w/0', 'oyP7DwK-Asni3Hdxn0ic-Q0sZwzk', '', '0', '', '1', '1', '0', '0', '', '1470621394');
INSERT INTO `tyms_users` VALUES ('1531', '。。。', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5icupo57lRNNHFKFicQBYyAcZwpNbQG1B3aQIlXVpQp9tcKwyOmU7L8yUdCYS2ooyN05ArG1GNW7ww/0', 'oyP7DwP7AjIi-Qjl9COyXpcfcEMo', '', '0', '', '1', '1', '0', '0', '', '1470621512');
INSERT INTO `tyms_users` VALUES ('1532', '做自己', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0YdgDeCO2zjqAkywXFe9zvibT50x4Q9oj9hvADfzy9ZYoUBrtBx0KvRkV9H6YSCFEpupjQfzhMu25/0', 'oyP7DwEPYX3mwPIOyR3uyXzgI4FQ', '', '0', '', '1', '1', '0', '0', '', '1470622388');
INSERT INTO `tyms_users` VALUES ('1533', '纳兰皓月', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3Wy9drMPyZQLPEEsNZe4kSn8xVv1EpbdcCUWGc0DK578LpjoWEsTsVeTbOdAQKL743pblr51RMR/0', 'oyP7DwBTlwYkHba_ebJJU0_7H2IE', '', '0', '', '1', '1', '0', '0', '', '1470622590');
INSERT INTO `tyms_users` VALUES ('1534', '高飞', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY57E4coT8IcLKuklBLicKk9dnMI9XDyX0hQdRUSpU6UOK3D4avpr9qmoU9QxvMtnBbXEJHeMIT3z39/0', 'oyP7DwFeisPBudJNUdulxyHhCHJ8', '', '0', '', '1', '1', '0', '0', '', '1470622908');
INSERT INTO `tyms_users` VALUES ('1535', '㐅、、', 'http://wx.qlogo.cn/mmopen/1okIibruooUibqtwJZibe9Th4dicUy2WjgjzjVFO6t5cvDCrficqibObUnR8TYAY4yJNEjEt4pkz9yQer1qib0fxU52gg0h4c20qY69/0', 'oyP7DwKLZfG4MAJiYEBdv3exDntk', '', '0', '', '1', '1', '0', '0', '', '1470625163');
INSERT INTO `tyms_users` VALUES ('1536', 'D XX', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM66PFKoA0Br6GfvfbQrbMkzxJphuy09y7Bo4cwAsLZchyKPibju1cnXXVvV7zM9P2LeIUXjawjvQsg/0', 'oyP7DwBb--8ORnNDg8FC-dBOZr_E', '', '0', '', '1', '1', '0', '0', '', '1470625801');
INSERT INTO `tyms_users` VALUES ('1537', '承', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayr0ne0icY8NzsqCGwpJALSvB7hhUrZQxHxJZF5jvzld07iaq6tKiaWdtUAsaUKlPw4Oicy0UrUFBdLb/0', 'oyP7DwExtVm_3wGgby3KNzJDU1VU', '', '0', '', '1', '1', '0', '0', '', '1470627430');
INSERT INTO `tyms_users` VALUES ('1538', '西街大少', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UPc9zvKoYwTxAbCfIveGJDfugvgMKMB2KzlI3S6jqtICMtvlgRMtokk3m6ZOgfIXRspHXElc3Oys/0', 'oyP7DwGjUj-60jQlwooS2kvZg3Sw', '', '0', '', '1', '1', '0', '0', '', '1470628235');
INSERT INTO `tyms_users` VALUES ('1539', '', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZZp2PZlGX0GLKuzLnfc3gyMwibcX07woO1aFqCzMlpOMgQr79jFFic1lbKJIhT9OFULJa7XYnhxzr/0', 'oyP7DwCzJpYKiWI5nqHYLlL5QUtk', '', '0', '', '1', '1', '0', '0', '', '1470630777');
INSERT INTO `tyms_users` VALUES ('1540', 'Guoqiang', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKZSPZx16J7TgoCjrlAFHWcVoWyib9HtqcRh0aMDcsAnFlzWGH79gzwRrAAib68gNCiaMp5Rgw9QiaFrw/0', 'oyP7DwJ0VRr15y6AFSOom7hSqRmc', '', '0', '', '1', '1', '0', '0', '', '1470633730');
INSERT INTO `tyms_users` VALUES ('1541', '信达', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6ROZGz8oYFkNibBeQ5Y37AiaibhIXKXIXhFTEI3icgnYuiaLKP6BQnqtl3mqBRlgJkrRB78uiabY4a4tWQ/0', 'oyP7DwCIQwJ5cvTYaNfyA83vI7B4', '', '0', '', '1', '1', '0', '0', '', '1470635838');
INSERT INTO `tyms_users` VALUES ('1542', '武', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0Fn3l7Z9RX9Ee9JWSkFBmMJlge1q8T5Dbq90Rn5BrJ7iaaduib10OaDTJiasuiamQnzOyCrqA4gDicUpYUZ57q937Kv/0', 'oyP7DwBDoCLJLrX1IWAirXF6rQZI', '', '0', '', '1', '1', '0', '0', '', '1470636125');
INSERT INTO `tyms_users` VALUES ('1543', '零起点', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4kY78a485MIfRDnEecgag0s1DLymzibnlkG8iaHB6yKIQNF1ZN6Xic8ID6wMeub1JFGP0aRrpwtjBP4/0', 'oyP7DwJHx0bJ69kbO5cEMdNOi23g', '', '0', '', '1', '1', '0', '0', '', '1470639698');
INSERT INTO `tyms_users` VALUES ('1544', 'Nick容生', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QNLbeFZGQXkpzibpT2lRkbICmEMYjxSoSticPj75Smmh8uqhRovwXRDoTryIBtnlFwPcBFDibbdkAt/0', 'oyP7DwCHldjOYoiH9moAj8yZlgZA', '', '0', '18938655085', '1', '1', '0', '0', '', '1470639940');
INSERT INTO `tyms_users` VALUES ('1545', '翰音科技（三江码头网站）何镇杨', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5GphFT2T7QKrEQTvV5K8nQJpwibJsmyBZdtVcoJybOJ2mian0c2UolhiapSLSMAmzZdzEThdzxJG9kxK6jZcxviahu/0', 'oyP7DwMKU7ZZMj-Lynhv3_oieBVU', '', '0', '', '1', '1', '0', '0', '', '1470640537');
INSERT INTO `tyms_users` VALUES ('1546', '清风细雨知时节', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB6M6IuOvhibvh58kC4mY5x75EAA7Ph7aspN9FLImVQEeOJRMQEhibKib3JjJibXw6wA6So72tqe5fxWg/0', 'oyP7DwJizY7nubyx7v374r3eGij8', '', '0', '', '1', '1', '0', '0', '', '1470642796');
INSERT INTO `tyms_users` VALUES ('1547', '薛理想', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ00h5tGrjWOPSsTRo1icHEWKaBcDKVJicopq1TqFIz1cric8iaZuPvSlBNlEwvMABXzhAwvdhAoMbbjg/0', 'oyP7DwNKjfFkpTFjFEStRf3EQWOM', '', '0', '', '1', '1', '0', '0', '', '1470643316');
INSERT INTO `tyms_users` VALUES ('1548', '......   暖男i', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAWYRYklTxMGW2KibD33wU8r8O7XxdUG5Z2sGTVATnDFsqgOZ2ZM8w96t6jib4xZh5u5LdI8cj4KG4/0', 'oyP7DwN6U-PxxoERD2Qi6OKlC4ek', '', '0', '', '1', '1', '0', '0', '', '1470644612');
INSERT INTO `tyms_users` VALUES ('1549', 'Memory', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJNG08UBSozya7jvnjO7fkRZ1MFa5wfbEVzGG0vc8VnfibnNtftCxIDpdRojXQETQEOM2rWNJ5g7e/0', 'oyP7DwCUlm4W1xI2YsbOdkEXGNpk', '', '0', '', '1', '1', '0', '0', '', '1470645731');
INSERT INTO `tyms_users` VALUES ('1550', '小怪兽与小禽兽', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMW2XtcnyKicbeEcbZH8icypayiaB25TEmJc2kniaLdLWibs7oCASWnhhDGUx8PY2WKrJ237XfRKj1y0A/0', 'oyP7DwGEcbceAA8seIIm3944FaME', '', '0', '', '1', '1', '0', '0', '', '1470646399');
INSERT INTO `tyms_users` VALUES ('1551', '航星', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCjQ7MVteamFWJznfibTMkBEelsZCr8ia1FtmdeuMgStaIyjOBYBOvHGsPXtcFuFHvbLw4mlxFlia8LA/0', 'oyP7DwBkQo3EuddDXyPy5oSJnr3g', '', '0', '', '1', '1', '0', '0', '', '1470647913');
INSERT INTO `tyms_users` VALUES ('1552', '天狼星', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL77sJOS2wbyj9vnD77lFCZD9ksOa3Mz51r7kExN27Z4xbc53ZKicKZj141UxA38j0QD8sCJGic4AAYuWUlQyzBU5N/0', 'oyP7DwKsppt6fiDxkwiHbDhzTNdg', '', '0', '', '1', '1', '0', '0', '', '1470648509');
INSERT INTO `tyms_users` VALUES ('1553', 'snrty', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4hrice2MEbo3jhTJD7hicjvywg6HdYgMicXiayQib1SnF0yYIlktelrkpUm5dtsguqepqngia6ib8ADjaMEDJV5hRFiaWy/0', 'oyP7DwEni8CQaV65nGi44ae0K60g', '', '0', '', '1', '1', '0', '0', '', '1470648594');
INSERT INTO `tyms_users` VALUES ('1554', '超人变身', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKFbNGNOTMqIFxQkATJW8nN3xxwl6t2PFCAmls4EveqBELKUBxibiafaghNWtr68LvYG2SXUcXnGqDRsA6471ybhJdr6icV5LmrtY/0', 'oyP7DwNPw6J6nxL7HEZlWcLusPKY', '', '0', '', '1', '1', '0', '0', '', '1470649040');
INSERT INTO `tyms_users` VALUES ('1555', '王言', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibpoppnV1yp1bYHr8z2pKicSLemYbCY0A3qMGcytmUcHIR21Fn4ziaWvWXCAwVyDXlgTVlXOLon2r9/0', 'oyP7DwKKLs39y3UQVGIShRKUpdFc', '', '0', '', '1', '1', '0', '0', '', '1470649466');
INSERT INTO `tyms_users` VALUES ('1556', 'Meatball', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3LlXFgJJjXl3xvYHdE5uxNrzWCODedEHhUV5w5FWywxx0kOrWMUghDMZTDWY8czNwpWcibvPNSKv7BNyH8T3IeO/0', 'oyP7DwITM2X52YficgFB3l8IEomM', '', '0', '', '1', '1', '0', '0', '', '1470649693');
INSERT INTO `tyms_users` VALUES ('1557', 'T- 24', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eFzOkM0xGQ20iaO3QrZZkaia7Q6TKmeObbudN6lhBmV9celQwUae0TNSdMoaR6eibeFyrNm3iatXV4QJ/0', 'oyP7DwP8Jdm1qxcTp7q08uLi9VYE', '', '0', '', '1', '1', '0', '0', '', '1470650056');
INSERT INTO `tyms_users` VALUES ('1558', 'O小锋', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1pPMexUnlItshL5z4wsib49bgGYLUEpkD4IEGI8I1SDO2z48xYutfz55mOponWI2DlBbuSEgibg65Q/0', 'oyP7DwICcFN8a8Amr0UkdDtKE96c', '', '0', '', '1', '1', '0', '0', '', '1470653179');
INSERT INTO `tyms_users` VALUES ('1559', '阳征利（13613096958）', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELsSKVt6lrQDI9TekyOn7veFBGR0XaYzTlYghs4WXc2Eo8x0Rc9EbyAyib1LkWVSljiaKyERwNufrT/0', 'oyP7DwL6Nq53GcwaR_VT9MflUjBo', '', '0', '', '1', '1', '0', '0', '', '1470654374');
INSERT INTO `tyms_users` VALUES ('1560', 'ж', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7K9zreS4lj4BmIicrkTOzLDoVNtaym6xSfqbNicFrcpNnKjuswaqRLC7hjLmclnia9HfxZQib6zBjljA/0', 'oyP7DwBuERfjkUriSM7oOFYvnDJE', '', '0', '', '1', '1', '0', '0', '', '1470657093');
INSERT INTO `tyms_users` VALUES ('1561', '张安定', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VpFYTNLtDWxmluLpK3BWk5Ouu040JLvCm5XIbqxaiaB0eCwjhdiaM69fhf9EB2tIKu1Rrkib1Cu1kz/0', 'oyP7DwDyhdCx6S3QT5Fkz0yOBO0w', '', '0', '', '1', '1', '0', '0', '', '1470657678');
INSERT INTO `tyms_users` VALUES ('1562', '少雷', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIeWvRXWgLt2It94JEAWw54ia8iaj2ye8PCo5LaEgGjbjy84ZUDiadjaibRPeDwUW3Gle9viamYyVUfbibQ/0', 'oyP7DwGE_tbvlCMp_at0AF72oQKM', '', '0', '', '1', '1', '0', '0', '', '1470662391');
INSERT INTO `tyms_users` VALUES ('1563', '李浩', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3srcywc9mJicFtfEvsnJru4onu0PruzYLDI1h2ETAuVrvsiaoXmfGOZMguHLCB02RjtpRfV9ltXls8Y7WgicgTWft/0', 'oyP7DwEsOV6jVWQZnl_Uk6D8Z6EA', '', '0', '', '1', '1', '0', '0', '', '1470663115');
INSERT INTO `tyms_users` VALUES ('1564', 'No color', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdecHm0gYKCia9FqEFJXxMQkS68jNNdFx6icPPaOibBGBxdFiaEjdUTrs1F4WYCpupy3rE0CL9hbcaaFrx8xxpfepID/0', 'oyP7DwGxrLucavpJYbPosoC7QKto', '', '0', '', '1', '1', '0', '0', '', '1470663355');
INSERT INTO `tyms_users` VALUES ('1565', 'Lucn30', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4x7DibnyH7lnjept3z0Lq9ZkhYpgDGib5ib6fHOqsE1PryCAQGhchBflXDia5qhMAvtIGxlQdyEJC9VQ/0', 'oyP7DwHd58jADyCg2Qv3gZUTwErk', '', '0', '', '1', '1', '0', '0', '', '1470665007');
INSERT INTO `tyms_users` VALUES ('1566', 'K.K', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcxia4ME03SuzqyUiaF9mMNibxUZDY7UwXeLicJWuic9Elue519b4D89ibDLZue65bDtpia2PLrU6QLYFRSQ/0', 'oyP7DwIblzZCfts3krBb1JwJm1dI', '', '0', '', '1', '1', '0', '0', '', '1470665636');
INSERT INTO `tyms_users` VALUES ('1567', '恒心', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ94kxVrAsmGZI5YicB5cicWu01NPcnK6LuWicwzJ2yDygsIfsoDtjd714ibhy5E4QLQf0WxJHbib60IkQ/0', 'oyP7DwBnqhqIRtzZr7iuGxSIjS9Q', '', '0', '', '1', '1', '0', '0', '', '1470666916');
INSERT INTO `tyms_users` VALUES ('1568', '杜文轩', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELt9zQfJaWhq0eVJeIMlQHu56dX6oVyyNjg8F1SYiciaak7ia0cIyZlIZh4tJ6TBJWxN3wUKgATjSrBg/0', 'oyP7DwPdkGE2UfSYt2WQH0GfYpKQ', '', '0', '', '1', '1', '0', '0', '', '1470673091');
INSERT INTO `tyms_users` VALUES ('1569', '向大海', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7TtEukW2Mj2UOAuBsiaiaeplA7Cwgcp5k7hBk2fTwwJWSep1kXU5LicalfB1SxYh8L2PaQ11fu0LAueQ5fADhkZYB/0', 'oyP7DwGnGdwJW_sbdtqPP-c27GIk', '', '0', '', '1', '1', '0', '0', '', '1470681375');
INSERT INTO `tyms_users` VALUES ('1570', '朱磊-江南大叔', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKQVyK5w0IkPOKic9Gm7Y8hqPJCW0ibdTeiad1Vw8xW1orwyPVibRgLzbrfF3n5QoqQibxFuXiaPFkp3LiaQ/0', 'oyP7DwIJof1H4cjXftCtk2ZZnQF4', '', '0', '', '1', '1', '0', '0', '', '1470681590');
INSERT INTO `tyms_users` VALUES ('1571', '.', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMsE9bkmibeRCVaFAW5ZibQRUE61xkNPCdxaTVXicOQT9Lc8vGZichKHhXnnq61Y7JN2QvfnI4BdMbNu/0', 'oyP7DwK2qo4GB8SQX7bEAcpMjQ8I', '', '0', '', '1', '1', '0', '0', '', '1470681793');
INSERT INTO `tyms_users` VALUES ('1572', '我本善良', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5DUfFYe3UwWXhh3y39dz4ZOxHTJibjvSsPGhicH0SDyB8HqQUX9BKTlPf90k8IZudfqWgdJCu9jicCibS7kka8lVvJ/0', 'oyP7DwIEOIJfGnH8vn0-q3xewjv8', '', '0', '', '1', '1', '0', '0', '', '1470698129');
INSERT INTO `tyms_users` VALUES ('1573', 'Ray', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia32ia6WbLVGmCmxzvFXZ2mBZtu4OBgATm0LOAbMfbfugBia6ia1bzbQliczF75tfoSa5WYSiaJictu0Qpp/0', 'oyP7DwDrK70VKe7cenf3S3APf7Ec', '', '0', '', '1', '1', '0', '0', '', '1470705609');
INSERT INTO `tyms_users` VALUES ('1574', '郑宇强', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5SQMKhzJB0eiay6O9xl0uNgNuTRHLV9Cqe1cW2sFjonpK6rILUYmwTPMwibibBwGw0PRQvw9ibwT1DVA/0', 'oyP7DwOUVjyLlP8rfqcOmzBWSOoo', '', '0', '', '1', '1', '0', '0', '', '1470706839');
INSERT INTO `tyms_users` VALUES ('1575', '右手牵着幸福', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6o9T69avZUWEs2eDRc0CEQibibmiakr1gLrD2wUib8K6SEGHZkvpOzoPwDhaEhwTVgwK6Pv4CicVlC0uw/0', 'oyP7DwCvzPuFdd5wvT5auMtEuXek', '', '0', '', '1', '1', '0', '0', '', '1470707307');
INSERT INTO `tyms_users` VALUES ('1576', '曹裕涛', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECA2DsO7l80ts9rQrXhicsSjCZJTtWlkj5kDmhLGLZ31iakicb2F6al4SYPkichEbIqr6c4OcKOLWHgic/0', 'oyP7DwM8QF40hjmFjhUjS7zgYVBc', '', '0', '', '1', '1', '0', '0', '', '1470707451');
INSERT INTO `tyms_users` VALUES ('1577', '老邓', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cPXZiaLjcvbeUnUGfQM9JhdvgZawjYkgpJaB81EK3vvTqUm2I4ektpznBcRW8v5P13FeiandzJwrU/0', 'oyP7DwN6p8I2GgIbhgAZ1h8Lawjk', '', '0', '', '1', '1', '0', '0', '', '1470707989');
INSERT INTO `tyms_users` VALUES ('1578', '丽丽', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5AjshaVxXZIeSKntyGX6XFaQIRxbaYCPRX793wx066STlOg8ZaxHnW0dnvtavsfCcs4qL92BSOURibMO2diaZPb7/0', 'oyP7DwEYjE38cd7pQxMutd4dO5tI', '', '0', '', '1', '1', '0', '0', '', '1470708856');
INSERT INTO `tyms_users` VALUES ('1579', '阿豪', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0KhTY3Ua1BSZqibKGlOPiaWhJnLjJnSOLzSU4iaViabzUDEGVqofciaJtVmmGPaw4KQib2QdpHrSEnOR91IRnvufrCek/0', 'oyP7DwD2HcqmPBzgxMqhBekKp2-E', '', '0', '', '1', '1', '0', '0', '', '1470710279');
INSERT INTO `tyms_users` VALUES ('1580', '莫言', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP20zvVzbicgVRh4T3p9OxqB5yafVrAb51OsNb84Sbcr7Cvx8iasgXcbmEW0Il4JI6wHGkRRNfElCrXawBuEsoXxoO/0', 'oyP7DwFEkwDLPkqz75a8ngJ7CP-M', '', '0', '', '1', '1', '0', '0', '', '1470710967');
INSERT INTO `tyms_users` VALUES ('1581', '飞行', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qrave2BxnAKk0MtR9Z3zqrWmLWFp0PibzhQu7O1CpnaRcHQibjic6MMTptNLshHd5KGSjMeK0TfGV0voY/0', 'oyP7DwPKfyQPd2ZHPOG_g1hy9Hmg', '', '0', '', '1', '1', '0', '0', '', '1470712169');
INSERT INTO `tyms_users` VALUES ('1582', '女王叫我来寻山', 'http://wx.qlogo.cn/mmopen/Qk2WicPplRQiaYITnBMba9fps4qEzB8FVMQmVK6gm1oz6MJMqvjiaIhFlqZ2rdM7sYODdm1SqDfk7ibWNhZiaMKyw4QEUVkicwYMGG/0', 'oyP7DwG65iuHA6ReRvKQymW849AQ', '', '0', '', '1', '1', '0', '0', '', '1470714112');
INSERT INTO `tyms_users` VALUES ('1583', '☞★逆流￡♞☜', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53QwCSSjnTjwBQtPwwTVMgok7wafC7ME9LSCpZC4naaP6JgsegLQkQiatIhAib2oNIgXPhwXxfrvhc/0', 'oyP7DwOsUs_ELCBW-ZKNt1Mg7IOI', '', '0', '', '1', '1', '0', '0', '', '1470714144');
INSERT INTO `tyms_users` VALUES ('1584', '梁金', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1ePV6Rn7tXuIukMsXyWhQwM24z2LZepOMmtgdvOamJgiaj6lFAUia6sjUSsYM6qnK2SqHImvOrBzwIB/0', 'oyP7DwON9vsoY554WFlqx30KlNu8', '', '0', '', '1', '1', '0', '0', '', '1470714537');
INSERT INTO `tyms_users` VALUES ('1585', '张恒', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELvhnYOmj4JToduWLR6crlGia6qFFwbCFic8VbSZiaDf22RaYokI14mkN7RME4FzkU9icdX5m5BNfa54/0', 'oyP7DwGvaPrXX08FoNQfQYfFAVzg', '', '0', '', '1', '1', '0', '0', '', '1470715594');
INSERT INTO `tyms_users` VALUES ('1586', '行脚IT人', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2WlbmDl26gHWWNPMwGgn0AibWQfd6hpmTGsuBlsU3Gtnf6vjsVlBZYpFKqmhgQNWwfzKsYSx1c6A0CbK1oh3wiaib/0', 'oyP7DwAQ1DD18qLlmTwKKtjfhya8', '', '0', '', '1', '1', '0', '0', '', '1470722132');
INSERT INTO `tyms_users` VALUES ('1587', '●nly 迷☆戀', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaw594pOxCmLicrZp8A6bChiakDV4PCJusKc1UXxT48s5Ir0VbAy7ooib3yzHm7NzUKe8B7Ftyb2QL4ic/0', 'oyP7DwAnmKIAzrDyR2BuY0dacGNw', '', '0', '', '1', '1', '0', '0', '', '1470725218');
INSERT INTO `tyms_users` VALUES ('1588', 'zhong', 'http://wx.qlogo.cn/mmopen/y4ibhUzTEvX0RxibgYOes7UtDUFCsj9Dh0qVqiciayTwoBjEj5iaSdgAEYVHVhFhQmKY32icWkeb2wba9VP1o5l7ib3GS7XC5lMjptU/0', 'oyP7DwJiKw7BHDbqPBOkryyXJlN0', '', '0', '', '1', '1', '0', '0', '', '1470725999');
INSERT INTO `tyms_users` VALUES ('1589', 'shophy', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5NLvs8tEY0DRNCCmOXOYrj8RxHWiaOLMzwv67d0Ed5kG2uggLjthGDEjtTG06K8XEYT6MEKqVNKEiaiannt0sZYrz/0', 'oyP7DwB9U6659f775dCarlh8H9ZU', '', '0', '', '1', '1', '0', '0', '', '1470727924');
INSERT INTO `tyms_users` VALUES ('1590', 'Hobin', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKFbNGNOTMqIC2vk4hBqeQrLPAp3S3pyWwuQyzDYiavrJu8DcMcAoPib4JV0JITFxKnsgSc1XyFy4ukb03cY6QolQcicf436EuHIo/0', 'oyP7DwK6gBg5bP_O9li3xpRq3LDY', '', '0', '', '1', '1', '0', '0', '', '1470728558');
INSERT INTO `tyms_users` VALUES ('1591', '好帅的爸爸', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5AjCVtT2Q2Yqia2Mn1QKpc2fhpNQfq3Rydc4y3Z3cnHbEbmLxuaerBwJhKTfaRK77GEOH5BOib01GBZHzAbzwc1Y/0', 'oyP7DwHzV11bnPFfyPqoQha-I9GM', '', '0', '', '1', '1', '0', '0', '', '1470730565');
INSERT INTO `tyms_users` VALUES ('1592', '某言', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP36U7ADOc6pfBwLsqib8FjsIvtjtZOuibN1mbqbuQcTcNQIz22oKNjLHQMrhMcg3RILSAEmTpd44RDbuJlxMU0cV9/0', 'oyP7DwIpPK8C_8xvcTWoUhNBqadQ', '', '0', '', '1', '1', '0', '0', '', '1470730695');
INSERT INTO `tyms_users` VALUES ('1593', '绝云', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP37hMial1xiaiaduNjZBdGv3v5ubDOB5nnxVfo2MaOo1Bw3SqG7XaLibWB3oqpxdvomFB0qPNwicw2Z62Vgia7fcuhLtx/0', 'oyP7DwOl9vopSNqGfLMHAMlNi4-0', '', '0', '', '1', '1', '0', '0', '', '1470732642');
INSERT INTO `tyms_users` VALUES ('1594', '春春', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0WC62uUuo2vCskfydzXuknb7SWicewjbfrfrvYhYicDDUX8mOWicOJyJXmfB5rgjGu2OwR5Z0Kuu6d0FyZqlw2lJZ/0', 'oyP7DwLDj9d0ci9KcbJsbxW_QQLk', '', '0', '', '1', '1', '0', '0', '', '1470734761');
INSERT INTO `tyms_users` VALUES ('1595', 'xhq', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKQoCTfUzNuH6B5eDhY7jTicjXf0iaqU08icOickiaGickVwnyaZgVbpPabtW9vYgY3a0vSMQmKQTFOqWE/0', 'oyP7DwBSLt07Ieb35bF7VeswgLvo', '', '0', '', '1', '1', '0', '0', '', '1470735687');
INSERT INTO `tyms_users` VALUES ('1596', '\"缘\"来，如此！', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UDdLicdkFhticYwiaIY2qFVoRyd4FsERPTD4RkiadaYWxRbSYXPXc4cUEHLxcibO9sW1W50622ZXllQEg/0', 'oyP7DwG6nvpAfS47mwV-tRG-nnZI', '', '0', '', '1', '1', '0', '0', '', '1470736123');
INSERT INTO `tyms_users` VALUES ('1597', '五之间的街拍', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEIHftJv2mxEEvfGw5mJj1q9nUUtwURoadht7kGgznQbL05Ty3oFceUiclflWUnQpXSHfwUcKmtuIj/0', 'oyP7DwFyX85FlqrZnmNjC5MTqaG4', '', '0', '', '1', '1', '0', '0', '', '1470736135');
INSERT INTO `tyms_users` VALUES ('1598', '♚⚜爱妃接旨⚜♚', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7RpwRMlibnCibWd1GJh1pXpVz8iamX6K9EN3hvy4rdWm4edpd0azO1LCqEpSvNXOGHklEs76libuCJic/0', 'oyP7DwMSDWGfowPaNM5T-vX2JsRQ', '', '0', '', '1', '1', '0', '0', '', '1470736142');
INSERT INTO `tyms_users` VALUES ('1599', '红尘v^过客', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ajB2poceZRebHic1L7mwa7G0EhSKNp0OMmZYNHHrLBGmqyVLElgtytVGmNwtibZEICqRHGqJxbkdf/0', 'oyP7DwHJiTHrAKkPRzsUkwp_XVas', '', '0', '', '1', '1', '0', '0', '', '1470742405');
INSERT INTO `tyms_users` VALUES ('1600', '孙财神', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBth9pxDEyibUvicGa5YS4umE9dDCJ1m1XYYhf4fzhO8lLicaNdpGmsdL3FRnGDFdMvSTA24t7yic7lTw/0', 'oyP7DwI3Qe0h90T7sQMAsevboNxk', '', '0', '', '1', '1', '0', '0', '', '1470744833');
INSERT INTO `tyms_users` VALUES ('1601', '神鹰网络', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP09DgzqiaNTjVoyPGYf8pibEfDd6dgXiaWnZicYzfJ4u5yZicia1HfbXoEMBzicMHenML0ZbrfTWVNbicpwhnUryQHp9Yyt/0', 'oyP7DwDYArd9fXSDzCZ1DXobNCXg', '', '0', '', '1', '1', '0', '0', '', '1470745619');
INSERT INTO `tyms_users` VALUES ('1602', '笨笨', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0XwgYVnA4f6ccIW62vIFnNTLUZOmQaL7tsGxw1DDdBRqpX00sJeSDpW0ic1CCUSrSK2LpqD15MJj3/0', 'oyP7DwFCm6x4xhJ2WgF0c051M9BI', '', '0', '', '1', '1', '0', '0', '', '1470745681');
INSERT INTO `tyms_users` VALUES ('1603', '星星之火：可以燎原：', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4s9LC34ibBP99GGSLVAVCq0FXrXDyLYQNTXqQX1TdKDicurMwF7bicialxjzQABgy3ASBD8HCcLCg8dN/0', 'oyP7DwBXRgAaPxYeLuRsxLt47WMQ', '', '0', '', '1', '1', '0', '0', '', '1470746834');
INSERT INTO `tyms_users` VALUES ('1604', '木有小爱。', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJE9ou7iandHvMGVGK56boWZH6oxGgIlgu0hXDNS4PW6D6x6AX6SpYfdsPB7k564x8VNeJ4V8KACHw/0', 'oyP7DwAcYxpRARQJMwj8cPQH_qRg', '', '0', '', '1', '1', '0', '0', '', '1470748151');
INSERT INTO `tyms_users` VALUES ('1605', '不信你数我名字有十二个字', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ibGN46PboFkMIoULRqjkC6NN6ibU6l7jCn29Er17Ky7z6a6dHjrn8JkIUauFtQEw3Vqe5YJ6OAQNw/0', 'oyP7DwOK7szhhhEIVTJ3ER59_fhM', '', '0', '', '1', '1', '0', '0', '', '1470751020');
INSERT INTO `tyms_users` VALUES ('1606', '阿贝尼@新农优品', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2ibsOZM9VLFgIxhpDPUmmagBibYzCku66HEnsTUeaE38Ron2YTIS2WtRLIdhkNonbcBBlLUxnYkyEA/0', 'oyP7DwHHv5ES69M9QR5c_Z9jut_I', '', '0', '', '1', '1', '0', '0', '', '1470752919');
INSERT INTO `tyms_users` VALUES ('1607', '展望，未来', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0592FDfbS2RfvEDBR4eOwxVwqcYPAibnWD75FuI5eJL4Rk4ovF96TVEzYYPeo9v0ApR0ibduprWtymcTrK4EbbCx/0', 'oyP7DwMBEmmZIGASIQ1W6BaXe6WM', '', '0', '', '1', '1', '0', '0', '', '1470788804');
INSERT INTO `tyms_users` VALUES ('1608', '你很好', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2KoOHWSXNSS8tZkbQib8DyZy1n0fDOyEUpaWZfUtXBiaoEcugfibqzZ2QppV9txOmhz9u0eBWDDUdW8icDWe3FonWh/0', 'oyP7DwN_IilknloKuBvM4Q-IG2xc', '', '0', '', '1', '1', '0', '0', '', '1470792141');
INSERT INTO `tyms_users` VALUES ('1609', '林大成', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ePVwFfha10MLfwVOFFdlS7rDIRfibgSGAxlY8wFXzJA62PSZ3Ae8IQXje4gWvtWt8aAiaubj2jIoh/0', 'oyP7DwOGXJobpvmDnqtJ8Aake-AI', '', '0', '', '1', '1', '0', '0', '', '1470792932');
INSERT INTO `tyms_users` VALUES ('1610', 'A', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIAdNbiazcFyeystyfMAJLXAvtOH0kMajyV8bqjUkldppWMxKwhib0FdTfp5QzcaYhCRXEYrojCxOog/0', 'oyP7DwEehgtvvgLk8xqSevimLi_M', '', '0', '', '1', '1', '0', '0', '', '1470794911');
INSERT INTO `tyms_users` VALUES ('1611', 'Jin', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECs8rILCFzIN4BBO2PALLkpDxfmwVdmqjfic3IP1cgbQzMxoDMyOQXcyfjSxUhtt4BSgnjJA52UVZ/0', 'oyP7DwMZZGodRbTMM5H9F6yVX7jk', '', '0', '', '1', '1', '0', '0', '', '1470796359');
INSERT INTO `tyms_users` VALUES ('1612', '吴明', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5EpUWBUXqia2hrCATQ9DN19zsic8yh3s1UTicupBrIPOTzDHPkkG49aldulMib7ZxDC5ibCJJ5q8b3bJg/0', 'oyP7DwBDZD0srEwmtj4TxyHI1of4', '', '0', '', '1', '1', '0', '0', '', '1470797046');
INSERT INTO `tyms_users` VALUES ('1613', '张灵晶', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5s6qkPdwxOPAwIrMv4J4f6ibWjLJdCgJ4b85ficfnEEK5pbFxjJFAye1odYMhRb554FAdoK6z3qeWEJYrPUktVxVoIFicq6NXYibU/0', 'oyP7DwP3ikbm4EWDuS5BFEuyg3uU', '', '0', '', '1', '1', '0', '0', '', '1470798562');
INSERT INTO `tyms_users` VALUES ('1614', 'VIP阿巨', '', 'oyP7DwCCFSt3aJ5Mdkh2uutakoKA', '', '0', '', '1', '1', '0', '0', '', '1470798690');
INSERT INTO `tyms_users` VALUES ('1615', '郭银', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0ImZGQjMgL6mQBsYYFP9HJzwyQtptBhdEIng4GYn0Z1C1m4CLkA6k23oibCZ5IEIpb6HoFMib0bBUGxbSib1BO7aic/0', 'oyP7DwDiLqiUlnsrQNsbvHPyAf5M', '', '0', '', '1', '1', '0', '0', '', '1470798749');
INSERT INTO `tyms_users` VALUES ('1616', '许', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEBSvtXLVKNL3w6z20aRyKNpufVGfCnq1xiacYNXlURIw3VHaWqFibKM0neud3RMUOicvs3zpUQX4pdJ/0', 'oyP7DwAWE_WTp7JG3W6hhld_PKMU', '', '0', '', '1', '1', '0', '0', '', '1470798810');
INSERT INTO `tyms_users` VALUES ('1617', '万马奔腾', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2RKnURI6mg4YmuG0sPh4Essq4AhQYIShJfqHWN3cZh9T4ReuCT93VE3slLjtoEGTSXfnHLpossdrWFFxdPHYFA/0', 'oyP7DwBQmm5FYQaHjBf8_pRXXX7M', '', '0', '', '1', '1', '0', '0', '', '1470799027');
INSERT INTO `tyms_users` VALUES ('1618', '同盛祥家纺有限公司', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJCE6yKbf5fnKZf1Dqt7tNFku28fOIUQ9ibhpKmfpDRtw1iaJRL52u5iaHLqYMCFZGXrZvsqSHtamCH/0', 'oyP7DwNM1sJsD1og85ESitUtfT9s', '', '0', '', '1', '1', '0', '0', '', '1470799358');
INSERT INTO `tyms_users` VALUES ('1619', '老黄同志', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UEfN6qbTwxZWrCw0bMpIDWOZHEicy91lINAWuAhGxeKPCVGRWicuRtaibb0Gq6CFoqaE7yYSn7v2iaID/0', 'oyP7DwPcrzpvAIcOa7OBqu9D90FM', '', '0', '', '1', '1', '0', '0', '', '1470799797');
INSERT INTO `tyms_users` VALUES ('1620', '皎皎白驹', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0csheHiajZJfKjyOU54Doz5bqAqgQdfKw61vvD55hhx9vj1Q6vjOwxqZ4ooUoWVJnqKmaQhWnKwibc/0', 'oyP7DwOb16t1MY_F5Qa9evmyTrFw', '', '0', '', '1', '1', '0', '0', '', '1470799956');
INSERT INTO `tyms_users` VALUES ('1621', '杨笑', '', 'oyP7DwKYi5NVai68jRr5s6OsKzHk', '', '0', '', '1', '1', '0', '0', '', '1470799968');
INSERT INTO `tyms_users` VALUES ('1622', '他政哥', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5JNZOJdE00LYkEBXHCyeLNF4tDIuRjkLnIsygBl9EINxINQB3wg45iaaJqRuesibUyCs2ZanTuLUbw/0', 'oyP7DwCiwdwTUECMtvopOK4Z7CZc', '', '0', '', '1', '1', '0', '0', '', '1470800035');
INSERT INTO `tyms_users` VALUES ('1623', 'Rickon', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4VILLwgj7y7bNvOwia54G2YSPOnYuTSllNdMsFxYaVpANz1mqnjbAOhSQyd76tJEMPxHPqRfUYrgoGkPIrUpWA0/0', 'oyP7DwH35ikRoLXCeqzSMEv3s8oM', '', '0', '', '1', '1', '0', '0', '', '1470800039');
INSERT INTO `tyms_users` VALUES ('1624', 'A隆裕太后', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaxcS4WhCUG6fx20BHoGYv3t32OqwBSicHnDqDPfrVgeHiamFibDB7mRwF6jypI6c9KB9HiaKWMHicWLYX/0', 'oyP7DwDCeCLewAmXw3Zf_DsbisaQ', '', '0', '', '1', '1', '0', '0', '', '1470800044');
INSERT INTO `tyms_users` VALUES ('1625', 'Andy zhang', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5NyUfjSepB6ZszTJ9OB2KSvq5PCSM9u6QyjMmOVMs9gfyKusk3ZtbcRGqhmCJgicNQjVeicKjFgTaBVkb7b6HtiaCe8cQvWGKicrM/0', 'oyP7DwNiVy9Zzw1aAsXnenOgrKSs', '', '0', '', '1', '1', '0', '0', '', '1470803126');
INSERT INTO `tyms_users` VALUES ('1626', '科思栢丽照明田卫卫18976676233', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UHcrXqMk7nndZlvU9peZogP0zevCsd8TFmgJybpD2QpRSdrbyTaSONJHu9KkJoyVdWib7zq16Yqk4/0', 'oyP7DwDgMBQOKML1s_lPSoSKwaMg', '', '0', '', '1', '1', '0', '0', '', '1470803995');
INSERT INTO `tyms_users` VALUES ('1627', '小黄', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPgcmzPpzG2Iqjhib4aJlqfRRwvHn7iaAJa8ayZbRY1WgWrPDIJUibk2e7VURDSvSDNLlfGZllbZ2dX/0', 'oyP7DwGrU_JO6-UV5uMAwsIGjsd8', '', '0', '', '1', '1', '0', '0', '', '1470805067');
INSERT INTO `tyms_users` VALUES ('1628', '孙满', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY50xJZgUvMhMX2zv3RziblV8bOzJWCQgzc0SLdghsMKEwvytmic61RmftbRC5VEjiayvqRcv5x2r6iaK4/0', 'oyP7DwIvlOfgSM6JLR_mu_kOhl-I', '', '0', '', '1', '1', '0', '0', '', '1470806329');
INSERT INTO `tyms_users` VALUES ('1629', 'first boys', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ4LS6oxvBAporqBQib5REqdcIKJsVkVuYQ4WTfotxQygGYax6Jiah70rh4pvcA52ticzgSTUklbzSeQ/0', 'oyP7DwFgajXSzCS7L_1u3yrAWzI0', '', '0', '', '1', '1', '0', '0', '', '1470806591');
INSERT INTO `tyms_users` VALUES ('1630', '周应伟', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eEOhvt2DpmjaJxWkJfj4QHlUwhNDHib02uptYc5nia8yibE5ComP7Fiam5O9o7KKVgjFsJKePTKElVK2/0', 'oyP7DwPJagTWVGiqoR_Jlb2O3cRc', '', '0', '', '1', '1', '0', '0', '', '1470808071');
INSERT INTO `tyms_users` VALUES ('1631', '小依依不舍妞妞爸', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5biaH9417D8icKZn3bbTRMx9XFzbibB6uLyMEUP6iaItC1MjWfNw2t4xzc7S9uuImPqQrFvWXO9UkNLY4afwibZMyab/0', 'oyP7DwC1irJjYYLZmdXQz-xwiPCM', '', '0', '', '1', '1', '0', '0', '', '1470809348');
INSERT INTO `tyms_users` VALUES ('1632', '何跃', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0yrf8KOBoydFxjKyZHqu4XHRvqScYbwEUWkUakEpRqIgibiaJwPWXP1qcUMyVmecoFzSnLJgBTYTcibMxACY4S2cp/0', 'oyP7DwHp2RGcmOFBP9ow8kzKZXE4', '', '0', '', '1', '1', '0', '0', '', '1470810645');
INSERT INTO `tyms_users` VALUES ('1633', '鑫', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLClSzrk7utWYDr4R7YFMQNlDyVWK4EStWppSXdKFJ48gibIyllLHHrcjeA8p5N9ssBwHwWACC6oyibg/0', 'oyP7DwGAJvhErywM5KAKksF2arO4', '', '0', '', '1', '1', '0', '0', '', '1470812782');
INSERT INTO `tyms_users` VALUES ('1634', '刘远东', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK7NxA46xpdrrzVNFwHusTPnj0ENW0n4CbtAlDcX9fKibIMP7BEWQPF2T6WvqbnAicGN6S5VhYzmQUA/0', 'oyP7DwB8SkqEiqvUFhS50fu7izUA', '', '0', '', '1', '1', '0', '0', '', '1470814200');
INSERT INTO `tyms_users` VALUES ('1635', '老刘', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcKIOy4iaxttmPsRdccV0FFDazPBWZg83Xia4lWs4zYhiboT4YI33kIQfQZVQNZq2r1K6icDwic4Q3f9Pw/0', 'oyP7DwIW79ntJq4PmTDCenF_eTXY', '', '0', '', '1', '1', '0', '0', '', '1470815589');
INSERT INTO `tyms_users` VALUES ('1636', 'ken', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicWfib68tialWhHiaPLm49AUK7R8xeSpIfnYWzd1Dg7aCzJ2K3umYYq8P33bPRoLpiakOhJlB5Jrq4Eic/0', 'oyP7DwN8khZvY_QoarC2FMSwYK80', '', '0', '', '1', '1', '0', '0', '', '1470816537');
INSERT INTO `tyms_users` VALUES ('1637', '鲁雪刚', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ2aVeZ0ap0OqTnFN76Y5l0WRzOyTHkPWvrRVdUkXGfibibqNIIjYtGhL5pNw1cfITR15oT8eGqVsrA/0', 'oyP7DwPQthWF-VVyNB0T5p2IkJd4', '', '0', '', '1', '1', '0', '0', '', '1470816947');
INSERT INTO `tyms_users` VALUES ('1638', '逆风飞行更适合成长', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMkR3RfoaBDR54viblpoKG4AFhTysf0SN0uV44mjqr8UY0Ntf6ubMfEaA3bFRrN2HXWgPDAQFfyJG/0', 'oyP7DwGTL6oBDQj3NvBeOXT9H484', '', '0', '', '1', '1', '0', '0', '', '1470819034');
INSERT INTO `tyms_users` VALUES ('1639', 'ideyinyue', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1vnJSfulhmRCDYXC7gNHKBlqhclcRj7kftDoFHRlpEV2sr1OL2G8oOWNKBAbQNuH6VM4CiaRtG3I/0', 'oyP7DwHHdcs7_-r7-d0wbM38OnAo', '', '0', '', '1', '1', '0', '0', '', '1470822505');
INSERT INTO `tyms_users` VALUES ('1640', '海批渔具', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4hd1XMib9q4fAMicJXJvHVzwS5pqIkvmgq8P2xgaH25ulQmV7H2pxJTxZHgFctNWzu10Z1Z5CIBBFic/0', 'oyP7DwISPf05rA55oseG_G9i2LQY', '', '0', '', '1', '1', '0', '0', '', '1470828901');
INSERT INTO `tyms_users` VALUES ('1641', 'bilberry', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJHWicnhibBjwic9HAHXu964T4SW11Z8lYZWSGPlqxOoLAfiapfs7xmf3LleRKdJRAleCSuOtibLKSZgjA/0', 'oyP7DwP_tZkWx_O1kT2P10DyluD8', '', '0', '', '1', '1', '0', '0', '', '1470830995');
INSERT INTO `tyms_users` VALUES ('1642', '四处任逍遥', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0XSicISDSEV7GITtHAQzDQLf8PDYibnfNRPRLibj4MYsPmatiaLTvxEfATULHTUicBtjpibCrUerrdNDNx/0', 'oyP7DwCfquWjdGq3ks4FnMnbeo4I', '', '0', '', '1', '1', '0', '0', '', '1470831070');
INSERT INTO `tyms_users` VALUES ('1643', 'Wuzhou', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKruYsmxZaM2hnia9L2efL1znSpXTZ4W86BoBIkyaLICxSRQoE8Mjdmkiag28OVWQD77QsT9OOoflGg/0', 'oyP7DwMEvNuUNt6L0SsKSYNvnqM8', '', '0', '', '1', '1', '0', '0', '', '1470832622');
INSERT INTO `tyms_users` VALUES ('1644', '欧阳俊', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibccJntyNLg4ry1aogwDlF0xPLtONhDAHkbvrYjZEzrJMjllJOxYwbtyjYgPG2NxpA0dPlLDX18xvA/0', 'oyP7DwJEshchZEpuK5l2vlYluKw0', '', '0', '', '1', '1', '0', '0', '', '1470833512');
INSERT INTO `tyms_users` VALUES ('1645', 'Ten(萍)一小熊贝斯', 'http://wx.qlogo.cn/mmopen/hY02C90AvzQx0XwSS9RMfDbqxcr0U2EvACycWXyBxJMO7v7jzbmnr1NtHs55gHOvXWviad42YPiahr0r5I3F3ee6CkLEHhZp2h/0', 'oyP7DwP3RBKj1ONtpYb-3-m9r8qs', '', '0', '', '1', '1', '0', '0', '', '1470838235');
INSERT INTO `tyms_users` VALUES ('1646', 'JIA', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELPlhJ8Wr4FkMpDXFKrqH14S5Rm4W12LUsxQglcRQg4T4pCNMfJoNU3H9gf0iaLD49MRsouxAGwEGA/0', 'oyP7DwKFqx1feXYcRL1asaYQf2xo', '', '0', '', '1', '1', '0', '0', '', '1470839772');
INSERT INTO `tyms_users` VALUES ('1647', 'Jiangxiaobai', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKiaRqg0bOfibic0eDl1mxeTBIYtCpbibgB0RGQVPjXhYbNibvPSicXypq32ticT6SENGcalIRBDh8JEID7w/0', 'oyP7DwHGqp8nAxZX_vNCIDn33-OQ', '', '0', '', '1', '1', '0', '0', '', '1470844114');
INSERT INTO `tyms_users` VALUES ('1648', '吴银刚', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4X2VREfPticaAdibP6A9DpaIAmnY8eyAxxSiaSUTQSQDHLQpa3QoIzMYqGD6kib5oDYm7ayZwlPSh7d/0', 'oyP7DwCEFm6SzEfMpH2pkQ6IdLtM', '', '0', '', '1', '1', '0', '0', '', '1470844980');
INSERT INTO `tyms_users` VALUES ('1649', '糟老头', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6FibyvYIjfibOWA7Z8bVqv0CS5OzeCViajq2njxT2QT0HsOl3OdJ3svcyXFT3RHQ4wSkibtVj7ktqiaZibgkreGJKtgY/0', 'oyP7DwEt32EUFiigIUZcMN8QyDtE', '', '0', '', '1', '1', '0', '0', '', '1470857181');
INSERT INTO `tyms_users` VALUES ('1650', '罗意|易企微', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcGDcD4niaPGZvKSHgIt8FQOUvqnicSea11YpkkVSZrpjN0ephHwrVgkuibhNNUBZFFDjBLamMsHFbgQ/0', 'oyP7DwPfaDCXu1zwGTscHucRCP8U', '', '0', '', '1', '1', '0', '0', '', '1470871583');
INSERT INTO `tyms_users` VALUES ('1651', 'Gjr', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UDsicYT9Yxrkmn0IM5IqXy4KpNSkYSblqOPwLRyMLlMYVWZn9m2ZtwKLV3ltsRRwc7MCOl8VSSrlX/0', 'oyP7DwK1bbcUD66yxP-lVnU1drks', '', '0', '', '1', '1', '0', '0', '', '1470875403');
INSERT INTO `tyms_users` VALUES ('1652', '木', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2KBOfk5Wu99olV1DdJehP1JesvVmicwkYicm0WJlWHqepp0Fd4xGicGibRNQzGKAZADa1Zr0gl8L77sQ/0', 'oyP7DwJ8PzxZ3p3SeD-hntqLBZm8', '', '0', '', '1', '1', '0', '0', '', '1470880580');
INSERT INTO `tyms_users` VALUES ('1653', '我是谁', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5aR7R0TmIWiaSyuIwuGicDgC220dOC9kIbyxWoFHe11iaYewpJvV4rjMtPDMnFVicHxyImX21lCV2rIg/0', 'oyP7DwMhcPMl-wDtvnONw4GFpkNk', '', '0', '', '1', '1', '0', '0', '', '1470882971');
INSERT INTO `tyms_users` VALUES ('1654', '鸿濡•Mr', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4QZrBzyRxHInZOvFQVjEZ9TOXkviczWNASa3HIemsfAzjvMO9b522ib3CPBdco9IMVXDnfLK40CFL33KFhOTGfNr/0', 'oyP7DwOhmwAd-33rYirF4_zf6mtM', '', '0', '', '1', '1', '0', '0', '', '1470885089');
INSERT INTO `tyms_users` VALUES ('1655', '单曲循环', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZBgjJxGn2c7VXNw3zSXxwhdU9JMHknZDlN2OY6nibvh8RoVuO68pmpn85aJUfpOx5RSnEkG9GeNx/0', 'oyP7DwBFB2XH8JObs_znUBsIuACY', '', '0', '', '1', '1', '0', '0', '', '1470885104');
INSERT INTO `tyms_users` VALUES ('1656', 'Akun_smile^', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDuyK72rZLRBia2ic2BfzuSL5J95QzRFdXdd98X2ib5FCNbjnxztBCicnkYL47tyDQp57s7eCwMQN1MD/0', 'oyP7DwJUB5DZ360dmJGTz06jJ3lA', '', '0', '', '1', '1', '0', '0', '', '1470885209');
INSERT INTO `tyms_users` VALUES ('1657', '机智的小鱼儿', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKycXjGC5LEmfPHLWcURX3ibvQamMd3OOT1GhPh0ERAUSPDondp2ODX8eSLja39FstZwQmVvcqjict/0', 'oyP7DwFj17h6svliTSzayWkRcYRc', '', '0', '', '1', '1', '0', '0', '', '1470885251');
INSERT INTO `tyms_users` VALUES ('1658', '阿喵~', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibetmsXSKBhr19zVEzQMBPkQmrFpeGEFCjicArTibS2BISSAE5PSGwQd0icJJ6Fkf9QFP2l2A5tIej3FQ/0', 'oyP7DwGwMWdIGyuHMNDwks0T27-M', '', '0', '', '1', '1', '0', '0', '', '1470885384');
INSERT INTO `tyms_users` VALUES ('1659', '吴强', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4p6euyhGiaqSFtLPHOnI65EtjBKSxkjCb2EiaE13R7bnqRHiaEEe0CRg8EbM2BqVemBsNbibGQEKbSwA/0', 'oyP7DwIeTgUV-sujCgCTUF8wnV5c', '', '0', '', '1', '1', '0', '0', '', '1470886391');
INSERT INTO `tyms_users` VALUES ('1660', 'A001万鸟网络科技-孙巨中', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC6z8LQnMbgzqmZGtyVhUd6JD5ibN4UicyUr8wyoRpH3ibvicngpwD9pF8bAmq8svsvn1BIlMgUa386icw/0', 'oyP7DwPKqeSxP7Kqok66B4ewIAWU', '', '0', '', '1', '1', '0', '0', '', '1470895403');
INSERT INTO `tyms_users` VALUES ('1661', 'timtang', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBJEO8thl9icXPdy3lHC3SiaZc9ichx5vicS5srHQUkAQU6TiaxaCKypJg19a3hs0Dd4I2dhFbaz3qxjbw/0', 'oyP7DwJkPNA8whJD3cj0QS-dnCJM', '', '0', '', '1', '1', '0', '0', '', '1470896319');
INSERT INTO `tyms_users` VALUES ('1662', '陈斯南', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ8ZXAmyibrEySn8ukA91teibnB2NB1Cgz7XCZlI2pQ9TXGeRGjY6ibH5PG22P56K29pw2srLbHziaUiaA/0', 'oyP7DwFWn0z0A5_LZtGuWD8tzJBg', '', '0', '', '1', '1', '0', '0', '', '1470896321');
INSERT INTO `tyms_users` VALUES ('1663', '№。Linger', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibc82C2M5VK6XYadRQVb0ibjsqEV3yakIia740kpVArP4PLcRsdaP7IUUP8iaibFic1XQvB3QMYe0y392CA/0', 'oyP7DwLqxWs0gWPK4HuAiqVpxXUo', '', '0', '', '1', '1', '0', '0', '', '1470896359');
INSERT INTO `tyms_users` VALUES ('1664', 'MyronYang', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAfqibT0jH8l4vLXExhF9xLGIU2KNDuUPVujicf7sUPoUn9GSUKkg69QD46ycWCdfXIaciaY7R8BGykw/0', 'oyP7DwBWYfmVqMjunXn2udmugyxE', '', '0', '', '1', '1', '0', '0', '', '1470896373');
INSERT INTO `tyms_users` VALUES ('1665', 'Bing', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA4gkFYOic3CcLj5bIt1PEO2wMuuicQ1wsfuaFHMrAY4IZ9Gj9Gykgp6wzNf3j0mIOicZouDLKrBeqGA/0', 'oyP7DwM_aa-dqNr0yYaEsZqpfMWo', '', '0', '', '1', '1', '0', '0', '', '1470896504');
INSERT INTO `tyms_users` VALUES ('1666', '王达来', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WicZqceUgqib4PQGmiccRricha1Hic26WInZAcvvn7biaLlJHnpG40MZJUsJHIRTzpsoFz2AccUiapnY6e/0', 'oyP7DwDvZYk6QqWLqQzZCBJNfOb8', '', '0', '', '1', '1', '0', '0', '', '1470896519');
INSERT INTO `tyms_users` VALUES ('1667', '姬豪', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIzLEjge8fVWO5iclvrKpHtXn8pzOFqZNsKyEcEFO8D6qJdGTtFQVrCjQuquZRJyPPgl7YYLZSRlsA/0', 'oyP7DwGj__A6_Blg2RLM1zuiagJA', '', '0', '', '1', '1', '0', '0', '', '1470896858');
INSERT INTO `tyms_users` VALUES ('1668', '相随自在飞', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6yGFSBWhStQsj7ujhPRebHCiaQ3gTJoa1EkbyK0ia98dPBaBPEOanoMFm2D22UjZYp9PoRiae5F0OJ/0', 'oyP7DwBzt55IxUJDafUsii43d-H4', '', '0', '', '1', '1', '0', '0', '', '1470899834');
INSERT INTO `tyms_users` VALUES ('1669', '梦想进行时', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7UibIia6ictYLL2hvRDo2iciaQ49BDoLtzzRibbS4ibg8zemlZ9wmJvSnyFlGOB58cRvdDeIIHnOTuwDFhg/0', 'oyP7DwEVuoDF-wmZDXep3LgoWKrc', '', '0', '', '1', '1', '0', '0', '', '1470901169');
INSERT INTO `tyms_users` VALUES ('1670', 'Small Dream', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfnHuozY4mNjrCzhA6L1Jg7czib066sIoibv8bh772luhiajWbG10wRpJeBiceH5cemViaTuWnzQFR0ZwA/0', 'oyP7DwCNRHZUNwZDBmS0RYICW8f4', '', '0', '', '1', '1', '0', '0', '', '1470902066');
INSERT INTO `tyms_users` VALUES ('1671', 'awang', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3mmN43eLDUL6Oqg9W0ibEvMSHmWQhUMdR5oB39icCMLz6JLDpcKP2oxd63WKAkuN3o19ubTYbyGdB0NlS9NRicxXQ/0', 'oyP7DwCHXeu74J26KJceMBFB1L1Q', '', '0', '', '1', '1', '0', '0', '', '1470904300');
INSERT INTO `tyms_users` VALUES ('1672', '艳滔', '', 'oyP7DwHpu6mBUxUYXqQT5pvov_XI', '', '0', '', '1', '1', '0', '0', '', '1470904768');
INSERT INTO `tyms_users` VALUES ('1673', 'laver', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEO2XhU7Hc6aUdr9jCxnNtyib31Qmf6W1OIAWgNmbByeYLy1gSu4PuQPfdupNbabtTTqekUNYYujicw/0', 'oyP7DwIDVbrOdH6d8yDoG0U3eKac', '', '0', '', '1', '1', '0', '0', '', '1470905340');
INSERT INTO `tyms_users` VALUES ('1674', '红李子', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7owuiam15vm2Y9Y0f9dVY11ZhribRebiaOXcQleKlsdMmFHfgVGrHB8jibfRwicKSAwNzmWajDvhpLIf/0', 'oyP7DwAg5Z3ThBluEEId0cMZItJc', '', '0', '', '1', '1', '0', '0', '', '1470905475');
INSERT INTO `tyms_users` VALUES ('1675', 'Mingri', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90K2pQ20XveibZBmTEib33O5bOMDvdFhfJaZlke7SngjR5DVdcDsQn7yHrhH09CsPCUeWRGBbxkWrYO/0', 'oyP7DwImPrtM51mFQjdpbyd5SmAc', '', '0', '', '1', '1', '0', '0', '', '1470906584');
INSERT INTO `tyms_users` VALUES ('1676', '刘小美', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4l8RfFQXLByYQjibB4PBO8Lhl0HBjWGFnkpXoa5PZ6pwbN0Agh2Lx7vp5wTaV5cA8gKviaWsIQHbJVXXdhAeZjCkTwaVbz8kggM/0', 'oyP7DwEyxRuvjrwi6Bw3Vwghn4B0', '', '0', '', '1', '1', '0', '0', '', '1470908923');
INSERT INTO `tyms_users` VALUES ('1677', '天杨', 'http://wx.qlogo.cn/mmopen/LibNrIz6OEOqKJHWGtLNBhF3k1mBQzCKXSHcQBGTKr5Fz3icuFiaBxleLxnPaMzSlflpvx9Yoyc5Zrm8VqWskNaGVTImJS9oL7w/0', 'oyP7DwNsVkYsP9MXc-0766-epqgI', '', '0', '', '1', '1', '0', '0', '', '1470909459');
INSERT INTO `tyms_users` VALUES ('1678', '独家memory', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlMphiaEjshrDnViarkzHSET2NhZKhA1SkBozhyy9wzPF6agKr2SFq1JnVQMKZibg9Pys2v8de8MjzOA/0', 'oyP7DwE5VDVN4yYTRCpVHnhc5vIQ', '', '0', '', '1', '1', '0', '0', '', '1470910126');
INSERT INTO `tyms_users` VALUES ('1679', '老褚™', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKlPf8onsNTwKUjicm5tS1YzYWnGbdD9UpCywicwHohgM4WAPqVYCINDVXgeicg0hFfDBEFnjpxk96eA/0', 'oyP7DwJ3SiLz-bic2QkJNYh-bBQA', '', '0', '', '1', '1', '0', '0', '', '1470914080');
INSERT INTO `tyms_users` VALUES ('1680', '永年论坛_松赫', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJC4RAtw7o3VGb5U0YibomvFvgEf1TAEk5wkYoichjZNyiboibx9URcfotE39oIw4EjHAyCnLYrw8mW8A/0', 'oyP7DwA7CQRtshoIbulfDjgo6TpQ', '', '0', '', '1', '1', '0', '0', '', '1470916444');
INSERT INTO `tyms_users` VALUES ('1681', 'Channel-X', 'http://wx.qlogo.cn/mmopen/y4ibhUzTEvX20tYau3vhvia938eaA3G3Lma36Jx9GiavD3ackLnDvkNicTlUaibm3p1T04ADzmSqMrJv4micNUHubz5o73zLRdROea/0', 'oyP7DwBSj59o0MoqYgMHCQ7tOYUg', '', '0', '', '1', '1', '0', '0', '', '1470920970');
INSERT INTO `tyms_users` VALUES ('1682', '梦在远方', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7bPjYgViaAWUrMUWEMJWQE7mZjqNClJ2roO1tHoXyfQha4TfIC7KF6icUmg5c67aPc2wp0NQCJyONAffq4zBY9oZ/0', 'oyP7DwA-1Kby5JwrHbigs6b_N0_Y', '', '0', '', '1', '1', '0', '0', '', '1470943744');
INSERT INTO `tyms_users` VALUES ('1683', 'Panda', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaib2Dgx1yGzHdxlpeujEpicf5C0GPOdGO9Sq5AhnGIqwWZHxB9EWSwicVMGrib3ibMKrWWk4gfJ1G7hoD/0', 'oyP7DwL-Q4xAsI_HkXxbsxzm44QI', '', '0', '', '1', '1', '0', '0', '', '1470967371');
INSERT INTO `tyms_users` VALUES ('1684', '泛白的记忆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6R1e70mjGLLAbPe0ict3vKa9jppvKiblx7fxoK0Z8BImZT8qpBWic8NEaFOpVSiapdQE78neEVJoQRa6hRW6qTdniag/0', 'oyP7DwG-p8ULh4OCM-oFeimTrXdE', '', '0', '', '1', '1', '0', '0', '', '1470968046');
INSERT INTO `tyms_users` VALUES ('1685', '谢如琴', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90DDblFQicjCvcAVtjWIA81ohYz55NoBNmm2ItSGYPnXiaLyhTeLnQfhso7AmA4DyxTs883gkECtjzU/0', 'oyP7DwHxD37DPiiZdOa_eCQCDTYU', '', '0', '', '1', '1', '0', '0', '', '1470972306');
INSERT INTO `tyms_users` VALUES ('1686', '寂静', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eM0qnPEgYQN11ExbLicTDRkEMnccshphzjtTz05ZsBKTgU8bmmo87VKiaLjHKX5MbiczianxOSjuds4s/0', 'oyP7DwLoAx8Uah4wBorXOeNoUbhc', '', '0', '', '1', '1', '0', '0', '', '1470973667');
INSERT INTO `tyms_users` VALUES ('1687', 'Cruston', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7BHFf7z5Vy2uwo9zJZ2y9uibUBhFWYKlIiaM6u9QJicNliaJDyNtjHibFfh2Vo5oYUqQzruHgbGHYhkP/0', 'oyP7DwHVWYfaSDrkjepgbvmQdgFU', '', '0', '', '1', '1', '0', '0', '', '1470978110');
INSERT INTO `tyms_users` VALUES ('1688', '军', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1yjeUhngAnSG4lLgv6s5L9gGHBSfkf41n6ic4229gfQ3WL4kZFtL2Q3yjBQKfL0JY9voWPLHxAgCB2rRoOfH8at/0', 'oyP7DwIhpyAvG0BlEBgr9dTV9ysA', '', '0', '', '1', '1', '0', '0', '', '1470984113');
INSERT INTO `tyms_users` VALUES ('1689', '低调奢华', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBnibQwEfiba6yHqDTumWqBvUxjVXasiaKxA4NPGo42Zza13mdF8M3ubeicSZ3LxELVwFOqH7gZJRLDGQ/0', 'oyP7DwFFplcaPRLPC_XUVdUpdCos', '', '0', '', '1', '1', '0', '0', '', '1470984631');
INSERT INTO `tyms_users` VALUES ('1690', 'べ冇跑龙套﹏○O', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicA0q5JpZU7m0ngJXmdFPUiaBXKpAVHao42hfPjdGUicibzibXia2fKycsMEicicCTibpu2R1W12ejyCy6oj/0', 'oyP7DwCu3sB3qDUp4pXepHNxvLf0', '', '0', '', '1', '1', '0', '0', '', '1470984924');
INSERT INTO `tyms_users` VALUES ('1691', '远峰', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eBwUbuW9sc6NcxdcUPn1vKNtXTeJicDmfjWJdUaP8JH2oVsh5Fiax05cOOISeurYAd2oAWvX7iaqUibL/0', 'oyP7DwHELnUSmW1F8Y916woMKx74', '', '0', '', '1', '1', '0', '0', '', '1470988393');
INSERT INTO `tyms_users` VALUES ('1692', '大沙井', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1YwWzFDAd4exkHJ1gjicTibRb9oMYjialO6icnMYpsHeEtUYfWFia5E7kuaicUqWJ2JwCSzfohsdo991KfyHVrFXTOlO/0', 'oyP7DwOGsNbc_GnBb1ybb9LhRamE', '', '0', '', '1', '1', '0', '0', '', '1470991831');
INSERT INTO `tyms_users` VALUES ('1693', 'Miriam', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3H5afDbcvtia0BWClL43Vv2vWmH6qlZdBeUk8Euh5Rww9Lj0Mia3OYLHmKZpaOicDNCtnnLjAxgY8K8/0', 'oyP7DwMgAlH0r61bloibhBS_pXRY', '', '0', '', '1', '1', '0', '0', '', '1470992829');
INSERT INTO `tyms_users` VALUES ('1694', '阿星', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4KzKqmSOUNhSDz9NFQDaXU5jVZRL0LF7eBYFDNvYS8Y7our0EsG2Jt3biamWUDSev0Sfsth8Xc32/0', 'oyP7DwB1rJrtDntO8_b7UE3Ex1bI', '', '0', '', '1', '1', '0', '0', '', '1470993036');
INSERT INTO `tyms_users` VALUES ('1695', '小笨鹏', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6SFtT5fLGZs33dYy6vFnvjcawtQya1DYjdnkSwAn6GNR5VVHP04s3k3mcf1nM0DHOxGAic9xyQQPrDhzQXQQNibluVnuAomcRaA/0', 'oyP7DwISIwhw8X5nQKud59M9IyDc', '', '0', '', '1', '1', '0', '0', '', '1470994393');
INSERT INTO `tyms_users` VALUES ('1696', 'Mr.木易', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2ibrlLR79YD0KqnjjW77Y2nQqpjj5cqUQK1EjQnlEbMoib6iccTxiaRtI4DpkF6zpg1ibn1d7iaDXic4h7bBR2Hye8lZt/0', 'oyP7DwDtn417zPqkCimOAC8TyPAY', '', '0', '', '1', '1', '0', '0', '', '1470995407');
INSERT INTO `tyms_users` VALUES ('1697', '尹亮飞', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4hcJxXYS8JEoLlW7pbBbibn1Hwo7ia1Q9GfChJOSBBfQC2ic82qx4PGVfibnVcUfcMoicBBXW5UEg9Sjk/0', 'oyP7DwPUgDnAM9RXQ4Xq0RAXauxs', '', '0', '', '1', '1', '0', '0', '', '1470995555');
INSERT INTO `tyms_users` VALUES ('1698', 'Tang', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5U2a3syJha8wkX61IHDmSicWubEiaLX3vFOmb2h3icZvfcF51xWmSqic8uRWVBmV9JxJx2tytzbt5ewNVj5rPfqMWx/0', 'oyP7DwOCGyfu_eUy4TD7U9NPtVjg', '', '0', '', '1', '1', '0', '0', '', '1470999723');
INSERT INTO `tyms_users` VALUES ('1699', 'A张建强', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7dUpZzY9DyegNibTibGV5dhpJB6XkK3Kt3BaCItibKxPrNH8ovMgttCPAmHt7Du0EK1x9lW79cuZiaq/0', 'oyP7DwMqokqbuTXKmZy7uZS_V7f4', '', '0', '', '1', '1', '0', '0', '', '1471005879');
INSERT INTO `tyms_users` VALUES ('1700', '谢永', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dED6acJmLsFdYPh45wTjDd6LCyBXib2uvIVcLSbxAQtFoLLraOMplX9U6FDx0Nr6UsFCT6Y2GcleWic/0', 'oyP7DwL_qeor3_FwbtCJWfd_1Ioc', '', '0', '', '1', '1', '0', '0', '', '1471006705');
INSERT INTO `tyms_users` VALUES ('1701', 'Jorain', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QiaaqiaqAjN4uz6I7RYxRfJhW99Af4rCSQ6WArvhOicOYascwPEvWKaJQPiaFicDD22PzZeOnhyt3CSG/0', 'oyP7DwF-4lCPT6n_HfWy1k-4b0r0', '', '0', '', '1', '1', '0', '0', '', '1471017301');
INSERT INTO `tyms_users` VALUES ('1702', 'test', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBabkklibLpGE66j7zHCPgpicszbnoRibiamCXZ9Oia48RORDUlXW9LhnkcYhCvuiaIy83zBWtjO0hj7o0w/0', 'oyP7DwOopT3d-wJJf85MPZt7kLy0', '', '0', '', '1', '1', '0', '0', '', '1471017519');
INSERT INTO `tyms_users` VALUES ('1703', 'Climb', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eEkxPXgECO1iaRdIoicOhPGKLzJISYgA2NxlAa3siba16icRxXs4KYZ02m5IicyAJ52zfJWXxCOCauzeX/0', 'oyP7DwOxuyyY6ww3vFfqrloCbIzg', '', '0', '', '1', '1', '0', '0', '', '1471017601');
INSERT INTO `tyms_users` VALUES ('1704', '韦丰', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELQPwoT9cjU7t2SaDLxibWiaF4ouicuicXadfSkAj4rDQAWFozcaUDKQocndYU3xsVJKIJfqpYzuscYnQ/0', 'oyP7DwB2RO7fRvmoqLLBOeQqxIOc', '', '0', '', '1', '1', '0', '0', '', '1471020644');
INSERT INTO `tyms_users` VALUES ('1705', '楼展榕', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibe0B8BE6jZYFzJqpLtjQlvPWWeysodtRREFKv4yTKuQjuq0cib0kYEYchEQPCFTF1rIJ1ePLUqPMGw/0', 'oyP7DwF09F6Tif3Vn5Qn8xmtluks', '', '0', '', '1', '1', '0', '0', '', '1471028849');
INSERT INTO `tyms_users` VALUES ('1706', '世宁', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAyibWgkusPgHKGicFvxVfyicqvG31jURfyc0wwHUVtoepGhImeNlOKtWgkhkHMSbjm5Qx4yBPDoGq5g/0', 'oyP7DwBSwqPlEfdFuRn3sNeyZamM', '', '0', '', '1', '1', '0', '0', '', '1471044841');
INSERT INTO `tyms_users` VALUES ('1707', '二老', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL51gLGkLoWiadnQoOicSs44pjdXPMVR22bqriav0NVX1Y9x0EcNsMvQIEVI0yJZk9OVbzWY3C8tySJPxSVSmG5Lhab/0', 'oyP7DwJ9c2I-hK0o11OlVcv13Oo0', '', '0', '', '1', '1', '0', '0', '', '1471049850');
INSERT INTO `tyms_users` VALUES ('1708', 'zhaolei', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6VdvACXOeSgIYA2cr3Sp9xgAobP1gomgyVtWECkzX0ZslxCs8pPqoEpypHKtuPDlHqsJPM0QWB1FDxTc3w04klwBibor1A8ib5s/0', 'oyP7DwKBqUu0TpgLzUaTtYFOPrKM', '', '0', '', '1', '1', '0', '0', '', '1471055411');
INSERT INTO `tyms_users` VALUES ('1709', '小太阳', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5zEy42Uiafx8mxCicaR6CYFIOXcBmJNWHicTAgBe6FmACFzpTJz54hzrN40tmCF8cj5g8smk6wMr2mO/0', 'oyP7DwGDJVZCpIk4AThDrkB62oyY', '', '0', '', '1', '1', '0', '0', '', '1471057562');
INSERT INTO `tyms_users` VALUES ('1710', '孙燕超', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibca8m7dfMeNqibX2Tj3Q1ibBL0CYdIpiaSAz8V9oU1s1pibOiamtbj9LZAcwiaiaRrJOxkjasjjicZpZquznibRXklwthtmJ/0', 'oyP7DwMB7df_o_IZj-RAeULhfE88', '', '0', '', '1', '1', '0', '0', '', '1471057586');
INSERT INTO `tyms_users` VALUES ('1711', '赤の瞳', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia38PDXaAyYJ5W5rEiaqVRXlhibdrK8HWvZ3f20iaefBMBOeYT4U1Wbjkb0vAsurws5bpxWrS4cXylKX/0', 'oyP7DwCowi3z98WFEm6PFeiBw8q0', '', '0', '', '1', '1', '0', '0', '', '1471069125');
INSERT INTO `tyms_users` VALUES ('1712', '面朝沧海', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY515tic7fx38N7ugjU9mlB72afPheHoh8icxf2u22lXkxgTqSyibJeFJGKoEdTGKTyGNd8PqkPudrCQf/0', 'oyP7DwCpUB8iBzzPnwnKia7dYvHk', '', '0', '', '1', '1', '0', '0', '', '1471069289');
INSERT INTO `tyms_users` VALUES ('1713', '行己', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5Daeibv4002BwXxSmicSpzwA7K8rxUyNlRLeGcgvz3g7IydBw05lOnGiaUtMo3Rl5RpUibmm2QRQWpxg8OYQvGyxma/0', 'oyP7DwP6yKi3mCxOBumDNuTWsxMI', '', '0', '', '1', '1', '0', '0', '', '1471074094');
INSERT INTO `tyms_users` VALUES ('1714', 'Teddy', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3ZTCWlqUz7rvl5k3PRevdcuwNbcolp9HFxvpPhzicvfdVKM6ib9on0uialBXpZnVGZuKaySRPdicpSQQ/0', 'oyP7DwNvwo379wEoyYo0YckPxN1k', '', '0', '', '1', '1', '0', '0', '', '1471101787');
INSERT INTO `tyms_users` VALUES ('1715', '莫栋良', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90H8y1BVYWJb3aXCnAo1o8Y1FoRJe8HyfIrvibYZdTMkwVFVwbGWXS2Jw8AuMwgz1TOlLdcY6xIY0j/0', 'oyP7DwK6YoN0Oz_fg9WfKgIQ3U3E', '', '0', '', '1', '1', '0', '0', '', '1471118693');
INSERT INTO `tyms_users` VALUES ('1716', 'A 勿忘心安。', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibf9aQu9tHrgMPDATAmqiaYKibicTIuYHNxA1iccntRbN3GEZz2RNhiaicDqqTvQTbUjU5sELic29HIU3Bygg/0', 'oyP7DwOzhQzM2yqqnMH1853JMixE', '', '0', '', '1', '1', '0', '0', '', '1471119812');
INSERT INTO `tyms_users` VALUES ('1717', '钟海涛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5JpKUIupiaomic5ibrU3mxI5UAmXhKMc2BofYjFCicrj5KksxiajzmWJ3WAtPtxKibHhnQbHXIgsOZUxew/0', 'oyP7DwH9GeDD4MUcXjxdKUv6ko-U', '', '0', '', '1', '1', '0', '0', '', '1471140871');
INSERT INTO `tyms_users` VALUES ('1718', '朱磊', '', 'oyP7DwGK-IKuitWeTx5ozXb67ya0', '', '0', '', '1', '1', '0', '0', '', '1471141500');
INSERT INTO `tyms_users` VALUES ('1719', '蜡笔小新', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibc9FWfiaicW5F5A3jHGBibON2rNNiajc9v2NEG5t7rKdwzQxdJ1jWTIia7XYpfgticCicLic64BibdibgbwNnKw/0', 'oyP7DwCSp-Fh1VtAMvToU4NQfMmI', '', '0', '', '1', '1', '0', '0', '', '1471142390');
INSERT INTO `tyms_users` VALUES ('1720', '陈方', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pkkMU3U0VPAz1GBmnnc7KYyQibVjGPemgPm7OCDL7hxkaZ45jibQfqDfGtFAOuNVOk5xgrbPtkLrcJ7LVexiaMxg2iac/0', 'oyP7DwPWTqBPhlkzMTuGF_ZAIDE8', '', '0', '', '1', '1', '0', '0', '', '1471146770');
INSERT INTO `tyms_users` VALUES ('1721', '回忆', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4w1kCvsF481t3aZKudIw5icAiaenvoexPBxc5IEy81eyI7ia1bFJ6vlG8SnIonSA2uB21b5DaIr4vER3e8ID7gIZd54ydFcgP6P8/0', 'oyP7DwD7_eJi1PzCCNZ_6tFCBYk8', '', '0', '', '1', '1', '0', '0', '', '1471155015');
INSERT INTO `tyms_users` VALUES ('1722', 'A一Dalin', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6TNvfF7s9mafF05vyJE74gZneyqiajheHoBBibdms8IBWJCJhOiaBY5IQBv7wjQe0O4A3mO4xmicWez/0', 'oyP7DwB8xriISDpihqfYIEYWHfPw', '', '0', '', '1', '1', '0', '0', '', '1471159428');
INSERT INTO `tyms_users` VALUES ('1723', 'Jeffrey', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCFlM5c55ll0Ig1BiarRv7Yo8bj2y6RocvM2rYRZbUfibibNQwcA3GypeGBiayYGnUS5mgfTAicTvz2HDw/0', 'oyP7DwAIFqhHF-Ic_NzFEu1homkE', '', '0', '', '1', '1', '0', '0', '', '1471170049');
INSERT INTO `tyms_users` VALUES ('1724', '智维斯传媒', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2jlR2la6M9ebmhV2Qc1EtOquNMqplib5jopjFZZ1R3TDyh5cLAlrQ3ym8Ree0wL5d8aVabTzsvsBTCiaehnvianK6/0', 'oyP7DwMVeG4eDSGteAtvX0-IGEDk', '', '0', '', '1', '1', '0', '0', '', '1471181757');
INSERT INTO `tyms_users` VALUES ('1725', '小人物', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53ge7VTEILJsZZx3W3pfSZfS6HbDicG9wQIcQpTicWejotCalZcgOSic5wibdI63F3bWy0mWHEkWpIr5/0', 'oyP7DwD7wm9nULbExg2-Bk0CKHWk', '', '0', '', '1', '1', '0', '0', '', '1471220788');
INSERT INTO `tyms_users` VALUES ('1726', '初学者', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2Qbd67qzTemib9RKjiaZ9nnlcREypmK55THnxNtVmT7uu3oQrUQh87JAsKeeKL9JNlUEH17Sf7OT0/0', 'oyP7DwHc-tx2rImpEBrM3tVyRvQE', '', '0', '', '1', '1', '0', '0', '', '1471225214');
INSERT INTO `tyms_users` VALUES ('1727', '小掌', '', 'oyP7DwKj61vV2TIB7lYe18FiRw-k', '', '0', '', '1', '1', '0', '0', '', '1471226785');
INSERT INTO `tyms_users` VALUES ('1728', '小来哥', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0bWEvp2mboSdibmfC2oQOXsR7k2Rumo3tyiamVGZQy3oia2sN6Oyibul99WwHc8SECpNyaiaJBseJ7pab/0', 'oyP7DwCOXp8MoY8CDgSuXk32WCSw', '', '0', '', '1', '1', '0', '0', '', '1471227203');
INSERT INTO `tyms_users` VALUES ('1729', '爱生活爱辣椒', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELH5xK3PzfZ8F20Yjjo6PyjFwjxq4ztpK0jtic9JN20EWNwPibLYv5eI5QCcVeMO73FKw3hreGpuyV/0', 'oyP7DwFuJA7xKNzDOIR-6uW__WCw', '', '0', '', '1', '1', '0', '0', '', '1471227471');
INSERT INTO `tyms_users` VALUES ('1730', '漂流', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAg1FibHLQuJibFs2xaXCW4PqFWYU1iaCxRYib9iaFpz677hm3ib5QHZrZ48eJfIv9RwwYOQKarx5xW7SU/0', 'oyP7DwOyC18xDzyRc1CrskkyHjMY', '', '0', '', '1', '1', '0', '0', '', '1471228287');
INSERT INTO `tyms_users` VALUES ('1731', '杜明翰', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP31jXXRN7HH5w4YAhXxVOZ2TJbRxoIZHkmviaHZPWiaQBzbjFicibm5k4KUp3veWhaZpcaRntzJicFrI3jCghnNcPwEY/0', 'oyP7DwG0Q6SW-WM0uUOSMw33Ed4o', '', '0', '', '1', '1', '0', '0', '', '1471228913');
INSERT INTO `tyms_users` VALUES ('1732', 'A～CHERRY', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pkm37A69B9zaVa5vDQjAoItOcFgUamI4nHB78U1dwOoicl2URk753zwDKE79ib3GTicxJlg5ss0IjcicvCW2jR2Michiao/0', 'oyP7DwJCcxYkjqMdJtcph86S5zLY', '', '0', '', '1', '1', '0', '0', '', '1471232405');
INSERT INTO `tyms_users` VALUES ('1733', '唯美设计', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2UsBXjLqZLhOCU9358BZKsqaByIMV4D3kUiaBnwdFsXsXUH3bCeC2iaSpEPib4Dia6icvibOAyEcspwRX41FB2xr3NVc/0', 'oyP7DwMVnLHix7LqcFtRzMdUnxUw', '', '0', '', '1', '1', '0', '0', '', '1471233527');
INSERT INTO `tyms_users` VALUES ('1734', '《海》『湖』', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIuKJAibAskeCKCb5QmNsRoCcrUVXwG7dZOs4ONZA24U5HaKB4UMiakQv4ibWt5y2rDoL9NGTY4R0zlA/0', 'oyP7DwInYie60ztVaVsgZbR6XE0Q', '', '0', '', '1', '1', '0', '0', '', '1471239174');
INSERT INTO `tyms_users` VALUES ('1735', '哎呦、', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0c8cugFm7Nr37unibiaHx5Lo0Itb1UHAKfgu01NrbibHSgRSgP6pZh1VOXcWeJVZwTvP6wFvz7vG1fx/0', 'oyP7DwPVi_wj5VW-l7xmy7l0Zglc', '', '0', '', '1', '1', '0', '0', '', '1471242296');
INSERT INTO `tyms_users` VALUES ('1736', 'Android', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5yN4kyOxXKzcQdazURdgNPorBU2XudKeJaOI8SylAuAHlorrwicAaX0bLmtXFxIMS0a2xKkFtgzQcAo5sne0OYE/0', 'oyP7DwLKjWn7sxONYeUzEN2w2BJE', '', '0', '', '1', '1', '0', '0', '', '1471242354');
INSERT INTO `tyms_users` VALUES ('1737', '程飞', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELtNrZT6ZOLbPpQia15dAmJPqwGNh2yxfzepd9VH3x0ico6ibco50GBtpgXoHydLJP0u7Hsmp9Jj0MYg/0', 'oyP7DwJ277ZU4RQshCp_jxTeJHtw', '', '0', '', '1', '1', '0', '0', '', '1471242404');
INSERT INTO `tyms_users` VALUES ('1738', 'A0汉中悦车行改灯:yuechehang.com', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJAXytcO32etiaw8ic8KJDicEEibjnGp63EdFFkPSbaJWvyuZ81fvJtXsYkHgSTTpJXlgAwtlEiaKgqoNg/0', 'oyP7DwPirhgMfV2GSlRG5ivp8Bfg', '', '0', '', '1', '1', '0', '0', '', '1471242646');
INSERT INTO `tyms_users` VALUES ('1739', 'Event', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP25FFyFHeZByBvl7sEQ767NWZ1MbFhheH3cYoNH9W3b0qcscGjF48109bdEyMnZDhuLaiaoxiaKk4HN4xWJwlNl7U/0', 'oyP7DwBB9OYweIZQyC3v1hxF8VUA', '', '0', '', '1', '1', '0', '0', '', '1471243793');
INSERT INTO `tyms_users` VALUES ('1740', '过期的电影票', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP386OfJKsDOTdwbcl009iaRIiaq82amknGA5qMQHmdj204yh3vsC3ZCjVSBXNwo9ctXBKQcL0K1klziaXrKuib87WC1/0', 'oyP7DwHZuWG1PwUw6m45FApaSlh0', '', '0', '', '1', '1', '0', '0', '', '1471246327');
INSERT INTO `tyms_users` VALUES ('1741', '震哥', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraswKueoL4Ik5bP4ficVnGIWrkt948vLyey8KjtHiaCNTtLCvrtdoqxPwsoynEIySz67qZbN7nUcyCI/0', 'oyP7DwJy-fvrx_jTu4OJbn_2qCCo', '', '0', '', '1', '1', '0', '0', '', '1471248302');
INSERT INTO `tyms_users` VALUES ('1742', 'Hansen', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3jrYpXQDtX9F0QmZEV03bwmPcbx52e1mXskoSRSrdyP35CklcVf5loukcX3XRGNd01gnsrr5R2FKJ8zA00G8n9/0', 'oyP7DwELZyYHueY6hc1Qb7tEs_ag', '', '0', '', '1', '1', '0', '0', '', '1471250070');
INSERT INTO `tyms_users` VALUES ('1743', 'Rice', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5AkjeBNydicdhJl7YnYhESvbbnc3HyydOEWBvCVgRVyR2iaavLgRcJrthiasLe6wkO0osFibmq5NR6H0uOTicibvoJicj/0', 'oyP7DwGLaJY5Onv8kLJ_xmcy7NYY', '', '0', '', '1', '1', '0', '0', '', '1471251870');
INSERT INTO `tyms_users` VALUES ('1744', '娜', 'http://wx.qlogo.cn/mmopen/LSQ0gl6NMgbwCpiaxqhlnq6xibzFAUQoYS6b43wZjEDas3ydeIbMWn3fLlB5LuIYbmTk1rQUr2UO4DDPJMecibSJCJjss3hqCDK/0', 'oyP7DwBIMu5N9oIRx7kY6ox4JL38', '', '0', '', '1', '1', '0', '0', '', '1471253109');
INSERT INTO `tyms_users` VALUES ('1745', '骑猪行钢线™', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraHhyZgiboFeokeCO1UAYeE9WILicD2Ub4y6RvNCk0NIAxK6GNZmCiaLAY29kAvZtgYbic2mnbuD6UKek/0', 'oyP7DwHpY0DE05h_d6y_GiZkwgeQ', '', '0', '', '1', '1', '0', '0', '', '1471253846');
INSERT INTO `tyms_users` VALUES ('1746', '张小力', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5xU46UStFe0TbK9djibBUtniaFtZFeu6UDBq7C9ianB7iaGePST9ibqQzfnI4eYpPmrHia5whIvaWRjZNe/0', 'oyP7DwGRe2Ny6Joxpnxtq8Rz8yQ0', '', '0', '', '1', '1', '0', '0', '', '1471255148');
INSERT INTO `tyms_users` VALUES ('1747', '朱明明', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0Apo81xUxVp8y8Zuhw3gFt5FChxhjQKRMNeJ1DvFq031o63ErOaZG1QOrPZ2ibQ1icEoq2Jq6WQm7R8bzMf49jPy/0', 'oyP7DwFD2tMqAuKrD90I0CCyfrsM', '', '0', '', '1', '1', '0', '0', '', '1471264021');
INSERT INTO `tyms_users` VALUES ('1748', 'QQ用户', null, 'E0B84752A12C42A699E12DC3E0AC6909', '', '0', '', '1', '1', '0', '0', '', '1471270038');
INSERT INTO `tyms_users` VALUES ('1749', 'QQ用户', null, '0EC5AE63526193681A700FE77FF804E9', '', '0', '', '1', '1', '0', '0', '', '1471270197');
INSERT INTO `tyms_users` VALUES ('1750', '裴立雄15810075996', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDJeuG7BP4Vr6u5gUfmulAjibEbdba8PAwNia7Qfvd3jic7UOMHeucIumzTe40do0icIHa9iaBwoJ06p4/0', 'oyP7DwAr4uJRnh6PLMWIEifmCIBs', '', '0', '', '1', '1', '0', '0', '', '1471302202');
INSERT INTO `tyms_users` VALUES ('1751', '付泓程', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eBFZ03bicGw7ZOC477rq0qtPHe2bLaJf73etchm5ianCJNjGH8e6FmJ41Bsnosp2ErpYY8HFoIpymk/0', 'oyP7DwFefVFtk3DF0KcX3kZBqrJ8', '', '0', '', '1', '1', '0', '0', '', '1471309151');
INSERT INTO `tyms_users` VALUES ('1752', '等到蓝天再看海', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0aicCoFwIibX9IAFxicf33HvCbnVD31icfyQD1FkkHlwdpSjKkTfJDSMdkWFuCKibEWIJdf1xViase8Jmu/0', 'oyP7DwPPNmEEEd0CLEq2vuQptt3M', '', '0', '', '1', '1', '0', '0', '', '1471312285');
INSERT INTO `tyms_users` VALUES ('1753', 'A张泽，益阳中网18673737580', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0dkHRkPWoXgkEDLpoZhej3mspokIib6abjjPfo3fO2krXETXdrpl5rEtxY1O5vXIxIcf5aIePMNKu/0', 'oyP7DwLRTPxHTW3qvY-ntqc4UlrY', '', '0', '', '1', '1', '0', '0', '', '1471313786');
INSERT INTO `tyms_users` VALUES ('1754', 'app开发.进盛Jason', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDKPCHp0InjqqEEQUMSBCmc8O0QU3PT7VnxJFwribdbCjBL1U0XYIM5s2fIwQTYekljo7BrW3Ku83Q/0', 'oyP7DwDk4WP8VEv0tDp9nvdJhzfk', '', '0', '', '1', '1', '0', '0', '', '1471314438');
INSERT INTO `tyms_users` VALUES ('1755', 'Admin', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP314lPam5XlCiaUWbiaquBrYNclTozBwo1suribXLk3Norv1Q7uVAzuc7gR1eMYjktLJTI6dxgSHOlUksYzLCiar67d/0', 'oyP7DwJkIWI4jywt0pF5dFo8D1jo', '', '0', '', '1', '1', '0', '0', '', '1471315215');
INSERT INTO `tyms_users` VALUES ('1756', 'Prota', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJcr1wiatFaqNrbU7YahiaicVnCqUhlJJ56oNwMCiaICCQOpf6BKicouOHzBs6YficvdMG35dF4FVhKgTq/0', 'oyP7DwOg-mQ1sQROYLL4WyUaYLBA', '', '0', '', '1', '1', '0', '0', '', '1471315594');
INSERT INTO `tyms_users` VALUES ('1757', '醉猫猫（鑫拓科技 ）', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAGma2ZyOCdTej0qQqlZKh4u05N28NialMJFchzeicnVBicQG8sSXReuvurajutzKoSZ2qibyHN0pboLw/0', 'oyP7DwBKdV4mI-qO9CCrglzcA88c', '', '0', '', '1', '1', '0', '0', '', '1471318225');
INSERT INTO `tyms_users` VALUES ('1758', '庞小小', 'http://wx.qlogo.cn/mmopen/s5LGMFevq1fl9Pq4mTKQ0ricwS0UB4ekPRAUHvCJ8sefYcGEFIFqJa4DWl8MrgHmDx8W936lSuE2TqhFGSGC1QrnJPxwibngId/0', 'oyP7DwAag8mllCxFgnk4poJ-fc2s', '', '0', '', '1', '1', '0', '0', '', '1471318312');
INSERT INTO `tyms_users` VALUES ('1759', 'Don', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0SUibyka8DeKBuMvAl98uBln4icSFT0jQmAnnKibUpDiaTb20Hj4NteAqz8SFnAK9u8JUZoAx4XjrPsx/0', 'oyP7DwFegHe32idQxNfC6TJ-Hnoc', '', '0', '', '1', '1', '0', '0', '', '1471318899');
INSERT INTO `tyms_users` VALUES ('1760', 'Alive。', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAAdcAPRL7fU0sgbpcicrp78ftN1h8ibntcDLhBhCK3V4yPWbz0EkElhhIal5e9OdtJFHvdfP3pSTQA/0', 'oyP7DwMTnr82vfrnI29b2fv_2TdA', '', '0', '', '1', '1', '0', '0', '', '1471319202');
INSERT INTO `tyms_users` VALUES ('1761', '赖小赖', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDmobThspBnq0ADxFe0WjZpjRd7r47SDIFhYJmBhQ0EHVTXOVlXC9eIZTicJtrYvFGAxFpuYFib6Dk/0', 'oyP7DwPlTPYDk_wqFxQm_WUWJMgU', '', '0', '', '1', '1', '0', '0', '', '1471326682');
INSERT INTO `tyms_users` VALUES ('1762', '木小撇', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4ntCMCAHDagtXJoDF98VtnicapXK6ib1T3Upcc3EYm7x58rYJDFxEN4JRIDXFgD0udKcibtJVqEVjT0/0', 'oyP7DwIr27AnMO15I3V_4H0H5W-I', '', '0', '', '1', '1', '0', '0', '', '1471326688');
INSERT INTO `tyms_users` VALUES ('1763', 'I Believe', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBKOLSpSGhaWSG1XSxclqVMTBeWg6zE0QySkEy3icg1LvrfROaxOkDNeXotvpZbgnUBMxtMGe6XN4g/0', 'oyP7DwAe7Etutr0TbUAZVaUeIDog', '', '0', '', '1', '1', '0', '0', '', '1471327765');
INSERT INTO `tyms_users` VALUES ('1764', 'A001Today', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEHLypBWO1icic96qRQ8rBL3Qrh4S7q5vPJC17YBOa7RHdCyP6LwNSOb7ia7K0c0TNBXedKuLL91l7EB/0', 'oyP7DwF77LBgCrHlnOYUcfSixXRA', '', '0', '', '1', '1', '0', '0', '', '1471328035');
INSERT INTO `tyms_users` VALUES ('1765', '陈年', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0fPnibbxFbib9JACXuTLFBvBPk2a6ibRZjBgA0Y4tL9eZRbaMsHebvqsjD41cr96sqtrbnSnzK4v5jf/0', 'oyP7DwBumyqRg7CMAZNGiHsFVc2Q', '', '0', '', '1', '1', '0', '0', '', '1471328214');
INSERT INTO `tyms_users` VALUES ('1766', 'Base.', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECVTz9UNia4OZ18EZtJibwQTQ7qVEl3FQJ4PCicOp4kVtkugPbRibbwLRWrBGica3ed6K1svINwgybnkW/0', 'oyP7DwFBrnxv1PISTf4EpbyxlhDw', '', '0', '', '1', '1', '0', '0', '', '1471328582');
INSERT INTO `tyms_users` VALUES ('1767', '大圣', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia40icDJiaGXbWoXCxy0iaBodUCZauEMQOoTe39fibb3G17b6knSaypgF5sO9ld0JtH5uuTic4RuNkibYD0/0', 'oyP7DwEv5hD64ZBZRVd3ETYbW6NU', '', '0', '', '1', '1', '0', '0', '', '1471328855');
INSERT INTO `tyms_users` VALUES ('1768', '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ43EECLXsUOQCL6vNpjqM6CjWNVd7IttBql5MMtQ9juRh8Eae9mS7RCPs0LOk6RM0oSdbicOobJQQ/0', 'oyP7DwNEj6zdcQD18B0OwfZPx6xs', '', '0', '', '1', '1', '0', '0', '', '1471330931');
INSERT INTO `tyms_users` VALUES ('1769', '逆风飞翔', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2HCZEUuRGJcIXIIqGyK90a1VdBgHbKZEJQ8PCukfW1iaXibtQSXKRicoJ5PB1ic0p781ZFXJ1WhMvBR/0', 'oyP7DwDvecOiF3upkofYhrGetZpA', '', '0', '', '1', '1', '0', '0', '', '1471333001');
INSERT INTO `tyms_users` VALUES ('1770', '', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC5RYvub3wVG2mhV7yrwhQ5o8M4mc2g7Zk9oiclB5V6OBjEAQnQREic83L0IvupJBKagnKPrVDzxZYw/0', 'oyP7DwIwbas1V414RtXPhd7KsomM', '', '0', '', '1', '1', '0', '0', '', '1471333516');
INSERT INTO `tyms_users` VALUES ('1771', 'asion', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5XszBC0XAlzbicX6JEo47lYxN9CmuOofcpZnru2sUWal2IxhZogzzeP3QeHZERE7Lq8pibGXpLD8M3pK7bvibofqU/0', 'oyP7DwGagLqsaCecw9hybc63O9GE', '', '0', '', '1', '1', '0', '0', '', '1471333519');
INSERT INTO `tyms_users` VALUES ('1772', '船长', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5yhr2yIdMcv4LWaZCzufkoXBiaYb5A75Yuqg6JaA5pQrcxb8gx1o0Um5Fkv3tgqljf78uXZOsU152YAJzic5z9g4/0', 'oyP7DwG2QBadiTelOtjF0rZWaORQ', '', '0', '', '1', '1', '0', '0', '', '1471336004');
INSERT INTO `tyms_users` VALUES ('1773', '徐敏', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPmB3jNqXjG74pYwZTibeGXcntD4HMjDh39ZpKuBzk2oXgr7znJ8ibBPYXZBUuxD0Xd1sdicLAS0tA3/0', 'oyP7DwBK95vdIX0Zlgerk6LYge2M', '', '0', '', '1', '1', '0', '0', '', '1471340037');
INSERT INTO `tyms_users` VALUES ('1774', '佳奇', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eAw3rN53DgbPiaeriana6iaBOuuLl5Hic0DIia1RdvBEgDKvx7eTxQFZf2NszXrWNK1VOg8d4tzCicYribv/0', 'oyP7DwFp2o_vr08_T-l3ZLuYVQu0', '', '0', '', '1', '1', '0', '0', '', '1471341895');
INSERT INTO `tyms_users` VALUES ('1775', '小郭', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3JssSxWL1byMwjjlL0HYzzDPO0m8Htu7Zmsn6L2icCfjZEia2t3Mz3n6DpM3pYAqYDSARScoq1p5Q/0', 'oyP7DwI37K10OL9uDNDzFEmGMf4I', '', '0', '', '1', '1', '0', '0', '', '1471342449');
INSERT INTO `tyms_users` VALUES ('1776', 'nixan', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5yj5Y8f6tfbqcKCuFmDtm2VzI1zorS5icQ6Ue5porbRzWAClwYibx7Yv8PXQPML9cia79KibibCCsBEDd/0', 'oyP7DwJvQWkhP-6ygtSKj__mnbIA', '', '0', '', '1', '1', '0', '0', '', '1471343450');
INSERT INTO `tyms_users` VALUES ('1777', '余贤铁', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3Yvxqlhcs892ric5gGyo5s0lxeibftelOHRwZpYxsgtDnwDHatNibMKkBYtpemKB0wtDibs71hG3WVlg/0', 'oyP7DwMo7Kts3E3MXyM_UppZVjxY', '', '0', '', '1', '1', '0', '0', '', '1471360063');
INSERT INTO `tyms_users` VALUES ('1778', 'wolfgm', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELrgicjbiavEV6icg5aWR1vgajkakNpbwaC4An9nV1avdIODRw1WpjU0WPF0nibtZSgeee0ZWX10fah7A/0', 'oyP7DwMtA4dz1ICQLb3hv1wAlhL4', '', '0', '', '1', '1', '0', '0', '', '1471363044');
INSERT INTO `tyms_users` VALUES ('1779', '‍我不是肉夹馍‍', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5U2a3syJha87ic4dXcC590rFnAdP2uYBzdElGorxQL7Z0m1llB7y7jPWib9BiaUsxWXtm4n5fMMYgLSM67mYo22Au/0', 'oyP7DwJRuDQiyg_qxBdfSR6Wu91o', '', '0', '', '1', '1', '0', '0', '', '1471363466');
INSERT INTO `tyms_users` VALUES ('1780', '可乐', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6bE4z1KJW8bhFMDFbyNkNQHqgXA90NHY2x5k1h6fmI2W44JWiavSt9xptg4WvGpkFibh33Dicj8YT4DoQUm0LXJwh/0', 'oyP7DwBkIQ1c9QT0j3OFcw0OK3u8', '', '0', '', '1', '1', '0', '0', '', '1471398991');
INSERT INTO `tyms_users` VALUES ('1781', '我愿随风', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaziaLAhY29SCbOcQ8HkMK3tHtMtic1UWUldVNicH204LJZWicVjXtfTuTiaDmfTd4qibPgSB7LjQDktNmW/0', 'oyP7DwOInO6dR6LuZhalN_6oXlnQ', '', '0', '', '1', '1', '0', '0', '', '1471399942');
INSERT INTO `tyms_users` VALUES ('1782', '崔新道', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNTlnyZxLuFfO3qP7UxMlCu9yXsSMeSwW3SicGUEHt6iarwXLGhvcfiaD40vHpfqV6hKxyVBZlNcRUQ/0', 'oyP7DwMcJ6Sm7fYOXK_fEvVc5AF4', '', '0', '', '1', '1', '0', '0', '', '1471400799');
INSERT INTO `tyms_users` VALUES ('1783', '你没心咋知我无情 ', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UBXKUjSTPa6eofxVPiaGvXyNDyDuY0Teh1hvnaMKLFllBaaiclweIwyzJp6ibMzZjw6zae0ibLzpgWwu/0', 'oyP7DwLg5R8iRYwESJ1Cf6S5fWoI', '', '0', '', '1', '1', '0', '0', '', '1471401451');
INSERT INTO `tyms_users` VALUES ('1784', 'Sealeo', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Iwob6v1ZJdGtw0QHiap96uzFFp7zrq68icWv5kLacBHxOPI0Ew6Oib7XAW6MWUkX3FrwtkTP8E080v/0', 'oyP7DwINDD8RdZl54tIPXB7Wjwkw', '', '0', '', '1', '1', '0', '0', '', '1471402469');
INSERT INTO `tyms_users` VALUES ('1785', '小蝌蚪', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfiae4UHtTD2gDqIbLInm5DiaA5rgPicwuTfkA7Q8yWKZTt3HmBfPC8NBCRc3cqY58YTsHfv9Q7q4sOSbjkhUqBTUib/0', 'oyP7DwIfqUDoa9D1Hr1bcv9kpi5Q', '', '0', '', '1', '1', '0', '0', '', '1471407175');
INSERT INTO `tyms_users` VALUES ('1786', '从前那座山', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WCm2K9ppANBMgsxqUD77rSnibN0Q2bdu7lbq1vWDz63ur5ETGUIcUicibUl3MP0KcpYX5iciaq1hd3RQ/0', 'oyP7DwN_5zezrVoHTuJ-6aZJorhg', '', '0', '', '1', '1', '0', '0', '', '1471413534');
INSERT INTO `tyms_users` VALUES ('1787', '咲 ', 'http://wx.qlogo.cn/mmopen/ObPAfHzv6UsATwXyibaicJT9PYUIIR3rXFwuOeSyjazicicQo24GHyR5uGf23VxepMcYibp8aspEbTLQgddafgmqic5tS5KxF4zvhj/0', 'oyP7DwNXZn_OXGjiOCPgijgrbKXY', '', '0', '', '1', '1', '0', '0', '', '1471414117');
INSERT INTO `tyms_users` VALUES ('1788', 'A_韩成 opvip.com', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5U2a3syJha8zYF1qSUic1EGHHoNtQx3ZD5QvbShAdBfzpiaeVb3OsEBFgqVZ2Dc4n1AmqXc1kIR0rDQp5mT8SdyM/0', 'oyP7DwKd5LZ80_O1shM1CjfHgDhg', '', '0', '', '1', '1', '0', '0', '', '1471415044');
INSERT INTO `tyms_users` VALUES ('1789', '朱小筠', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5JyWcqtKnPSStuh9veWyuicXzIZRs2GhqaPN2GgWJ2DiccT91OBE62Y86j7RrOOuZNCf0qQkaK6UWQ/0', 'oyP7DwKYou7pwSoEKPfEYYTVl6Fg', '', '0', '', '1', '1', '0', '0', '', '1471415561');
INSERT INTO `tyms_users` VALUES ('1790', '御敏', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eCqnnCJAEIlrx7xIg0RLsLSG2icuGviaeQbo1Z992AYO5DXuWXhABtAarfEyx15SCUJOibwZ4V0FMZZ/0', 'oyP7DwAJpCEa1pmLvAszQnZ1Nuhs', '', '0', '', '1', '1', '0', '0', '', '1471416702');
INSERT INTO `tyms_users` VALUES ('1791', 'YAHOO ', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdZgd5tzLaich5zVsmtWtW1sjqBxhhwal7kNfb2RWhVDS6eFYOIyIAMpRVsbBlVNvgW3pnoAMrT6vQ/0', 'oyP7DwAtqzFpFSLGrIS0wxNoXqOg', '', '0', '', '1', '1', '0', '0', '', '1471417318');
INSERT INTO `tyms_users` VALUES ('1792', 'syivia(yuan)', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAtSSpAzUhUgQPFBFmRw8koxJfiaeqYzY11eVWX3zc2On0nzQhXr9hUZhJl664Au8L0aDY73NN80EQ/0', 'oyP7DwFzhBI0zpLfLFyQ2PDyBXw4', '', '0', '', '1', '1', '0', '0', '', '1471422183');
INSERT INTO `tyms_users` VALUES ('1793', '黄宁', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAAWTRYxurV4rfvbUsORhQia40xRiaRa3wLDRp53N9GncmawSfBVgOl5xGZf870Xia0ChibjS6RpWKZicw/0', 'oyP7DwMFnp1JGjvjQeNfqLY9Zd5g', '', '0', '', '1', '1', '0', '0', '', '1471422266');
INSERT INTO `tyms_users` VALUES ('1794', '一千五百两', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eAAv2b7Miaw35DptoUwnnnMgKxzOySnyomLJBWs2mBSKtRP1EpviaoXx2VQrT48Rt4k4X7xQ72awic2/0', 'oyP7DwIX4C0Kk6itjJyM_NyQTbEQ', '', '0', '', '1', '1', '0', '0', '', '1471422848');
INSERT INTO `tyms_users` VALUES ('1795', '狗焕', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6v89h2ID5JLLu4KibicQibOXJIo1xNoOqicEBJtIHdIWFDbeHyYbXN2WnMo5iauElHaP4jyP0fOlsu3lpwibw7RPWBqu/0', 'oyP7DwNG95z84QrU9Vvw4gwE66Ig', '', '0', '', '1', '1', '0', '0', '', '1471423382');
INSERT INTO `tyms_users` VALUES ('1796', '悦颜', 'http://wx.qlogo.cn/mmopen/8hSs3H5r6sYIuRUOdGWJYdEM2E8bpyUNKiaKa2gBvQ8LhMObY0T9zTLc0ZPcDdpJKzfpat8OChhwCxXMaOAriaDd24n4dE6DNb/0', 'oyP7DwPxhH7j1PeydWVxw9kRPllw', '', '0', '', '1', '1', '0', '0', '', '1471425692');
INSERT INTO `tyms_users` VALUES ('1797', '咕嘟网络-浩彬', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdqBRKicSccUDTrd1yc2BWpNM3Pr2DYXiadBXmCnpOVxS18VQCzvDyRSriaNqdLCPw2XFAJSrQLAHtfHCeJmicJicJ5H/0', 'oyP7DwHX9hA1L-sNhIyV6rH-eKSU', '', '0', '', '1', '1', '0', '0', '', '1471444760');
INSERT INTO `tyms_users` VALUES ('1798', '无可置疑', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeKIKfDAuibZgEKxXSIIT3CxuTiaCjucZ6QgGmLKVrRPeksh6m7NPXQ8ZR6Ig1iavTlT1LTicVALT3ELA/0', 'oyP7DwGJ8ONWJ8mJ7hArIIak-hNg', '', '0', '', '1', '1', '0', '0', '', '1471445178');
INSERT INTO `tyms_users` VALUES ('1799', 'Mr.刘', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCjaYJicqXOicpAc5FerxONQc7W5sFlBlyS7PXPzvfnibiaS3ROVjs4kGhmia3PnHcMkwV23qkh7V3m5xA/0', 'oyP7DwJx59uHxQunRKsla3-Jj_Jw', '', '0', '', '1', '1', '0', '0', '', '1471451032');
INSERT INTO `tyms_users` VALUES ('1800', 'AO绿色健木', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3qQ3zedRF1TBObhcPzWJ7zGFQsAADapvO0qQjTyemRhpeZKxua9JOL91Sjlhhd6MVKkooa2MGGicE/0', 'oyP7DwB-5TtwCN6oe-jm-qmgnobY', '', '0', '', '1', '1', '0', '0', '', '1471480462');
INSERT INTO `tyms_users` VALUES ('1801', '李继伟', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7Tyhd8icd9iaibFFkf0uq7b3uzW0xmMOnbo5YnOJR8WhXusScxDKrQSGOLpaEzK7hqiblIC939NxOhD6jZ2FpOdlyP/0', 'oyP7DwFd_mMfXkfP2PAMhEmqKkU0', '', '0', '', '1', '1', '0', '0', '', '1471481962');
INSERT INTO `tyms_users` VALUES ('1802', '可惜我不会', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WkSWAIq5LTLWb5kLQoUPyz6wprJzhtwKPVmxnxiciaxGX1iaVHkAQicg72KZ3nQBNoiaRQ42ibUgmy4ML/0', 'oyP7DwN9j7QBQlnB-oRv0oeFANeI', '', '0', '', '1', '1', '0', '0', '', '1471482652');
INSERT INTO `tyms_users` VALUES ('1803', '明', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5x6VvV8OYYBSTSUP3aKOiaozKyLFS0AQhHdR1xFrjNibvTmWG9CbD1Vur699HUwK3zrzicYEvrViceAA/0', 'oyP7DwKAFwgxdiDhM4NxxpA3DsY4', '', '0', '', '1', '1', '0', '0', '', '1471485252');
INSERT INTO `tyms_users` VALUES ('1804', 'mingliang9481', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0THYQ1OS2Bp0ZIPtJjOdbv4LFeBNMm1YBAkf9xEBboXoYicrSTiamKAfwTkEBJevogt3TGxuSs7C1k/0', 'oyP7DwDh_Nq7TLtFU8WpGrGbQ4-M', '', '0', '', '1', '1', '0', '0', '', '1471487580');
INSERT INTO `tyms_users` VALUES ('1805', '布衣星星', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0nDbLqBibSeFE3icka5fHywX9PXianAQAZ5EGfAzibXMA6wYpgny01noqE3RKumMqAUich258Tv89xjWoAjvWdLKAjC/0', 'oyP7DwFE-lTaAXZXsFsDq-kHXzAQ', '', '0', '', '1', '1', '0', '0', '', '1471490768');
INSERT INTO `tyms_users` VALUES ('1806', '卫建华', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL58HxFcUFV6GTzNL65kqHHvtnZxc06DdPw6icvN0vaiaVBm3iacN5LJwmBLBpHamFxGtiblfGb5XFhy3WiaqvZ8XRAEf/0', 'oyP7DwBYxEJX3i_qxQJ0rEUFZHs4', '', '0', '', '1', '1', '0', '0', '', '1471490773');
INSERT INTO `tyms_users` VALUES ('1807', '风雨同行', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL0Df3ceWMlWoXFbKMoHibWibbvs4NV0IIISKsAGpm4X9EwOH0PE25PyQnYBhTaOhqQQ9viceWib7VN1g/0', 'oyP7DwDFCkvKy9pXKwL13FGRfS1U', '', '0', '', '1', '1', '0', '0', '', '1471491737');
INSERT INTO `tyms_users` VALUES ('1808', '舍得', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1rSicY2Wwq9kdjictXqHpHFKNkEiafSvUMBicyu6fE3Cdo0foQX44EtvpjeRCHhGgeR0j8fKUwicyW4z/0', 'oyP7DwAr1gnma7owBXtQvEOKUj_0', '', '0', '', '1', '1', '0', '0', '', '1471492023');
INSERT INTO `tyms_users` VALUES ('1809', '努力奔跑的胖纸', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6EMN5WP5IGTPllrYVvITr3OljBNkiaRVk3oWO74lhsNNDPHVWtjjQ2siay39jng8ws2xGBG7KVAx7bcszO7ZWfZh/0', 'oyP7DwNcfaAT8LD2oYOcqEB-ADPQ', '', '0', '', '1', '1', '0', '0', '', '1471493058');
INSERT INTO `tyms_users` VALUES ('1810', 'alive', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDQGTtoWKwKbzucNnSMNwMkEUibLBuPibsSoIE1s5dXegiaFaAEPPmbYFvVzntvtwqV5f7a6OlA5GHZqIUcW8EOkOlDX6xWdxfYVI/0', 'oyP7DwAq5ZW6KUyp1hcyT49afYCY', '', '0', '', '1', '1', '0', '0', '', '1471493150');
INSERT INTO `tyms_users` VALUES ('1811', '知行合一', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3ay6c7kDibe5BHDcIicuHP2tx5zYG1bmPjyuxibrywFg5WZ1BiaAK4GzmbFKVSuO2FXNSgCHPtYqpG8/0', 'oyP7DwKnTjGVrFU39DBp2ybu1vI4', '', '0', '', '1', '1', '0', '0', '', '1471495106');
INSERT INTO `tyms_users` VALUES ('1812', '小鱼儿★学君', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90IAw8JEBmRPEVycTmgNVIN1p8IyufIkJUQWbu6zy5QMSG0Dc0ve6DoAepxkbm1V0qR6Sibc59YEw6/0', 'oyP7DwJmdkClwFxxbePpwBis0JTM', '', '0', '', '1', '1', '0', '0', '', '1471499884');
INSERT INTO `tyms_users` VALUES ('1813', '康康', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaxFEP74eCJBouZuQO66qvLpLeX9K0Y9NibWlAPAY4POL13rFK0yOePicEIYk2VRpI0Yf6iaSMW8OLJ9/0', 'oyP7DwJoNksnDO0eCAl4LihYsmps', '', '0', '', '1', '1', '0', '0', '', '1471500277');
INSERT INTO `tyms_users` VALUES ('1814', 'QQ用户', null, '6F8AF3B52AC6B69D0C55EC3C263591C5', '', '0', '', '1', '1', '0', '0', '', '1471500910');
INSERT INTO `tyms_users` VALUES ('1815', '885672158@qq.com', null, null, '', '0', '', '1', '1', '0', '0', '', '1471501021');
INSERT INTO `tyms_users` VALUES ('1816', '臭臭 〃', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3WabJWiajF1v4L1SpZyMGnia7LO7IEcAcuvDreKZJkzE3gibicHeyDbtpt49JQuE5icEIgLibrEzE6aJelUnCzG1dkjp/0', 'oyP7DwMOPtygtgtx87YHWYKy7JJI', '', '0', '', '1', '1', '0', '0', '', '1471504987');
INSERT INTO `tyms_users` VALUES ('1817', '消独', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7kibDtxWCqBHW1dMD3iaVFZSBichD9ficKq1HaRFncrIzcd91P1K8IWgV0OkFDcDjzNHYAUL6GF3ow2JvUevCOQe4q/0', 'oyP7DwAI8HhFTzd3GoE0qfQwlAQs', '', '0', '', '1', '1', '0', '0', '', '1471505291');
INSERT INTO `tyms_users` VALUES ('1818', '当当', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBUJhp5ZhbgGp5rrdY5eQkm7fWibwuIkdbLVCYOzyT5SbL3bpCLkV4q7GYzY7qE6eJ6JrO7YeJt3yg/0', 'oyP7DwF0okM_XU9W5QjoromXLdvY', '', '0', '', '1', '1', '0', '0', '', '1471505899');
INSERT INTO `tyms_users` VALUES ('1819', '青衫如故', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0RPiaJszy2icRibp1icTN6ZLNF3iaO48XM7WjibnSZInXwWheDO508LqyKiaVN2oMEa9bnNibFQmvoa2pT82/0', 'oyP7DwHrq7HCnu5-H04FCW3HRL08', '', '0', '', '1', '1', '0', '0', '', '1471507173');
INSERT INTO `tyms_users` VALUES ('1820', 'VIVI', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJlOE7Ky8MtKXZXIS61tTlYExNUNYyy21G9VghsvrqltiazN0dasloYuceaiasaxEMPrc0oW0C93gTw/0', 'oyP7DwPEPEdUHJaJUHD4QYnuOMOE', '', '0', '', '1', '1', '0', '0', '', '1471507388');
INSERT INTO `tyms_users` VALUES ('1821', 'Mr、Lucky', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4khrH0nmTTstvLBeR1xzVZBtBrRARaIbf4ED7po1UOSPiaC4m2vCNHbW3YrexH1XU2nPMgMfRcq8mS1UibHYhmrFqcJLoaibKVe0/0', 'oyP7DwJSWs2_IozSBO4QUSsIO3Yw', '', '0', '', '1', '1', '0', '0', '', '1471507397');
INSERT INTO `tyms_users` VALUES ('1822', '王泽', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdEshhEMqcXmnGN5PrTGEUCHcI3hlCnruF10uSKZprvuquo2wBDFdyZofwicica5xjjK4Z5CKnJ4aSw/0', 'oyP7DwErVqr3zAwGnD6ELhVlfwu0', '', '0', '', '1', '1', '0', '0', '', '1471508291');
INSERT INTO `tyms_users` VALUES ('1823', 'Jerry lu', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5icE0fOSXpXTicBzNHDiaCibOVW6vMR6gmokSKh3upUnpy1PkHYianibNfYziamQvnIKKULVTfNhYQt1ka4Y3JXq7bibmE/0', 'oyP7DwDx65aZOHZZ1drc8YJP9KWQ', '', '0', '', '1', '1', '0', '0', '', '1471510603');
INSERT INTO `tyms_users` VALUES ('1824', 'First', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Yrapp4nic8j259MlRwiaib1wqxcw1ibdhc3sBweZYgT8pZv8Iga2tW2cS2lEObvjKxanAiaoVzu9eWIL/0', 'oyP7DwLsnlTWNtniWmmLKhQfaFYk', '', '0', '', '1', '1', '0', '0', '', '1471512177');
INSERT INTO `tyms_users` VALUES ('1825', '喵小猫', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pkm37A69B9zaVO9eJiclatamqKJibrMzmRXY8oH9pH1UOgkgohh3H0OtWSNTNuFia5ZwKiatAknB9hBxKHTJAQSzkLcI/0', 'oyP7DwMHhT4r3Lu9D54KZgyiy3R0', '', '0', '', '1', '1', '0', '0', '', '1471512270');
INSERT INTO `tyms_users` VALUES ('1826', '杨高峰', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaynW9RIkUh2b3ELcXvLMmRy1siczzZDhic39PM1z6PVjS97Sw3D9XWNZOaeeDx514xm7WGToiaIYljE/0', 'oyP7DwMobIz1KOtccVH-_DOnFigU', '', '0', '', '1', '1', '0', '0', '', '1471514717');
INSERT INTO `tyms_users` VALUES ('1827', '墨语', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4taQcpDTo3pDTmxZczpwTSsNVRgnpVQGRKJTLibUA0qPOXyF8Z58wDpIbo3GrcSzXkQtzIA7Ph4wNBZ0rr6Dcoe/0', 'oyP7DwL2RSGek5PIZQlQ56b6ixiM', '', '0', '', '1', '1', '0', '0', '', '1471515348');
INSERT INTO `tyms_users` VALUES ('1828', 'Lemon Tree', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazBNpsHuPRNdDjH6qnia0k7HpP6tPmjUU8ELicpS73UodRtqHrrs8UJo1T6I22Yibyq4ECBdDCe6eQia/0', 'oyP7DwOAo4q0TOKOluuvmranEfvU', '', '0', '', '1', '1', '0', '0', '', '1471516064');
INSERT INTO `tyms_users` VALUES ('1829', 'A信和借款...郑仪仪1878694455...', 'http://wx.qlogo.cn/mmopen/86FBKqUiam02GlmlqKfGGnSkicopv84FCcWdzrfylRpTVaYnGfpw4GJdjhAJTCjGibMvgpa8ZWXNUncwWyfE1ke4icv7ldIIcjfJ/0', 'oyP7DwMSzu-j7hE9u20LbZbptJeM', '', '0', '', '1', '1', '0', '0', '', '1471531641');
INSERT INTO `tyms_users` VALUES ('1830', 'BEN', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0UUoBp2sTomCRW0oRa7KehMOJk6Mc7AXiaddYGpzgJicSUbGsG0MFCWARmjcNWiaeiakIZX0vkIA6Od0/0', 'oyP7DwM5pEEFzRan7cExZdisOklc', '', '0', '', '1', '1', '0', '0', '', '1471537127');
INSERT INTO `tyms_users` VALUES ('1831', '文古', 'http://wx.qlogo.cn/mmopen/LibNrIz6OEOqRabcdhMSy0q0uncDdW6W2ePlYgj6KQBC8kxldicB8iaTUZ2nX54Z9p0WjMFNEG4Ja7EM2ss82QHwhETtXmKyn6Y/0', 'oyP7DwMCrWeO5i30jW071qqLol6w', '', '0', '', '1', '1', '0', '0', '', '1471571151');
INSERT INTO `tyms_users` VALUES ('1832', '冯先生', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDCYKIYDxIc0raLqia2RX0iaqCw1VE0YH1LdBWk0r1hBVN3ibdPWHVbpp6ib1icf2j7ibLf9kTc4UNBkJ4Q/0', 'oyP7DwHFx9XB2JsZnVUXHhlsEw_o', '', '0', '', '1', '1', '0', '0', '', '1471574850');
INSERT INTO `tyms_users` VALUES ('1833', 'elmer', '', 'oyP7DwHKe2ROAl7un_pEaXJUyDNg', '', '0', '', '1', '1', '0', '0', '', '1471575566');
INSERT INTO `tyms_users` VALUES ('1834', '军军呀', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5yWqHcRc0mlISxjebLolscSM8qBMuQ7M7tUlGSsns32GotUvWNC4MBH3iaXTkia6gsggU0th5FPMWm/0', 'oyP7DwMXB7_ZXN_a4pXcalSGzdlU', '', '0', '', '1', '1', '0', '0', '', '1471577246');
INSERT INTO `tyms_users` VALUES ('1835', '静心', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJb8slPewzUXma1EZMLJPxG5vGVZclWzb6C78libXKTFa6iaXPOn9lsEu77tBQtD0zAuFrc6cqTPxkw/0', 'oyP7DwJLNBeWcHTmyZobWiavdCPI', '', '0', '', '1', '1', '0', '0', '', '1471578493');
INSERT INTO `tyms_users` VALUES ('1836', '太平洋警察', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdSbrpJ0nQ0Ll2boz9cr4ZDVGzfsXeLIa5Vlr588xUibkJtSfLdXEu8ZGvMDJ2AQibQicpsTN8U0aqpsaaR7JsYGlG/0', 'oyP7DwNla26MFCaxo0dbChHLHY8Q', '', '0', '', '1', '1', '0', '0', '', '1471578745');
INSERT INTO `tyms_users` VALUES ('1837', '洲达叶', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UKJtU1ic4nIdMMXL8ibwqnn67ibjBhunfW1lmpYKgEHjficlnGkBgT0Luqsb2ibWMYYhrZu3aO2y6nahM/0', 'oyP7DwDF0unqaaqw3e1-qDNHcvsQ', '', '0', '', '1', '1', '0', '0', '', '1471579070');
INSERT INTO `tyms_users` VALUES ('1838', '劲松', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAWKgWMRic1SUnO0foicbvYEXzWupZmXY3ntUbkHDKaURKAB1iahAN6iaCzE4F0zoVszL3FoaFH2GBGV/0', 'oyP7DwN9rcR1i2CCQpSF3NcM_q88', '', '0', '', '1', '1', '0', '0', '', '1471579185');
INSERT INTO `tyms_users` VALUES ('1839', '葡萄干', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3f85I7Hh0hxoFzD7vQyNPyK5T9gH5ICbic1pF5UibwVNU53zx8qdr9RZpWlhPVqlVOfJD3iaVym8Aw/0', 'oyP7DwIZ6y7z1iy8RxrmSI0Sdx6Q', '', '0', '', '1', '1', '0', '0', '', '1471579639');
INSERT INTO `tyms_users` VALUES ('1840', 'jack', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKibibu1Fr7p71XSic8UXPqfBZVQqWzrLkhHbrXd2Eowuz1WrTbZ1gFN73g23NGB17tOfLhoL2Vwhgw/0', 'oyP7DwBV1Ab7mGPJ4t8PbLSVd4mw', '', '0', '', '1', '1', '0', '0', '', '1471584895');
INSERT INTO `tyms_users` VALUES ('1841', '问吧', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4m3PALXlKjuaibL7BIy7uRGNw0S803r4z7LnbEPjk4lbpNOHJicRADXmrPfUIjicyC6FL1OGqbl5crX/0', 'oyP7DwPMjNqLgMC7y1en_7oCWJqE', '', '0', '', '1', '1', '0', '0', '', '1471586930');
INSERT INTO `tyms_users` VALUES ('1842', '王亚磊', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC4MxsTWACgVw46mhrhicia2BqAra5wAPu0MQt28ibpRicxI9wmXXOPJbELEsj84d01raYc4AFx2nJLBg/0', 'oyP7DwOMBjNMIZ7LeyzGACA56bkc', '', '0', '', '1', '1', '0', '0', '', '1471588432');
INSERT INTO `tyms_users` VALUES ('1843', '橙子', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eDFMNibkrkgaQs60zQ7hds8AzzM9xzkqDGiaeHUj1Pxo27JPIXEmCgY0s4oeEFqLvCEWcunM3lyXaQ/0', 'oyP7DwGvV_dBaAxUl2INWnIWQ9UY', '', '0', '', '1', '1', '0', '0', '', '1471591567');
INSERT INTO `tyms_users` VALUES ('1844', '一座城池～', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP37hMial1xiaiadqVjSKgs6b9D6ln2NDMP5lEv1okfvWBFmVYnJmDzjAj3llnbjWrf2xaAd67jGmMWGkVOErhDqlCI/0', 'oyP7DwI59pN3MUqLqBTH1j_loypM', '', '0', '', '1', '1', '0', '0', '', '1471595399');
INSERT INTO `tyms_users` VALUES ('1845', '天国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBJPU3vzAOQPNEicSfo6RibyUZmOFnibMrFwqC4MkkUfdpaYxdRicYkX1p9H7IagxuuW7ORl6FpAyD9pg/0', 'oyP7DwB_RhTKzzKxTNfE8nUXZNIs', '', '0', '', '1', '1', '0', '0', '', '1471596784');
INSERT INTO `tyms_users` VALUES ('1846', '时光静好', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2wCrtgqqwibK2JyopHKzkTYQe0GBWvbFmMz2pkSpfbN3dG3e5N9GRLtwib3g0EJDRU2I8nEMib7ytBEFnkXqEFQef/0', 'oyP7DwDRAna4qIHBUtLjJC7AKUek', '', '0', '', '1', '1', '0', '0', '', '1471598132');
INSERT INTO `tyms_users` VALUES ('1847', 'lion', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia7WNtyuGyPlibhmIKqdKNWWaEKzJsmD8FAgoSia5wYGdGJcVicVdreSbgqqh89RfMzSmian9Hm9MsOEd/0', 'oyP7DwKvN9zFJEDIhPgopbAgG8MA', '', '0', '', '1', '1', '0', '0', '', '1471598532');
INSERT INTO `tyms_users` VALUES ('1848', ' 克罗地亚狂想曲', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKGrFv4ic0hve8H3qnGjRkkpjga12M7BHPf8eDSGHibZFO8lopu0icLD5xaCe0vYLQvhf2Bw5uarw8Y/0', 'oyP7DwIa2bAZM6DMu_JUHz6VvhCI', '', '0', '', '1', '1', '0', '0', '', '1471599953');
INSERT INTO `tyms_users` VALUES ('1849', '核桃钳', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCvvshCx1jemwW6vAE5MsMPsFVp7YJAbufEIfwDH6638eYdZaIB5HzBwXvPxeHYG6pOuGPwQOb3jw/0', 'oyP7DwOdHWxSd5iO4poCS4v711CI', '', '0', '', '1', '1', '0', '0', '', '1471600621');
INSERT INTO `tyms_users` VALUES ('1850', 'buling buling', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eOmJMic98ytiaqUtCPLVIIicaLAP8A4O8S1HHoeX4wR9ppvPJpdiaBqR86CLicHv1mibKibEqMnFRBebCfP/0', 'oyP7DwPlpcSyU4hbn7HAQatvScig', '', '0', '', '1', '1', '0', '0', '', '1471602712');
INSERT INTO `tyms_users` VALUES ('1851', '得心应手', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p361SYaoc95KicnhfVhSibOwj2ViaVIwnkuQk9yBQZWrYeVUp8WBia0oicxbFYibiaeaQDNAKG0ag4jxdx7XlIdicJBK8vZ/0', 'oyP7DwCSVn5SITfjFzNaA696zKB4', '', '0', '', '1', '1', '0', '0', '', '1471608932');
INSERT INTO `tyms_users` VALUES ('1852', '吴锦锋 Jeff.Ng', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90CmFLM6iaujfMWibWF6VGgw0uYCphTfZE7kHrsibUwyltGFPS9fPwl01Y0jWWl0bHVZcxQtM6yPEtxia/0', 'oyP7DwEyGzcY6UyLxJ6orgUk5MVo', '', '0', '', '1', '1', '0', '0', '', '1471610621');
INSERT INTO `tyms_users` VALUES ('1853', '超人', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3sZGk20e6SE7RxWlA4DxjlxKkVQHDwvDqUJbAM26MTlqsNVCNtaJSkXdkPtsd8HOjUh7iaNVbibpq/0', 'oyP7DwIE-g-K9iT2HVnZgFCHn0PU', '', '0', '', '1', '1', '0', '0', '', '1471615739');
INSERT INTO `tyms_users` VALUES ('1854', '傅祥', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qra3Yg3rDzp3v1874UQJkcXmn2FQicibCmkuI78EqO4kjWVwqicWooxAjoXNebgP59Sicdew2Ipic8F7xMI/0', 'oyP7DwCYgzsOGQ8bjGNdNCzOyqFA', '', '0', '', '1', '1', '0', '0', '', '1471622276');
INSERT INTO `tyms_users` VALUES ('1855', '家有仙琪 ', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eGN8Gjnc8bmCnv9VXQiaDsgrhuBlvc3VkCZtAPsxc58CfJF9YM5qdPk69Sygf6qBTxC5G8cmGiag6s/0', 'oyP7DwBxV1qWEsbn1UizoY9a0Naw', '', '0', '', '1', '1', '0', '0', '', '1471622585');
INSERT INTO `tyms_users` VALUES ('1856', '有情*饮水饱', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIE3Fu19YSejNd7ibF89TSkbM3gKISIgXSNjAUD2vSmnzN03hIdtFC6fO5LpSIRMIc02ztNqwMSo9A/0', 'oyP7DwLQTicXCH7dLcDYNWHpLQyA', '', '0', '', '1', '1', '0', '0', '', '1471625612');
INSERT INTO `tyms_users` VALUES ('1857', '_Mraz', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlPicSqPp4WFcamgW3dPc03TtV1N1dHtITUIz3UUjt0K8DFRpWa24ryrYg6me1zMFBibzvGfeSnFoGF/0', 'oyP7DwEY2_4MvlmlKpNRY87J5JIs', '', '0', '', '1', '1', '0', '0', '', '1471639876');
INSERT INTO `tyms_users` VALUES ('1858', 'Luke', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5DekJMNYosrbG6OZkZPB5rKiaALm7engW1QRXAiamRqhmkvVXa89ic5ataZrIyicz33fTcn1apufHLbAJ4NxtmF19G/0', 'oyP7DwDfiTrtKUnfmIBwYLP0VoCc', '', '0', '', '1', '1', '0', '0', '', '1471646779');
INSERT INTO `tyms_users` VALUES ('1859', '转角遇到抓车的', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4rXNBaror9o4iccQpeqYNm6cBaM6ROFC8pyqe9WTJVXaEf6MwjobamqIEfSB0POTkbGMeibvrgjvlw/0', 'oyP7DwFZKh14TEZrFSRwG3JNgSuA', '', '0', '', '1', '1', '0', '0', '', '1471653955');
INSERT INTO `tyms_users` VALUES ('1860', 'A联谊-新微商', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKvXRIj2HZVltzrKic1cbbMJ3Enh16kmTh6UibLYl77qbTgibWJJGY2RMsmRD09ODwFD8dkD3rEXe1J/0', 'oyP7DwKRdZxrh9x7IfMbKJQ7t8zc', '', '0', '', '1', '1', '0', '0', '', '1471654614');
INSERT INTO `tyms_users` VALUES ('1861', '徐志恒', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicxzvpgQo625MWKCQcgk7icpMxXy0f7Vy6Ttex4jHz6KicD9Dicaesrrcm332oiblH6QdrEH4L6YlNdS/0', 'oyP7DwN_-NbBxCSh7u-s_I9WhtE4', '', '0', '', '1', '1', '0', '0', '', '1471657288');
INSERT INTO `tyms_users` VALUES ('1862', 'QQ用户', null, '376A7A1A11F438FC83097B6E1B7E5CC1', '', '0', '', '1', '1', '0', '0', '', '1471657682');
INSERT INTO `tyms_users` VALUES ('1863', '小蝌蚪找妈妈', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2gIUEslRW2IraPPvgiaxfAaGAJDyAwD2qADLribxQd3sVOCKBk9y2D7IX4DSp1OCPzOI9bUTuju3ic9c70fJXoiaa9/0', 'oyP7DwC85k_R89ejSNo4dcPnILBk', '', '0', '', '1', '1', '0', '0', '', '1471659197');
INSERT INTO `tyms_users` VALUES ('1864', '雨蝶-刘', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2dGPOm3ia39jf79u9qzQibWDUZibl15V5Lst6JiaPLK3BLfialTSNJ7lc9TjlELLUtSZ2LRciczmRDU0RYzCbZRkhYQh/0', 'oyP7DwKrFc1amJuOAlae4o0FtWfU', '', '0', '', '1', '1', '0', '0', '', '1471661685');
INSERT INTO `tyms_users` VALUES ('1865', '咚咚咚咚咚咚', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90CnGGx82VVBM7FAoSIWA1mj51eYaDriaO2SfrJqY9OmJyYSe8vicsHx033DGQiczaz6ibU5nx0p6KO1j/0', 'oyP7DwGt62eGthYuWvxAJ4xnW-hE', '', '0', '', '1', '1', '0', '0', '', '1471663656');
INSERT INTO `tyms_users` VALUES ('1866', 'a0小熊', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEF62yFBzBxiaHVUwNOvibhoJiaHvxaTLWI0ASibIzByIBydgMR0avtP8aicwvfWHsYUYMwZ9Uwnj4vETX/0', 'oyP7DwMUhJeN81d8j7mrakSO0uSs', '', '0', '', '1', '1', '0', '0', '', '1471671072');
INSERT INTO `tyms_users` VALUES ('1867', '李强', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZGRIxx0rQQsCLwZ8FSibJM9ialXDIk4We2L0WtPdlcc7OXMu1OWtiaIgeGlkauywicjbE4T6o6bfjZy/0', 'oyP7DwLe2s4PHy-BfJrwUKNuDYFU', '', '0', '', '1', '1', '0', '0', '', '1471676510');
INSERT INTO `tyms_users` VALUES ('1868', 'jiangf', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4tt29eI8I0rNQY9eKicP69P5LibPVmG9JFicaiaKg0dJTQ8qEFjlmiafp3zHYvGyLECM4JGolnFnDh30I/0', 'oyP7DwI9i-bVhjcIsQjon_nwSBlY', '', '0', '', '1', '1', '0', '0', '', '1471706735');
INSERT INTO `tyms_users` VALUES ('1869', 'MSI', '', 'oyP7DwE4i8X8Y6k0JJDMGeqaUuLA', '', '0', '', '1', '1', '0', '0', '', '1471741738');
INSERT INTO `tyms_users` VALUES ('1870', '王嘉', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4kicSmCY3ia2ibu4QCjezqqg1KrwfT92GDIiasqzJKbuJtOalrSh9Haf1CfHz4r2TBtSWdZy4p5vE5MSlDyia1icLsMX/0', 'oyP7DwGipVZF6qemnKU3EEydtCl0', '', '0', '', '1', '1', '0', '0', '', '1471742793');
INSERT INTO `tyms_users` VALUES ('1871', '真诚', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdhSTzZ4ibepcXyOicmFYTibyhba1rWeD61qW6U28n1l0FapSlhLaE8ueRiawBmcymg9oGdSJicNRQestM/0', 'oyP7DwIfJslJ8bNz9Ktvx1IsiuPI', '', '0', '', '1', '1', '0', '0', '', '1471742899');
INSERT INTO `tyms_users` VALUES ('1872', '一叶', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraf4BNLLgmeGUuiaXgNEpSX1apld3OfdzF5I9dKaHldCwFA44Kpiaia12bMXWmNInhHPKxrbEMZ9hSts/0', 'oyP7DwJi4FrxXvT-gCGhQBCp_wxc', '', '0', '', '1', '1', '0', '0', '', '1471742932');
INSERT INTO `tyms_users` VALUES ('1873', '张航艳', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0JNwtMBuHMgaRESj1fvTOUWVhOt1Gb7zz9ibQ9VicuxZnp3zBO0Pl9oUYhgZbxcpyloWxbPsMsFY2YqxjDgictIEu/0', 'oyP7DwDJuzHG0Qv7lDawebP1C4yw', '', '0', '', '1', '1', '0', '0', '', '1471743799');
INSERT INTO `tyms_users` VALUES ('1874', '任晓博', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p24hhvdesj7J7WszAaLOCAibhK14NILQ7AmFnwCSjOw04QwjwQzZkezBkicY034eOyyefEI5dSFOFcxHXYCW2bVz5/0', 'oyP7DwCn9lku6MihFbIzzIGU6pP0', '', '0', '', '1', '1', '0', '0', '', '1471753953');
INSERT INTO `tyms_users` VALUES ('1875', 'QQ用户', null, 'A3EB562AB07FAB9789A664AFBCB04FC3', '', '0', '', '1', '1', '0', '0', '', '1471755542');
INSERT INTO `tyms_users` VALUES ('1876', '莫淇', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7Aa87IdSvE3Ev8Wwe6vgEYbicPmn8wCBfwCrZlOZX6JQOdbEmIbCwSMVFibGIDPpjspIehaUx5oJ5IicqcS9uSNX7/0', 'oyP7DwLR_uGu4tcmfKDQKqRwc0Ls', '', '0', '', '1', '1', '0', '0', '', '1471755942');
INSERT INTO `tyms_users` VALUES ('1877', '张力', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY58hnr3QSgGvG9nX7zcqKQiaqPjbGeHH7vcia0jI6nJQ3ygg4PKzSf3VkGwAcF2Gcjo5iblhjAebRyia1/0', 'oyP7DwGwsCMOr9P6L12F7lYZ0VHg', '', '0', '', '1', '1', '0', '0', '', '1471759505');
INSERT INTO `tyms_users` VALUES ('1878', '王辉', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6VElZGUoLfBCwPt7ahkDQqycibMbylcVKWmVSzSgDSN97WXETRR4GJ2SSwXeKJNiaibYDALicRITkJt/0', 'oyP7DwF7QR44o7ZrB4XdOtwqCEq4', '', '0', '', '1', '1', '0', '0', '', '1471770770');
INSERT INTO `tyms_users` VALUES ('1879', '我是毛毛', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlMmrsFWdNW6gDKzxYxko77ruT38z9FwNvqngzrcfSrywzQC773176YFmcDkPLFLhvibRRYkwqbRTW/0', 'oyP7DwErSoO6mX5Dje8LTuP8V_rE', '', '0', '', '1', '1', '0', '0', '', '1471770960');
INSERT INTO `tyms_users` VALUES ('1880', '阳孚', '', 'oyP7DwLeQdsCVvW9FQtw71e_kU_8', '', '0', '', '1', '1', '0', '0', '', '1471783460');
INSERT INTO `tyms_users` VALUES ('1881', '邵杰', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJj3XHF5d9acWlcxmlQoiaXJeWSKVGn9Hbv19tdPFWSUJFXrbcsMOh6AZ71DT15KbMdAKZJePSecDw/0', 'oyP7DwGlDcpmo0kVmQAqU5NNtkRE', '', '0', '', '1', '1', '0', '0', '', '1471824610');
INSERT INTO `tyms_users` VALUES ('1882', 'Yingyu.Hu', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4mictHFiaBCUITT6EU2741ye4UFxicjtsNJZ1do1jqU64yOfKDTBW6xLGBTyO8Tu2HlomNHbVAKzbTd/0', 'oyP7DwMp28MwIWbgWHs8mpiSgryc', '', '0', '', '1', '1', '0', '0', '', '1471830438');
INSERT INTO `tyms_users` VALUES ('1883', '刘', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibc7xLllhDY6HL4Ooic1rdjGAfpSwBic6N3VB0xhMiajIN1ZmPgDAb3aY7FKpfSWWTOr5z6fUsnmroKVQ/0', 'oyP7DwKM1tx8gWYrtnxShtx7-_oQ', '', '0', '', '1', '1', '0', '0', '', '1471831679');
INSERT INTO `tyms_users` VALUES ('1884', 'Jian', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4jnQ5eLAVHCpB2tmJMfGgicyVBATFSBoa1zjoEVBtMiah5DwzTXaQBWz8ymkYbmtB0yYFvTLibgEgYic/0', 'oyP7DwEK5y_zPGRmnjW_niKzxQ2k', '', '0', '', '1', '1', '0', '0', '', '1471834125');
INSERT INTO `tyms_users` VALUES ('1885', '劍飛', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDRNgobm8YojR4KpVCSh6lfKLmOQN27GMTT1slEh5LiaHZHkRZhycon3KxynTaBLrh4WHCPtunw3Mg/0', 'oyP7DwNDPnVLseC0-5exW7GAlKRc', '', '0', '', '1', '1', '0', '0', '', '1471834245');
INSERT INTO `tyms_users` VALUES ('1886', 'Null', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayrm6V0pZPbDkmbUrPTRbqiaYzgE3qmyGCLftFtGeyeDcB67sfcMfL15W2EIe26MBONg94kMZIoSW/0', 'oyP7DwPmbVxFy1rtAVi2uf5FfrlQ', '', '0', '', '1', '1', '0', '0', '', '1471834503');
INSERT INTO `tyms_users` VALUES ('1887', '猴赛雷', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBPVRp9RZAammup6mr9mCHnX8N3PxcZxwqECYS7yb3TYu6cTrdbQLIBpQW3bl8ib9ACAaOic3DJFqRQ/0', 'oyP7DwIjdwSYus5k1Kw1L2zoKtx4', '', '0', '', '1', '1', '0', '0', '', '1471835994');
INSERT INTO `tyms_users` VALUES ('1888', '雷天鸣', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4hJAMo0nicWNQqRmBh8D8bLgspNU1L7F8CC7Wu0DmPLiaHmFk4oBLaicHxD0nfJzfxoYS35kqyxU6gE/0', 'oyP7DwPauvqBTSWfro2ZYMlNCMd8', '', '0', '', '1', '1', '0', '0', '', '1471837437');
INSERT INTO `tyms_users` VALUES ('1889', 'king', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMy4hiaaOp1XX6YzEUAeliaGOalamf0ZwPqCib6SVYKzgunYbN20PouQ76Dr8SeITuI3hicqWYYCLzHU/0', 'oyP7DwNhO_iGqyFojcIFKHbEV3wk', '', '0', '', '1', '1', '0', '0', '', '1471837593');
INSERT INTO `tyms_users` VALUES ('1890', '嘉华', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOTibluar8Ne3ic2CRAQwpYHiaYiak7BnwAiaKicKsVKklplfbpaJKnZUshFaaUUa023Z6uqpNEmS31beY/0', 'oyP7DwFfzknn9UfWDPCp8DeA_mXI', '', '0', '', '1', '1', '0', '0', '', '1471838081');
INSERT INTO `tyms_users` VALUES ('1891', 'APTX4869', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDAA81MkR2KRRgUCDx0zJ0F2K3GQOg9QhI9NibNqqlAQ037wB9qocDl1722mweb3vT48iaw8Sr7ZfYg/0', 'oyP7DwJhrmz37ieisVa3yCmt0JnE', '', '0', '', '1', '1', '0', '0', '', '1471840278');
INSERT INTO `tyms_users` VALUES ('1892', 'Aa    冬 瓜', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1Za0U0R1XDDBGRmgXDicIsbY8JjSvSjCiaAhO2RMgRmm3e8Kv3u5tlHIg1VZibuibayA3b9dtnib3rfyTIGqDK8j8eq/0', 'oyP7DwF0xPISozHYQs3T-lvLNk_A', '', '0', '', '1', '1', '0', '0', '', '1471842813');
INSERT INTO `tyms_users` VALUES ('1893', '收藏家', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia5P0NIYZ4fcFZT686DB9aUoXTyx9cSe79akjHMhnpKCurxxgxEoC70QESwEWyoPVexUaXyDjljyj/0', 'oyP7DwFRWotdSqFJNiTdwobdrMZ8', '', '0', '', '1', '1', '0', '0', '', '1471844450');
INSERT INTO `tyms_users` VALUES ('1894', 'Fan.', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibelf0wBDmGXKvWEzTHnQUzwicicicCg9sqiarRGQCjFAHQOVMuveEkcZbOqkIwOiayia1hiajFHoovvSuxRQ/0', 'oyP7DwDfg9rZ0CEUJi_4ZbRfXk4I', '', '0', '', '1', '1', '0', '0', '', '1471844986');
INSERT INTO `tyms_users` VALUES ('1895', '你想做什么', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0dVURM2ZGyf9RHJ8DIsic8zm9vaV3X14KMyHn5ZBibf8WfA8lGlNSrdNb7Ft16gvdL9ahI58ELmbQR/0', 'oyP7DwB_gOD8xkF2nf3HgkmfJB6Y', '', '0', '', '1', '1', '0', '0', '', '1471845483');
INSERT INTO `tyms_users` VALUES ('1896', '花逝留香', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBt5ictziaVrUviat7m9Oiare1oRNZciaiaeJUGauphamOpTwE0icpjep061X9RRhgclVlXpcM4hBWoYlZ8A/0', 'oyP7DwA2ZLK3RlsyA4rfl_14btws', '', '0', '', '1', '1', '0', '0', '', '1471845594');
INSERT INTO `tyms_users` VALUES ('1897', '夜空下的狼', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELVeHxTAHru7k0iccL3ib47TDibyNGHsFBMys8sBkrxibHP7mpcUmdWUtjpkpicERicHht6tmibaGrk4Oibicw/0', 'oyP7DwAqRTAVcBqW_VRtKf0IoGEI', '', '0', '', '1', '1', '0', '0', '', '1471848739');
INSERT INTO `tyms_users` VALUES ('1898', '阔云云', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFOrEwMOvqiblZJd3TtKvOjgKoFaguG1SuBKCum1aia12yeTr7fbB7ribhNOgXV2ewgO9S37Qviamad6/0', 'oyP7DwKNOy_itSWxrWudRCARRSQM', '', '0', '', '1', '1', '0', '0', '', '1471855766');
INSERT INTO `tyms_users` VALUES ('1899', 'Viva la Vida', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0RhTMRnOR9bdBl0EgFJAZlWyfAiaCO3FDMZzbqn7d7RApwr2gg2sApq9QkHAlMDuu84wUWKKrRribq/0', 'oyP7DwDmm8Mthz3zWe7WkF5W0AF8', '', '0', '', '1', '1', '0', '0', '', '1471858208');
INSERT INTO `tyms_users` VALUES ('1900', '优尔达通讯商城', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEGcU2OALgjkGzeO0S3OTmMDibicwsOWIYJMoR6dnXHqhs2NKiaKKmOZ33ibnksL6zGqJzvibfdvN68lrf/0', 'oyP7DwODUK1dbdk3nCkqeDM3aq68', '', '0', '', '1', '1', '0', '0', '', '1471858407');
INSERT INTO `tyms_users` VALUES ('1901', '花哥', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazDjf4VtGg7dSzUnv9jvvKcFdiaTbjx8kNrONYrQnuFpibvn3MnTOlEKuXWFzIQUof66ZncnWRUSAB/0', 'oyP7DwFQqej_YGXDvwq6yenxlEwo', '', '0', '', '1', '1', '0', '0', '', '1471861051');
INSERT INTO `tyms_users` VALUES ('1902', '小甲鱼', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Y9jkFVKhhicnUP3j9iaVKBhfY3yzT8q1FSyUBaBibEuKWo49Xh5PbGeDTg9J2vN3BccOEgGSnHiaNn9/0', 'oyP7DwGV8VjkgouD8hbBelVpUZdM', '', '0', '', '1', '1', '0', '0', '', '1471861466');
INSERT INTO `tyms_users` VALUES ('1903', '大大钢', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibe8zkNLXFCUuykK8x3spO7ic9rkw900TMziclXcPT0QiaNG1qa60k4jgd5f39Gkv2sAYM1gX7ODicazTw/0', 'oyP7DwA1CKDtxT02nvAbq0edmLfo', '', '0', '', '1', '1', '0', '0', '', '1471863002');
INSERT INTO `tyms_users` VALUES ('1904', '春泥•柒柒', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0RQiac8MbZricErUeQF51wJW7dRiblggmwU0pnOy4SBug21s1SMka3iboqiaSeicBSKUuuicRKZDiaJmfnXib/0', 'oyP7DwGFckup9z6GZyJe6S316lsg', '', '0', '', '1', '1', '0', '0', '', '1471864563');
INSERT INTO `tyms_users` VALUES ('1905', 'Colin', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCgVmibicYRQ3Kz6CJMdpKcDsqpicbZDPEkA9iay4YzOfOVicR0Py3QOxJKNzaiaUnTmAh5H3rp9TL4EvEA/0', 'oyP7DwCHw4sBRxirY5Kskr3CoUUc', '', '0', '', '1', '1', '0', '0', '', '1471864720');
INSERT INTO `tyms_users` VALUES ('1906', '蓝', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0j3gzGK0N94lqA29M48763cGvPSuhONicMFdR0iaachgHyewQzYvoPictt3l0fRDMz5GGAjcUyAmvDGLdHgtKslRP/0', 'oyP7DwEZcnJlsNENzyZ8Bjx5B1aM', '', '0', '', '1', '1', '0', '0', '', '1471866774');
INSERT INTO `tyms_users` VALUES ('1907', '向俊', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4iawHskTC5zY2Yb55iaIkQo95iaicrzvLA6eLXUmpT8v3RTdzpbvdFstzRexVgzibSsTZjaVcNTSnPtUW/0', 'oyP7DwCDZp-xVBQtvJJpyfNdnioA', '', '0', '', '1', '1', '0', '0', '', '1471872079');
INSERT INTO `tyms_users` VALUES ('1908', '刘小龙', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraIgRJMqH3S5xJ4DjKmUXNhXclsZZwhaNoCicuWxoCCJOXb0lCnbYupyLO8nXmrUb97whaUqRricOEo/0', 'oyP7DwHM7TfmFNpFtgQbPiBEOVWY', '', '0', '', '1', '1', '0', '0', '', '1471880057');
INSERT INTO `tyms_users` VALUES ('1909', '小伪辰c', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1KrtDeVHCQ5z6zAXXE9vBULVDUuIQKWoBkNQzLjnMaC3ODLo2oSAVP6JCwcbQ9LYiack85sm46f2/0', 'oyP7DwPkCQQuIbUlUnE5YF_vHTK8', '', '0', '', '1', '1', '0', '0', '', '1471880210');
INSERT INTO `tyms_users` VALUES ('1910', '晓明', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5zoqA7YJpFNuLZSUESRQQ4r7UE7EZa1BAF5aWpbLoTWmIjDl52IcJGsNZ6Evic515Oe7zralZr8tD/0', 'oyP7DwJNvq2SSSzynz0uINxCEra4', '', '0', '', '1', '1', '0', '0', '', '1471913863');
INSERT INTO `tyms_users` VALUES ('1911', 'Boris Lee木头樟', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6VPvcNHDibk9WACFfibwVicXeqOhIf5OBRspXs65YVkQk0WBR8fDibWUOVvTtu2ZB7kMPLlg8zgCdqmA/0', 'oyP7DwF1zH0eLXuhWm2P_CDtr0fo', '', '0', '', '1', '1', '0', '0', '', '1471915653');
INSERT INTO `tyms_users` VALUES ('1912', '刘程', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5mJ1Ey5IdIiaSqMgq1gwaRiaK5hia1XJ1IFkNcCyfspUTwTscibFJyiaM6n9ga7q97IeHXAbgkct2KcPg/0', 'oyP7DwMV87Dx6Tp37wpNvBPuuArY', '', '0', '', '1', '1', '0', '0', '', '1471916017');
INSERT INTO `tyms_users` VALUES ('1913', '驱', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W33KL2OjiaD30VCvNACQkxuckXU3OrylTFYqC27Dib3jp09yuu7GSbg9RkXibOpict72gPKMFic1n48DMc/0', 'oyP7DwISj_M5WsOtqrboK5mxkV9s', '', '0', '', '1', '1', '0', '0', '', '1471916706');
INSERT INTO `tyms_users` VALUES ('1914', '青云', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCTFzJfxwsJO0UKZTZh8jC49RhZ4Tgyl8pfdML5IzpjFI8zHxtjERAbj3XhTZ9hdeaz17Rpq8U4vQ/0', 'oyP7DwO4ziH1sV3nN6JBMHEVUSZA', '', '0', '', '1', '1', '0', '0', '', '1471916838');
INSERT INTO `tyms_users` VALUES ('1915', '杨亮', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0epW6RViciasic4Rl1rgzv1RxBrBIVZ7eIBVfxbBXDL1gNf82HibFnzOfl8ZxIogcYMBZer7ia41LIteZ/0', 'oyP7DwEXdg7rM24A612ldSve5Un0', '', '0', '', '1', '1', '0', '0', '', '1471917383');
INSERT INTO `tyms_users` VALUES ('1916', '胡荣', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZjUFsNUiciau3IghB4tjX2BgcSIGZbWeWcQDaicJIIibjeqC76drupQqnJg5058vssptTkwIv0pnMks/0', 'oyP7DwI9TfjQoId_jnjqWaZ16VCA', '', '0', '', '1', '1', '0', '0', '', '1471918782');
INSERT INTO `tyms_users` VALUES ('1917', '文哲叔叔', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJxPg2QLicWibA6uN1Xu61gnz7bw0YMTRqkmkJINBM5v1zqNyJJlwsmIQGrvGtFs9mmWbl6dia4VG79w/0', 'oyP7DwNhFLRlIOOBHEvLdT0Tmp6Q', '', '0', '', '1', '1', '0', '0', '', '1471919261');
INSERT INTO `tyms_users` VALUES ('1918', '乐', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlLLbaiaLb5r5R8saqOQBwricMSDpJeictDQtCOYouuH2zchsoGeMB4fAF1uwxdbA4cChsgRITzR7yvV/0', 'oyP7DwK5SQ4Fxvh4ARHQrbdb6JL8', '', '0', '', '1', '1', '0', '0', '', '1471919590');
INSERT INTO `tyms_users` VALUES ('1919', 'QQ用户', null, '79BF35F4C5EA6BF6EDAEA292F1B51B5D', '', '0', '', '1', '1', '0', '0', '', '1471919693');
INSERT INTO `tyms_users` VALUES ('1920', '木头人', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEBTmuJJWhtwkeGQU4cBc2au1gnnPR0fWptfLRGM3M9uNibIo7f4z7Vz1rObMzf7OI59H1lgL1fPjG/0', 'oyP7DwOd8R5UzkWG33UB29LR0tGY', '', '0', '', '1', '1', '0', '0', '', '1471919716');
INSERT INTO `tyms_users` VALUES ('1921', 'Dudanfeng', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL530cztib738SNNe8QIwbBu0q9rDmAOwa8RDOv5XJXISbKzsov2DJibcjUmppIxrpRtpxetBRO9OCug4q2chttqCJ/0', 'oyP7DwBBnZoRLSqpdT1iacxxU1Po', '', '0', '', '1', '1', '0', '0', '', '1471919866');
INSERT INTO `tyms_users` VALUES ('1922', '鱼鱼', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5maA65QCOSXN7up0RibtSRQAZ7TaE25aRbqib3OZeKNYGiaGdicE9pkyOzPIGbNHJZpTSWP66ZMBtnicf4LTDIz0J3abcZUWsYuJMs/0', 'oyP7DwL47pAgUHXJsr1Kav5VOuPg', '', '0', '', '1', '1', '0', '0', '', '1471920459');
INSERT INTO `tyms_users` VALUES ('1923', '任之', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0MjAQTZXIE13puQBgexBrNfiarT5hiaEkiaYvWtqqUDpsTYOT0GpDSbB2WXqFImQLcnjyXsMHTRdctiaHJflnCFCfc/0', 'oyP7DwKGHWINgAe9VB6qRbOGLDfg', '', '0', '', '1', '1', '0', '0', '', '1471920635');
INSERT INTO `tyms_users` VALUES ('1924', 'L', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3kJWnXnf4libwqAdibTAEAXhNIiauzpdDWO8N9aQLXh1sb8YwdlzouqibtgSJBwjQBhkCh6IUmCCCZz/0', 'oyP7DwCrbT6ipYajvI7gN5JoCd8Y', '', '0', '', '1', '1', '0', '0', '', '1471920977');
INSERT INTO `tyms_users` VALUES ('1925', '孟德超', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0czRPWaw6hzPZOqibx2TAiaQCY6wYRkuTRaBY8YjjJqfOSqImSwDN5W6kpSDoNhdibXic6VOlS4pStPN/0', 'oyP7DwH0uCeYqi_4S8t35hftt5No', '', '0', '', '1', '1', '0', '0', '', '1471921731');
INSERT INTO `tyms_users` VALUES ('1926', '致远', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pkkMU3U0VPAz1r0nnnqEnOpCX6ic5vo7UKupd5TlMmiaJ9WIAnP7QnfqX7JKYlyjJseMP1tkrpFtibWrscloBObYdnc/0', 'oyP7DwGWkKaxYw6yfA68Rae9bj8E', '', '0', '', '1', '1', '0', '0', '', '1471921829');
INSERT INTO `tyms_users` VALUES ('1927', '李想', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7hXIeSbmQA7OPfbLjxfL5kfDMRD6YCreSiaFS5vmwicNK1ia0whX99iaFDT6ZSrMOn6rskV2rC150krQ/0', 'oyP7DwB7pQ3bw5txQnOqjF4CHIVs', '', '0', '', '1', '1', '0', '0', '', '1471923364');
INSERT INTO `tyms_users` VALUES ('1928', '晒太阳的季节', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5fpGibrVEPJJ3X2au1YrtPNE6mQrolllpanlWWpXf3oazuY41FeibdBlmgwNpOTezlIwdtvZ62sNY9ibaY5ox8qzL/0', 'oyP7DwNfJWDyGCne6iRScnR88HFk', '', '0', '', '1', '1', '0', '0', '', '1471923604');
INSERT INTO `tyms_users` VALUES ('1929', '王鹏', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4vvxGGFHXrsciarBmnSpH45oDPPXlnP60RAtXcbWSbYjIYn4lLBeia84vCnzAO04sbP98JhSA0MnsP/0', 'oyP7DwKpstof0dkjLgl8FSyXqJ_o', '', '0', '', '1', '1', '0', '0', '', '1471924793');
INSERT INTO `tyms_users` VALUES ('1930', '奇讯科技唐鹏前', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0SZrCBpEShvY1icIcpicSTZ6R5ukaSBYflEY7VKxrE6gUsouSAibnbC4jiaZibjemUf1ILSmAjK2WYDAzZ8r95nkibd3/0', 'oyP7DwLTOxifPCTfpYTFEObUcUMs', '', '0', '', '1', '1', '0', '0', '', '1471930133');
INSERT INTO `tyms_users` VALUES ('1931', '黄聚', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4sk29Cw3BdgpQibYz09ldqepqJbibOib1reeSxaX3vLE7a7d9crta6cZPS1ic1HAvdvN0D5NXsmYdmia/0', 'oyP7DwET4dEuqXJmF7cxdS3QYr20', '', '0', '', '1', '1', '0', '0', '', '1471930648');
INSERT INTO `tyms_users` VALUES ('1932', '云吉服务', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK4QhFPyhKKOFCSZCoZHv7ewG05LXanctUCDia445yYgwLla4hjztm0bt56nUKnOUpZFdBia5B4icpJFoicC1WTAQqGfoDYEKzpuuk/0', 'oyP7DwOti_ruBYKeCn7NOFXoo87U', '', '0', '', '1', '1', '0', '0', '', '1471934118');
INSERT INTO `tyms_users` VALUES ('1933', '韩彬', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90KonlFIuYiblIduBuJ9nKEvSpB624KP5DCPS2VEBicfI2tleV2XMLwWozk9uCyBu7O1LnkAD5IFKyW/0', 'oyP7DwOeBJDGAcOiap1WDsPNy59A', '', '0', '', '1', '1', '0', '0', '', '1471936633');
INSERT INTO `tyms_users` VALUES ('1934', 'Zuu', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3kS8JQGib6ib9rMPRJq8Kiam6ABianFqIevaZg3FdGWltnbDpodCnQvLdgmB6nOoQVKO9ic6ZQvgl2lAA/0', 'oyP7DwOhw6cjJ7t29h2X1R3GLXyk', '', '0', '', '1', '1', '0', '0', '', '1471937015');
INSERT INTO `tyms_users` VALUES ('1935', 'zhaofei', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6HSBnGUNqHMf4eXGv1rdkqL9WMe1W4BsJY5moWIfvFkc2jpxI3ZibqdhlkvibaO4ialecudwcjHeTExVH6iaRPChl5/0', 'oyP7DwBgpNe4PLrNxcdTjurEAG-0', '', '0', '', '1', '1', '0', '0', '', '1471937123');
INSERT INTO `tyms_users` VALUES ('1936', '奔跑', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY52x2xC8LafAhSrbqjnibCuumxO4uZEcIhW1HWAFwbKFqzKb9vjtibvJuGa4HXJqHJrWrXHalTV01lV/0', 'oyP7DwBqEYyiadBhWEmx6RCoshC8', '', '0', '', '1', '1', '0', '0', '', '1471938192');
INSERT INTO `tyms_users` VALUES ('1937', '丿Monkey灬', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELKn2eXfvkoh5naVFibO3IWXD8DWVAQpJ9z0pydictQfrCp6Ln83t8hic7aU1fIX3qYlibZ98j9luNkicA/0', 'oyP7DwCtbqiS5KGTnBrxPF1bE7h4', '', '0', '', '1', '1', '0', '0', '', '1471938773');
INSERT INTO `tyms_users` VALUES ('1938', 'QQ用户', null, 'BB41904AB8D749B370C552613B4C088C', '', '0', '', '1', '1', '0', '0', '', '1471939004');
INSERT INTO `tyms_users` VALUES ('1939', '火爆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4ETiaa8ILlnMBps9XeLb3zTRAlQciaiaL8GJN25icmWZDtTtnoJUqTPQYEeHtBmVbpJLbybENH80kNtw/0', 'oyP7DwA8e0ySFiBH5qQ8V4PgzYcw', '', '0', '', '1', '1', '0', '0', '', '1471940752');
INSERT INTO `tyms_users` VALUES ('1940', '周春江', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELxxDgWh6cVjiaXoia4K2NzIhW36Kxs2MDQibq3acyIpRdDjRAgfV4IVic5z4N8qUr3WaUEMcGQXGCDIg/0', 'oyP7DwI0CPg0B3pF7buxaGIFdIs0', '', '0', '', '1', '1', '0', '0', '', '1471941095');
INSERT INTO `tyms_users` VALUES ('1941', '王玉－职业规划师', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6xHgV4Vbib2HkrRnGKD1YRjfnaCiavke3zTNLCtMyBq6IN0IUbplyJf6m7VYJ6WaHjicxEEfN1NCRxJcGUnuLEIwG/0', 'oyP7DwKIpVUDm6SlWZ8kBup7hIKw', '', '0', '', '1', '1', '0', '0', '', '1471941249');
INSERT INTO `tyms_users` VALUES ('1942', 'QQ用户', null, '6028759B35BAEAE88A9FB61D38123AF2', '', '0', '', '1', '1', '0', '0', '', '1471941270');
INSERT INTO `tyms_users` VALUES ('1943', 'Jeff', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBYRh9TRvcLegADj6r9vAUuvlJjX3jANNP83rGWDFpfjb6NzkInbT27ee4Vt8aaxZHGYeOia0VyjsA/0', 'oyP7DwE5OZjq2GGk-AavP47zbHSE', '', '0', '', '1', '1', '0', '0', '', '1471942753');
INSERT INTO `tyms_users` VALUES ('1944', '袁黄清', '', 'oyP7DwDlxcD2DrT_MvE7VZHpZ7Is', '', '0', '', '1', '1', '0', '0', '', '1471943054');
INSERT INTO `tyms_users` VALUES ('1945', '', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlEutbdYXG8TESWfBZmWnoFCTddHGgiaTuXB6aLHAr0lmj2rLVhhPGOaIdQ2wSGxtKzGMq16k7icmrv/0', 'oyP7DwN9zgHo36VSAYE8PWpQ5_Sw', '', '0', '', '1', '1', '0', '0', '', '1471943365');
INSERT INTO `tyms_users` VALUES ('1946', '任保雄', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayEj0OzVu3eJoyxrrlgH2VDibcJUEQwVzdrrz2ww5zUGgPYoaVWgPP6fCJYUpKtBrW8lAnQ1LgYkq/0', 'oyP7DwAbWSanunBJVVNaXoArSoT0', '', '0', '', '1', '1', '0', '0', '', '1471945173');
INSERT INTO `tyms_users` VALUES ('1947', '维斯塔', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlFrWAqcf5BUK9ochPQQxrXzdKh1QtwYKRPFCEID68IRQyUlKuiaa8XU0WcCJib6F1zbvwqLOiaJZ8Vk/0', 'oyP7DwO2s6rjNBK_OcwBvX4gr8C8', '', '0', '', '1', '1', '0', '0', '', '1471946192');
INSERT INTO `tyms_users` VALUES ('1948', 'ABC', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAP1vUH5XGz7LR2f0HtaRVEshjqsHv04d2iaiatXNzO0EIJhIeAAqvgCGK6gNO3UWarYQqC3plXmLKg/0', 'oyP7DwMulSyHLfyWyeYbgjSBbEEI', '', '0', '', '1', '1', '0', '0', '', '1471950424');
INSERT INTO `tyms_users` VALUES ('1949', '陈浩nan', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCM42jd6aaFPMMXpib1XTY92bSb6FvY1exx10cMKMrcwWx6bP3VAGQJyU35ibmMaKicmLDlNbHxhtofw/0', 'oyP7DwJUa3zMw5QhBq4Xioartrls', '', '0', '', '1', '1', '0', '0', '', '1471966148');
INSERT INTO `tyms_users` VALUES ('1950', '雷一 • 凡朴香生活', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2n22OMtbOIJg7G533oFqCTkgkWjc06jGNTRqh495eCIKwPFu6sialjfVlmbkrULvGMgKocOlXuPvKFLJLSuPCfY/0', 'oyP7DwK5vhQQxWsNMziXoDcBY2ZU', '', '0', '', '1', '1', '0', '0', '', '1472003052');
INSERT INTO `tyms_users` VALUES ('1951', '贾善德', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0VLCgpqwoU11Hd5hosHzWmPeG4w9qSSQTxNTwft9VxLVf2E0XzViaYfmBpPSPaCK2TySb7uU4WT0OHQsaVu6A1l/0', 'oyP7DwLfCQgociNQKXNqC9k2HB3U', '', '0', '', '1', '1', '0', '0', '', '1472004556');
INSERT INTO `tyms_users` VALUES ('1952', 'LinWH', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAqbZmK4FeGNJGRpMZMZgSuMInNzT7icDTxmwoCUqBVPiaFbyRhsAZTY5ZYdkiaTeRZHIsVkMbMIUDI/0', 'oyP7DwK0HqU3MpEHyVaaG0pPlhi0', '', '0', '', '1', '1', '0', '0', '', '1472006402');
INSERT INTO `tyms_users` VALUES ('1953', '王传昊', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJyjJAHicX2AqiawPI3xia2Datg7ayxiaEtDnVMGs99ZxzsDk8TSDjUzxMVZqHKa61cBA3aSOa1CQlU8g/0', 'oyP7DwIEib4nwys-F2wsOLcOcVxE', '', '0', '', '1', '1', '0', '0', '', '1472007401');
INSERT INTO `tyms_users` VALUES ('1954', 'A.付襄宜', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdx9QEoIGHicGgIIvGR1u8YAiaMXMcWibks3hcia28TQIzfd65ictG6aXuPvPEE7UywPjF6UmVDsleVV2U/0', 'oyP7DwJ5hR3VOzjEvrnUnGILEe5U', '', '0', '', '1', '1', '0', '0', '', '1472007576');
INSERT INTO `tyms_users` VALUES ('1955', 'davidtall', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3E4aeYmD9W4op07qOh0MF0iaJyTBPTjDXeTVeviczONp9dbxUR56HMltB06xCnVAT0YKjNSbDOick13mgwc7706jm/0', 'oyP7DwKongEsV6sLrP0Vp-qISpho', '', '0', '', '1', '1', '0', '0', '', '1472008177');
INSERT INTO `tyms_users` VALUES ('1956', '_', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibf2Jxwq7BtDYCaFwAk3I03F4FeMg7aia1A6b3gr23DjWbfNdUlcrOEuCAFn342jNBvBNib4fiag8ECjA/0', 'oyP7DwBSrASwLjRQC5YF8mfK1o1o', '', '0', '', '1', '1', '0', '0', '', '1472008684');
INSERT INTO `tyms_users` VALUES ('1957', '刘云', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0P5WIB5TyMicDeh4kg0u2xA9CERPTQN9RgX9OUXicibGEFJGuyud18f9gfoOZt7skTfUxuFNagSwvb5BKmrzPeQjW/0', 'oyP7DwPaBbFrCPCbmZM4970OV2d8', '', '0', '', '1', '1', '0', '0', '', '1472008871');
INSERT INTO `tyms_users` VALUES ('1958', '种下星星的日子', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3bsgtFN0JxvaB9LeicaJC5xQTVA3iaxicoTuCXOicBU78WRwcZL1uvsTaQib3MP50ogJZsRGIRYkaDWb/0', 'oyP7DwGQtX2q-p0y9kaYfNvmFaho', '', '0', '', '1', '1', '0', '0', '', '1472009237');
INSERT INTO `tyms_users` VALUES ('1959', 'QQ用户', null, 'F85185DD66411D0FF276705CBC7847D5', '', '0', '', '1', '1', '0', '0', '', '1472009396');
INSERT INTO `tyms_users` VALUES ('1960', '恋旧尘，花已随风去', 'http://wx.qlogo.cn/mmopen/8hSs3H5r6sYIuRUOdGWJYVTpica1PMT7m80rysjIV8lHdgYclsAW821l4ZjWH8d2M3C6WZff2PttDmOPkWibfMO4ys9Ed1hwrw/0', 'oyP7DwJ_EBPxu0Iaxw04ZnsDyUYA', '', '0', '', '1', '1', '0', '0', '', '1472010160');
INSERT INTO `tyms_users` VALUES ('1961', '猪在笑', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDlfTRtTeNtcjoiaOUEqmeYD6tPac0opqdyiaZmB6A08zFPNaPoqCcCHaL5VmoeyGafqkdMcZJwOGEg/0', 'oyP7DwFt7IGKXdLSLeJklJ0PGqpw', '', '0', '', '1', '1', '0', '0', '', '1472013033');
INSERT INTO `tyms_users` VALUES ('1962', 'BetterYou', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Odw8w7q07ibiaNZAxkOITlVyicxAj3E0upvT5bl1stq1SLkmG7eU5lspzeuXa2aKgicReVDZ4ruIOq5/0', 'oyP7DwLNoOtVc4u9tgHvGoy-eDYc', '', '0', '', '1', '1', '0', '0', '', '1472019253');
INSERT INTO `tyms_users` VALUES ('1963', 'Allen', 'http://wx.qlogo.cn/mmopen/RiahY6eEcIGt0lvicLA2RIticicGLMfaXkZdDyUg6Ux1KzpkZ0Oic7gicQZVXibicf5MHtGffZ9Wbriag7xa0YLIefDX3egxphvxRCYKj/0', 'oyP7DwP_ePi_RM2YqliSudKp4Mno', '', '0', '', '1', '1', '0', '0', '', '1472019577');
INSERT INTO `tyms_users` VALUES ('1964', '大宇哥', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iay1IbCYiaTSzNibhGPc7icpzRI0ZzaKWPuKsIEXe9icG8pBTvLGjanb96aFe8l2EoEOZMiaQqc5GMWaFY/0', 'oyP7DwGUj-DDBv_DThKq9hAhujmw', '', '0', '', '1', '1', '0', '0', '', '1472019835');
INSERT INTO `tyms_users` VALUES ('1965', '张亚斌', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5lujSU8R9wUtPLjA1KsjaXFKuUqdtFnuPTBicDaWrq7tbt9b1MHphMViase0wwtJu2BIiaHibhdQUNkA/0', 'oyP7DwKqCkuNhwYWAUGQ4Vt-Jaig', '', '0', '', '1', '1', '0', '0', '', '1472021434');
INSERT INTO `tyms_users` VALUES ('1966', '徐枫', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibul8OYpsbadP7XwRluxxK7PHjiaXpwse1wicB6fwo08sanIfcGhIMmq2dhoOfOyGBu985IonUK1eJ/0', 'oyP7DwAF7CoMQ7tfRkwn_8Rc102U', '', '0', '', '1', '1', '0', '0', '', '1472021450');
INSERT INTO `tyms_users` VALUES ('1967', 'jack', 'http://wx.qlogo.cn/mmopen/3eiaArVnjG2HnEzibiafo0mZ1rSD8F2ocDYVOib4lPZ52C8koGQcQJ85clL3Cic5XTZUkGhD6RsyYwcTkpYrE3H4n9p8eb7jlHLuP/0', 'oyP7DwNnBWtxK_K0J8Y80ZQt5IMU', '', '0', '', '1', '1', '0', '0', '', '1472022284');
INSERT INTO `tyms_users` VALUES ('1968', '陈健安', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UO3pDImJPzQ7OkI11bViarqZmo7E9pauweqMWF69nibFEKlkEnajC3EHAf4WYv6aSKPhkSXa2QZibh9/0', 'oyP7DwLsA9nSIYjX6j5GvLwC8J-Q', '', '0', '', '1', '1', '0', '0', '', '1472025905');
INSERT INTO `tyms_users` VALUES ('1969', '无忌', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB3vjxdUicpicRqNug2DiaAWibjrWbNG2cbsBpOv8iauXzq4kLKxQME1TUuTESUZTRKiaiaibZo6TkM6BkTCA/0', 'oyP7DwM0dl54ZcrDN1nJqq1XxM00', '', '0', '', '1', '1', '0', '0', '', '1472027557');
INSERT INTO `tyms_users` VALUES ('1970', '仲尼', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1yjeUhngAnSGLXJYm4lXkaXdzcLNunQvBeVoW0Fp0SsKUeiacXcsibOOAllFNYrOSXoKDfzs7BV0ib9QaX95bqribU/0', 'oyP7DwAutZIIerpQhrOI2l7oMX8Y', '', '0', '', '1', '1', '0', '0', '', '1472029318');
INSERT INTO `tyms_users` VALUES ('1971', '卖女孩', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3w2SBu4oN7L7rHKPtruwY3mS1Wic20UNXGkEltibQb2mwtQriaWgHsJibxV8ATTdEtP8SWqKAcSO4AOg0NTNqvEPSZ/0', 'oyP7DwCnxCHqgw15OAHaDK5BCNOQ', '', '0', '', '1', '1', '0', '0', '', '1472029610');
INSERT INTO `tyms_users` VALUES ('1972', 'li_jian', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP02ttQNjem28sgb47CI3StSNmwKqeD3avSjNDQ44xoe7bjBfLNlTdjsmeC34PwaiaJ3ZCjAM552n8L3YUb7tn1dd/0', 'oyP7DwCOsE1Op0kEtrmZa_ksncpg', '', '0', '', '1', '1', '0', '0', '', '1472029640');
INSERT INTO `tyms_users` VALUES ('1973', '灯火阑珊', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90KobPX7dU2KMyMiakgibbC9CxzZ0c8uXibSmpVliaoMkXcfH74P60J5oib6Os8donjwDEn0JtTbZOPESX/0', 'oyP7DwNZuHiJxenanFKXm9KyfJPg', '', '0', '', '1', '1', '0', '0', '', '1472029652');
INSERT INTO `tyms_users` VALUES ('1974', '15823128299', null, null, '', '0', '15823128299', '1', '1', '0', '0', '', '1472032212');
INSERT INTO `tyms_users` VALUES ('1975', 'Julia', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZkJZanCQXT4nf5omngRMpYdPmebLxbXokTD4vl7p2qVxicaBOc2IwCpVKewibGxTC93eOnURj3qoI/0', 'oyP7DwP_mJBRu8hIikBHN-4laOOY', '', '0', '', '1', '1', '0', '0', '', '1472046598');
INSERT INTO `tyms_users` VALUES ('1976', '伪犬', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAyaTKYicOk7cduYHjOGl5bJRn6NdJzHK4DKWVTbnEs0Ou3UzcFIiaqrvN1vNo2yVNWgpoXv874qUQ/0', 'oyP7DwDjpn-dEjcfI1X1J24OhZCE', '', '0', '', '1', '1', '0', '0', '', '1472048353');
INSERT INTO `tyms_users` VALUES ('1977', '孟波', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZEFXwXmnACKBlv7vV7kscPlQ3eAibCEVvg1jERicdpJRG3zT0zTTZMVR104j4c0XWucwricRLKj2N8/0', 'oyP7DwD3iBmLZSwYWdzRcq5ocVsI', '', '0', '', '1', '1', '0', '0', '', '1472054162');
INSERT INTO `tyms_users` VALUES ('1978', '胡宾', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfBtHibXM2OqJTLsw5DIFXaZIxSKia5ice4x5y90FWvebgr9iaCw0icPmHUibTibrbKics78vkGKiby32zibmzA/0', 'oyP7DwH8dJfR1soYhMsAHNubg6NM', '', '0', '', '1', '1', '0', '0', '', '1472084959');
INSERT INTO `tyms_users` VALUES ('1979', 'QQ用户', null, '9D6D7DD564F18E6D1B7AE9EC7A1A177B', '', '0', '', '1', '1', '0', '0', '', '1472085797');
INSERT INTO `tyms_users` VALUES ('1980', 'Dev', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dENV7eQtqwCSdc2CRAygmMfczDicY6xM1evGCXSiaOAc8YqnAic7VsgnaO0biby9BIn6rqs0G8S5f3Kg2/0', 'oyP7DwMgsO4XjduQyI5LkpkBDIaw', '', '0', '', '1', '1', '0', '0', '', '1472089004');
INSERT INTO `tyms_users` VALUES ('1981', '翟翟', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3XW6blqQVude6J8bCJkPsTRIRIEH2X0TibXHWHXDDAAjjREADbZrYZQiaapP0JFP0ibFWibHHFjKnJkz9Gg7slJPvc/0', 'oyP7DwI_uySXMR8WxBU3ILo8xkeE', '', '0', '', '1', '1', '0', '0', '', '1472092447');
INSERT INTO `tyms_users` VALUES ('1982', '小天', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlP3uPFEV6Swz6eOvjQwgKG3uKukYHMiapQfrjrObp2AOqGfoAeUFS1AQibCaiavJ84ia2IicB2gice3Tc5/0', 'oyP7DwCatBSdTpV6oEG1VzbZ6n-M', '', '0', '', '1', '1', '0', '0', '', '1472093767');
INSERT INTO `tyms_users` VALUES ('1983', '15222988389', null, null, '', '0', '15222988389', '1', '1', '0', '0', '', '1472094094');
INSERT INTO `tyms_users` VALUES ('1984', 'Feel.', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7CyHXp3uCvxibxic8MY1k7rEGUWEU2VjnXeoSiaFJwxS8TzibyAyr3WfmXd7UyF5fIpkKjPQ0cF8VwHGNpd3OXZqEY/0', 'oyP7DwEZVNiIwQyZkA4_Lm-ML5Lc', '', '0', '', '1', '1', '0', '0', '', '1472094681');
INSERT INTO `tyms_users` VALUES ('1985', 'zero杰', 'http://wx.qlogo.cn/mmopen/LibNrIz6OEOojQ1Me7WewgeS3HBiaZu4BictgjFlhlzOsMvCbWvJIGc9vZJvDcjDyNpszmu3SROSH620iaUDI1RLsCmDpbXs4x2u/0', 'oyP7DwFQ3C9w0l9ZFiD67n9Yh3hQ', '', '0', '', '1', '1', '0', '0', '', '1472095754');
INSERT INTO `tyms_users` VALUES ('1986', 'Wu', 'http://wx.qlogo.cn/mmopen/8k2ic7h02SFIJhlxdQL0mhZbwdXTfLHqWxbFCmERHhD4RDpNDSZW9d2tO46pUwJg9yjicz05JJZOqlcP81YInJwDYwzbEldDts/0', 'oyP7DwOXhekWwrU4OVo9oSjhatGc', '', '0', '', '1', '1', '0', '0', '', '1472096681');
INSERT INTO `tyms_users` VALUES ('1987', 'Action', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDd0zfD0RMf3LmMyGmbicAIZzPx9EGensaLI2M4O7LlSWDXeevwNZUbiccr6NJnA3moONbGLxtW4LDkg/0', 'oyP7DwJTZW581J7-QQBk-g0fqZ0Y', '', '0', '', '1', '1', '0', '0', '', '1472097525');
INSERT INTO `tyms_users` VALUES ('1988', '彭志青', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6HSBnGUNqHMWAzkbBians4NvzoAfQDXgyKlcsfKJCoIF43U6KXW1spjXcsq19ubEWN5bhJres45WXhoHKAVG019/0', 'oyP7DwHl828Rt-gq5X8tcL4D3ayY', '', '0', '', '1', '1', '0', '0', '', '1472100364');
INSERT INTO `tyms_users` VALUES ('1989', '刘威', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCo8AYhtWDdPZqlzS3sZxNJDk2tEljGWwvib9yWhbOiaPMam4vrRlvRPh1X0tF8b39LtKCSS404LsXw/0', 'oyP7DwAHZfZFmQ0S87CnKtvOVAK4', '', '0', '', '1', '1', '0', '0', '', '1472105245');
INSERT INTO `tyms_users` VALUES ('1990', 'jeff', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBMxjkQH3dMT0SZKdK1rdj0rxvsfia2YtgE5duqPcH2NbaNhUlPjqJTQnGN3XQqytficQtDtLYk8Pzg/0', 'oyP7DwKlCpw-rVao7u0d5n_qV6OM', '', '0', '', '1', '1', '0', '0', '', '1472106520');
INSERT INTO `tyms_users` VALUES ('1991', 'Michelle', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4gV73wMAvSFq9PKAiaBTRySjk3FAIQAdmNxicrdYnwOEWnXbLU76ToJKsF4yf1dWl9UYE0wcbM6oVH/0', 'oyP7DwPsS1-AuZOu5keIVIF2V7Cg', '', '0', '', '1', '1', '0', '0', '', '1472106730');
INSERT INTO `tyms_users` VALUES ('1992', '伧子', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4jB4D3dcIkEDGc1Sgad3Mq8dq6lwcTjBfOUVbiaXE8Wd4pgWBsXBuOC0CeICsnvQB5n8OsEXgV1lc/0', 'oyP7DwCu76-EBQy9xtOkHWdjXuS4', '', '0', '', '1', '1', '0', '0', '', '1472107521');
INSERT INTO `tyms_users` VALUES ('1993', '中国丶王镜淇', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdSbrpJ0nQ0LoZHwxhHvUQXBnFurJvghw66vQibQhwpgfeA0HlOH2olZbYWhpUcXRpCg5FoXpvPr0YIicdgg7MTy5/0', 'oyP7DwFkIZDKDsGbr1my57h4PRbA', '', '0', '', '1', '1', '0', '0', '', '1472107667');
INSERT INTO `tyms_users` VALUES ('1994', 'yyz', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7jLwibHEZvoY1SdeOJClAJ6RD8EHoepKgKzswY4eLPaV5GnrdwpYOc3kDCB66mh98rwP3RhR04mog/0', 'oyP7DwONkHhrdnwku4RWUMAubSZE', '', '0', '', '1', '1', '0', '0', '', '1472108434');
INSERT INTO `tyms_users` VALUES ('1995', '我是RUN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELic6hCSquqp4MLwjLE4yC3R1KGh43KdUfnicLn4q73zbstUrpsYG6BaDPf7zxCTHhshPrianwIYf1zg/0', 'oyP7DwCunRdDORsBlQyq_M_TAtmc', '', '0', '', '1', '1', '0', '0', '', '1472111328');
INSERT INTO `tyms_users` VALUES ('1996', '梦想之帆', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9Rn9OWopeiagjHoib6DZicxAH38iakPloZPLOwHI6ticd54nabKljLnroc9jFZD63n5DibVgiamnU0KY9z/0', 'oyP7DwMsDzSLAiJQw-c5Ps0mWR2U', '', '0', '', '1', '1', '0', '0', '', '1472113958');
INSERT INTO `tyms_users` VALUES ('1997', '@我木有名字', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELh8XZPewnTj30vmpeicUFBiatMUrKwfXxicl7g1MibCJMYkOIXtial3JzcupkdRvR2icIocz16xicsRNZ1/0', 'oyP7DwCWyrK2dVR0S9IhvenEtZvA', '', '0', '', '1', '1', '0', '0', '', '1472114700');
INSERT INTO `tyms_users` VALUES ('1998', 'zjieho', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UBjdjaxg4OrLafSjuOINkVAUtaR05icicpyhLUwlBkX8xmBCNJEmBs7kUomMjDmwdHN6zbd66iaLKkC/0', 'oyP7DwKuDD7MUfPUxIi6SwtaNkOU', '', '0', '', '1', '1', '0', '0', '', '1472115219');
INSERT INTO `tyms_users` VALUES ('1999', '李国新', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdpdTLUHMcs54FHnt6L22TNLZD0PkCufZhAgezcBqljgCRhwF7X6ibfVZxfrnXVSeKMebJ6MnheuJg/0', 'oyP7DwL67iLMwAFPECNyzVCEZK80', '', '0', '', '1', '1', '0', '0', '', '1472115591');
INSERT INTO `tyms_users` VALUES ('2000', '吴凤榜', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcNajhQ1AhSqqjbSib9z7QeF7OLsjicKCNibHgNfJLVEr3S1qm2K0Dzpc9I2mwDpUsvB9TeovhAq1MKMKyShMycibicS/0', 'oyP7DwJO__6kqjJ59eC8HYdUqTys', '', '0', '', '1', '1', '0', '0', '', '1472116336');
INSERT INTO `tyms_users` VALUES ('2001', '水晶瓶', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4byXFgaNmnSYudzXRxCOIm5ERJiawUfyN96U92zgAZBmRvcyF8nMcDMGmQXDla13t3BF79xeXfVv0SAU4qGvNqj/0', 'oyP7DwEzxzXft17-7cjyljVCuLxA', '', '0', '', '1', '1', '0', '0', '', '1472116533');
INSERT INTO `tyms_users` VALUES ('2002', '啊贵', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eCiadgPWqVBMscupC4tCbK2v9Dp1Z1LKPDsN7txbZfx5RRHibyhqYCgIE6bsbrVIvGaOXo94qjl5Om/0', 'oyP7DwLm5syQQDMQdkA4WpC5QJJo', '', '0', '', '1', '1', '0', '0', '', '1472116612');
INSERT INTO `tyms_users` VALUES ('2003', '℡﹏绫薍oΟ', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlCeNIpr7ob7zCXU986ogXUFT2c0ernke9gPdkLShuKLf54ic13a9c954kZHNBJjecYu6vVDfaJmyg/0', 'oyP7DwCG4r0l9SdgiBm3dVv7J69w', '', '0', '', '1', '1', '0', '0', '', '1472116856');
INSERT INTO `tyms_users` VALUES ('2004', '何夕军', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cIwteltQejFibDicZ4MyQvMbLGMcaVDBjkuia2FhIg9MmlZG63Jseib8TujaQA05iahRC8w99eIq6CTj/0', 'oyP7DwHEeUy-XKUEU8IYHlAWkQGs', '', '0', '', '1', '1', '0', '0', '', '1472117263');
INSERT INTO `tyms_users` VALUES ('2005', '启凡网络', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIouuwXDqa2mz7M8ZL6ZkzE7ltibkQIoPhLOjLibEu5RvC4hicibI6DJuw2niaM0tt0nf9Ch9kWkkfKv6/0', 'oyP7DwIVmRsVClNlcwScYsy49JD4', '', '0', '', '1', '1', '0', '0', '', '1472118432');
INSERT INTO `tyms_users` VALUES ('2006', 'Sam Hu', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfibYRaSja6oMqrB92ROwicbTgX7QrQ82d1M48hqsibePtMAOrsGl1BajpwrOdia9Yr5MMC3cDQ6VZ89A/0', 'oyP7DwHRVqf13e-Oy7ecA3pyAWW0', '', '0', '', '1', '1', '0', '0', '', '1472118986');
INSERT INTO `tyms_users` VALUES ('2007', '华源（奥图）广告印务', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6NzibPqJs0M95xeOtsQBibibGic35dNicUdGEEhKiagrzoR0ch3ricyBq00LUWeIeDQkKAs9miavSic4fHPWg/0', 'oyP7DwA1sDBEyAxAQt-FTJNOG2Mg', '', '0', '', '1', '1', '0', '0', '', '1472119001');
INSERT INTO `tyms_users` VALUES ('2008', '福缘', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLARE4sQ9astqnq0YIggYIYakXo64zOxrcsJhPrmNrN7BG1xhnaEzwNhIeQSJgKq7hppYT1FEMZzMw/0', 'oyP7DwODymiEjz6e5y6qWtiiif2g', '', '0', '', '1', '1', '0', '0', '', '1472119102');
INSERT INTO `tyms_users` VALUES ('2009', 'Tim.Tsang', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8ULPF66ctkuEvvD3DKqyJChLANsSsLs6wuc22OVYj8ibBLQoSMDyktiagSmiaiaEiaBsCib5WgIyhTUNW7y/0', 'oyP7DwHVWWfok6MDl3z5tbu2HJbs', '', '0', '', '1', '1', '0', '0', '', '1472120442');
INSERT INTO `tyms_users` VALUES ('2010', '水晶骑缘', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0cfUJeSfxgy0oyiaKGA3YwoZMfUTFZbVjVubV64oWgBmMTWjWRjtlQ3X4icTiaHzzHD8fxKqhMvmzC91EwcqezWcK/0', 'oyP7DwBhK2cBATkflfR_IkvOw2sA', '', '0', '', '1', '1', '0', '0', '', '1472123659');
INSERT INTO `tyms_users` VALUES ('2011', '刘大义 。', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFUqaf1qcHsy3PZ5k2xZMUOFH5PRg26lzFOGleicBgFaSExr3hbo5Kjy7h7psUwHiaFjoOiaRibX5C1I/0', 'oyP7DwJH4OdTI3GVStftFrR5fL_k', '', '0', '', '1', '1', '0', '0', '', '1472123717');
INSERT INTO `tyms_users` VALUES ('2012', '李红峰', 'http://wx.qlogo.cn/mmopen/zlF6AxdcK8BJ9e61Eoj5EFNDIsYxSsjaNhfAAGJNhVbcVLKBhMibfCHocLm0eVtdlSopLNyu2QiaEMtXBOInicGrUpacpdplbWv/0', 'oyP7DwOjWU1C8q5m38aYGhrYxpNU', '', '0', '', '1', '1', '0', '0', '', '1472124238');
INSERT INTO `tyms_users` VALUES ('2013', '王健', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJU2HeA0UCBhHqCV2k8QG2F8nxICvHxG5t5P2zdy3UiaxAPqSFGaMW4icOib0gnoia1Fa7ewvwgSeF9Y/0', 'oyP7DwEHFbkX8tyjH7VsWzkipb1o', '', '0', '', '1', '1', '0', '0', '', '1472124684');
INSERT INTO `tyms_users` VALUES ('2014', 'daz', 'http://wx.qlogo.cn/mmopen/LSQ0gl6NMgaCB8qbiaGuh60ibUU0XClbpNPQygOdMTsDLjB8mcxfg9jWicOqsPIgVib2v9PyD67qibstMrvUicOG7qEblczeMU6sv5/0', 'oyP7DwCw4ZBhj2Rkihzk4Wht3Vno', '', '0', '', '1', '1', '0', '0', '', '1472125482');
INSERT INTO `tyms_users` VALUES ('2015', 'Kenny_JY坤', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90LVN33Liall854UdSSBMuWAhkhiaTmYDia3tu4ibeEH7EYibAJHEuKicYj2jleZ4fNLRicFBhKX0zPrJfSx/0', 'oyP7DwEJHYR9MjT1RtOHiKghKpPw', '', '0', '', '1', '1', '0', '0', '', '1472129149');
INSERT INTO `tyms_users` VALUES ('2016', '孙广会', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDicu3LfGmsTB4PLxT9C1mNhO7C2qQYSc3Ykic5R8dPuPVUM17uEMmia0NnSXO8H5OHI2k2Neor46Wib/0', 'oyP7DwHZz_IWPwkBiaZaBwt8h1Lw', '', '0', '', '1', '1', '0', '0', '', '1472130060');
INSERT INTO `tyms_users` VALUES ('2017', '蔡川', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAA9aH7QZGxoEibD4IZ3VbMiaVgYo5ZPXRYMBIuUAlOYq8peyPqpA43VMJqYwq4V9hsvXs9Hl5Gtd6A/0', 'oyP7DwAE2tsh_1XVsgnrW0AkExEs', '', '0', '', '1', '1', '0', '0', '', '1472131512');
INSERT INTO `tyms_users` VALUES ('2018', '比特鹏', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WkicsPlIUicxZibYNuHpVAeQ3tkhDAPqjSeTZwXqo8RETicUNFaHF4HAdnYNyMtGceBGxibfxaCx7sibJ/0', 'oyP7DwKtd6-4qSg-3_LbIHi4oXIk', '', '0', '', '1', '1', '0', '0', '', '1472134336');
INSERT INTO `tyms_users` VALUES ('2019', 'Wang xiang hua', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKOPTHBgaMqBicwicbnfCDoLSC9e8WgicaatYqHCrVW0HvFu1RCiaeL7kMKiaFrtD5iaIllDibwwH91wQ8hw/0', 'oyP7DwNIXW72e8AK6k7mBjjtlaYc', '', '0', '', '1', '1', '0', '0', '', '1472134437');
INSERT INTO `tyms_users` VALUES ('2020', '花开最完美', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3HiaJ4xFCribyHbeWtnlezAicMV5sBgO4J6LczSemV0dia6A8R4j31kmQErdWJHom4B3aVFxEhpnVkGU/0', 'oyP7DwPNz8IwRdR6yR8kWpvb_rWo', '', '0', '', '1', '1', '0', '0', '', '1472135362');
INSERT INTO `tyms_users` VALUES ('2021', '高执华', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0dGcQbXuSicwKQxwkLoyyvQWxOu6rH7WYh4ibJdLFfAibrXBRiaogKKtxF47MCZE2PvGF9welmdLP96X/0', 'oyP7DwKC5rIPpgMm2u7Pba8hyV0g', '', '0', '', '1', '1', '0', '0', '', '1472140107');
INSERT INTO `tyms_users` VALUES ('2022', '黄涛', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEM8S28FebZicloCDWAj6nVccmDoEg89ibSMRgibEvicFiawKQeMwuwicbqEicbEvq22pq1hMl5yDGW4JP6G/0', 'oyP7DwKeby6Zn_eO5QOh1nlXEimk', '', '0', '', '1', '1', '0', '0', '', '1472142476');
INSERT INTO `tyms_users` VALUES ('2023', '谁让你戴帽子的！', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7jJNTruAiaNRPRKQfmReandU1sUA38WWx5eZwd3msHOFNK0jARqn8lhn2W3uNAaL6dKn7bUibhylLA/0', 'oyP7DwNXW_aDtn8hT64G-ERpTvsI', '', '0', '', '1', '1', '0', '0', '', '1472170866');
INSERT INTO `tyms_users` VALUES ('2024', '金刚时代', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFKvDAztGMkwqqT90v7mjUxCAzqtnS5qQYI9bH7HyhicTeCJIkrUYpVaEWEnrXCXFeRB8QcVsaXXJ/0', 'oyP7DwBnjToNqJLET3iCi-wUAtdA', '', '0', '', '1', '1', '0', '0', '', '1472173796');
INSERT INTO `tyms_users` VALUES ('2025', '观天象', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4gQ5BDYarzLMVibiaibvbm594emRia5krKnMpEFL7c0uwksqRe4JnT1K9aWzGPsBg46PdAF950eF4rg9/0', 'oyP7DwMLthb2aTi6JCix4veucEuY', '', '0', '', '1', '1', '0', '0', '', '1472174464');
INSERT INTO `tyms_users` VALUES ('2026', '天王', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0pkXMhodO3sOPZQFQKeFOcmMTfXSqgwz5EASEAMYl5QNQRBUUXoYiask8R8EJl8FohjqJcuINNhkpzULf2EpbhH/0', 'oyP7DwCjXo6tUthMy1TfsRWMjhw4', '', '0', '', '1', '1', '0', '0', '', '1472174483');
INSERT INTO `tyms_users` VALUES ('2027', '海哥', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4hMs8J4V7Jr1hdqCSVpDPClkMeGE3tOJKJx74oFNiaZEoFNZVHH0HmaukquAm5blpF0bD4ibpPanmI/0', 'oyP7DwAq3e21knsmyndq-PnigYgM', '', '0', '', '1', '1', '0', '0', '', '1472177253');
INSERT INTO `tyms_users` VALUES ('2028', '留客', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraM1AiayDKzBX94MVWvchzZgy5ziaTCPwGk0fryrdicpJIPHal2SUWHCdcKaicgicjS35kCAoRzJ7j44CU/0', 'oyP7DwIiWxE3n0mx_iNXchJymB5I', '', '0', '', '1', '1', '0', '0', '', '1472177746');
INSERT INTO `tyms_users` VALUES ('2029', 'Mr.胡', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0SLORdHib5CWWS77znnTFG9AceQCswVVPDxDKUfmUJrvvAyVVbuibJiapgYBIjTseFyCiaxXrqK6CHEk/0', 'oyP7DwJluqPoXMIT9msk4qdbfz0s', '', '0', '', '1', '1', '0', '0', '', '1472178065');
INSERT INTO `tyms_users` VALUES ('2030', '黄传森15975485394', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2rQ7ttbB1xibd2rsPNoCNBB4WwlMUVVxMKFXYs4xWgT9NgEBDPneeebv3ckFXPIUhxlHWGBSUAUnFcdMVBbB1ra/0', 'oyP7DwCZP3dwl4_NV2XUVIZnObyc', '', '0', '', '1', '1', '0', '0', '', '1472179048');
INSERT INTO `tyms_users` VALUES ('2031', '高一明', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5icVUaOWJluO1KBIOQo9A9rEqqEYmN72ynb8xsRgvIEYpaN21nDnNfyeSf29fD6Kl3tlsU8dNT1Lw/0', 'oyP7DwAvCdIyvwvNZm6IzjDI4XW8', '', '0', '', '1', '1', '0', '0', '', '1472179054');
INSERT INTO `tyms_users` VALUES ('2032', 'alfred', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0TAADrDHgxLKGAjm5nVTSibichu7Ty4Xibd9tMlajAch2aqSF65bENG0FIGd0VJOcol74humBGRegL5/0', 'oyP7DwPgQ-Da930FHS96clHcXn9U', '', '0', '', '1', '1', '0', '0', '', '1472180328');
INSERT INTO `tyms_users` VALUES ('2033', '春风得意', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2okWfTXBcCzg18D142MEQFIM6cVe3QOtgrdV2o1Gh3dfr7ia9xRUmoUWhaXrhgBuCzMFXtGLTdIJMowMyRWV8HT/0', 'oyP7DwNEI-B6bgLYbmIIoGqcmmeI', '', '0', '', '1', '1', '0', '0', '', '1472180661');
INSERT INTO `tyms_users` VALUES ('2034', 'QQ用户', null, 'EB5FD9ED7078690A313D9113CCBA8E95', '', '0', '', '1', '1', '0', '0', '', '1472180753');
INSERT INTO `tyms_users` VALUES ('2035', '火箭', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2x1dckMmicZQ3iauEY6zDwHbMcPQIMMceRahVk3gnSlxxkSrSyIcoJCt9h3WhRRbfvaA2ysOshloib/0', 'oyP7DwCrfV9T8ccwH2786ClQwbNc', '', '0', '', '1', '1', '0', '0', '', '1472181505');
INSERT INTO `tyms_users` VALUES ('2036', '遥远的她', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdgq0BFBiaicgjQIHhZuwworUEic4rQhcp5aOpfqcgMCmokrJSCYk5nZYElkdicmAXJ7VmztjopWriaapBYaezSian0DjYlCVlIApiagM/0', 'oyP7DwDi7soact-vFq_0lGOdwO9Y', '', '0', '', '1', '1', '0', '0', '', '1472182302');
INSERT INTO `tyms_users` VALUES ('2037', '穿越人海', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ym1sBKE84QHPIUiaLm0lf6HeiappMUIFYhecZe1jicHmeiaiap0sCtjyUjToL09KREFxClH8icSfl9PnQfVIFr2eofG/0', 'oyP7DwHNm_NFt53L_syT-klTGgV4', '', '0', '', '1', '1', '0', '0', '', '1472183150');
INSERT INTO `tyms_users` VALUES ('2038', '随遇而安', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6F05F3vFUz3vKjicO1nvh1HyLOjSQDQoF3UJzx0yZfhJjmQ3aDriav5UoIHfSBg7NnPnYmibaiadkAibhicxQhJhAMbq/0', 'oyP7DwOGalGGaKLtm7peeWNQ3SRo', '', '0', '', '1', '1', '0', '0', '', '1472183971');
INSERT INTO `tyms_users` VALUES ('2039', 'lucky cube', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0bqp9ntYAn2okNghgX7BYrwrMbPRooY2Xia2FiaG3yfJ0R1FQ0j6vph3iaaCbHPw3y2gkywWnvnnCsL/0', 'oyP7DwOnTUDGJpfYzuxA1mghWWkI', '', '0', '', '1', '1', '0', '0', '', '1472186394');
INSERT INTO `tyms_users` VALUES ('2040', 'w辉煌', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1gZI82t8oonz8zic9iafHias4icibrCUsNCdwDPVp1X8cbLI1Me20INxIEQJcdcz5W6OMPE7LxQJUJiak/0', 'oyP7DwNPMiHub_Sqf0m2Vi5x2DS0', '', '0', '', '1', '1', '0', '0', '', '1472186614');
INSERT INTO `tyms_users` VALUES ('2041', '旺旺', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJPKXNzIVkJgoh2fLBp1fpI6wqpnpFicajI3K67xHefAW1wj2WiaOfCYticibBYvgOhRIiam6uJZQXMBIw/0', 'oyP7DwLU6NQRITUeghAU54iXxS5E', '', '0', '', '1', '1', '0', '0', '', '1472189967');
INSERT INTO `tyms_users` VALUES ('2042', '龙瑞军', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAAOT7CDLkhF6MxvF48doZjDBsTuxLpIkkA2ozU7tFSy1OjZ3Ml8ic3VlP24bHsL8Ap9TyRDicVDb1Q/0', 'oyP7DwN4LdAcPUZATLxKNCIFm1I8', '', '0', '', '1', '1', '0', '0', '', '1472189997');
INSERT INTO `tyms_users` VALUES ('2043', '张辉', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELHiaHInBb6Z9ORoCh9vW5M2Z5s6IgycIVBibiaMBEnCMTvk5Kht63E3icmphgZRh738wEZCtKTMJjBibQ/0', 'oyP7DwKo-PrfDg2LlhVocBBEqmI4', '', '0', '', '1', '1', '0', '0', '', '1472191768');
INSERT INTO `tyms_users` VALUES ('2044', '༊྄ཻᏴ࿆Ꮻ࿆Ꭶ࿆Ꮥ࿆ ㎕马会飞', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaxKI8x5yvxSa5tEtptUDOEn8Omu7icP8GXz2jKGR4Gdboboxmbs0zo26d14wSibrp5fCiahBrCqvxm2/0', 'oyP7DwCH3ikIl36f3aKs8byz99Zg', '', '0', '', '1', '1', '0', '0', '', '1472193236');
INSERT INTO `tyms_users` VALUES ('2045', '果果木', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UHB7FzFwibmqN9RlxpSSKIwY1Lat2f4RdIgugskyl9tCpHO2beB6pwsjEOtJiaavThTJdVmXFFibEDX/0', 'oyP7DwHLRSUxsN6GSXbyOWlFEi-o', '', '0', '', '1', '1', '0', '0', '', '1472194279');
INSERT INTO `tyms_users` VALUES ('2046', 'A.Jun', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAyzlG1dV9jnVXf8uk85d3ibjKdX2KHGh7n174bq3PkIvb3GO8BIzZA9RTiciaibpsTHfblgMb2a5kJzQ/0', 'oyP7DwA7N8gBoDHD1h-h-yW2NkMA', '', '0', '', '1', '1', '0', '0', '', '1472194603');
INSERT INTO `tyms_users` VALUES ('2047', 'Jevons-niu', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UFYtTBtxNnCcjejOrYfe99olrMvK8aNe4L7TYjonpBfMYevTc2z0WDq1Fp3T0n2lRttkibma0OZmz/0', 'oyP7DwJDehV4E6351Ca_rdEOjr3M', '', '0', '', '1', '1', '0', '0', '', '1472194937');
INSERT INTO `tyms_users` VALUES ('2048', '桐桐', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1qauu1Nj8Ss3kVLP0oWetyDqFEK6skIOx8JzTicUHgQPMibNVaMYav1icEBVKswt2uFeLxQ65QBsSVtaCSP7N1fZK/0', 'oyP7DwJj5_1I4jzqnpTIfxTIZp_k', '', '0', '', '1', '1', '0', '0', '', '1472196560');
INSERT INTO `tyms_users` VALUES ('2049', '更改名字', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4KZKlYUlb6t1iaEiceicZ5xlUTQvk7eB0YVTP8WQXaP5GmdcCpdQ1EIqWSBTibm2se6H7zBfTAn10pIA/0', 'oyP7DwNmyh76o09eHvESdLg6BYXQ', '', '0', '', '1', '1', '0', '0', '', '1472197703');
INSERT INTO `tyms_users` VALUES ('2050', '鄢川', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeEbuPgBIzD0EEmTonJry4Ur3IQ2SYXbSraAb7icQwqP8lM08PEgic5QtwgFMkl0cxA252s8Hr9FmRicDWkRVPl4F0/0', 'oyP7DwJe2MLyZr9xdT7BVdraVppQ', '', '0', '', '1', '1', '0', '0', '', '1472200212');
INSERT INTO `tyms_users` VALUES ('2051', '你若安好⚡那还得了', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4n9ibh2ibH5QDfickN0iaOphB5XnFuF896RSicqZQib1BcIwSGCrfjEEK3ePtaLZX49I28fbSf2hIJxrGj/0', 'oyP7DwNopzNwMPvjHgN9fbTo-gg8', '', '0', '', '1', '1', '0', '0', '', '1472200435');
INSERT INTO `tyms_users` VALUES ('2052', 'A贾明忠', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5v3iaqQRIsnXWvEJhP9Jbaa7lGK0ibODJVaLiaPvhRg12qYoxqfZx0vxiahlYcSlWry0fkicicClGLSYb7LzWgUrItAh/0', 'oyP7DwBVSUb7oS1dyxnTh3NwOAx8', '', '0', '', '1', '1', '0', '0', '', '1472201274');
INSERT INTO `tyms_users` VALUES ('2053', '木子', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6XofBnxnQ8WHj6YssJQD8tKkTbqWtQZC8YupDrrdxTSXGF11u2LRwuylrVDjAEmGeXmr7qBSYg60uIOSeI3IfI/0', 'oyP7DwE0vtVAYmWllA7ZCIoScCwY', '', '0', '', '1', '1', '0', '0', '', '1472202024');
INSERT INTO `tyms_users` VALUES ('2054', '龍少 ', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP018ExDTXkDTVM5HvIAiam7l885pJAOD3Qckjp7zLoIibzmMBg6PlyFlS7YmugZwB9KRQQj7iahC0cNHvq9KicFPicdI/0', 'oyP7DwMwm0aqdBZH2sdUsTQnT91A', '', '0', '', '1', '1', '0', '0', '', '1472202343');
INSERT INTO `tyms_users` VALUES ('2055', '草根', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5zu9H8e8Ribz8JlH7SF98SDgrQuOyNYKianUENBnfevOWGWpAQ8SscibeRK1SzGTjO8YFwibwHAlzhEX/0', 'oyP7DwJcuz9Q-mhWYOYGt1Wg3-o0', '', '0', '', '1', '1', '0', '0', '', '1472202605');
INSERT INTO `tyms_users` VALUES ('2056', '刘大博', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia5poiba2y2nMQYReoZfJwMJow7DsK9kTiaMib45JFc7bbuxHZMoTcaJibtamYtIaWfLnn0RCgicBSPozT/0', 'oyP7DwCMPjXTD4dGVsxkjMKNjcH8', '', '0', '', '1', '1', '0', '0', '', '1472203630');
INSERT INTO `tyms_users` VALUES ('2057', '事五六', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfADhy2PzGib7ptxhwPzNpqHtUAcQk3cJ7foUib1WKrQwMU0N6ysO5fvics7SoKHvscvibbqv1bxh1bwg/0', 'oyP7DwBvnhOXJ9KCc0M3lMwo-I_Y', '', '0', '', '1', '1', '0', '0', '', '1472203782');
INSERT INTO `tyms_users` VALUES ('2058', '往事', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0pkXMhodO3sM0Ca83bfnvr4Ur53pDZogX9cbIzfymbnpOZcE2OSib0zJ6gJcuFsBVpyaNxKTJZ6HqibPPdCMcYJV/0', 'oyP7DwLMidmIANG1FKwHcFs_LIbk', '', '0', '', '1', '1', '0', '0', '', '1472204488');
INSERT INTO `tyms_users` VALUES ('2059', '王羊', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eGkpK2hul7yWusfKnjeln0VaDdGKWXwvmsk1fvxgDveQ40vG5rmxExu4eia8Wic70SBQibybag9Fyza/0', 'oyP7DwPw1qODlCP3kjdnzAcBumFs', '', '0', '', '1', '1', '0', '0', '', '1472205444');
INSERT INTO `tyms_users` VALUES ('2060', '飘香榭', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDGE4EMq4hoZAUgl9DW67Sbmhx92xbpbLLLXUzIQYHny4wYUAIpZN9b4BDbzZiac2n0sSGSSvEx7dlIxZkFSE1iapxk1yKqZ4NVY/0', 'oyP7DwMmXgNNIAyR3d8Tn2OmU9sI', '', '0', '', '1', '1', '0', '0', '', '1472205822');
INSERT INTO `tyms_users` VALUES ('2061', 'Mr.PHP', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL61icTfhWP7Z3YpIvOk4WXwGqDgDaEG9oxq49hH69ZX8Ke5myq2ibcnRib2XoiczrKMvl8qSBJBXa1NXSHFFzMqAT7K/0', 'oyP7DwFi23IOCgpI-hqSbk4iV_-g', '', '0', '', '1', '1', '0', '0', '', '1472206327');
INSERT INTO `tyms_users` VALUES ('2062', 'Admin', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cWx8MFagGtXlNoCiaXo5nHHMhHerzicibM6hG0gO12mzesgaV7jwhaRdLRbuz1bL6NK2q00UwAJAVP/0', 'oyP7DwA7HqPFUXtbJdZ9UFk5M5vs', '', '0', '', '1', '1', '0', '0', '', '1472213099');
INSERT INTO `tyms_users` VALUES ('2063', '谭振兴', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEK03icRQkJ7QIekHOHKiae70GKbzBV7J6WzMpkzjzpGPCibKqT7ahqSbpgcbX6aae3bJpZfqGyHMonM/0', 'oyP7DwNahQsmYWMCOZFm9MbKQEhY', '', '0', '', '1', '1', '0', '0', '', '1472214169');
INSERT INTO `tyms_users` VALUES ('2064', 'Purple', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELCbZbTHL2ovLFgSiczzUGFd5kVl0SNkXE2pUicgdvljzBweQs7voj14LqEX5ChELPNyBh9TgoLp8pQ/0', 'oyP7DwLvnErtS-VK1IdnIA8_zN_4', '', '0', '', '1', '1', '0', '0', '', '1472215188');
INSERT INTO `tyms_users` VALUES ('2065', '代俊杰', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP386OfJKsDOTQNcLXdjX7q4MtvWrj4wgibCSuyc2IKf8xKfNakxzjv5EZyKnzN1bxLoABMiaXuPhwDKusFeuP9P6a/0', 'oyP7DwKkfqVyc6lhxWIfpmHLu1JI', '', '0', '', '1', '1', '0', '0', '', '1472217923');
INSERT INTO `tyms_users` VALUES ('2066', '＠(￣-￣)＠', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0W6rtgtMDOclwzPnuibGCg6I2ZlhrWH1TZg5QD2k4DECSmRvOjtWBoF3qtpN89nich9ELUGw6zf2p7/0', 'oyP7DwB2a_JMGu1E220c8Q08d-U0', '', '0', '', '1', '1', '0', '0', '', '1472219584');
INSERT INTO `tyms_users` VALUES ('2067', 'Kina', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdCvPXdGCKWkj8ia78mKAbpR6xa1bc4RPeNriaicD8l8YTqdheZdG4IcqRcGFOJ49j3PGDl8uOX49fas/0', 'oyP7DwEMNCXCJ4gI61_0Df88P1FE', '', '0', '', '1', '1', '0', '0', '', '1472222398');
INSERT INTO `tyms_users` VALUES ('2068', '周靖', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9cibq2JxgAD0GicYDhiakxfylUT1fpxKUluichlHMexOhMjnzCILj5eg57ovCyR2JCPqKCptxNsx8gU/0', 'oyP7DwMg_0YfvHdp6sAmvBmNhgWo', '', '0', '', '1', '1', '0', '0', '', '1472223038');
INSERT INTO `tyms_users` VALUES ('2069', '雷斌峰', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMTvPB0FNH94vKQPZ4CibMmReXQM9CX2j3qotV01qibN8yWFteyjtcJE3TsywQuXV5kTmic0GNbzr6j/0', 'oyP7DwC0-gF9Tb3iKR2Lhgn1KuvM', '', '0', '', '1', '1', '0', '0', '', '1472224147');
INSERT INTO `tyms_users` VALUES ('2070', 'tangnba8', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6p7Lu4U78hVveicTcZE8RzjGScpJHsICFCdddGmxIeTtPhGhbRicKD0VgDvCWXs3u7UZZ3rres2LFcny3uSt5JJg/0', 'oyP7DwKd_os4_IVaPhHChzY-ZcPE', '', '0', '', '1', '1', '0', '0', '', '1472260158');
INSERT INTO `tyms_users` VALUES ('2071', '六壬学者', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90JX1iat6hSgeqCfFtsjM81Xw6iaZEG2cALYOF5a1ka0X1g1trco8r4pEpAA91tic8HFicZfv1IiabpyBia/0', 'oyP7DwDWP1WddE0dYwPLe0LmxJ-A', '', '0', '', '1', '1', '0', '0', '', '1472266448');
INSERT INTO `tyms_users` VALUES ('2072', '钟丶', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eAWw034Hgoc2pydibSC16jx5sxZExt5ueia4cv7jia9WJWyRjWa57etiaXiaNdX6mMtUiaibKyqz7kPBg6M/0', 'oyP7DwDyrIfnrlWA5-eIm2XBJQAU', '', '0', '', '1', '1', '0', '0', '', '1472268919');
INSERT INTO `tyms_users` VALUES ('2073', 'zzz', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawVQl8P28yEfPqYafmuqgcFPsY5H7XDZklEVLZ4at3hMHAtGggG1luBFNgLiayczvvBOZB2UceICu/0', 'oyP7DwOaslCSWVLplT-HIcLH8YW8', '', '0', '', '1', '1', '0', '0', '', '1472270124');
INSERT INTO `tyms_users` VALUES ('2074', 'linf', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0XwnvcVRymzVwkRxaDtAOiakbriaZ2l9wJTPicXd2AbE6ficeKrrrUtaeHqSqFU83GQdRyEU34seXvxf/0', 'oyP7DwEQacamYtx39snJpJZhI5fg', '', '0', '', '1', '1', '0', '0', '', '1472270340');
INSERT INTO `tyms_users` VALUES ('2075', 'QQ用户', null, 'EC6BB63E7D904C8B88381E2C1F9A7EFE', '', '0', '', '1', '1', '0', '0', '', '1472270369');
INSERT INTO `tyms_users` VALUES ('2076', '18916801303', null, null, '', '0', '18916801303', '1', '1', '0', '0', '', '1472272087');
INSERT INTO `tyms_users` VALUES ('2077', '╰_╯Arkin╰_╯', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZFaV5BUqGURac2JZdicsqDchBice7bHWatELztX3VI8QB9gArH8cVBqB3GU3SiazxKLBLqTyiaJqyR7/0', 'oyP7DwHhX2VVT6gIBiaooMKZ0tYs', '', '0', '', '1', '1', '0', '0', '', '1472273950');
INSERT INTO `tyms_users` VALUES ('2078', '木页', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0dg5JFfaxiaVPMHDdFpsNHUZQZ2mKSOxVcAb1lyE5ib2JDVGrdVPQiabDvxDJmrooVRf6CAiasWt763h/0', 'oyP7DwLIQ5KCIlAycuY_JcVKqKWo', '', '0', '', '1', '1', '0', '0', '', '1472278777');
INSERT INTO `tyms_users` VALUES ('2079', '林志霄', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4tia7zGENoeKk2egvImic6ovI3hmGUM9MjrmYltrugibChgkENnhgQfuAEJNBxTMIaxbUxOIpPgMjnoTjV0uaW5bz/0', 'oyP7DwIw65XXQc3uTzrLH2MnylE8', '', '0', '', '1', '1', '0', '0', '', '1472279903');
INSERT INTO `tyms_users` VALUES ('2080', '胡文俊', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eD57byUfcBsWiaNVzRrcNDribfCj3FJyBmrkxKAgRwBlqJUdic9y74Wj9TSMHjia3O6ia0aFsicYPxqK0o/0', 'oyP7DwKf8Ruet1R2KQIRQ5yCsqek', '', '0', '', '1', '1', '0', '0', '', '1472281591');
INSERT INTO `tyms_users` VALUES ('2081', 'Bear', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2zadMh6gyr93LCHyDBu8zS0wvPkjyp3gS5AHJPKyxyetRibiahjeq2RcC4HicBfzAYbfeExYmTPCZxg/0', 'oyP7DwL7sy0nZ9dlMAZs-uC118Q8', '', '0', '', '1', '1', '0', '0', '', '1472282481');
INSERT INTO `tyms_users` VALUES ('2082', 'Robin', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8ULKicKhBUKBAYe8VxuG3LxuWD3rfHRZoaXurIk4stmyJdprLg4lw55ezJAQYpv9BDJMkul4Mibs0Q1/0', 'oyP7DwJjZSFv1Zr2SaCvOmH_r5bo', '', '0', '', '1', '1', '0', '0', '', '1472284803');
INSERT INTO `tyms_users` VALUES ('2083', '春雨子小', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4avgxXZkGExibNojxwJL2FPBIUr7B8RqiaLdfhiaQjuyWn0V8HHbXnwRRNAkU2zkDZLzCicvJduU5Qq2jy7NzJW8NI/0', 'oyP7DwGV1nx-dmprwBNRW6D4s7yc', '', '0', '', '1', '1', '0', '0', '', '1472285516');
INSERT INTO `tyms_users` VALUES ('2084', '小帅  ‍微信名人', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1uUQwCcL665PIqVHDib4QHqGwaTVSiadSbiarokBOeTHqriaV9djwtOn1Uhc219PjmuQLPyXOVvNCficw6xnwuLXXrU/0', 'oyP7DwHK4m2xqv7M2gmCrETIfw7o', '', '0', '', '1', '1', '0', '0', '', '1472290968');
INSERT INTO `tyms_users` VALUES ('2085', '我是谁', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0YKTj6niaBrcANSfCn10PdZBT5ZdlNacUD6eBv8ibxAzf38h3XLyUsa0MicrnJozicdDW8Up0UzYdQPN/0', 'oyP7DwFQmP696gMSsBxLxX0vX33M', '', '0', '', '1', '1', '0', '0', '', '1472301351');
INSERT INTO `tyms_users` VALUES ('2086', '杨富贵', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2jBjT0aj4uFM4c5I6KgOdrZ1jobYibnvoCF3WVCZpWRKWSrTPfmkCHHez4Ficm1RMKJb6X8ZRJte8ylyJkTkyJ5B/0', 'oyP7DwKRg1AoqqeK9yOo8jbxTMYo', '', '0', '', '1', '1', '0', '0', '', '1472302074');
INSERT INTO `tyms_users` VALUES ('2087', '　', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1RFehhbtvOxrSb0W7pGddujF3iaA962yrQcVibT614wD9zBbuZ5pRsHhoWJ8ibZKwCHduC2c5pLh89anHlICC0qIV/0', 'oyP7DwF8CxzXjwwIgmoWDZYdDyXY', '', '0', '', '1', '1', '0', '0', '', '1472306736');
INSERT INTO `tyms_users` VALUES ('2088', 'super No.1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCiasg3ELlQMuLE6YzlfyWIrC5d2RcGVGuj5Lj7XX8WOWiciaYynfx7ElABooZH3Jk1qbCS7WrmPiakzQ/0', 'oyP7DwBEYtsDLguI1qlotb8SfH8o', '', '0', '', '1', '1', '0', '0', '', '1472311512');
INSERT INTO `tyms_users` VALUES ('2089', '_不要解释x', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6ib0pIbk1KHXD7mjYDic6KuP21jkibicz88VHuicNtsM9U8t0cpCPSf23kX9wzuhKj53ich23z2bv6zmLA/0', 'oyP7DwAS6EXXLpaWSc4KKruhDvtg', '', '0', '', '1', '1', '0', '0', '', '1472316955');
INSERT INTO `tyms_users` VALUES ('2090', '萸', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia95Ozv1jyS8pf1KQGClvH2u9EEqBLI3BwicNPOtFIO4G1xEUtLQ9BReaEqOzCSxg2AywKpWCZUYhz/0', 'oyP7DwNfNjWNSC4DysKJzvyraBnY', '', '0', '', '1', '1', '0', '0', '', '1472348010');
INSERT INTO `tyms_users` VALUES ('2091', '李子', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDGP5m6pjYpYMIYqnwBjclspXdqXSbehbszsufo7VuqLs2Q8HibRDxItLtDPbdp2MDiaTq8R6FbGl4w/0', 'oyP7DwJ8uPbUK_xdpfbWZ0tbFO50', '', '0', '', '1', '1', '0', '0', '', '1472351457');
INSERT INTO `tyms_users` VALUES ('2092', '黄炯', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90NaHAOAGBb4UjCr6r4sicGVe95zhA6X6kmUZEPZbdvCvaRwZx9oe9Zn9BCcrAunqRpj3frS3QGI0h/0', 'oyP7DwJ8u6NVOggWehvPbHI9QOkY', '', '0', '', '1', '1', '0', '0', '', '1472351957');
INSERT INTO `tyms_users` VALUES ('2093', 'Chankit', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5axReV8Zdsiarke1NR0ibDYFkrFkRv50QqDoUMTnAJGO35z5ZtCVPu7D8eCmoXcUuFUbhicPJ0T18UKNJlQs0ap8M/0', 'oyP7DwOTG8PcFg2KOcddPmMhj1U0', '', '0', '', '1', '1', '0', '0', '', '1472354954');
INSERT INTO `tyms_users` VALUES ('2094', '尼克.', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY50TaOdFxg0j592Wicwvkzjiad8Nn54KFdFk6FC3icfMDNFJrGyL4nPoR0yupVia3uKfRMucxdh9dWLqO/0', 'oyP7DwJl4QGO5b98f8lwipwsA3HQ', '', '0', '', '1', '1', '0', '0', '', '1472362377');
INSERT INTO `tyms_users` VALUES ('2095', '傅世杰', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4byXFgaNmnSZ2TohAKAxRkIuYbvVMT4btVmVmyDzeOib6iaoypWpG7d9jm2fKwZCibrNZAxbbhNLFB5HVb2LOfa8c/0', 'oyP7DwA3HuwcKLUHa0KHq6RLN0Jo', '', '0', '', '1', '1', '0', '0', '', '1472365056');
INSERT INTO `tyms_users` VALUES ('2096', '一牛九毛', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1KI6p4Jtu4ng1zs0Cu0Pudc0dRh0RUaCZbiaaEicH1K2xAGlQY3gNM7ujrzJrOxia9LznOHAopxw4I1fVZlwlujd6/0', 'oyP7DwJQXCCDNuooh72HhSNjTc6U', '', '0', '', '1', '1', '0', '0', '', '1472365155');
INSERT INTO `tyms_users` VALUES ('2097', '青伢子', 'http://wx.qlogo.cn/mmopen/wrgP5kVic6GBdXZZE9Aays07CBT8g1Y9kab5S6AiczSbnHq82Br8VfMHTsSzzeu1b6N33UgvVE8fxOibDGnQBOYUy46r5nzaBl6/0', 'oyP7DwHMGcjrNIlVYcf5lYQ2yQBs', '', '0', '', '1', '1', '0', '0', '', '1472365220');
INSERT INTO `tyms_users` VALUES ('2098', '3DFox', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDtA8CH7qtmz6heytUhxOFoj3SxGSK6JzibmKrqlspdapDU192N36wOCXmT6L6sm1KQb6RqRWtr3ibA/0', 'oyP7DwOpReoQxvi3jbqJLxyPYtd0', '', '0', '', '1', '1', '0', '0', '', '1472367125');
INSERT INTO `tyms_users` VALUES ('2099', '教主', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL77sJOS2wbyj3DNQA3y1z5BGM6mkuUCZ24ePANTnZnUyicKicI2NTDIY3m7nI11Q1SflAsXia4DTx2uPV1Xybgj3E8/0', 'oyP7DwHaA3YyjqhGxkCN1SPJ7638', '', '0', '', '1', '1', '0', '0', '', '1472368228');
INSERT INTO `tyms_users` VALUES ('2100', '段少', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4iaszVgMkuZIYa8NicVDkpZXvZZps6aWEcll4SXsv0AFg8pm3ymRAc1FEVvXXLH52gyL1V38iavkzJC/0', 'oyP7DwJOMUySQwDSc4kfmPvn_6iw', '', '0', '', '1', '1', '0', '0', '', '1472372049');
INSERT INTO `tyms_users` VALUES ('2101', '一抹ㄟ', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W32MibO4ZMibxRuehs1s517SktoGibT1nS1P8icADByg0Ka7EicdibnjFuOyn1pBOdbfeCZWHicokhU4UrEY/0', 'oyP7DwNVUy6XTiZAHRqudxPRo8G8', '', '0', '', '1', '1', '0', '0', '', '1472372196');
INSERT INTO `tyms_users` VALUES ('2102', 'QQ用户', null, '81C50FA3E3E3423608DDB5485E8F610A', '', '0', '', '1', '1', '0', '0', '', '1472372335');
INSERT INTO `tyms_users` VALUES ('2103', '皇甫浩特', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeKWt566ycCqIicJwTicnQiawGTCE4tP6eYJok5r3cRqiadWWQ0EMDUfJvmlLfnxm34Sz3juiayLeVotjA/0', 'oyP7DwLzYkE2Dj-NGKLId0s2MHuc', '', '0', '', '1', '1', '0', '0', '', '1472372898');
INSERT INTO `tyms_users` VALUES ('2104', '张超豪', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3d39oPRk558qFgPxRkOGlcia1vskOwOPibU1LaG6mOfFCwTWJ7UP1Z784gsPYdt7HaXD7YNjZy0sOU/0', 'oyP7DwDz37tSoiw09QxAawKCSTO8', '', '0', '', '1', '1', '0', '0', '', '1472373036');
INSERT INTO `tyms_users` VALUES ('2105', 'water cube', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0AMryuYf93icmD0vt2ic82A0mMsb21HKWxUIYO9DGlibquCxzmbGmtkE435m8icsSFtuykgrWqh5wXp/0', 'oyP7DwCZbO9nB9i2V0RnS68ArKKg', '', '0', '', '1', '1', '0', '0', '', '1472374698');
INSERT INTO `tyms_users` VALUES ('2106', '纲', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPyZZ8A9H4N8uwh0LmH9sfF5w1cyIf6QXvcsnnwXNN8ghQ3icjgoicb2Gia0icZsV8BeTkYWFezBr0lR/0', 'oyP7DwPNMtg4M3Jygl3hHvd0gsPQ', '', '0', '', '1', '1', '0', '0', '', '1472377043');
INSERT INTO `tyms_users` VALUES ('2107', '叮当猫duan’g', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdBNictUSkhjsLa9w8eptGEfzFeOvS2aUjReLsXjwqgXBHLk0QzHTIbKdmLr6wOMl7xEdM9pKHImdQ/0', 'oyP7DwEKIPZx0psnRjrhiLzP7IoY', '', '0', '', '1', '1', '0', '0', '', '1472385460');
INSERT INTO `tyms_users` VALUES ('2108', '张剑波', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2zM8YWiaYt0TcQaaAYUrWuleSQo2UraTlvqMyWJrJYN96AtNI6Wld0iaSphCTxVsgPDicJuQfQC7wNgD3MkicIccicv/0', 'oyP7DwAGUpnQ2romiRSUiQ4mGodc', '', '0', '', '1', '1', '0', '0', '', '1472388192');
INSERT INTO `tyms_users` VALUES ('2109', '建建', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4uF4d6kplVhgzkGXVqAHSfeIFqebNIicDjmD8nMY3Zxdc7QPJh5TblrAMXVxUuGy4slkItp0UqBvg/0', 'oyP7DwAiS813qEDluKphrqPMYoQs', '', '0', '', '1', '1', '0', '0', '', '1472389313');
INSERT INTO `tyms_users` VALUES ('2110', 'A_亮哥', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0gQhJicAibRicyVgotcWxX9LGv6Nibv7kaicZCl7y5So9ILd3icNibVRhoFKHg9ib2uxruHJHY1xaHg2lNMSYj27lqlMDB/0', 'oyP7DwBmVroTllNy_EHEJxOFoYhs', '', '0', '', '1', '1', '0', '0', '', '1472395699');
INSERT INTO `tyms_users` VALUES ('2111', '遮天', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1yjeUhngAnSDSYUYTSj3BcbQlchH0bZuo829Eqg4z70G5npMS0SJnP87PQbcwlJ0t0ubPiaicZYUQAnnSdndEGpN/0', 'oyP7DwMxxADPx7wDCQvdvmu3nyDE', '', '0', '', '1', '1', '0', '0', '', '1472396452');
INSERT INTO `tyms_users` VALUES ('2112', '呛眼', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2UIicW4gicbtcv7LzYTv7kw9icbtVUnXT97U7D9ZZf8yNfhR3Y4yjEEFaIEQwNibWrvhuGzzuHQS2Ex4jxsEZflaLv/0', 'oyP7DwL3P1sUqXuWkZHhqApqh_60', '', '0', '', '1', '1', '0', '0', '', '1472396505');
INSERT INTO `tyms_users` VALUES ('2113', '⭕️情人的花朵⭕️', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOicAahfoicKTY4hjd7sNXZXicdicsINKRzH8GiaCzibSvRKkUIcraOFzQMUCaQpZiaAmEDP8zYOBtyKVCb/0', 'oyP7DwJ-DpABH9rbFv-Wa8Wbmp_o', '', '0', '', '1', '1', '0', '0', '', '1472399044');
INSERT INTO `tyms_users` VALUES ('2114', 'Since9080', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5n1XAbz4ERticNYscJkYyCjhLCpByVw0godKqVwc3jThibgPz6IAu7hJupzCJEsjCSXUxB39YBIpPJ61ttpPLuXW/0', 'oyP7DwABcnE2_h1w1GeVUXiTohV4', '', '0', '', '1', '1', '0', '0', '', '1472400400');
INSERT INTO `tyms_users` VALUES ('2115', 'ih ny', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0m3ReWhXJUHBvcKe49BicguqTic3lLDr2mOGIHpKYGnCyHRadtqofx90fICQlKfDLA3mtjHgrNhUiaewe3iaII5Bwe/0', 'oyP7DwOX0itlU_TBvQ1UvIOR-2tI', '', '0', '', '1', '1', '0', '0', '', '1472433177');
INSERT INTO `tyms_users` VALUES ('2116', '渐行渐远', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3pkj0BkHibPej5ksv1hGDBt4NTjp0ruvJZxUYuJicu2U4aaRsnzNk7CxWHwJgXtXJEHnDb2Uxr0RGNvdKT8PgqLU/0', 'oyP7DwGmN5C00_VEkIGfNTSDypyY', '', '0', '', '1', '1', '0', '0', '', '1472433783');
INSERT INTO `tyms_users` VALUES ('2117', '大白兔', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3s8NVlibJficxhG4zHB38H44KoicajovYYJAKGphBI83vCtVLALJVYNo1lcNPBicia05RiafJ6GMENr3aw/0', 'oyP7DwNSRWNHD0HpeT5oP13R_Vnw', '', '0', '', '1', '1', '0', '0', '', '1472435998');
INSERT INTO `tyms_users` VALUES ('2118', 'biubiubiubbb', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKXee8l0icRPlALscJ2ooUmCYHicYHIOMpsTFuuFDV5CibCtibmUbWCsZ5VkhdYD2FrwECeUib9ereIspA/0', 'oyP7DwB1Bf-smqjH2RLLyj-pw1Qo', '', '0', '', '1', '1', '0', '0', '', '1472437345');
INSERT INTO `tyms_users` VALUES ('2119', 'y@lqun', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY59TEerzNicweRM9sqhHGeVFj9r9hevhjcUaM9DOrIYxqTfGhiaO5BCPqGxUUWbynVYfg7KrOCLqP1T/0', 'oyP7DwAr_mCgD2RutwKybEes9bZc', '', '0', '', '1', '1', '0', '0', '', '1472438705');
INSERT INTO `tyms_users` VALUES ('2120', '牛牛', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazxpT3sMzkvOPEwMr9SzGWD1LJlmyAzicSuNzj66jyrkTqFv0h0wu6X29veRZELsLykt5qIXVvQyJ/0', 'oyP7DwKr4iUvD4g9w2PtgwjGPj6g', '', '0', '', '1', '1', '0', '0', '', '1472439040');
INSERT INTO `tyms_users` VALUES ('2121', '尘豆', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WicBGejHcJkPYEWd9WCY2QKrsYSOzuvzDl8Z71QD67KYHJm2pfyzgEqeFHbfmodZdIaf1H7icjcGJ/0', 'oyP7DwLvwD4bqxKyuSytHKisyf_M', '', '0', '', '1', '1', '0', '0', '', '1472439669');
INSERT INTO `tyms_users` VALUES ('2122', 'abigal', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazQTfRTYRSQtNXOQNGYGPzAZBHIPjFOIb5iaOhiaKK8dJ9LjpEmCNVhMDmaog65GNTWP4D7hWoAM3o/0', 'oyP7DwOl2pCH9O1vUW8dFcdIivQk', '', '0', '', '1', '1', '0', '0', '', '1472440995');
INSERT INTO `tyms_users` VALUES ('2123', 'Peixb', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4uyXE7qRZa1CoeTmo0YxFPc4a32Kxn7JqZ5XQqw9fr54iaAkWQYu6vRZ680MN2TvHgtVeIU012K6A/0', 'oyP7DwN6douLIAVnhE3VvX0FNlWM', '', '0', '', '1', '1', '0', '0', '', '1472442401');
INSERT INTO `tyms_users` VALUES ('2124', 'Mr廖', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP25Q1QNvbAtrHwdc1ctmG9icPvkxric4Td9m9XgMbMmvVV3GzFBbJYsfpe0pHeQ4ibcdHl5sibpeJgPNaKPOXLm81Jm/0', 'oyP7DwAU5sZhQS3CzjrU4Udg2qS4', '', '0', '', '1', '1', '0', '0', '', '1472442415');
INSERT INTO `tyms_users` VALUES ('2125', 'Return of the king', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eB7XCUlSXwc7JJu1JBwrUYP86M1ATdN9Ao1Nbn405RUbsklcLAicMwT1dhGCDm1MR2R1WTiaFHZSicP/0', 'oyP7DwG_Xq3t2zih8VtxqTCDdVdw', '', '0', '', '1', '1', '0', '0', '', '1472442812');
INSERT INTO `tyms_users` VALUES ('2126', '', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY52RBcDSvGkruR57IJFmjXXyOh7cic3GCpYLokkzCpycbS1vrcvFWlfgq3kHLQKRT9OFatSw2zzH2Y/0', 'oyP7DwI60tndoBBmaMsrczrN8UlE', '', '0', '', '1', '1', '0', '0', '', '1472443376');
INSERT INTO `tyms_users` VALUES ('2127', '阿刻凡', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeVt7EJ1zLsDoOZ90EoPibecSUciaiaUAia5wgTZK7ibOWlzDPmWedy9sXEFxRibB30VWh1Ad46rHrhFWtQ/0', 'oyP7DwCh7jQbiFe9M0HkRS-wVfiw', '', '0', '', '1', '1', '0', '0', '', '1472445104');
INSERT INTO `tyms_users` VALUES ('2128', '大卫照明', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5yvzTz2Sl4q5ZFdLcJNLGFzCTribfbPofsvgq2vn3CXZ0RQ8TItDDX4SGoMBOz2jyicf67ylrljMFQ/0', 'oyP7DwF6GCahb6oiVQHwc_kVrld4', '', '0', '', '1', '1', '0', '0', '', '1472445678');
INSERT INTO `tyms_users` VALUES ('2129', '雨落流殇', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4r3tLe4DVicRYLrvk6gzdM7ul514aOjVibfgWCxW0suMrexmA8lgwLJV7z6icoF6r1TQJW2YiaGTmbM1/0', 'oyP7DwBaBlQG4_OqZmYktA9O-Vfo', '', '0', '', '1', '1', '0', '0', '', '1472446011');
INSERT INTO `tyms_users` VALUES ('2130', 'alert', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK0kM7NQEdlicBJNtpoWNx8BvicqfBNEBDHCTPV6FydnDv7LrgibzG43iaKBhL4aibibfNkquJicvmh8cxZg/0', 'oyP7DwLGhu_xStdRCbsPN8gBcHPM', '', '0', '', '1', '1', '0', '0', '', '1472446086');
INSERT INTO `tyms_users` VALUES ('2131', 'Ψ醉清风の', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1KcASGQ1iaF3AwzgCElkBsmHtTibgTwUwsMOVK5DtnRYV6G7v4RLyDWTIrNicOCm5ibUwFbbc0icgQ5CdGGeyNNuRPX/0', 'oyP7DwIXW-OM6tC_nqF6B0c3_24o', '', '0', '', '1', '1', '0', '0', '', '1472447557');
INSERT INTO `tyms_users` VALUES ('2132', '陈凯杰', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2RKnURI6mg4bmLet4mxCIpjP4tY8wvjSWzsljXSibKmyC0gnBiaQ1mgXRmj3WsJ23a7x1kzbU4b76wosTXTicM9YC/0', 'oyP7DwMG6HF-vr7matt8CJ1kdy1Y', '', '0', '', '1', '1', '0', '0', '', '1472448212');
INSERT INTO `tyms_users` VALUES ('2133', '有目标的去努力', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAqlVicQZEl0hBoVtLLVjQibAmUFZibpu86icJ9Rc7oPib3acuY4EOr0u7poAHx2llacTrVUt2MwwYrOG/0', 'oyP7DwCKh0t25yS28OJ8W9OZsIzw', '', '0', '', '1', '1', '0', '0', '', '1472448570');
INSERT INTO `tyms_users` VALUES ('2134', '尹旭', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAJW2t3BfSaxreMudZnAOA6GMuND5EgtkwIVxGeyA2oDichUKPoLbfZk9icrG2AOYhSbYmF5iasATHg/0', 'oyP7DwJkUPEPf3QIwhQnY0YRnjxQ', '', '0', '', '1', '1', '0', '0', '', '1472449176');
INSERT INTO `tyms_users` VALUES ('2135', 'Donson', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEIG8CkMS2v0CIfhBLvxSKIDfibq3RmibPylJaTIEEf6MF7BPIr8j7lVKeiaoIb2H7Ru7suMZkdyCQCm/0', 'oyP7DwKndL9gi_-cBlYL3tcDtedw', '', '0', '', '1', '1', '0', '0', '', '1472449219');
INSERT INTO `tyms_users` VALUES ('2136', 'Whistle', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3cAPLDqLc3rYj2tVLZn6emqqJkjLRXXia6DyGqGUD2SlMwsJgU8Ba9k9c6SLLPbBibOW4l7ibSLtbd/0', 'oyP7DwOFsV5ygxQVIcixi7Oyg95Q', '', '0', '', '1', '1', '0', '0', '', '1472449443');
INSERT INTO `tyms_users` VALUES ('2137', '薛明', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5s4ITK8WcFnKVdMe2icUmiaIn7DHI05m33ZhP3bSwr7S6UVGvibPkroj2TKUMic692PIgxUicYqvoYwefjiaw3BQWKtC/0', 'oyP7DwPmRjYm1TdAaCYjYOT4Eolg', '', '0', '', '1', '1', '0', '0', '', '1472452879');
INSERT INTO `tyms_users` VALUES ('2138', '胡祥贵', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL51gLGkLoWiadpFgoib1oV9PttmiaJglgN3enl0aicU6eDbIhQZAcibAgicw8JicUTLtMa1icCXUDWa1e0My4X88rblW2oF/0', 'oyP7DwHNgZmJsaGs3AWnrgqr7630', '', '0', '', '1', '1', '0', '0', '', '1472453332');
INSERT INTO `tyms_users` VALUES ('2139', '萧竹枫', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELibf8FdFvBolNWzK3EDgwkCGUTZtw9hVeL2K1lK4EStlmU8tk7MAyXquZGz1YhN7cmyfiamSewWibgQ/0', 'oyP7DwLAQcGGGiO-Smx7cx4fmZ4I', '', '0', '', '1', '1', '0', '0', '', '1472453973');
INSERT INTO `tyms_users` VALUES ('2140', '海潮口腔', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3dT7MHibqTtbiaPsXb4bOhD86ET2HGXJHK3UyYqWwiaqovlDZIOWzljDnmfF5HsRk5sial0HSNmpNy4NdJIPSzmDMT/0', 'oyP7DwK70jF2z5WTV3u9b0m_hjDk', '', '0', '', '1', '1', '0', '0', '', '1472455905');
INSERT INTO `tyms_users` VALUES ('2141', '福生', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4qP3t50wC11JsQcblicD6v7ibiboy5QNjoGTBQibUsfXXKQYWCCY6M8pnbOZg1XwnZktb6H6uzeJxHFQ/0', 'oyP7DwMIqe20uI-iCqMXm2WWG2Kg', '', '0', '', '1', '1', '0', '0', '', '1472456030');
INSERT INTO `tyms_users` VALUES ('2142', '为了雅集造了生活', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaiccZ0J4nPtZVxoT0JHrjVSghfdgNEzYAuibCib8et5uWUBP9pq2N5yQQ4aLFNWpDoYQf0md9Z7OVA5/0', 'oyP7DwEr2fryrKBOvVrgHmVKNDVM', '', '0', '', '1', '1', '0', '0', '', '1472456038');
INSERT INTO `tyms_users` VALUES ('2143', '海底森林', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJGu7aoYzXnxwrXhyiaRFU4DvoAxiaic75ia9dliaqZHo4HoWb1kFdKyseao4ictbXHmuU39iayv5ba45pRg/0', 'oyP7DwGkWcQt6tiLuDCFyZoLcq30', '', '0', '', '1', '1', '0', '0', '', '1472456728');
INSERT INTO `tyms_users` VALUES ('2144', '周新伟', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBAK9Cae3dPfeIvpsNUwicQ7LEslYokYgPibMKicr14Il8kp4aKPy4Cv9ia75BZjN3Cyng9ibv0M5gWkzw/0', 'oyP7DwFSWuUBOuX7rOreErxxu3lc', '', '0', '', '1', '1', '0', '0', '', '1472457231');
INSERT INTO `tyms_users` VALUES ('2145', '金鱼', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4A9KLEdFCkrUc9QRossXkJ3s3xicrgpUry1QcictOVxibluibvaoF9ufLKvpHH9rA7LOqeBkgnibP1QuiciccloIJQjmP/0', 'oyP7DwHy9ILA00PZ9y5KcbvI3zrE', '', '0', '', '1', '1', '0', '0', '', '1472457795');
INSERT INTO `tyms_users` VALUES ('2146', 'Mr.Zhang', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4iaNLe8XDC8tJJljMyWAQ1m9gVEaWauoJ1LN8PS5dfvlVSvWZOf0CfcMcVTADq87ibk5T3DNdqCfjN/0', 'oyP7DwF4oz1RB5yXoyjky_dV8eJg', '', '0', '', '1', '1', '0', '0', '', '1472457999');
INSERT INTO `tyms_users` VALUES ('2147', 'A-Mike    (用心感觉)', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDHXlaeZ5ZQIjJyxSEuIW4HibOTu1a4Fia2VOO4Hnx0H8rCE9HCsyHOoYmjkzYGou7b92LGdyGose6A/0', 'oyP7DwJodBu3p-cLNGAyqz9oJFqw', '', '0', '', '1', '1', '0', '0', '', '1472458049');
INSERT INTO `tyms_users` VALUES ('2148', '共饮长生', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cWwv6q8WuzVSPK4vXoiatoKiaHyeDrwG0JRdibE2dRfq67HB0iae76GtCrBVbvicVm6lmFPFpXz9fntia/0', 'oyP7DwE7qvH9ffeXDsTkWRAxLZHk', '', '0', '', '1', '1', '0', '0', '', '1472458238');
INSERT INTO `tyms_users` VALUES ('2149', '阿健', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6VKKIAic8XJN2HSNbpia5DlpIkTyQdibic17VExicbicyopr4Pz5QRKzw3HPb6bGIGXlGiaMVjlKYM2PTlA/0', 'oyP7DwC_ZHsTUU3zwcJfQHVX4N5A', '', '0', '', '1', '1', '0', '0', '', '1472458375');
INSERT INTO `tyms_users` VALUES ('2150', '海源境心', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ajd83PBiaZ0jp4C9eKN6NIeoaywmoqDAuewAgPbcY1wt66VibGv5AH4NjUryoAkibnFqlLeEzKDdFic/0', 'oyP7DwE2xpGFjQcmnvXDwdI9DtRU', '', '0', '', '1', '1', '0', '0', '', '1472458578');
INSERT INTO `tyms_users` VALUES ('2151', 'DUMI', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0eRrCGSY7uwpAiacZ9nK831QPYNFN5CdmQWKgVupDX90EslxCJfGMxs1BJjI0iaqJhCBDXPcDsIv3Z/0', 'oyP7DwNhFxby4WHzLfoKLMl2Cutw', '', '0', '', '1', '1', '0', '0', '', '1472460058');
INSERT INTO `tyms_users` VALUES ('2152', '阿晓', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAVuBVFWTljOruAbmSfSnnc17fWOzzWRU3XzsianIlwKL0tRNZsWxuGyNa1YVc4Wmr6RKicdjfkExcQ/0', 'oyP7DwMJXshqmjIns5oOe0RzyIZo', '', '0', '', '1', '1', '0', '0', '', '1472460321');
INSERT INTO `tyms_users` VALUES ('2153', '寂静的神经', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawSVZrA09PKkbqah9pc2864kRjib8hYtH4x0OIkn5XgMqYvDACvXRObOgpkCzFYkhQj4icVK36Eh6n/0', 'oyP7DwOS8iGqXA4g2pHalhU28abQ', '', '0', '', '1', '1', '0', '0', '', '1472460630');
INSERT INTO `tyms_users` VALUES ('2154', 'Jory', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3nCLeiciatyWIcFh3RLZkOeOQRjwpsR3iaYmibLdGxkbDozYLhgS6ic9qkGM7BQKvSicBW3w7E4yvKgbfNRJiaZf5fFGJ/0', 'oyP7DwE_VstjcXIEuEkggXRZan0U', '', '0', '', '1', '1', '0', '0', '', '1472461028');
INSERT INTO `tyms_users` VALUES ('2155', '马彦军', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1VpuDibfC2VBBtickHeC9g5YektziaN2SXYdE3M2hfe2zlJwcGZSWic3Fu9nFZdojMwANibsJmhOxscVxag5orP4SpD/0', 'oyP7DwDVs0u70Q1VCa8O2sVJG-Wo', '', '0', '', '1', '1', '0', '0', '', '1472464731');
INSERT INTO `tyms_users` VALUES ('2156', '蓬蓬头', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeMRxlcWlwuu6HLiboqwZTXWLnpKfTgTON2CLicroRmJd9Xtbuj4QDjR7CjADfrTr6rGjpF9SYFzV8g/0', 'oyP7DwBmq-Rvk-XGjXC2U8qyUWAU', '', '0', '', '1', '1', '0', '0', '', '1472464991');
INSERT INTO `tyms_users` VALUES ('2157', '浩', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4VILLwgj7y7XbEOeUibQ6icXRHa2hU46UExgMn86XlGgibUFhpZs3jZulve18ARgib1sUVibUO4PRHX4ofpjfnsTeb9/0', 'oyP7DwEoym-1K3_i6wnsUT5R-qTA', '', '0', '', '1', '1', '0', '0', '', '1472465015');
INSERT INTO `tyms_users` VALUES ('2158', '思维Turbo', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2ZCh79JTmfLdDDS32EJpOVbGlK6fyiba6cZPicYNiaib55ljGpHnV8MWRVJvQ2tZHjC0L551uerXDtVw/0', 'oyP7DwB-1sQ-1HlcJKgctybFHtnQ', '', '0', '', '1', '1', '0', '0', '', '1472465215');
INSERT INTO `tyms_users` VALUES ('2159', '支付宝用户', null, '2088002029353774', '', '0', '', '1', '1', '0', '0', '', '1472465734');
INSERT INTO `tyms_users` VALUES ('2160', '·沃本善良', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eNhFqFLaJlLCkJicdLQZMWiccJ4YjzxjVtQGicDuXCKfuAKFxuicpRB9YxhcibibeUHRG2YPiccbuTkicB7w/0', 'oyP7DwHcJ1_vgPFISorLLjHmd1eU', '', '0', '', '1', '1', '0', '0', '', '1472467352');
INSERT INTO `tyms_users` VALUES ('2161', 'keven', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0gcJBQQEnR28UNEiaMaMAYNLCAxzJ2b9NaU5576a74fIC0WguoXkbzBzgaicUPP4xg8VEs2libxPAcRMzx1giaQP7E/0', 'oyP7DwJgd_pGbxjvFwU-cho84MMM', '', '0', '', '1', '1', '0', '0', '', '1472470317');
INSERT INTO `tyms_users` VALUES ('2162', '陈佳钰', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5yCj9qbLofMiczsZby4bOYd3fQ8ibT2dCuy5W5MZRwN57o3lHgFlEcqXULxZOw4RfpMibFl7DFicWzjt/0', 'oyP7DwDehZye1s8ebwRPRtwBo3iY', '', '0', '', '1', '1', '0', '0', '', '1472472597');
INSERT INTO `tyms_users` VALUES ('2163', 'AAA冯强军', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2icgVNxvzRSyI3o20evf7VzFJA9MiaoJkEEQT5X7d6AMbwKrjTKA0E6kicgebOib4IPcytu6D6muhQSw/0', 'oyP7DwHokgPcJblhvQNMPRoxVJEs', '', '0', '', '1', '1', '0', '0', '', '1472473199');
INSERT INTO `tyms_users` VALUES ('2164', '炸酱', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY55W05DAth0etUCicfvyqvedicBeUC4ZiccFZB5oo4N6CgM62C2x0R9T8LULVPrynicoArZG5ENL2URibia/0', 'oyP7DwDPB4yKP5fQrXF5Q8I8VAtM', '', '0', '', '1', '1', '0', '0', '', '1472474322');
INSERT INTO `tyms_users` VALUES ('2165', '①', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6kpoWiarx6bHsO2l6butz7lI3FcTOkWGEpfoNfJoY2iatghIfr7UFBW6htGj0dr26dWfaDcefkWFGA/0', 'oyP7DwLxxBdjad3BDDruhLFW-a0E', '', '0', '', '1', '1', '0', '0', '', '1472474694');
INSERT INTO `tyms_users` VALUES ('2166', '星ㄟ◎VΕ', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3KafebGpvf8lPzxnFKxhNcZbzr9XgXfz77Wf19G4IKJBeg0HHiceI69hSPTOzoic2iaMXt9cgd0KeVgOtYay67EIz/0', 'oyP7DwGxMU5y0hDA0liS3HTbJFxg', '', '0', '', '1', '1', '0', '0', '', '1472475134');
INSERT INTO `tyms_users` VALUES ('2167', '々々々杨', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4qY8H44llwRFUqpwN7dL3q8QfPp0HPjo6qFzj1iaB8MSaTaVSBLALNkicjVmic3AIslawRBbJMl4DO/0', 'oyP7DwB2oJLWe830rR0neje7KzQU', '', '0', '', '1', '1', '0', '0', '', '1472480942');
INSERT INTO `tyms_users` VALUES ('2168', '小强', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKLzUrLgvQicHCbkzjHYkialwPFD2xhQ4ItYqscYWuMgqtR6UFJUHosicOBTOKo9TQeLTIa9TFZxZQHg/0', 'oyP7DwCF4UeKsPfouE51aBml3TlM', '', '0', '', '1', '1', '0', '0', '', '1472481071');
INSERT INTO `tyms_users` VALUES ('2169', '子非', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4v1uEZgYrlohbsdCM5HzLAUbRH5zaWIKWHFfqRymdVqYGGI2e4bv24G1mmahfqXQfbyjHqsMZgoI/0', 'oyP7DwNIG1KYMnP9JuLN5UgZ4Bjg', '', '0', '', '1', '1', '0', '0', '', '1472483451');
INSERT INTO `tyms_users` VALUES ('2170', '半步天涯', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p33QfxUsbgpaFAyqM9Y1v0AfZiaSSiaaiadVYnmz8wicu7y3wgYB9oTwGIw5t1nWdR3f12jADaoMmZVqCrkCRbicPwWZ/0', 'oyP7DwPWhlkn22jAYs4zRmSOd3gw', '', '0', '', '1', '1', '0', '0', '', '1472489434');
INSERT INTO `tyms_users` VALUES ('2171', '一次就好', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ta3CMf9tESN24jew2uMyJiaGwNkaw1ibbJavFbEQdTAwHzNuy63icdRlUIdllwWyTib1gvxf7DTUicY868mjNZFMqu/0', 'oyP7DwHm3hh7_fY8Iz8SsuaoS3sc', '', '0', '', '1', '1', '0', '0', '', '1472494144');
INSERT INTO `tyms_users` VALUES ('2172', '王冬', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2SXt1stibISdxyo8pQicGY2xxBia1ibwgPfOITcBTOyweKdxVuW8UTibbyFW8bmc9GUUZ2k1DiaDGl8mtw/0', 'oyP7DwL0hLx3GGmT-UOS0f1Js5-k', '', '0', '', '1', '1', '0', '0', '', '1472518574');
INSERT INTO `tyms_users` VALUES ('2173', 'ziiying', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaz4zqFXm0cguZnw8bGAP3iaFKzkK7iaDpffRZt8vRREvVfpygYV9ET8hCnl4YsPg3MpW68bxuoVdbN/0', 'oyP7DwG0JjcwAbVumB-8mrK8gHKQ', '', '0', '', '1', '1', '0', '0', '', '1472519841');
INSERT INTO `tyms_users` VALUES ('2174', 'Ben', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlDYGQ67gskbSibO1K0vLY1B1fuqqVpFzNokJ5HrTia9LGbXg4wibZef7zoQIbN4dODNnIoqsjDQBBYW/0', 'oyP7DwD-JUZnO4Ghw_J-uYpZ7m8E', '', '0', '', '1', '1', '0', '0', '', '1472520961');
INSERT INTO `tyms_users` VALUES ('2175', '广州梁朝伟', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2buHiacTAIphrZiakwnVzDO2XGrbjFbyWzGQx6LPOyYP91nEFQelQ3PC0ghd47d5Um9LiaNiaV7Y6KPaJRYNTeb4Via/0', 'oyP7DwBCVaeCxSeSghf8xeTAAxpo', '', '0', '', '1', '1', '0', '0', '', '1472521317');
INSERT INTO `tyms_users` VALUES ('2176', '姚堂兆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELUHkUGhS0h8icRMOGVvPe3OGCiar3omLsJWakldnhIyP6dkqLaibF2wdb4mEIGQ0GzMMOUNRXOTvzd/0', 'oyP7DwM7bbV8ZvrA6gjifZzLx0cI', '', '0', '', '1', '1', '0', '0', '', '1472522154');
INSERT INTO `tyms_users` VALUES ('2177', '洪涛', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4rHyKPUcLkzVhfW6482Fib9LD9Dp7jvOIsfBRcI904Kr5ahKktOEYTcD02FuMmuKSHLtDEviaB1bG7/0', 'oyP7DwGoDMWujWSYfHrZLCfdOT8w', '', '0', '', '1', '1', '0', '0', '', '1472522520');
INSERT INTO `tyms_users` VALUES ('2178', '极致', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eOJGkgs06ytYVyb2Z4icYfQlicaSFv8pFLgiaXGBT5Sbt5ibdY7PlBHY0licPVEUMdbFoLIqr7xbCFGQy/0', 'oyP7DwH9LOWiOULq65zPSLEruL5c', '', '0', '', '1', '1', '0', '0', '', '1472522608');
INSERT INTO `tyms_users` VALUES ('2179', 'lanyu', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKYOoR7Z6c8gic6ia1ESCH0Fs2N1y1o645NibRYjonswMoVPmo45D3D8IXRt1soNupE4qybW1Xb9zWx/0', 'oyP7DwNHqbn89S8lLKtVCPYJ-U14', '', '0', '', '1', '1', '0', '0', '', '1472522963');
INSERT INTO `tyms_users` VALUES ('2180', '攻城狮', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1ePRPJw1aUBO57MJLvNzMBAAVHicVfdgGVPr2cLZLpvVppk8AHvcx6ONatWndKsPIf37bN5n4s4ZEk/0', 'oyP7DwMJDYGQztS_XuJ19kLI-VHY', '', '0', '', '1', '1', '0', '0', '', '1472523238');
INSERT INTO `tyms_users` VALUES ('2181', '宋军', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK4QhFPyhKKOCokIzLsNiby4OC0UuTibffibKel0EK6nKo1HHySu8p0vhF18FR2E4yGy9ygaCZ5pk9kag6037xDm5FK7Uw4EXicWPQ/0', 'oyP7DwB7VefmbR9sB8hkIGnenfaw', '', '0', '', '1', '1', '0', '0', '', '1472524244');
INSERT INTO `tyms_users` VALUES ('2182', '刘鹏', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayvmsMdlkEgp0OgTspV7sSoDnmqlgLhXK9koSGicWyjT5d3X4RBOAdoju28Z0Kf76YPGibU9ibpBzOy/0', 'oyP7DwMM1EBdZgU4_lkXtcCWR2uM', '', '0', '', '1', '1', '0', '0', '', '1472524623');
INSERT INTO `tyms_users` VALUES ('2183', '海阔天空', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELibsoJpPYCcBORPr0Qxz4Wst9zW9hu36DqzgrDaQXIdCAYHVE3BE7RkICcCnHdUehEPYfURbiaiaUKg/0', 'oyP7DwAYqlQ4KzgdXIa6eAQSOh28', '', '0', '', '1', '1', '0', '0', '', '1472524983');
INSERT INTO `tyms_users` VALUES ('2184', '张国源', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1aA67McCWQbUbP5nro3dk41MEfpYwHfibbYFwibF5npjxfNvEPXB8rI1ge6COVl9epqxhDcPeQ8SOw/0', 'oyP7DwOw-7wy2fOzkEQiNvzDC7nQ', '', '0', '', '1', '1', '0', '0', '', '1472525240');
INSERT INTO `tyms_users` VALUES ('2185', '步履不停', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eHK5uFIqGoJn4myy7GNK8mkCsWeRI9zjmpSFKP3l4MteaBQAE1UCMV1iaFXh5VA1KwwJTOJpQPtnc/0', 'oyP7DwAbVgRGzyFcMCpcOmg7cj5A', '', '0', '', '1', '1', '0', '0', '', '1472525548');
INSERT INTO `tyms_users` VALUES ('2186', '王宇', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1yjeUhngAnSAYTkp9TAMURIdRLnbFYtzrkbow0AhNIVJpxtibQMDoMnNnOgl5Ytfx9dpgHvcib7RrDHOEuYwXIV0/0', 'oyP7DwPvM5BjmI9gbYcgaixj8-Ys', '', '0', '', '1', '1', '0', '0', '', '1472525663');
INSERT INTO `tyms_users` VALUES ('2187', '郑秀杰', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLASV8JxiaSR7WUiaBYuRoFcQcCQ7MLOTtFQg8icLu06gKJUOJo308ricmk5ogn9SLac2ibib9uicahVoNb4Q/0', 'oyP7DwDJBnyrYQLnHWQUNLhZHkdE', '', '0', '', '1', '1', '0', '0', '', '1472525959');
INSERT INTO `tyms_users` VALUES ('2188', 'Harry', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM798GFXhVrRmYbicTcH7mvLRAXBvN36iaGMGIEh5QPkSicPm0VX3aYLXH0DTjpx9nzATHZK5mbF7ZWfR4Vhbn2okPZ214CfzickPpI/0', 'oyP7DwIyOTTN4PUykfL2bL_XOe-Q', '', '0', '', '1', '1', '0', '0', '', '1472526528');
INSERT INTO `tyms_users` VALUES ('2189', '品茶人生', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0zUNdryAUAS8gtQW3g6T8VrCFMu51KjIgUytrgibWgpIXR548CWHA8AOm3gf9jncTymQEuic6hGgia/0', 'oyP7DwEFCCGlwhis-BDYlXWPZGAY', '', '0', '', '1', '1', '0', '0', '', '1472528713');
INSERT INTO `tyms_users` VALUES ('2190', '南', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4YEQItibxiaP3ficg53cRnHbRZWZ7ia57OQMRMMRXWXjV3T60LCP73AbY95KB3gOmAKuR5r3d7V0sPaHMBfKbzZ1dfqBVeL2GTS9Q/0', 'oyP7DwAGZn6BN5wxWiLWuNFx87Mc', '', '0', '', '1', '1', '0', '0', '', '1472531306');
INSERT INTO `tyms_users` VALUES ('2191', '球球', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELBoUd8huVj45uXyeKJW03WBv1BGcyuWCcgzZ0883yEdVBVIAQu4VHnS2aX34S7t9CjWrf39qLwjw/0', 'oyP7DwPVxxOZB8xdZqtHcjt6pfAg', '', '0', '', '1', '1', '0', '0', '', '1472531632');
INSERT INTO `tyms_users` VALUES ('2192', '刘强', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJhnGzGDysytNiclA2v3oJtkbnv8kFJgLKPlMx4pmDsicic5lWpq9Vsl2ichoibV5mo3SnXfsozRhO7tlA/0', 'oyP7DwDLFB9al9OH_HzlJ2Uajd0c', '', '0', '', '1', '1', '0', '0', '', '1472532026');
INSERT INTO `tyms_users` VALUES ('2193', '乙瑜(Bruce)', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlDTULbzIrMV4Srj2uhoI5BBtTqH2DGiaK1FIMmhONibuh9UyVdWa6QnxxmUuEPyftauIPxicDNmqClK/0', 'oyP7DwEuCINpnzMVXvJ_byarpQxI', '', '0', '', '1', '1', '0', '0', '', '1472533154');
INSERT INTO `tyms_users` VALUES ('2194', 'QQ用户', null, 'AFD7D92AE7AA35633374B05E83AD1877', '', '0', '', '1', '1', '0', '0', '', '1472537814');
INSERT INTO `tyms_users` VALUES ('2195', '区小锋', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6v89h2ID5JLHWCcBbwDqzVnsyQQldo5viaa3IZvicvnzXSRaYibnJ7w0bx9EE6gOgG816k2iapfctrRvz1YRW1PEPG/0', 'oyP7DwNTqI_WeVArrE8slUXAkyAQ', '', '0', '', '1', '1', '0', '0', '', '1472537947');
INSERT INTO `tyms_users` VALUES ('2196', '夏前程', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA0NbDA51FVibBOq55FQW0VPwo2U4MZaEgYzibfHlgGbeXibFaR2aowmGdpppI5NVpEr8GjibPaMibvGQQ/0', 'oyP7DwKMLCi9xPgmeXH0yuUCNSTY', '', '0', '', '1', '1', '0', '0', '', '1472538291');
INSERT INTO `tyms_users` VALUES ('2197', '李杰-佳境传媒', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEEk6E7pibt4KTRKvbcUbM2ibPjOg8Dg9KETiawlhnicI27aVBia7VR1K9ib5ud4ZMuIUA4ltarVRLXLgXj/0', 'oyP7DwIpirsDPjNlqI5bzsQKR_X0', '', '0', '', '1', '1', '0', '0', '', '1472539194');
INSERT INTO `tyms_users` VALUES ('2198', '&nbsp;', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfiaz9Q2UbicJKp3hVhiaBYdF1VjONicc9mwwakqibW3uAEmjoXuc4bIWLQPbO5I38hGxyS4ewslvgtQHQ/0', 'oyP7DwKyRya-lX-3_sSxkM2SZP9Q', '', '0', '', '1', '1', '0', '0', '', '1472540287');
INSERT INTO `tyms_users` VALUES ('2199', '猫使', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPLnezJLkbwmR7fWGAeNoGvXQmWyg2nzHetmx22IA0dvX5MHvCVkDUcGuk832eNA2bAndaHlbog3/0', 'oyP7DwBgLXeHWuIfg-pq2d3eI5uc', '', '0', '', '1', '1', '0', '0', '', '1472540826');
INSERT INTO `tyms_users` VALUES ('2200', '吴阿琼', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1smXTnTYN18DNicYtBbN9REffia4cWmmVu6eqXWyAW23ZejIKiaZ11wYpPIjKN9f3Nfs4kgDiaib7d4gC0fOmZp6guO/0', 'oyP7DwBkCtKMCzl7DTUtk8BuIdfM', '', '0', '', '1', '1', '0', '0', '', '1472541782');
INSERT INTO `tyms_users` VALUES ('2201', '', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5Hv8DGY7tCLtVB1GggaP647HUSI5ewgFPuwzacgDM8ibpYjn8U7Weu2yZTvcp5ptD2xmN06wcZ2llaGibtmw6jeX/0', 'oyP7DwBx9OTWGvhO4dGVKtZW0HFY', '', '0', '', '1', '1', '0', '0', '', '1472541790');
INSERT INTO `tyms_users` VALUES ('2202', 'A0运城天天电脑13994888461', 'http://wx.qlogo.cn/mmopen/y4ibhUzTEvX20tYau3vhvia7PmwOJCq5ormCX7WYtm7Jb917laeP8WiaWnoHFNRTIvt2ud2OYpsZMP3yh21kWugb7brR1Ja2z67/0', 'oyP7DwGcvNyah5O1m3XgJVmh9xVU', '', '0', '', '1', '1', '0', '0', '', '1472542678');
INSERT INTO `tyms_users` VALUES ('2203', '黎刚', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPHXYe1cF6uASBjfFEWckEj8mibrKGXZX3U0GiaZFykutLicvicJvvqZzXsI1VDawnWia9y5Ez57KETYk/0', 'oyP7DwPVS7ZWNx6GddMvi5z2J5uQ', '', '0', '', '1', '1', '0', '0', '', '1472546029');
INSERT INTO `tyms_users` VALUES ('2204', '飞ྀ̥༗鱼᷃༾༻', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5DAKdcRo76zON1zaFMn312OOmcO41ghRIR1hJTBQ7kpYDvKmElZb8NgMuGI76ic3QkK26JKiadIVqcycd7fhKpmT/0', 'oyP7DwGNiHdlw7v7YFTBMrQUiXkU', '', '0', '', '1', '1', '0', '0', '', '1472547759');
INSERT INTO `tyms_users` VALUES ('2205', 'Tensen', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cDILnSNkF1nIAMHM50ywqKFhcPoMPPC7jdJn1Edvrr0Th9mSKUA2Yh2A1Z5h8dV4OKCTQP00Xyc/0', 'oyP7DwCGlbUHuOY_KkmZQ2oNRKZU', '', '0', '', '1', '1', '0', '0', '', '1472548242');
INSERT INTO `tyms_users` VALUES ('2206', '曹大排', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBNsmWPicaoRmWWxOHVcwOxtWsWnQ8r0Lop5QVbBLk8efvR3ol0RGvgFuZR5ibFX6rCWPyvfJhG1XkQ/0', 'oyP7DwJFStOuJXRivR7r2dcNp-sM', '', '0', '', '1', '1', '0', '0', '', '1472550117');
INSERT INTO `tyms_users` VALUES ('2207', 'GuoWanbo', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKzTnUUvtxd4YvVr8rbtfoLQvEiczDtlWXZP6F56BNeZ6lwhosNuUfrtlRFk4ehPXDzazicfVu9HK8w/0', 'oyP7DwJHcPm-ioH9mZhlBOifFGyY', '', '0', '', '1', '1', '0', '0', '', '1472550553');
INSERT INTO `tyms_users` VALUES ('2208', '王汪汪', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3MP4UVz1hpMlQR2iaibbAdRYPKlA4eL9ibL2P9w58pmGU8q2iaxvwYS1U4hIgGX80tGiaSKgqnHIz3pg/0', 'oyP7DwF8WDehOwU6A-0TDUBN6ceE', '', '0', '', '1', '1', '0', '0', '', '1472551985');
INSERT INTO `tyms_users` VALUES ('2209', '邦达中缅物流-唐富瑞', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3u0t5ZWssibP9Imv15BPKZWictkesUuoJjUEbpnXiaubzXLC82tavNS4IVaQTjL9F8IhiaXT86G4N5eiaIoxzw9c2icv/0', 'oyP7DwC99iR9Ix9D7VYI8A-bzch0', '', '0', '', '1', '1', '0', '0', '', '1472555458');
INSERT INTO `tyms_users` VALUES ('2210', '一言不合我就闭眼抖腿', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0Sib4I7jWw1wMCsV8fVo1ibEAv9PWxpvabYU88bf5dHvSYjLl8Nlj5SzNUl23NyYn3vHSqK1VUDl6W/0', 'oyP7DwFezZQ86Tr5C-aHwfgQZBJY', '', '0', '', '1', '1', '0', '0', '', '1472555769');
INSERT INTO `tyms_users` VALUES ('2211', '可为', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKTOhXfJ7CBXnr0AY4cp0ZY8EVDKk0ibUbX013hnEDqTDsxMKDg5p0ibb84LZrXMYqOVrDl6cpZNU4g/0', 'oyP7DwFiU8WR-pFHmrNwQkVH29wA', '', '0', '', '1', '1', '0', '0', '', '1472564360');
INSERT INTO `tyms_users` VALUES ('2212', '丑八怪', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPgj1hpnlBbLyWcLUicSg0x329UqibibSBN0geONickeEPfYfe3biaicp2Lrak8u50TQorEOxnCs1Re2XX/0', 'oyP7DwJA7UMxnky75DP-pe2O6OaA', '', '0', '', '1', '1', '0', '0', '', '1472566694');
INSERT INTO `tyms_users` VALUES ('2213', '龙永忠', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5td2bzq5p4EqRibYwePr7YfsqkiahYuS68LZfibvc7XyQTZU9S523j6r3LDfibCOjwkHgfTLOj8BeLHUXSXjfPkm3g/0', 'oyP7DwOlgIEiQgpwLpq0iU8calPs', '', '0', '', '1', '1', '0', '0', '', '1472569399');
INSERT INTO `tyms_users` VALUES ('2214', '肖锋', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKWDZicCzwLWKLXAFX7z7QGic5fcybTY08mHvgIcko5cgqXYeVZMPnzwUopQlia9qly5E2iahdL7n7icicw/0', 'oyP7DwDJSnvL33320jD9-6mpNwgo', '', '0', '', '1', '1', '0', '0', '', '1472599957');
INSERT INTO `tyms_users` VALUES ('2215', 'QQ用户', null, '4BF46A9A4B3B301D87E3893BCDCBB164', '', '0', '', '1', '1', '0', '0', '', '1472599968');
INSERT INTO `tyms_users` VALUES ('2216', 'funtee', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM72bGvw5DuQhibichuFPGf547akjCbRFickw1yg0qKZW6NicQFFtOib6ibdMibziaaaWojoOBPdFibHEnmTHZw/0', 'oyP7DwE0PMmLZONGNQQPyYCjYw6I', '', '0', '', '1', '1', '0', '0', '', '1472604476');
INSERT INTO `tyms_users` VALUES ('2217', 'Rikuo', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3Lt33ibxX24E11aNJIC2LKZ9cQIM7Xu70nSgnT62OtJ6UMwk2frH4SUuQXn29icjaXuVssxJZrOe1w/0', 'oyP7DwFsEdCFDYBeA_xB_4IbcIrQ', '', '0', '', '1', '1', '0', '0', '', '1472606299');
INSERT INTO `tyms_users` VALUES ('2218', '大象不会飞', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4khrH0nmTTstvLBeR1xzVZFS6E6I4RmrFWjGqNXHic5FibwU6mbqR7U2qZIBdk8xSg9RtFDzyAscNgLcM7kDicNdGchwicLPjsmicI/0', 'oyP7DwMB9S_ci2BfefR7N-iiTPKs', '', '0', '', '1', '1', '0', '0', '', '1472606627');
INSERT INTO `tyms_users` VALUES ('2219', '花文波', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qra7eMteKmMsBjapHZpj32CNLEuIFKylYDKAPh6ia5REdlvGkHjBMVvMBc9BDU3Wwiaw8bzKkTTx8UPk/0', 'oyP7DwFuYDvQFoFCRgyZSBLA7zKw', '', '0', '', '1', '1', '0', '0', '', '1472606916');
INSERT INTO `tyms_users` VALUES ('2220', '桃之妖妖', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfNXRibB90neNxkLiaGia08JD5Ymxslvec0Heeq5ejy7CSdc6WhLutQurp4QbvZDxOuia7bA94T1MGKgqfsm1vdO5Op/0', 'oyP7DwELmY7yKzmCQ44w4k-WloJs', '', '0', '', '1', '1', '0', '0', '', '1472607554');
INSERT INTO `tyms_users` VALUES ('2221', '微微', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0VxRrlQLWX6zYzlIYIarxwwia9H4Oud9Eyd3zyYvbb0QjDmZvcKfyHCmzLxHLogWGZiaAXwTsGO72ePZDxiaRLN9F/0', 'oyP7DwNVxIuu0GipA5wQ0L4bDlbQ', '', '0', '', '1', '1', '0', '0', '', '1472607806');
INSERT INTO `tyms_users` VALUES ('2222', 'jack', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlD3gBmGYSsPbEicstKaAUlag6gMIBal3k5pMSbpN8s8ibxfcUe62319YSXS8HCm9aCOHtFE5HMS1mr/0', 'oyP7DwOJgoYLLhpEI3sxhwFCtrYI', '', '0', '', '1', '1', '0', '0', '', '1472610466');
INSERT INTO `tyms_users` VALUES ('2223', '孑贰.', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2AIVNnchqYgH4cyMoGicppxDfS79zvLheJjibtk4ex3FwCyhFIQF98OoAMYL0REicqFnicibzAjiaCicfOw/0', 'oyP7DwBTfvHZoYTC_2RPG-dPkzpc', '', '0', '', '1', '1', '0', '0', '', '1472611193');
INSERT INTO `tyms_users` VALUES ('2224', 'A. Galaxy', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5ys4z066ouksTsOcMXeM3iadiaqFAm5aJjKHuk6MZz9oUPq7xd7gdEuibicEMoObG9LIgl8wC5cVgejl/0', 'oyP7DwOvidEWyzFAHG3Jy3RTOQ7c', '', '0', '', '1', '1', '0', '0', '', '1472611716');
INSERT INTO `tyms_users` VALUES ('2225', '何德胜', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdSbrpJ0nQ0LhKj7QJMeDNBicfmQGWzIzaYkqUKfSCbticxjh2g7y8m5uhpzRwqicrTKVibsJuOVzKRoBAXqL6muqyd/0', 'oyP7DwAU_kmO60anNSnH7Ppw9aSs', '', '0', '', '1', '1', '0', '0', '', '1472612447');
INSERT INTO `tyms_users` VALUES ('2226', 'Johnny', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0oZCrVng4zGcWiaZX7ZyOHMvMzhhvh7RfrwQOb62Ciaia1L8We7IO0bBVk5HTQduwPbibLm7IaT1I1j/0', 'oyP7DwFZwfU_LVzq_A1laW7X07pc', '', '0', '', '1', '1', '0', '0', '', '1472612788');
INSERT INTO `tyms_users` VALUES ('2227', '王石刚', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UIHicQsH28dwxvQNXoOU2vCtA0PoqE3deEiaVwjdxf3UD0yuBdjmEOZqgaAdQuBBjdmwsTUr7ztd8H/0', 'oyP7DwDGajkQ2eHpJoi8Xb4yisxQ', '', '0', '', '1', '1', '0', '0', '', '1472613580');
INSERT INTO `tyms_users` VALUES ('2228', '淘宝京东等你一起happy,购物推荐找我', 'http://wx.qlogo.cn/mmopen/LibNrIz6OEOq9AHypbK1Gpe63pVyzGxTepYCEZgmv56jqKAicLPE3I89XP55XgicnouaoxhlFTQNHNqyNktAkugOwBWiarlLJR9u/0', 'oyP7DwDC_uKuOFBipolv2i0-mU9I', '', '0', '', '1', '1', '0', '0', '', '1472614518');
INSERT INTO `tyms_users` VALUES ('2229', '穿越西风带', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7wauEvR2lKkEUcNVbP73SkbXS5P5AQTkaPE1Ob4Vb6ncN4f3DbnBffTAx10L9kicIdMH4f64fy2104X4NDNdNM2HR3ibIicUHpKA/0', 'oyP7DwHq2WU_kEEyXc70B1s4CEQQ', '', '0', '', '1', '1', '0', '0', '', '1472615296');
INSERT INTO `tyms_users` VALUES ('2230', 'eric', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL51HibtP8IasXOuc3wuNe2icUfC2ms2SOl1NWdOTXcM58arXVUgRwaSflDm8ozwbrIIjw1ibRQI9JFBDtiaWAGPwpdic/0', 'oyP7DwLxna-KWnWSlSOxkbvzSaXU', '', '0', '', '1', '1', '0', '0', '', '1472615425');
INSERT INTO `tyms_users` VALUES ('2231', '高振亚', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia2ZlbLrT6Q5VFTQA58jJwBuFuviaPNBsB6PE9AnD7udI2U2ZCP3Npq92efhVBNorC353IME9pI3U9/0', 'oyP7DwLyfnRXxREub_2GUUEkJOL0', '', '0', '', '1', '1', '0', '0', '', '1472616563');
INSERT INTO `tyms_users` VALUES ('2232', '好奇宝宝', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKHN1M4j7SF7ZIJrw0EaFxdI6gNv5PC1fZ7J3jI2egvererwl17VVKRiclAHB8xpYx8gYicpLNZ5A0/0', 'oyP7DwICRX4xxye5G6-Vh0rRusKo', '', '0', '', '1', '1', '0', '0', '', '1472616566');
INSERT INTO `tyms_users` VALUES ('2233', '胡泊#约学车', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2zOWFEm7tDlaYoCm389FZdwCahPQUu3DAwWRFd9u4J6UH4CY85djv5ic1fA3JqP45zrdRx1BExQ6w/0', 'oyP7DwOxvHfPgWaxgsO-Ec28Y2UQ', '', '0', '', '1', '1', '0', '0', '', '1472617117');
INSERT INTO `tyms_users` VALUES ('2234', '不愿透露姓名的王阔富先生.', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia5lh27vicPXmJ95pphbBXuRV3RBibac0sMxyl2QAqUYN4jjkfyqSRXlRTicPq5gzDJudEOcicoeic9FHr/0', 'oyP7DwCM5TNOa9tTT-qQf5_SXQKo', '', '0', '', '1', '1', '0', '0', '', '1472617133');
INSERT INTO `tyms_users` VALUES ('2235', 'A半瓶啤酒 Orz', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEG6S4zCv9dKpoT5Izk2Uu9AqFKHwbfGXG86UK4Ivzq0XKf8Gmc20VTx5ficBep9vpohXuRfic5QesA/0', 'oyP7DwGaN9S0AnT1j3_abNS_I7d8', '', '0', '', '1', '1', '0', '0', '', '1472618291');
INSERT INTO `tyms_users` VALUES ('2236', '梁子', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6vEkRAkXXWgtxuIcbickicanv7hwkhpnLdeCPSrwVCtwqQysOgGCLC70jjO63QRt7icKP8dWz8mNzQQ/0', 'oyP7DwCMLfzZHjk96r7t_ekggr20', '', '0', '', '1', '1', '0', '0', '', '1472619406');
INSERT INTO `tyms_users` VALUES ('2237', '孙肇旭', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6BbArq27hgvpCtlr6roSxbO69tj91keLdOVlQNrKicZdJkTBSQSmKaj6X6icWIXF27q5FtNs63Iib7g/0', 'oyP7DwNJUIUnqwFnD6ZOVep720f8', '', '0', '', '1', '1', '0', '0', '', '1472620064');
INSERT INTO `tyms_users` VALUES ('2238', 'Danier', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIoH8XQWd9vv0BfpicGZNMaz5Uu0FNLrhmhl4ahtGticaX1xBxEZe8Na5hs9iboFnEmZV50aL4hYEw9Q/0', 'oyP7DwEbsyPx4IDunykWWm_KX3CI', '', '0', '', '1', '1', '0', '0', '', '1472621041');
INSERT INTO `tyms_users` VALUES ('2239', '酸菜包子配茅台', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1iaKbD9ONDRTb7Zy3B5F7ib9icjIFQiaMYBT2bkTrmiajjJE1tJpoFnnIRhWK0Kx47lJajmW8iboB4pED/0', 'oyP7DwMjzg-1SKPr7wYAzE2CuvCQ', '', '0', '', '1', '1', '0', '0', '', '1472621325');
INSERT INTO `tyms_users` VALUES ('2240', '罗小六', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCA95Y01OsHJLMG103UsiaPfJ7CKGctNAsuib0ny0RibQNiac5CoIaZceKyK1DOicuTS41PVGlZSTia5qlA/0', 'oyP7DwHen-zk8Tac5DKjF9_AO924', '', '0', '', '1', '1', '0', '0', '', '1472621616');
INSERT INTO `tyms_users` VALUES ('2241', 'Miami¤明', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaygStwKdC2iaMgvHPrbKibSXYxQSezBic7cunAK5DekWKXibL3aXILXueMqia1XIt11uXTQibicPp3J5kUa/0', 'oyP7DwHgbjeKftETC3y6aMP69S7A', '', '0', '', '1', '1', '0', '0', '', '1472622180');
INSERT INTO `tyms_users` VALUES ('2242', '琴心剑胆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5td2bzq5p4Eia4BHvib6P7MUltUVia1sObSADWqYfleZ01D3vaxOZu9u89ra6icD3P48UMRpUnKVrU0ib9ZUceMtGHd/0', 'oyP7DwLV-q31EzyMTiVqhOj1bY1U', '', '0', '', '1', '1', '0', '0', '', '1472622536');
INSERT INTO `tyms_users` VALUES ('2243', '辉辉', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7qmLlkDcib6FzzOFMlXibT92c7Lx1qcWmC7zAOBF3icIswqDwT62ribFkIz6ATePjicHLogGl7M6lVruwnwtsibyYhUM/0', 'oyP7DwK-9S1GvQHPToPD0aD5Cl7o', '', '0', '', '1', '1', '0', '0', '', '1472625069');
INSERT INTO `tyms_users` VALUES ('2244', '曹凯', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eButqcLh9tzuuNnDsrUEapicxdr2W6VN5MJ2UsedRib0LM4ZJy1xQhXlPbUIeNLVGzb6DIDMn1Shyw/0', 'oyP7DwNryESMqNOsjIKg-vGtfMG8', '', '0', '', '1', '1', '0', '0', '', '1472625420');
INSERT INTO `tyms_users` VALUES ('2245', '雍松', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCYm8QuMrOicy0I4rWI9WyFoS2BVXrYu3B9U3tNFyvXQdGDKZnhKKdggicb5faXFBUKllm21ezCPfsw/0', 'oyP7DwJRuFUvbJhE6ESF6BRniKRM', '', '0', '', '1', '1', '0', '0', '', '1472626739');
INSERT INTO `tyms_users` VALUES ('2246', '松子', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIwRuZLOPusznYeTIUXQ4eUy49TWjBkrMwxfyPTGBqJI7egeeLv8hetMjJMYrlia6liaBzibWLN1rlDA/0', 'oyP7DwEMfo-VHmtxL4lQazoZuVWA', '', '0', '', '1', '1', '0', '0', '', '1472628997');
INSERT INTO `tyms_users` VALUES ('2247', '静观日月', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIlJP4ibhpdzq5MpV2k1IMlhEic24jJKDOibDOicAmqeibhJ6KWwzkriaoUBzO0jaEQTcoNVuichVicWD42lg/0', 'oyP7DwNAZy7B7pFbMQur8zUEEfYY', '', '0', '', '1', '1', '0', '0', '', '1472630457');
INSERT INTO `tyms_users` VALUES ('2248', '瞉音', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0WcbInPX2X2JgsdY1uXlWvH9dO2kuXJ55br1kY3TiaWviczgs7ibZqwn5Wf1UXdv4YtxJTaZgCe49t2/0', 'oyP7DwB93PmtuuOWQvjDdP62uxns', '', '0', '', '1', '1', '0', '0', '', '1472630930');
INSERT INTO `tyms_users` VALUES ('2249', '杨作亮', 'http://wx.qlogo.cn/mmopen/REKRONqwCsibicynfCRbLibMUMjtBuWt9YiaTaBfokBy6xUsvBcialHick1P4lnyZnhQrqxTcxiafgjuBFknM5GNjibsgzPgP4mW4rn8/0', 'oyP7DwP_MWLwA4youjwvjU7tDRJM', '', '0', '', '1', '1', '0', '0', '', '1472638684');
INSERT INTO `tyms_users` VALUES ('2250', 'Erxun', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0rVpoCVAdS3nzyOrRN7ZOibSIR2NU2a9bSuHwYp497TAEUlV1icfktBIyJQFtUu6gRrrSrIziaUgMiak4007tSQG93/0', 'oyP7DwL0gntEK0DCrc9LZczSz510', '', '0', '', '1', '1', '0', '0', '', '1472640134');
INSERT INTO `tyms_users` VALUES ('2251', '郭斌', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0djRIoLG6xuaCUUgSMaXmKMXHEJMF8LmyIpYAicicsr6KZz4ibWWHT0OMESYrxNQNdvicMS0J05PB4bg/0', 'oyP7DwNdcZaf1ErT-AL-fqXZ2Ui0', '', '0', '', '1', '1', '0', '0', '', '1472644574');
INSERT INTO `tyms_users` VALUES ('2252', '飞扬', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6SHJQiaiaibpoaIRbEQ6xXv1h5amOjs7l8picfXnhib24pZ5mCX2emaiaKbySC6jf8jlliajxvwgrehtsGQ/0', 'oyP7DwPlYX-kzkTBLS-v71il1vYw', '', '0', '', '1', '1', '0', '0', '', '1472651416');
INSERT INTO `tyms_users` VALUES ('2253', '20531665', '', 'oyP7DwEhf8TLuDrzkeMUPdlk1PIE', '', '0', '', '1', '1', '0', '0', '', '1472655690');
INSERT INTO `tyms_users` VALUES ('2254', '子非网络 13574141305', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0e5kywicCog7BLLwHpsnmcO8gSyLOTfauicZzxjDcyyXYFia8CXMgtPlJh2kWj2U0fEJBW7kmWaDNp7/0', 'oyP7DwGRrq1UnoaSC4ypyBm4i-rI', '', '0', '', '1', '1', '0', '0', '', '1472658208');
INSERT INTO `tyms_users` VALUES ('2255', '学不来的浪漫', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfphJhEzMddbGwbWmt88tzU8smBWBvu13AsKlUJZFYnSLIhtUtcBKg9wxv1gpG3Ecsje3a1f6ptZQ/0', 'oyP7DwJSY9ZB3lB1JQSlvtUUr5OA', '', '0', '', '1', '1', '0', '0', '', '1472658228');
INSERT INTO `tyms_users` VALUES ('2256', '诸葛思清', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJXR3tF0KkKhWSibsYUskqyJvaVIWkK49nJ0KMiauGt7PVHbERXjFbZ77IibkPKHXAUVwJNJR7dBjEjQ/0', 'oyP7DwL-q9sgTvMF4relLxzV4jFA', '', '0', '', '1', '1', '0', '0', '', '1472661127');
INSERT INTO `tyms_users` VALUES ('2257', '呆', '', 'oyP7DwNEd-MT-M8WIR0kc3DT2F-4', '', '0', '', '1', '1', '0', '0', '', '1472689943');
INSERT INTO `tyms_users` VALUES ('2258', '社会小夏哥', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5wzib1b9Fu8NWSZEEaTk3V9kfGqfmXxiaOj8zJtuQuEUjxJO6FLa3YXbVayyrfOsEgR71XYYdJI4KM/0', 'oyP7DwMLbbKZhdPG4ovPouno6DcQ', '', '0', '', '1', '1', '0', '0', '', '1472692555');
INSERT INTO `tyms_users` VALUES ('2259', 'Lost Soul', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIUuiaOFWWsXz93RN2lxS5iaVibQf8MXxJzpwe4YSxjGCiaHLEvHFUQYH5U2O8Z445r5FvqXq22RywKNA/0', 'oyP7DwK_5XsgvV8Lxy6EM4w0L6UI', '', '0', '', '1', '1', '0', '0', '', '1472694356');
INSERT INTO `tyms_users` VALUES ('2260', '毛众', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeYNib5pCz2SytVNzKh4VygWghnvkqiaIhL1FGLPs1Rb0WpQcX24gNtPYcZzs9WCykEzuGDfqibOjFDI8ibBytB1qvx/0', 'oyP7DwOj_bDirQFgZvz8wt18hHEM', '', '0', '', '1', '1', '0', '0', '', '1472695887');
INSERT INTO `tyms_users` VALUES ('2261', 'South dream', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEL9N7Kib1d23knAPxpjLV9YLKt4vIVzXKqICn7quAZrBQGkaW46Nl7oIv6RXdiaOA6xRPKOlW9nBkY/0', 'oyP7DwNcIi0arUB3iW0pu63R0GDY', '', '0', '', '1', '1', '0', '0', '', '1472698294');
INSERT INTO `tyms_users` VALUES ('2262', 'ζīυωЁηЬīη', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEObMMcKkk7jF5iaCA3RFw5cpicV7bobCGc5mHMzO3LngVniajvk09uH5IrIic4eju0Hz741ibKruF7NYd/0', 'oyP7DwKFafQUaswxuDm3IbrkWGkk', '', '0', '', '1', '1', '0', '0', '', '1472699449');
INSERT INTO `tyms_users` VALUES ('2263', '洪励非弘历', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOhTLutqwcibtRwsdxiaLXcv46lzlINKzHN8yPfVxPdjHW92rVicuYmgwovmL8BSDia4yR5QCKxD1sRZ/0', 'oyP7DwCstjiybjDaEU-lC1J0lVpM', '', '0', '', '1', '1', '0', '0', '', '1472700561');
INSERT INTO `tyms_users` VALUES ('2264', 'Insiders', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCMWWxiaRepOnPticKHticNAnibaaNr05WpFyu3oBtwF7ZiahicV8rEr6un7ZYm47FLVTNUCoclial1rDjaQ/0', 'oyP7DwL77gdxNM_Dk5dN8XRBmkJ4', '', '0', '', '1', '1', '0', '0', '', '1472700746');
INSERT INTO `tyms_users` VALUES ('2265', '_康康康康', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0e1GZnNpjf1XoCRXJ5SpWq344L2LANqgufdLSuAowlTVZIiaS6pqianWy6CUGs18MPzQOGd74vWzsB/0', 'oyP7DwHdyyQEy1YxoCu5Qe2aUT-M', '', '0', '', '1', '1', '0', '0', '', '1472702397');
INSERT INTO `tyms_users` VALUES ('2266', '西华苑业委会（筹）小秘书', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3SDMREXRLiaiba0WWUd5I9yAnSTzplxQZG3YnLibY0nICqkSdXr2vH6qT0p78BewibUYT6fXEtPbmEe/0', 'oyP7DwKlaHhSpOzuL725b3gSSyNg', '', '0', '', '1', '1', '0', '0', '', '1472702803');
INSERT INTO `tyms_users` VALUES ('2267', '你在干嘛？卖萌啊！', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6PUySR0Y2qgIEsDltpEcicXiayssbLrrpdU09QXibCfkdoJhG35es3cuiajJm4ZVrRKGm3L4mDSFdK5768CgB5ibMpP/0', 'oyP7DwL0LEc8JxgBCQvjyG8oVOMA', '', '0', '', '1', '1', '0', '0', '', '1472704538');
INSERT INTO `tyms_users` VALUES ('2268', '满地可', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6CpGvgMSdLlW1khmibJwyewKmbdOzVqPpN7icQgq5zkea4KFpEU65RhCsLmwc5hnvkKr66rBiahJSAg/0', 'oyP7DwFZQR_i21wXrDtTENlCfeyY', '', '0', '', '1', '1', '0', '0', '', '1472705664');
INSERT INTO `tyms_users` VALUES ('2269', '光引科技™陈影杰', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCWdWGzcBwcf6p401ceutHu4ZDgalbjxvsFlQJCj5VNFPoGHYawibwDEgKoic1PgqWdVZeqbrbIAH9FB5XibbNpdfIXZFPicUKVawU/0', 'oyP7DwEpKzTIbmkJZCfDe2r-Aiw0', '', '0', '', '1', '1', '0', '0', '', '1472707938');
INSERT INTO `tyms_users` VALUES ('2270', '包师傅前海店小赖', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cschtpjWOoLKQFgxx2eCzGZMQqV5pyUYniaHia7ibup5SlnJRb0v9DJoKlEEZsEe9bN8parzFiaiaT1E/0', 'oyP7DwJEbOo89rDj1CC-v10PAhF0', '', '0', '', '1', '1', '0', '0', '', '1472709576');
INSERT INTO `tyms_users` VALUES ('2271', '爱在鹭岛', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCPJcRPb0O1Uia2f0ZADhx9fKPLdkWcobNHURwFHSrFXDOm9agWXnyD26l9ZeoWnicRl6qlgibMFIc9g/0', 'oyP7DwEGKAFRw-Hk7mYsecxdgbW0', '', '0', '', '1', '1', '0', '0', '', '1472709941');
INSERT INTO `tyms_users` VALUES ('2272', 'Billy', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCBlQNUgkLy6x6GmHDtKeQS3jRTJgKHHwHUVic1cicHq7wGG5cQcbRZic9dXeKxtInalgywUK9qT7OcA/0', 'oyP7DwBkakTCRTI0MihXELJOReBc', '', '0', '', '1', '1', '0', '0', '', '1472710536');
INSERT INTO `tyms_users` VALUES ('2273', '周偉', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ZV7faAtAa963XArJEAjL4FLW8IOGksM9K3HTptes97heVwH30zuCrdxQKt2UW3UBJFsSDE4NxpLAQBnbDIUfa/0', 'oyP7DwKEsNOtas5yyuxpeJPGUWdw', '', '0', '', '1', '1', '0', '0', '', '1472711078');
INSERT INTO `tyms_users` VALUES ('2274', 'A0_智慧泸州_张建', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAPa1lORiaRNtO767Q8g5CzpOKnKa5RUicaa1GIUpOHBDnuHUFNzaibGaoxGE4WxTlVwvibGAG7F7sSTg/0', 'oyP7DwJUVKRLjiBHHChAvLJ-XPso', '', '0', '', '1', '1', '0', '0', '', '1472711409');
INSERT INTO `tyms_users` VALUES ('2275', '懒人、天天忧！', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA6Ukk2nRgh3lu00ugViaJnoQCxb7Elm6JgUMko6tOU5E30QcLauLicuGuL55l8WahvKr1z1BxxQIiag/0', 'oyP7DwALi_Li1WqvY5ccnQ_dc7s4', '', '0', '', '1', '1', '0', '0', '', '1472712049');
INSERT INTO `tyms_users` VALUES ('2276', 'xwei', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEHUWwgJCfuEV5YP4zwpE4riaibrjIcPtXjDiafDa92NUDiboMZjyO171xoqNujFEh2gPZsBT2JpO1d9L/0', 'oyP7DwChKHI6NMOy-zVkq12AKCDU', '', '0', '', '1', '1', '0', '0', '', '1472712126');
INSERT INTO `tyms_users` VALUES ('2277', 'SCC茼&铜麻    ', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia77Nqh7vHUicia6bm7LiakzHpspKoKx2P27wHHFxcE3iaibWjOgVuz94ibibZ14vOlCrxfPSmUu1fSu9zKk/0', 'oyP7DwIvyoD7Svq0ZXYoPl4ovTas', '', '0', '', '1', '1', '0', '0', '', '1472714685');
INSERT INTO `tyms_users` VALUES ('2278', '单文峰℡', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJCfxpV7Nia0Mw3ORVBZvXcfiaDSXKBT0SZRh4vrbzjKFibSonIS60fnzQicOib5v0jnKIiclHFcV7yniacw/0', 'oyP7DwOfW6V12iCusFYOMX59ijN0', '', '0', '', '1', '1', '0', '0', '', '1472715164');
INSERT INTO `tyms_users` VALUES ('2279', '一个机智的少年', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEN396zyh828zfgqbI6v2fwIuzP5QibSe4iapU1SlbfwVoNnlKS6TtOEP2wdKXHrCIK3c9wd11kRsFr/0', 'oyP7DwDYaY4Cr6EQ97XQ8MbTHVGg', '', '0', '', '1', '1', '0', '0', '', '1472716391');
INSERT INTO `tyms_users` VALUES ('2280', 'xuxchen', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4plEySmb4ceILScZLuRuXBc5w2OSoGA1zEr5INNZZyC6Ln2f117QlyibhryhT6DicbRiaLvHQwHY63n/0', 'oyP7DwKbvhrtOQ0sRdF3Dy4OVYUo', '', '0', '', '1', '1', '0', '0', '', '1472716982');
INSERT INTO `tyms_users` VALUES ('2281', '勇敢的心', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIH1Z5Y8KpNzcfff4WXkAwPCzRMNg5lFXml7zrqHXn7xhU8Y34ic9E9FbwGCuMia9Z2IfXoxcLFZKuA/0', 'oyP7DwJ74Zv4YBZnRlGJjzkETe98', '', '0', '', '1', '1', '0', '0', '', '1472717155');
INSERT INTO `tyms_users` VALUES ('2282', 'QQ用户', null, '48CC0F179107F092AE0B957787F8CBEE', '', '0', '', '1', '1', '0', '0', '', '1472717777');
INSERT INTO `tyms_users` VALUES ('2283', '王波', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlK3zZFMbsgsic7EEh2EpsFD5YdGKxndPUOKExHJw6mO7m8ibaqCl2lac3kf1t32ndFIDHswrt1d2icC/0', 'oyP7DwH8IHRgtq0H2X--CHdj2T1k', '', '0', '', '1', '1', '0', '0', '', '1472719588');
INSERT INTO `tyms_users` VALUES ('2284', 'ORANGE TIME', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4h8GJmry9J3ibcXaEEM83kA9D09QGrOt7EmsDf2bTQLvVwVre5wIbSvCbKnhcI6XiaNSRicmicJZ78Mriaibx4KMf8AY/0', 'oyP7DwJB2dBodqfKA_k-keKEz1mM', '', '0', '', '1', '1', '0', '0', '', '1472719827');
INSERT INTO `tyms_users` VALUES ('2285', '懦夫救星', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6eLPaONA9jpKicCqOXwjM4XAuAia2nSPWAAft1yYY056FGSL8lnqAeKh5AOJreH2xZ55ibgKDiaj05NA/0', 'oyP7DwNY8AIMFCxUi83BBJ1G5-nI', '', '0', '', '1', '1', '0', '0', '', '1472720066');
INSERT INTO `tyms_users` VALUES ('2286', '星辉网络数码科技', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1Z3W2Kb0YMuRgu1O0z6tyo4vaO9mFicb9daO0NRHAQ4a2LaicMzpA2hhQdYYqCOMG87XA6LG9ZXQnj1KvR0BnrKy/0', 'oyP7DwGfHRcss8VwzqdiARMHxBEE', '', '0', '', '1', '1', '0', '0', '', '1472720318');
INSERT INTO `tyms_users` VALUES ('2287', '杨', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL2cm4rL8PuUQVLhP0XxJajibJe4XbvclcqYqRGZ8dZB1wKU4eRZGWQFegQibRyYFGcR0Rgqcsc7nKQ/0', 'oyP7DwIcxTUAyX80wleqpcmNeD8w', '', '0', '', '1', '1', '0', '0', '', '1472721246');
INSERT INTO `tyms_users` VALUES ('2288', '猫粮s.', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdm1SFiaLutdhvOtkqSYFXmhgfGFgHGbOv1ibSFJNicqKfWFSCibOoRnzNJR6COq3xfCm8ruhH237Pm9kl67uSWoFtZ/0', 'oyP7DwMsADRc1gF9YyqfNPvLkdJs', '', '0', '', '1', '1', '0', '0', '', '1472722020');
INSERT INTO `tyms_users` VALUES ('2289', '掌上中国传统食品', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibDicicOgMZ97NGxLz454lkBibm7LiadKGbziaOqh4vbLJj0iby2XHbgKqaqhXX4Eg3AEQznTG7FyXYkxa/0', 'oyP7DwK5OwQ_iuncC6DczZXQyhww', '', '0', '', '1', '1', '0', '0', '', '1472722997');
INSERT INTO `tyms_users` VALUES ('2290', '灰太狼', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJUzhNWNezWyWlKRO7rpKTXtia49Pl4bjfr4qa6MZntGH2D516kgdwuQsSn1hULYpozt93XgL3ibTCg/0', 'oyP7DwMetnd_NSzMherGI7zgKEpc', '', '0', '', '1', '1', '0', '0', '', '1472724096');
INSERT INTO `tyms_users` VALUES ('2291', 'Bít tất', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1ehNyUVrCGlv916xUaJlFTQReWEIu9OXkXyhiaFF6kz4eAgUfkuC7hRvs2dd0eot1IYMNyjP6Z59/0', 'oyP7DwOnW1iqOT4dqIxQ7u11Cmqo', '', '0', '', '1', '1', '0', '0', '', '1472728047');
INSERT INTO `tyms_users` VALUES ('2292', '黄恒文', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELomyavicn4Af5rmm4Tkgh9IloW8ayicK3RpwWIvGEuOdUibTCA0qQGLx2Iia9nR5ceffnLh9icHH8tyyg/0', 'oyP7DwHoSUG5JvpfeFBbfEskHXh4', '', '0', '', '1', '1', '0', '0', '', '1472730126');
INSERT INTO `tyms_users` VALUES ('2293', '路人甲', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfO9YtxLVVPv7YXjwQB6dtficXKhJUPk4ia4bwX0eW1eMBv0CLBpWvFzjge74pGMMAhI5SGTttqRf4g/0', 'oyP7DwDPpgSkm2BV3CVhAPIKAwdE', '', '0', '', '1', '1', '0', '0', '', '1472731149');
INSERT INTO `tyms_users` VALUES ('2294', '墨菲寒', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP24T17TjcibCNuqjIWfyLQaHj26cY9KmOqbW6If4MAw76GZ8oHmkBeZReOfPS4NkgfzicNOjXfk7dNA2iafYnFdnyz/0', 'oyP7DwFvlxghTLe_zujEDMSMdI_s', '', '0', '', '1', '1', '0', '0', '', '1472740500');
INSERT INTO `tyms_users` VALUES ('2295', '微笑', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKFbNGNOTMqIFxQkATJW8nNJpDyiavictIMGdBVRtDrTLlAXV61X4IicrjkPgs5454VPeV4WTzJZYMzUDFvlpIj2SgmfvRyYeEDI0/0', 'oyP7DwMU7npgBIlt0-W0GzlBwdQ0', '', '0', '', '1', '1', '0', '0', '', '1472741020');
INSERT INTO `tyms_users` VALUES ('2296', '午后水妖', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5AMlOqtHq9YWb8PKd8qJIuJ7dz54ZU8hiaHSjIichpT8jdRMKwZxHhg1mweGRwLnV4C5wj02B3UhiaDxkrWbYn2rL/0', 'oyP7DwO9aPtk17eVJfXv2fKhsPfk', '', '0', '', '1', '1', '0', '0', '', '1472743211');
INSERT INTO `tyms_users` VALUES ('2297', '大信', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0h78rlDboK7CpuwHd73eygrNf5XuibIib2YINxkNj724xU8GraIAZicjYydJUqAtJ0t0zRbxEfsLpLT1ckxB1Zz1N/0', 'oyP7DwCHNXcCKWVXvnzeyyb14Vc0', '', '0', '', '1', '1', '0', '0', '', '1472748114');
INSERT INTO `tyms_users` VALUES ('2298', 'You I Style 轻奢聚乐部', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2dDG4cORJ8cbibz9MHW6dqyibXmlF70G0z7NkfuglLFJ7xaaNiaXGU9omibxY2fKibb7Humzuw2KTdzbA/0', 'oyP7DwG9GIDKn8L2upb3lZFGRpJg', '', '0', '', '1', '1', '0', '0', '', '1472752843');
INSERT INTO `tyms_users` VALUES ('2299', '阳光', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDLQfrchryTLV7zApzZwbZN7O1icPj7JMQ5AZFz29dtJpLkVQWbvVFU4QB4MglKCQxoIY13yy0Sk9/0', 'oyP7DwN_GUHX8iiER1vOEclXpAO8', '', '0', '', '1', '1', '0', '0', '', '1472773872');
INSERT INTO `tyms_users` VALUES ('2300', 'orz', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia6u31Mjwicw9lOhOicRicuf9ZRALtrVGKfBC9cx1n7cZrYBTZy2xJXIgvNOZ1liawscAvRQ9GCCgLHkE/0', 'oyP7DwM0b_i4j7hVdRmQxd2zPLiU', '', '0', '', '1', '1', '0', '0', '', '1472776108');
INSERT INTO `tyms_users` VALUES ('2301', '', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMT3nH5HnMiapVq2ibIAdtTXHahhiad4LvjhwpW1lGuHP2Kud0AEDbiagUepyBlVZdQsTht87QiaYia40U/0', 'oyP7DwJq6dShvmTV0tXompFTJDFU', '', '0', '', '1', '1', '0', '0', '', '1472777844');
INSERT INTO `tyms_users` VALUES ('2302', '雪舞空灵', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlIgP5iaA8YSNLdhibW4RSLGo6z27yLxCPh24m8wslTfUHAP7ghHoGGicLT5Dsic2jVfYYJMD2nicX3lU4/0', 'oyP7DwCiSHXxN6jEnxOdEFFfgVvY', '', '0', '', '1', '1', '0', '0', '', '1472779776');
INSERT INTO `tyms_users` VALUES ('2303', '陈国科', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI8D5Byq33YsaaNZo9C5sXeUGHtfKqsMibUf0RLr4XkFLj7Oo03E3CC5oicbksHBVy5gzGaReWVLXRw/0', 'oyP7DwP9RybJTqB0jSTyDvPqS4io', '', '0', '', '1', '1', '0', '0', '', '1472783097');
INSERT INTO `tyms_users` VALUES ('2304', '桂刚', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eKYNNuMMMMnlZ7RrYDzN3L2FiacDnFl8Ox72DEfoRibjaRibXZg0qmnUZLl2ZGrjQ3MxpUicbXljFCaic/0', 'oyP7DwDaX4fSLDF4l3ysl7xs8GUQ', '', '0', '', '1', '1', '0', '0', '', '1472783751');
INSERT INTO `tyms_users` VALUES ('2305', '白夜行', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELv3llhcBiakrIGfE8la9fvG5JOPiaSpXGojmAenVzlelic2W2wSribZ3YbSTLoMtjjtYWnUKicUKBsiaKQ/0', 'oyP7DwLvLjYRJPpk-7zf81amA2XY', '', '0', '', '1', '1', '0', '0', '', '1472784502');
INSERT INTO `tyms_users` VALUES ('2306', '张刚', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dENqWXnW0RDPwccLPAmo1iaOiaeUkW5H1UnaoUC53LAWSgoKkjIwfribxAxYBHcDhRx7BTEI7GNr4WZ7/0', 'oyP7DwA0OFav6nGMJv6wQJD4eGqY', '', '0', '', '1', '1', '0', '0', '', '1472786527');
INSERT INTO `tyms_users` VALUES ('2307', 'Yang.', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UJPZxHN4fMg8wXErzKP8OZFL66d0K9kvsjE3V4QQ1RDTVwHic1C1tjvzKZxMGNoOvPdicE5Q8bnzQk/0', 'oyP7DwIBRvaJTQcs3aYDGWrBsxN0', '', '0', '', '1', '1', '0', '0', '', '1472786831');
INSERT INTO `tyms_users` VALUES ('2308', 'Peter.liu', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0VxRrlQLWX63yKHuWkCWVa0ewRTnibEFpVyW9VmqOuSEO1lWNo1LiaURDG1qLZrgu1XcCJyXfglpATvUpp2QliaHX/0', 'oyP7DwDkSAMHwpLRMJw2Y04tF4v4', '', '0', '', '1', '1', '0', '0', '', '1472787361');
INSERT INTO `tyms_users` VALUES ('2309', '15833660607', null, null, '', '0', '15833660607', '1', '1', '0', '0', '', '1472788990');
INSERT INTO `tyms_users` VALUES ('2310', '谭', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEF3vXJclyjeJQo5Tx2ZXCkibqKq6YaHibA7a65xmAMqOcic0PyP88o4oPLhDia4vogT0CbIS7055EY7F/0', 'oyP7DwL2bPkp2Vp1XlDNqv91N5QE', '', '0', '', '1', '1', '0', '0', '', '1472789855');
INSERT INTO `tyms_users` VALUES ('2311', '阳光N01', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7qmLlkDcib6F1QI87dmcwdBWh7ZA2QyibOiaVhqjmAiaY8QBZtsHtNVmOeZyxa40ecw7XicicyERrmwJWAdBDZFJS296/0', 'oyP7DwKq8HgxH5b9UaDycxBQg-sE', '', '0', '', '1', '1', '0', '0', '', '1472790806');
INSERT INTO `tyms_users` VALUES ('2312', 'Dream', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4zpG9vSWq08aHMCpDhVgvtzOTTsY3iaicbKic2HEAT5qfCZkQXicDSeROBtyBfF7u3g4zzNybaeco6pQ/0', 'oyP7DwNTXzbu6h3QkOa8BfmNDC9E', '', '0', '', '1', '1', '0', '0', '', '1472795589');
INSERT INTO `tyms_users` VALUES ('2313', 'AARON.RisingPhoenix', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6P0IvE1AoGb7b1hvEyXxEYIiaN7mg6y1LzW2uytzaQdxmHKOxKnpqYXlD5tKiampFojjSUn8Hapanw/0', 'oyP7DwI00eOPWjqWGvrWEkl_0ed4', '', '0', '', '1', '1', '0', '0', '', '1472795916');
INSERT INTO `tyms_users` VALUES ('2314', 'ylweb', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDGs1mMTepYj3ShibKcFfqkPzS06YQUWbKHnmeeWrHnsfdR0uQwr9mExNllEkLpHWMMAtr4putia4Aw/0', 'oyP7DwLe78mXk0afi1Oj4JNzRo0A', '', '0', '', '1', '1', '0', '0', '', '1472796015');
INSERT INTO `tyms_users` VALUES ('2315', '徐振帅', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJhHxtTgSy8W4p33G7nXYFpVLUP7t0IDyHCcHJHgDZGmF7DJUVJkwBDXSmW0BxIic2ssPldN9iaEr4/0', 'oyP7DwCldPZ46inyU_8-r5KUKSBY', '', '0', '', '1', '1', '0', '0', '', '1472796522');
INSERT INTO `tyms_users` VALUES ('2316', '清', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMQtSJQC2Qu0y1xnlLqAXOs7ZIqhZlAMQfo7gWibW764f1Mcqesqib0fXxvUujZwmUDibzbgRNTEQob/0', 'oyP7DwMYxL4Z9GmcKq6rD3EtSpWY', '', '0', '', '1', '1', '0', '0', '', '1472796801');
INSERT INTO `tyms_users` VALUES ('2317', '伟LOVE玲', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdMF6uibb9s92qweAH1GibnTnHUanmCu581U4oRncoBbyn9oNp2ttlHoYXETjKIMfiaAgLmv8P6NiaHcQ/0', 'oyP7DwMiVKu04Y6p5XbB3kxTSYAU', '', '0', '', '1', '1', '0', '0', '', '1472796851');
INSERT INTO `tyms_users` VALUES ('2318', 'Yxj', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfLUZWQFuUlSjhq18T7RF7OA6ialxS6EJZZg9w1TtjF4Dat8VajIn760nG0OLFbvvPMy1guic2icw2hw/0', 'oyP7DwHQmPkk7PSOvfPzyCDNjdNg', '', '0', '', '1', '1', '0', '0', '', '1472797223');
INSERT INTO `tyms_users` VALUES ('2319', '西漂的阿飞', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4n2RXLaZJuDpJ4ZrXapwWqtyIjImvN88nibBXo8kia2vS6xO0tIDbSKzMMdyicqcYpENF2jFTAxDPnIMHwTG8nwlSQXdEVYLzvuM/0', 'oyP7DwHAFo7JGF0o0h-gZ9av59KM', '', '0', '', '1', '1', '0', '0', '', '1472798237');
INSERT INTO `tyms_users` VALUES ('2320', '黑夜随风', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBPibBiaORKtAEnMov4xzEyPfvxFFtDsWhdxenCUh34E2Zu0o9nh5ZoSXABdJelqePpOeuOJ6qQNRlg/0', 'oyP7DwG84TiKUIsHZtdoRBBTQglk', '', '0', '', '1', '1', '0', '0', '', '1472798303');
INSERT INTO `tyms_users` VALUES ('2321', 'IT游侠@星辰 ‍微信超級會員', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBmI1GBvZIGaFIBSfOviayHibiaXYPWiaugLFq67YWLVged2Q7PPJDHJ47JxUwenWBnD6ic9cr34dUGibSg/0', 'oyP7DwL3qNJg8rjWNi6KolcLEovI', '', '0', '', '1', '1', '0', '0', '', '1472798995');
INSERT INTO `tyms_users` VALUES ('2322', 'A.方子', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicaIXbagEDtATKBVrYgED3fEOgNeBDea2vHbow4JaTo7p05hp7HmeZzrCP2FLdbdAhcfXCEoafjs/0', 'oyP7DwKeaPRLxHTO8lQAbPXje3so', '', '0', '', '1', '1', '0', '0', '', '1472800297');
INSERT INTO `tyms_users` VALUES ('2323', 'Ly', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0VxRrlQLWX62a2LeibfSMbtdkEZL109AmFQ6hPiaYDxFuG4a0mc3C1myEnwQRwpVqOeyzTKiadI4bl1cAltUCmicK2/0', 'oyP7DwKSsJ5i8Onij3mwH-y2x12k', '', '0', '', '1', '1', '0', '0', '', '1472800735');
INSERT INTO `tyms_users` VALUES ('2324', 'Mendocino', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UEY4r6tcFrtKwwmB4HJ82R5nMYr6DFy4MkPeNAk5LKBAHticgT3x4Fcbeae4wUQhfZkMVibZ8ANU3V/0', 'oyP7DwOKTA5XIn3wxFrOp9i68dog', '', '0', '', '1', '1', '0', '0', '', '1472800990');
INSERT INTO `tyms_users` VALUES ('2325', '兔子', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFgNa809J6kr7OJrKlsSmPiazC6Asqgzkoq0smouUoSXFNkusYSibakno0qMs6BicPgAyfxEzolXOCS/0', 'oyP7DwG14RGTafMyXE7lZhUJN8kk', '', '0', '', '1', '1', '0', '0', '', '1472803907');
INSERT INTO `tyms_users` VALUES ('2326', '叶金筑', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eBBXcJicOCgD8MXHR0ejzHc2BhFnCpynAa0WnfhcqF6vIkHYzjPuOyM9czYzc2tP2CbIeXGpl2qKW/0', 'oyP7DwLEGq_Aoxb0dvT2OKiqjtPI', '', '0', '', '1', '1', '0', '0', '', '1472804136');
INSERT INTO `tyms_users` VALUES ('2327', '刘', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAOMBsG9UgQLqLUC3Y0gE0Nr1zibtqBVo3v4jrhHpJgOtd4tKLkPrHe0icqic2cJNvlO6Orqk9qq5re/0', 'oyP7DwFOPHQK51phBP3EHdB4RDrw', '', '0', '', '1', '1', '0', '0', '', '1472805536');
INSERT INTO `tyms_users` VALUES ('2328', '唐俊', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP25Q1QNvbAtrBQRrMFBHhq9nwuwUOWZf9NvgTxOKydbg9BEcEicBLDno7A8iafPEQeq6necq7W3biaUJVldxra7fgA/0', 'oyP7DwBdn2hT0D2ZYLMh-uq2zeYg', '', '0', '', '1', '1', '0', '0', '', '1472805642');
INSERT INTO `tyms_users` VALUES ('2329', '大海浪人', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Dib26Ay8HBvHEg2j2jtIrpRbzSEpibZiar1vHDm28Rw4eP7J8A7lNmVS02yDLU5SodHXYBpe5IFibGf/0', 'oyP7DwKscPetkJgcfHcTusfCHqek', '', '0', '', '1', '1', '0', '0', '', '1472806448');
INSERT INTO `tyms_users` VALUES ('2330', '断剑重铸之日，其势归来之时', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfWQVBD4jQfatzXxJswybh3qywpq2dTfQYGdnLa0adOYxJRYHcSAKyvGjl6iazyibx5zoKicbgUzia98w/0', 'oyP7DwLWXfWoVAI-Yw_vBqmNJ1GQ', '', '0', '', '1', '1', '0', '0', '', '1472807196');
INSERT INTO `tyms_users` VALUES ('2331', 'lol', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3w2SBu4oN7L27ySPbiaHsJK5G6RUemrVy3rMy3nHtWzwq6ibtnaQtXGGdtwN1RpuqDPbFjk7IKOQPhNNhJ0ice6bG/0', 'oyP7DwGZ-Jz9Sqdn4RD5K-yDbIOA', '', '0', '', '1', '1', '0', '0', '', '1472808247');
INSERT INTO `tyms_users` VALUES ('2332', 'holdfree', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1D9nDqHb1q60iaXlklf97OdYUyWg5MCFCuhNP8CibjqQu1gRJ3t56OIHvicEpicQBxibm27vLqialYexnDyialms4ZCYB/0', 'oyP7DwAjw1vEh1dlgUiTnjZoAjfs', '', '0', '', '1', '1', '0', '0', '', '1472810456');
INSERT INTO `tyms_users` VALUES ('2333', 'glincarp', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1bjQomS9urRtHrJSU9oa1whiaiahVoC4fbAlIibFUbjYMrnuy6EXpexHVgpVAUFIUP6hv6H7qvc8JPmIQMZL1IxPO/0', 'oyP7DwApTvgtrJovDKFQYciJ9FkQ', '', '0', '', '1', '1', '0', '0', '', '1472810619');
INSERT INTO `tyms_users` VALUES ('2334', 'QQ用户', null, '5C512F9B456D79BE55E8DF8A802BE9C2', '', '0', '', '1', '1', '0', '0', '', '1472815315');
INSERT INTO `tyms_users` VALUES ('2335', 'jinby', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dENrjwgPSL6MBWzenFse9v4NkFUWblha8wxtY0pocP1OmyxPD2aswuSXfOkic9ZOxPPRMa4ZoibYK2b/0', 'oyP7DwA4Qk5xxcJfIMcNnFabxmAQ', '', '0', '', '1', '1', '0', '0', '', '1472819688');
INSERT INTO `tyms_users` VALUES ('2336', '仪轩网络', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3DQKLBSsePl9F4F630ANqcQwX6BsjLoQEKAow67Rw3ydLRnwvNYdqRubSx6Xd2oPfdJWrmLvrfeJFnGXVRTt28/0', 'oyP7DwJq_fviba38iNI75BFSzGsI', '', '0', '', '1', '1', '0', '0', '', '1472820461');
INSERT INTO `tyms_users` VALUES ('2337', '赵晓庆', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0aK9kz1NSKX72D8IuibibZay8lIUcSFcP0clNR2FAxHUIsbE036E1rlz6kkpD9oWXaDMNJJNtI1tgo/0', 'oyP7DwPNdoPJvs1c2jF83NourywE', '', '0', '', '1', '1', '0', '0', '', '1472825477');
INSERT INTO `tyms_users` VALUES ('2338', '爽风旋', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4sBdNQqvcZ4cyAibRibvZaXWLMKA0Mw3KAwSQmaibIAZibOvokcVLLlTZe4yBgOS90JDW79PNmkO3Aic1/0', 'oyP7DwDML4-RIJH3VF7_4umR4LPY', '', '0', '', '1', '1', '0', '0', '', '1472827153');
INSERT INTO `tyms_users` VALUES ('2339', '梓淞', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4kIibHUl0icFia9jbS0QdIAcsevCD22DOttC3h0bmtahMQYAC3K5gbHxcqyBpqM8RYZPKJctib2M5Ajk/0', 'oyP7DwKWQ4e1VVYHoxSdbRs6E4Ac', '', '0', '', '1', '1', '0', '0', '', '1472827218');
INSERT INTO `tyms_users` VALUES ('2340', 'SOSO', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0ibYZ2RTVxib47B0iaRCz7ibG87wGcYkSicC6DhTegiat5aj6MDIpj1icT2fhANY1FEStENJdL0lJCnnybsDBNWgDDfUm/0', 'oyP7DwNJDAYn3TDxOjzmJgP8qfiw', '', '0', '', '1', '1', '0', '0', '', '1472827225');
INSERT INTO `tyms_users` VALUES ('2341', '傻蛋', 'http://wx.qlogo.cn/mmopen/Qk2WicPplRQjnm0LZ3jxOlgCXVOw1ltMN9gNLbdN3IC7JEJGGqyQT05Fibq6uicCQUCTJz29CxWZDQpdxJf68LLZYsKIlQOaw9p/0', 'oyP7DwB6tCp9FYboJdA69ZdVDkxA', '', '0', '', '1', '1', '0', '0', '', '1472827708');
INSERT INTO `tyms_users` VALUES ('2342', 'yue', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1XhHdG35fcoaxUu2lNWSuLQQanibPmiazG7dvMLERQfl1WeFyNUCDF8iaa8VdWbxYq8IFE5YpiabGkuQ/0', 'oyP7DwOqat_3GaXYz49c9D6vYJcA', '', '0', '', '1', '1', '0', '0', '', '1472828229');
INSERT INTO `tyms_users` VALUES ('2343', '阿聪', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcJGnAvHl4ibTb3jDrTAFQNW7Hm7ib9xGuEC7BX8u1nERg3D3PWemZRQzVibfMxkcDibAaXsszVU7KRGQ/0', 'oyP7DwD-MQXF4zJxaqDXLtTnLQ08', '', '0', '', '1', '1', '0', '0', '', '1472831909');
INSERT INTO `tyms_users` VALUES ('2344', '纽约分类信息网', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0Gz2wbU100ia6GTOgQORJ5icGMcTGsTYfFp05P3EQh0ubvicMbKoD4TYlkfLfL68WPMwLnDXxBRVcyqa5Oy8YO4Xs/0', 'oyP7DwDSkWJAYAVlrn1FUqTdE6KM', '', '0', '', '1', '1', '0', '0', '', '1472834354');
INSERT INTO `tyms_users` VALUES ('2345', '阿河哥哥', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4orWIUGtU8C0cDwOyibdYUZmZsevrrQZPUuwZsTrHJh3fIM5cOjo73YwhibI84qmP7lcvobedIZc0cLyia7uu88YBicuyqQYrB8nA/0', 'oyP7DwMlRWkMyXHNs5VPX8dKC5zk', '', '0', '', '1', '1', '0', '0', '', '1472865228');
INSERT INTO `tyms_users` VALUES ('2346', '可达鸭', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELibW9E20qCz2xoWQ9tODsiapjBicwwNufDGEeDOX0PPCTS8icEBZTUk8qgibeRwEGibMDyH96ibe3jLKIow/0', 'oyP7DwNL4TUySa0pRSE2Hw5CHuvY', '', '0', '', '1', '1', '0', '0', '', '1472868255');
INSERT INTO `tyms_users` VALUES ('2347', '平湖烟雨月山河', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7bfxibnHS2cwDQFvMbxtfFIDzJz3QyPu26WfY5sDSnQJn07ybUaBcGJrrY8Pq4moylEkTkpbVbjdkrVRhTwpmicX/0', 'oyP7DwK4SIivloBhIQ5D_uSfr_SM', '', '0', '', '1', '1', '0', '0', '', '1472869316');
INSERT INTO `tyms_users` VALUES ('2348', '刀刀', 'http://wx.qlogo.cn/mmopen/hY02C90AvzQMy7ZAfjgBHSX37Vq6a8xvlUUkBqub4OLK2gXw3WH70MV2sb8JdIFYlTE22LweWUOzdzQu50MTyeSQu9qKmgLib/0', 'oyP7DwHJFBVLyRP9rOasZFuU9qqg', '', '0', '', '1', '1', '0', '0', '', '1472870471');
INSERT INTO `tyms_users` VALUES ('2349', 'Polly', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4ohHmymGXoopck1nRTCHQJFJc4aYqprTTNBRuv6lTfoVpX2KufqfMeFu7uBnQCbKBiasorSGWFI8V/0', 'oyP7DwBaJGoBGr40o-ehu-Cw4MN4', '', '0', '', '1', '1', '0', '0', '', '1472877680');
INSERT INTO `tyms_users` VALUES ('2350', '港海阳光', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP16zCMXuLxFSYR4hJM9CJKadoNTqicsc9fV33OhUzzibhzkEfF3ghbcVqQgTjbfdfLdTwAEq9w467GSs4v8mzA0jA/0', 'oyP7DwGYezQYvOBJcHtT9xWgDREU', '', '0', '', '1', '1', '0', '0', '', '1472884558');
INSERT INTO `tyms_users` VALUES ('2351', '龙圣', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIH8kUCLFk5qA4HK8KQ2f0mhkZLboKwSIQIb6ouOmsicAeaR2jibooDRmuwXZOePUu0ksUVVUrFH6BQ/0', 'oyP7DwISfW2XCdFX9Kve9KadoBbE', '', '0', '', '1', '1', '0', '0', '', '1472885015');
INSERT INTO `tyms_users` VALUES ('2352', '段亚楠', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibynkUJnbfcQHcdyPh8ee9US0akvkibmRx37XiccGgG6epybBNx7fImNOAibDpmzC7yiaCTAiaOcW4gibO/0', 'oyP7DwDyFaWti6IE3ATZy58rqEYA', '', '0', '', '1', '1', '0', '0', '', '1472886045');
INSERT INTO `tyms_users` VALUES ('2353', 'Eliu', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iazMrScMtYK4hamjcugLHspiaicwzSQYMJ5QCibhUwYAibPeicARgPvZVYicedcYHZo3WSibv9Yykuynt5IV/0', 'oyP7DwHyz-KdXU9JIiP8FZ_vTHJs', '', '0', '', '1', '1', '0', '0', '', '1472890461');
INSERT INTO `tyms_users` VALUES ('2354', '零度网-吴林', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlO9kUW9S8Jz1EypMaLVuOcoBcjzNsMSdTkbZIEcHaTARkzIQKFiapNmX4kNrmJCAZib5q02Qc1t6HF/0', 'oyP7DwO1F0ZvR8UmmcpG8q0dIWLU', '', '0', '', '1', '1', '0', '0', '', '1472891907');
INSERT INTO `tyms_users` VALUES ('2355', '單雙²º¹6', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4hUnhLuV0d8nQbt3Y4FwrPjiaJ1erJTC9fNficEk4T2QUNG4oTj2m2XQcrUXM6RCzsvDR5jt2niaUo/0', 'oyP7DwJISeGVd3DVPVTgHpQkGC68', '', '0', '', '1', '1', '0', '0', '', '1472893240');
INSERT INTO `tyms_users` VALUES ('2356', 'QQ用户', null, '6ED6A21B460122B616230698C392C8DB', '', '0', '', '1', '1', '0', '0', '', '1472896867');
INSERT INTO `tyms_users` VALUES ('2357', '飞鸽', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ6NicbxaCXf1crIq62zzFPkapHlic1qicZ0dFPl1yLo3iboMMBjlDIGRYLH1pQ66VIOh1H8tDQBCTyjg/0', 'oyP7DwHWKaiiUVH1DQ7HUlqzj608', '', '0', '', '1', '1', '0', '0', '', '1472897333');
INSERT INTO `tyms_users` VALUES ('2358', '十年', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIFOCYWLeRJl0uYJUb1ZfxarBoFciaFLmzEUkHb6P7VUzWe29yoFDWGaofsCFZ2MXTJP6dh0syvaLw/0', 'oyP7DwCj-9JwKB5lZcwtrvh_Ck54', '', '0', '', '1', '1', '0', '0', '', '1472902083');
INSERT INTO `tyms_users` VALUES ('2359', '畅联云街', 'http://wx.qlogo.cn/mmopen/ObPAfHzv6UtibaxuialUSFhcQhLP9pYJYLOE6kpR2mKlUDQhc2bwvfyTVcwN4qWVKfJHzapv5w2pNzU9QQwaqZWWgicLzxVvnjf/0', 'oyP7DwHKosRVrBVBvs9kroZDq7p8', '', '0', '', '1', '1', '0', '0', '', '1472905440');
INSERT INTO `tyms_users` VALUES ('2360', '在线威尼斯之美', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6Py4BhTQ20glt3P4sRbvTaffugeMGdE5Hz09ic7JMJesibgcKvIhYvnziaY89sCdpofbW60IR0PgYWvibrVjAT6mdZ/0', 'oyP7DwBuxF_QP4kLcwaryhlNI5dc', '', '0', '', '1', '1', '0', '0', '', '1472905683');
INSERT INTO `tyms_users` VALUES ('2361', '@起点商标工匠维狐', 'http://wx.qlogo.cn/mmopen/y4ibhUzTEvX0RxibgYOes7UgN3VK2BfqWYZHgc8pJ07wvamHriaiaO22owSu244225mhVJicakhkick0q99xh5zOg3vJxiahp3wu4BF/0', 'oyP7DwO8lE3GFgBf5XlXSAp8ljZs', '', '0', '', '1', '1', '0', '0', '', '1472907734');
INSERT INTO `tyms_users` VALUES ('2362', 'M&...', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4ialBuD9a5mszMhOf9F6dyUeUghk5qjPeu8Yo96g7w6n7nibnYtliayFVzAxmiaic5ib6qM3NW9JcUXHvQ/0', 'oyP7DwCZZkpl4GQet3kO7hkqp41Q', '', '0', '', '1', '1', '0', '0', '', '1472908370');
INSERT INTO `tyms_users` VALUES ('2363', '罗', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4oM5Gic3Er6ezzC6pHG8kwFgaic25zIOEb2kRsx1b1VUAmJDxoGIJpZ1XqPLQicHObqxgy8CSnHjLZh/0', 'oyP7DwDIxrjAFjyavh8xwilWPT_E', '', '0', '', '1', '1', '0', '0', '', '1472909394');
INSERT INTO `tyms_users` VALUES ('2364', '网事', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pklfhiaXwricUiav46ZGOGh1lJMbByNgUXOxKficm4wM81o3A9skaXicsSZiaYKkMkqyibeNKDw3Tm9Bd7sArDw79F6rIAE/0', 'oyP7DwDIujNhAzMJJS5iOHtTuj4M', '', '0', '', '1', '1', '0', '0', '', '1472910323');
INSERT INTO `tyms_users` VALUES ('2365', '授人以渔夫', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4ibuy27PZ0vtsnmjtSIhYIIr4WRSFoQU7CNtREc4KE72AL7LGiaTicx0b1qxd7aTm8rjQaYGkoR6vuA/0', 'oyP7DwJTlkIHgnSi2jgBiG9W86hQ', '', '0', '', '1', '1', '0', '0', '', '1472913472');
INSERT INTO `tyms_users` VALUES ('2366', 'A西部网超', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD4IMTj8ibj4DfemhhDkN16KxV0LwdsicSJ9eAHl67R04twvC8LpyqZXKhaia9BTCfgKKVnPibdrUcdMjJWH5aBbuDCLl6wMydlrNw/0', 'oyP7DwLYzkD1y4QdkCA5OHEA-DO8', '', '0', '', '1', '1', '0', '0', '', '1472918453');
INSERT INTO `tyms_users` VALUES ('2367', '旗云', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK8euHiayBvCIn49ZlETWXh6I0Mw4r89H0IuZvOM8UPiajWFEZErhxLnLHgb93bfgrXicu2FNkibbxPibw/0', 'oyP7DwL8hGdOjQVGEvobj0kpQDy8', '', '0', '', '1', '1', '0', '0', '', '1472921313');
INSERT INTO `tyms_users` VALUES ('2368', '敏哥', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4GQyzItyIrdpxic0Fh5urVhZ7hznqtDJOSxsCudNYx84xplKFc7DZ6K71TkJVDODUBVDtPpcxrJOw/0', 'oyP7DwGn0bJVXvsf4pCZI1t6gZIA', '', '0', '', '1', '1', '0', '0', '', '1472923310');
INSERT INTO `tyms_users` VALUES ('2369', '金生水起', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1kALwfA2z6CRZC2Wux5CAMsIjC88nZux84rD9toXQB7ABqtYFL6s6ibeBkWicWzJqFibR721h6kHaW8iblHU32tO52/0', 'oyP7DwEjp9cZaxNR_JB775hfSRdU', '', '0', '', '1', '1', '0', '0', '', '1472952447');
INSERT INTO `tyms_users` VALUES ('2370', '谁的等待、恰逢花开', 'http://wx.qlogo.cn/mmopen/akwptsKSbF2oBH23pQan6qQIlpP2JEgibOJM0sImkhxC0ic3LIOtjkP8DDoNCBDJrmtL65TfNBSyVtE4oSqWicjELJicQCYq1ZLW/0', 'oyP7DwN4wAU2suCXUVIwT-O9N6Q8', '', '0', '', '1', '1', '0', '0', '', '1472954056');
INSERT INTO `tyms_users` VALUES ('2371', '郭栋', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcwicPtv36DMjSia0iaVK91p4cuneibbMTiaXanH0O2wLErdmDZUQ8O4FRHkNYXDTKqMmdGXNib8ODM9ooA/0', 'oyP7DwLDaa8LxGADCNqMVNQo83q4', '', '0', '', '1', '1', '0', '0', '', '1472954912');
INSERT INTO `tyms_users` VALUES ('2372', 'A雄风科技～手机电脑维修', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5DERlGJQguggypOu43vCJzolEe9vhRyG0hgXnHQCibX0mx3C9S6leexiaiahK64456QkcswFN2GleDmETgBRtgM6a/0', 'oyP7DwNlYu2B6-Kls3JcxUGdGmWk', '', '0', '', '1', '1', '0', '0', '', '1472962331');
INSERT INTO `tyms_users` VALUES ('2373', '欧生', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0m3ReWhXJUHDsCHzj11wibJu12Kl7ic9426jNH1LyctaQhFptplTDwrM1FmafVfXOPlo0FfPty51jYsib6HpTCs7O/0', 'oyP7DwLt_OOkb8DD1qDJ_OjbEBw0', '', '0', '', '1', '1', '0', '0', '', '1472970205');
INSERT INTO `tyms_users` VALUES ('2374', 'akll', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLChSDibVqgWUB16d0iczvlsCtSr45S5xjrQ7mT2e9cGBqia8CUDwGcw8LQKicu7wXKLN6XKUtRaGqEpOQ/0', 'oyP7DwLopPumEyS3BJ-25pwYJ9V8', '', '0', '', '1', '1', '0', '0', '', '1472972929');
INSERT INTO `tyms_users` VALUES ('2375', '聊城房产网', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCcw8fIjFFcj0RWPcfDOY6rM7RP5yEvtn7E9KQVibrZibTDQZzegPibJicqiawdp9EE7a9CO8J9dClubHA/0', 'oyP7DwG7_nwpJNIlAJhC1n5CWaYc', '', '0', '', '1', '1', '0', '0', '', '1472977491');
INSERT INTO `tyms_users` VALUES ('2376', 'tyler liang', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90Nia25ib0vtiasPtJc9ibibfAjEkQY185Xeq4DibPIiabM2ZlB1VaUmIynERj7nAfZMPBfUnqMiaWkEKkRB1/0', 'oyP7DwOgofQB0zROH6ji0WdPlwAU', '', '0', '', '1', '1', '0', '0', '', '1472980780');
INSERT INTO `tyms_users` VALUES ('2377', '青苹果', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90CPVMsrgliayesR2L0ZyIp92gmwG7OuCMQicNQyvu9k3rCicQvs4SlXLxj2bQ1HuQgwwOBUt3kFacia7/0', 'oyP7DwHan-Fq70gSSuM7KKZz5V9s', '', '0', '', '1', '1', '0', '0', '', '1472983420');
INSERT INTO `tyms_users` VALUES ('2378', '叶梦网络', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UCo0BgEJ7v3egNTfZCGOcVEnAYanf99oBViczYNol89g4L55b8WdBvzAANmyyjcNIyFg1tOt4Tlbc/0', 'oyP7DwB9vWq1IDRueQOYK-HzowHk', '', '0', '', '1', '1', '0', '0', '', '1472984979');
INSERT INTO `tyms_users` VALUES ('2379', '李海源', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5DERlGJQgugqBia3gKknQDsvBRboCb3rTlGweYvbpsHPYGXXwI7icjUYwTLdQtYFKN87SCiarfB1IIShcrjgSQabt/0', 'oyP7DwAunbvlb2M5_gRhr2NVih58', '', '0', '', '1', '1', '0', '0', '', '1472985452');
INSERT INTO `tyms_users` VALUES ('2380', 'Z. y', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6RAHG2l2o5Hib0mFvkEicRI44XaHu4LpVsw8Us6GSv3dUCY7X0m4ILOMhH3iaH4bSMic2r39w5OFfsf8fRhTW7Nxgc/0', 'oyP7DwOvLy98DE9VRa9w8MVrKry8', '', '0', '', '1', '1', '0', '0', '', '1472985615');
INSERT INTO `tyms_users` VALUES ('2381', '黄根', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eEGBJvr0yyg2iaxL6WTiadgkgIAPzia6ECOpP031P6jXwfBRCRF03BU9miavzOp4LN9wtFlZsnlZw6Iu/0', 'oyP7DwL2fPNmwcqojHFpxQ80KbLU', '', '0', '', '1', '1', '0', '0', '', '1472987918');
INSERT INTO `tyms_users` VALUES ('2382', '青娃蛋', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBevfxAs1JvuGhcp6ib1QhhM9zDRnbY8eXqVRX8LYQG38XZeenia9PPaHgbdxNpJc4op4YLxht78t7g/0', 'oyP7DwBx9IB76YhGeD_Bl_Xm0EjE', '', '0', '', '1', '1', '0', '0', '', '1472989556');
INSERT INTO `tyms_users` VALUES ('2383', 'Foreach', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90OnPP790NPbsykczUUIwwxxR1b6hgO6KLBTW3wXX6qt524KrR4aLnNn3dbhicoLdicibLJDv8U7DXDG/0', 'oyP7DwH1mVm31MVU6pnLM8TymvWY', '', '0', '', '1', '1', '0', '0', '', '1472992990');
INSERT INTO `tyms_users` VALUES ('2384', '唐朝', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0bKq2vTc4dkz9WzgsHPiaTT7oLocfNjkYwqk2iczXh997VpnicfkCPS1pcl8xz4wwuNA49OLx4qmbic0/0', 'oyP7DwADGzGEYVaaRVNaTRo4idMc', '', '0', '', '1', '1', '0', '0', '', '1472995137');
INSERT INTO `tyms_users` VALUES ('2385', '', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3L6icrc2vIBgGicnVkU8vVy2BULHYQQLBf268WTKS9vH9t5Y1w47kfibaP5VqtQ0v6822eVMqib76ACpGYfoFG38js/0', 'oyP7DwPHPFvdd8AZXjCbpv80_qfk', '', '0', '', '1', '1', '0', '0', '', '1472997851');
INSERT INTO `tyms_users` VALUES ('2386', '인생은 쇼다', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1ePvUUgkKibicB0icQ5wLrbhwNZhPl4PJmuqRxUfibxRFaviaaPQEZNtQiaGTYFgBP9mUeUDOyEDtaeXuTU/0', 'oyP7DwC7vxEpmQiDeHEdG72xCNZo', '', '0', '', '1', '1', '0', '0', '', '1472999259');
INSERT INTO `tyms_users` VALUES ('2387', 'A0顺隆鞋材', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4VILLwgj7y7aVTKpJYsN8icg7icyoQ6ZkasGkiblMe4vwibkxYunTf9UO3SE6677lcS6CQHgsXAZNQ7sP6YiaibicfGHN/0', 'oyP7DwPhR8akrbig8_qxhKT87Dxk', '', '0', '', '1', '1', '0', '0', '', '1473001637');
INSERT INTO `tyms_users` VALUES ('2388', 'A高先森', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6vjbehtmNYDTibqQDOGJfsOzx1f5pASV5RSzhPIx2n1GHd18rbGtqzu6uF8Hvos0GzGYbTyRticBZsYxRxIsz8WT/0', 'oyP7DwC3nxuNDHzomUrpqJARceSk', '', '0', '', '1', '1', '0', '0', '', '1473002606');
INSERT INTO `tyms_users` VALUES ('2389', '黑白', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90F9y7EqjKTQHRfGssU1l7OAdsmYtDZEmEbziaEI1phnaTDoaxUFiajLyicVJjalNQjLaibTGfSn4XUOf/0', 'oyP7DwPwMxEV6ECO11EF2O4dpcSk', '', '0', '', '1', '1', '0', '0', '', '1473003556');
INSERT INTO `tyms_users` VALUES ('2390', 'QQ用户', null, '4641389CCE688BB0E3A073F88C50CAE4', '', '0', '', '1', '1', '0', '0', '', '1473005341');
INSERT INTO `tyms_users` VALUES ('2391', '智慧生活—老伍', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLADE7sAaN0pklfhiaXwricUiavvwH9hXQRaXCbICLJpXficUDK3z34QzVwESU7QToR9w1lFsq4XhOQ5rqVVs3p5vhqmp8lvjmDJE1A/0', 'oyP7DwMijqvEaWeg1Fd0Md0PQDTQ', '', '0', '', '1', '1', '0', '0', '', '1473012413');
INSERT INTO `tyms_users` VALUES ('2392', 'A.萧航网络', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7EjPK3hb3Dqu9On3ibYwo76j8wndIHsVsoRc5pd4omjLNXm24pCx1rm39c5afeYvuFwhMD5BuEVbt2shCIHHIgb/0', 'oyP7DwNa0g0z3sqXClg2ku7RESBY', '', '0', '', '1', '1', '0', '0', '', '1473034021');
INSERT INTO `tyms_users` VALUES ('2393', 'shijinzhan', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iawrlOqDBI2N7jyuV2KXkKaOU2UmIu6LzU4scQCpic42az55eZBDdt4OgUNgXDrQhibPFdTHvRlRe02/0', 'oyP7DwEpTiYfMAwiVk63woc2vJ6c', '', '0', '', '1', '1', '0', '0', '', '1473034266');
INSERT INTO `tyms_users` VALUES ('2394', '马建武', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIgwV4icwOH6WugAWVy9R1Fp95OwtBqlOgib0qt5CZWNWlEI69TXLhx9vPgwEBWp4rLoq2fBv0gsxzw/0', 'oyP7DwJ1-60kegHgaPbNk-heHSh4', '', '0', '', '1', '1', '0', '0', '', '1473038619');
INSERT INTO `tyms_users` VALUES ('2395', '王勇', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0FQF3kxrJnkJMpw9MhUbKhVn2MEqQZMyoUeeU76O49mA7sibf3bUFTgUfwQhhfFQMGLdew7BjvQibmcrb4dDXiasia/0', 'oyP7DwIPY6oBR3RdhTWAPqjo2h8I', '', '0', '', '1', '1', '0', '0', '', '1473039139');
INSERT INTO `tyms_users` VALUES ('2396', '晓诺', 'http://wx.qlogo.cn/mmopen/Miac41FYicyaSKZbwshelnyCDZ5JCo6l8JWBXXkfLgc8rbic8I1hNicRfQicxYytSwichG4D4JKVzWNyJoDpLmE4pDtNsZDcibwJ6Il/0', 'oyP7DwFA-XmbqVo4nv-4jT_8kbjI', '', '0', '', '1', '1', '0', '0', '', '1473040265');
INSERT INTO `tyms_users` VALUES ('2397', '  * 炜丽', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEJ0O6MpDah4qtxt7SMP6I8QSHic3EiaG9kSfTokePnqia3fBXQzxbhcOxpsVTp0xBK3U36AYGkC7mCB/0', 'oyP7DwGGZqh3Q0FHG1eu0i6BhZpw', '', '0', '', '1', '1', '0', '0', '', '1473042901');
INSERT INTO `tyms_users` VALUES ('2398', 'ZennQann', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2zO8PyhEqJPZZnuXefS0IMujAwlClCttYSC3IJXcNuP5LM7SDQ2D9vkVcnKCrRw0Xa9P7hB7LFalyT1AanyIFh/0', 'oyP7DwLSubZAKKpJ6LYYYqffG6a0', '', '0', '', '1', '1', '0', '0', '', '1473043158');
INSERT INTO `tyms_users` VALUES ('2399', '梦入天际', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7Hg2jDHcia79MyHp3xkMVxZqFPziciak3vY3zO5jbnibRKUBY64KP7Fic9hSLvahbWFygLgQnPEfUAMibQ/0', 'oyP7DwKGGu0afvNAhEBSB1YePDTY', '', '0', '', '1', '1', '0', '0', '', '1473043212');
INSERT INTO `tyms_users` VALUES ('2400', '方丹', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia239EeEQHS1R5qS3KAy6LalnKrExrV3ucZagezKbLA6JxIjPjdUydPXiayfHHLicaxF8lqjxd6Yic3M/0', 'oyP7DwAAsP4lxZhZX2X7e-zQ1orU', '', '0', '', '1', '1', '0', '0', '', '1473044124');
INSERT INTO `tyms_users` VALUES ('2401', '-0_0-', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEC2hjLDypyvaOx043NpfaYic0aESZsOdGLRaBib4nNwm8IQjh4aPthPtv6ne34tv5iaFHlXwz5S5bJb/0', 'oyP7DwAF0wCxdqwW_XgyFPMrHCsk', '', '0', '', '1', '1', '0', '0', '', '1473044195');
INSERT INTO `tyms_users` VALUES ('2402', '绿茶十三', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1lrdDiaLV9LlBoamVPFCukVXqPCseO7OF3sRiaEsnyhuoJicmlKLps3lGWFX58xpfDOeNzQhG5icokuMrgvNY5356h/0', 'oyP7DwNfPVmckfyposKqWR2SE7Vg', '', '0', '', '1', '1', '0', '0', '', '1473044839');
INSERT INTO `tyms_users` VALUES ('2403', '张志平', 'http://wx.qlogo.cn/mmopen/PYhfYIwEo38SvsMrACCqeoMDL6uV9HeZvSN3jMYdCkmZ6QUyvFoIMEbnibbbQF9CeCjOTQcvWR0uGs211OIqYcrKbUm6ialNJd/0', 'oyP7DwGhBOtPacCyl3gZvJcRZt_8', '', '0', '', '1', '1', '0', '0', '', '1473045007');
INSERT INTO `tyms_users` VALUES ('2404', '斗牛士', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIPha2uicEwAuV3z8LiaI0yuTB38DEMf9KFuk8Eom2sib4wxpqlVNN41YJ4CcAbQZLiadlze4EJrfVXuA/0', 'oyP7DwAq81ZRlO0bxDbfzujvg__o', '', '0', '', '1', '1', '0', '0', '', '1473047223');
INSERT INTO `tyms_users` VALUES ('2405', 'CZH', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibf9OJHCePtn8Lgs8VMrsmQvDicACIVrhCicoSLsibnRdHMAINHIOtkkXuh4I5W9hyB6Ckibiafuo9ibYUmyGN59AqB7ibv/0', 'oyP7DwJ_fMqe81nkiXdG43VKufSA', '', '0', '', '1', '1', '0', '0', '', '1473047925');
INSERT INTO `tyms_users` VALUES ('2406', 'Jack', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90A4tRBrRaDrNdVU6hQI4darxW9jJ5KXV4aKlBApEfIRUxfsibvMQA7e9FJeyWwZTibl1hL4dFmnvMA/0', 'oyP7DwGQUHrmpLAYo1QXNqUOyKJI', '', '0', '', '1', '1', '0', '0', '', '1473055117');
INSERT INTO `tyms_users` VALUES ('2407', '李先生', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdDZ1CAvvRib7HQ8xHMQ2Jo4U4kCNlWaW7F6hR6zhPPKzQicnSztlyVxMwroMiaQrsiclWfTgFzX4vj0A/0', 'oyP7DwEUf5gF71JLXV8rSU0P2iY8', '', '0', '', '1', '1', '0', '0', '', '1473055932');
INSERT INTO `tyms_users` VALUES ('2408', '丶丶丶', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0SG3YuNwORO7JsBVTGlIfvRcnyulH3MaAAf5088Vmwbl2X0j0BuIxvLZib3SArP6N2NLsr6YA26PU/0', 'oyP7DwFmasuxd0rCFpRQiI7sd3hA', '', '0', '', '1', '1', '0', '0', '', '1473057566');
INSERT INTO `tyms_users` VALUES ('2409', 'AM.Song', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY53XfnJHJ6QVOQpzia6ElRAPZBBTmicPVOKPibmsjPmHf0vmuCBKPSRKnEEIraUQrcuCJib5YnXrf84SU/0', 'oyP7DwAAMDhPHoksdvyZEkzhxTeU', '', '0', '', '1', '1', '0', '0', '', '1473057860');
INSERT INTO `tyms_users` VALUES ('2410', '李现庆', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPJFAf9lAwq3cx88XVxD9UW6UgO0EK64LsKwTyYO3mjZGpR0DQhyTI0JIbjCqia1312dFFZCrVSuV/0', 'oyP7DwECP2X-W3GDndXPguXOj0QQ', '', '0', '', '1', '1', '0', '0', '', '1473058369');
INSERT INTO `tyms_users` VALUES ('2411', '殷亮', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDYicUXtln6MU4H5SCOibvD2aeQLJoQY6a4qsK7xqKiaNPaP4VlicUSu3EtVrHRbaaYunC9zqRu2iaYQFQ/0', 'oyP7DwMFDDXDsmM91ESvFRYv3WPo', '', '0', '', '1', '1', '0', '0', '', '1473058809');
INSERT INTO `tyms_users` VALUES ('2412', '夜空中最亮的星', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBCVYxXlX9ryy2XgmaqpI4DKchQoLkpF2LWX2vVZEAxgZLUsRD6YcZlmR4sWqahnYBdHJZ3QnoicWw/0', 'oyP7DwKFGdUUPZGORTApw_DTcDP4', '', '0', '', '1', '1', '0', '0', '', '1473059479');
INSERT INTO `tyms_users` VALUES ('2413', '蔡立堉', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p1lqm20ufk14D2fhTs5aw0xRDZc5hU2e8ylq0pFxVcQUCblxSUQGGvTXiaROnXBSPLku7JiceDuhq3XkkNDTerCfx/0', 'oyP7DwFf0twVcJXj3paz55pSvamM', '', '0', '', '1', '1', '0', '0', '', '1473063054');
INSERT INTO `tyms_users` VALUES ('2414', '泰山', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QLjO2icwhLT8meMtpadQ8ZfS2IXbvR2cM9jQXxOskuD6Xiboumdib6BS4b3ibb4WJpH5IDy3MUYkzy5/0', 'oyP7DwGIS4TPc_PsP-NHonSMXQ2Q', '', '0', '', '1', '1', '0', '0', '', '1473063058');
INSERT INTO `tyms_users` VALUES ('2415', '走私茄子', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL7uJO9Ajficf2e9nQZkXLEzviay6S9q5TVbEXOjHMf748ick513liaJeG0xKBAZOlINkv9TuAjxTnKyvSlic0oRXHmfT/0', 'oyP7DwF5SucQ7wPL8DwVxjPsMaZE', '', '0', '', '1', '1', '0', '0', '', '1473063358');
INSERT INTO `tyms_users` VALUES ('2416', 'cycle', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1qu6fYUiaDRzKLUO778al2mCNeBvQXgcQrBoIM7e5QQF9x4mcwTMae7mFfJ7qP4ic48LsnWCe2LYyQ/0', 'oyP7DwLZtuFip3WAqn3KnZ_xRB8k', '', '0', '', '1', '1', '0', '0', '', '1473064445');
INSERT INTO `tyms_users` VALUES ('2417', '难朋友丶', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4ASbve1bovq56DwEvVhEcjHNLUFNlhDfpAjEPN5DvTJdZlxatjrWTEsy3SWZiaJckT9TKCGMoyejbuua0vSLTPS/0', 'oyP7DwNUCVVAaXMdWHqJy5WkyoY0', '', '0', '', '1', '1', '0', '0', '', '1473066137');
INSERT INTO `tyms_users` VALUES ('2418', '波', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6ppuCaiaQ9dHrk01rXvbb2N9LShG5N7Dic4ByO6LxUicRxVV8WiaLwuj4sBFT9CibuK8rg0yMvtgC5MdicibwHn5JNy4P/0', 'oyP7DwGQiH5VQ5EBYFKBuIuu_JXU', '', '0', '', '1', '1', '0', '0', '', '1473066180');
INSERT INTO `tyms_users` VALUES ('2419', '胡图+', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdKiaFj3FrFrusNARuzNWicEW9mqpAvu3Ow8ick3YbCtu2yRjPdeDoyAN6086X6KZRlFYbjVhAtrGeQd6gHQBkmziaf/0', 'oyP7DwJI1RwTVZd8T-opkOd-39Yo', '', '0', '', '1', '1', '0', '0', '', '1473066272');
INSERT INTO `tyms_users` VALUES ('2420', '明少', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4k5lyxlPQgX5hQkBMUwgu10d9D6HzlxP9RY4hcxknOp0icDZxYSicfIEicsBgMERzjqd6G6FUKyMBCk/0', 'oyP7DwBKBVbGG-Td1EmvQGqRrr5E', '', '0', '', '1', '1', '0', '0', '', '1473066316');
INSERT INTO `tyms_users` VALUES ('2421', '_谢', 'http://wx.qlogo.cn/mmopen/086TMlyKVO6oXKRP2ibJSpNaL8uuJBpibXRwK9Xm10YVZZVw1RoRGQT9kp95NtC88qZaibyFl1fys7Mhbx3WD2f8lIoJpW0CibiaQ/0', 'oyP7DwKzw3yyJo5VHP71GRHZuxho', '', '0', '', '1', '1', '0', '0', '', '1473068358');
INSERT INTO `tyms_users` VALUES ('2422', '阮伟东（上海圣科）', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdDnzae2picOPfMUDDsK08P3fweYLJag0zRT3neMvBUia2u2H2amC9nNZsicGkKg2dX3qe1IO2CDWFiaw/0', 'oyP7DwIpahc2NPchA6mXoSEgAFak', '', '0', '', '1', '1', '0', '0', '', '1473068481');
INSERT INTO `tyms_users` VALUES ('2423', '后背凉', '', 'oyP7DwGwvufglSPnhe3j6VogxImo', '', '0', '', '1', '1', '0', '0', '', '1473069054');
INSERT INTO `tyms_users` VALUES ('2424', 'maobin', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0c9ebOdpAx2GveLmnyaZpY0fRsz0t4VUjoOuCvBTqCGuhbsaMA30aePEP6KZldu5LD1awGPLKPeJ/0', 'oyP7DwA5iINWXJ56UZTydmKdW_s4', '', '0', '', '1', '1', '0', '0', '', '1473070165');
INSERT INTO `tyms_users` VALUES ('2425', '杰', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1w1xLcdFTY9kuA0iaIiapZhLJvm1HQ0rIuovMN0ibLVArliaVnlnGuSXRsMA3hibU3RoYDLyL8HOQUblibFibb9myqaDI/0', 'oyP7DwPJzLvkfyO6rp9dqfmGrsps', '', '0', '', '1', '1', '0', '0', '', '1473071809');
INSERT INTO `tyms_users` VALUES ('2426', 'fshark', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELicoc0fXvgNG9bjIiaUjfJ1KzKePicgmuARgsKvw8qMctIcic0x0FSMicicud406Joz3on4l3d0ic0cicnRw/0', 'oyP7DwBddSK_qZse_bdqN8pysT64', '', '0', '', '1', '1', '0', '0', '', '1473082904');
INSERT INTO `tyms_users` VALUES ('2427', '简优商务', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6sA22h4ibnXxagUfib4Y9zqibp7QBbVf7oJzxHzkciblCAibFdfFskqe66zdQh6icVibCHM3aQlAPjzvL8S11DTwkfibA6/0', 'oyP7DwF-hqWwz8eiUvlKOy2fRrB4', '', '0', '', '1', '1', '0', '0', '', '1473084562');
INSERT INTO `tyms_users` VALUES ('2428', '微信用户', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM75HGOqCeuRORibMaVeYg0R5xTFFJAuv99uO2X0Q1tTibQTHCwNIElnPeuID3ntG0wWx8ibEiaxpTO9OQ/0', 'oyP7DwL4A9pFFIXTWLUHxqMTUnnc', '', '0', '', '1', '1', '0', '0', '', '1473085571');
INSERT INTO `tyms_users` VALUES ('2429', '兔八哥', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5eYa3QkvyxkttTv0CTQgbzGcqazwjxvwsOhxcBFX5VsQyvyWLfAfQRzicCEWY2Vqz6cfA4OFBTbXQ/0', 'oyP7DwLKoiVtrTRGWfNkAlOZ_TxY', '', '0', '', '1', '1', '0', '0', '', '1473086235');
INSERT INTO `tyms_users` VALUES ('2430', '奋斗', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia3ibscs0wPrYlmwUa3ic6ljJibfc57r2XgnhsNDMTjGlO9A0Q7OWayhXhm2IBMBdKKTsBATcExuUoJS/0', 'oyP7DwOJp-jjX32Sp7LJq820Fia4', '', '0', '', '1', '1', '0', '0', '', '1473086791');
INSERT INTO `tyms_users` VALUES ('2431', '大浩浩', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELiaybRub1L3odqFOpOZdqUiaKyot70MJFib37bJBfOvz945CRZ2aRnjzTw2WpCjur7JZVO9beAEpXW/0', 'oyP7DwKnrmvYhWOIjJ5vj4lWurjI', '', '0', '', '1', '1', '0', '0', '', '1473090503');
INSERT INTO `tyms_users` VALUES ('2432', '巴斯滕', '', 'oyP7DwDkQWihqfjA4BzDLrVFSSUg', '', '0', '', '1', '1', '0', '0', '', '1473091471');
INSERT INTO `tyms_users` VALUES ('2433', '越努力 越幸运', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0T34cpiaY0SRNegTb5M3uEMqib4KcBjficBPvjX82K3EkdMnibH1HicDrQYn9Y0N5gSywkDFPUpm17zutkglH1J1LJs/0', 'oyP7DwI9nIci5ENWX0Atm8LzP6Xw', '', '0', '', '1', '1', '0', '0', '', '1473093272');
INSERT INTO `tyms_users` VALUES ('2434', 'A麻辣小龙虾～鸡头王撸串', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY5yAROYbJ2MnJ1CWMyUYia7kJGHdfgvdywnGKKWcIAkmcpibKA0LRwZwvGvX6XlicibdxWoq4b155F2V5/0', 'oyP7DwAuqnc3C32cq6lIy6JgXvzc', '', '0', '', '1', '1', '0', '0', '', '1473110304');
INSERT INTO `tyms_users` VALUES ('2435', 'let it go', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eGp2NspOAumDbmt9Dtp3cXCl8tYfLfeDEZNAG683bEzbuFaA0iaOdgnXz5vLnbS60icQvLk4rt008k/0', 'oyP7DwOVELVtc_CQ7wPnxxjsvZcM', '', '0', '', '1', '1', '0', '0', '', '1473119022');
INSERT INTO `tyms_users` VALUES ('2436', 'AA雨鸟 灌溉设备13913853639', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEKkQkM07m6wFV7IVY7KhtKGOW4GLhzO9mvu9fJUOKYQ199MDibGt7HgCoYuyO7r31ulmo196Pp3K8/0', 'oyP7DwERPNltTz4sbtIXhtefklus', '', '0', '', '1', '1', '0', '0', '', '1473122323');
INSERT INTO `tyms_users` VALUES ('2437', '晋朋', 'http://wx.qlogo.cn/mmopen/LF5ufsDqRDZBich9sEj05SKGCibKticAcp07ZvILJxumVxIYhzfSzK4M4Nficpicm2MakiaYYIVjxsibs0FBZHoprdKUj9oL4kDJaog/0', 'oyP7DwBeLq2cG2Q5sqCgb2TAOb9U', '', '0', '', '1', '1', '0', '0', '', '1473122647');
INSERT INTO `tyms_users` VALUES ('2438', '果子', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKdlrKVLMXy2yo1JkBcCEibEUBFDu6e5cJCzKFdA7IsxcjVWK0FZUABD7wLUW2dvW3DCAgWU21Sb8A/0', 'oyP7DwE7e5K1w6vQYpSRJBuMDyFo', '', '0', '', '1', '1', '0', '0', '', '1473124029');
INSERT INTO `tyms_users` VALUES ('2439', 'DullaHank', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0ZZOEnU8jwB4dibO9raBp1Qiayobkyyz8zbiatnoCwjWFnpsoeySicvKibH2uMMwGqObsO0jIag8Kg5WO/0', 'oyP7DwOyAU9nIVGhgPk0FyPOtjZc', '', '0', '', '1', '1', '0', '0', '', '1473128141');
INSERT INTO `tyms_users` VALUES ('2440', '芝麻', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKZWX35WOgjChwuc3ibm4jP8ycuPs2VT8DkX71pPRj9qpBXwiatCoPomLm1rdZ3GLGkzxlhrLEgqFjg/0', 'oyP7DwIhh59FaiEKu57bXmjRONXc', '', '0', '', '1', '1', '0', '0', '', '1473129147');
INSERT INTO `tyms_users` VALUES ('2441', '伟志丶ZHAO', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEI5MuLAVibeRWcGoPbpeEgZhTwiaoIibkib3dCedgpRkAVPmZvguOat14iaYA94NMXoiaiaNVj7OyyibJA9g/0', 'oyP7DwLoL8oCgSOLk8yE1OlCT49s', '', '0', '', '1', '1', '0', '0', '', '1473129601');
INSERT INTO `tyms_users` VALUES ('2442', '木木', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL6svbjy58HtGlpZ40jxbtV9KSTqOqEwIuzFibxicLcwnDtnKDQWkpibB9JybQzXM0TXcg0VzoVia42QAJZQjPyQkS4A/0', 'oyP7DwJ3fyB9D4Zc1mdgfNzCAQuY', '', '0', '', '1', '1', '0', '0', '', '1473131125');
INSERT INTO `tyms_users` VALUES ('2443', '拂晓', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90CmXibcBzzpTXTfv41ibXwHqk1rCkEWQ3WJeQAZsqGsu0R6nalbI7d2EZjy42aF9TaZKsokzxm2koO/0', 'oyP7DwEs0o4laMBPngGeNwFK7fZk', '', '0', '', '1', '1', '0', '0', '', '1473131923');
INSERT INTO `tyms_users` VALUES ('2444', '杜杰', 'http://wx.qlogo.cn/mmopen/086TMlyKVO4V3fdSWdOn195PEoavweficF7pbHYGuRKTialoxicoB0mEJ7ic1tdcNgkiaILsZMibVZ7uATrXRhjNZiaaGghTMKPoH8S/0', 'oyP7DwP6XQtSjhw0wJmafFd0WjEA', '', '0', '', '1', '1', '0', '0', '', '1473133530');
INSERT INTO `tyms_users` VALUES ('2445', '桂林自由行开心旅', 'http://wx.qlogo.cn/mmopen/iaic26T1Lo3pGAOAQckkQNzE5dqnvT5Kn9ickBJ75V8kiaG2dcJFPqS4iavOAzYQyjy91lsWP2lOz01ZI2CkHrCj82d2PPUNABLSN/0', 'oyP7DwA_aTM-WM5ikz2aY4J5Cow8', '', '0', '', '1', '1', '0', '0', '', '1473134381');
INSERT INTO `tyms_users` VALUES ('2446', '911', '', 'oyP7DwIALN50O9JEeydo3s3dEPEw', '', '0', '', '1', '1', '0', '0', '', '1473138871');
INSERT INTO `tyms_users` VALUES ('2447', '六条', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDHDZlVZYgxDGHsurstMciaIn7gKuNQu6SGTyNiaDyGqq73pnww4qtO503qtoeav3qHic8obtKjYmlp/0', 'oyP7DwKO36pOx5ViwOA9G0idMkzw', '', '0', '', '1', '1', '0', '0', '', '1473140292');
INSERT INTO `tyms_users` VALUES ('2448', '鲁曦', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eJtoqRMwOaD9JnvAuMlNniad4b0fl2DXAbicDdOqdBI0TncrjHBia6huPssTybOUV3ZKeyzlibMPWd2w/0', 'oyP7DwBZnK1uIx2mVbWFYbXr-G44', '', '0', '', '1', '1', '0', '0', '', '1473140558');
INSERT INTO `tyms_users` VALUES ('2449', 'TKING', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBocDGZCfmcUvafaW0Z2lNqTKgwuraVGD2etnzSYtzNs8lAibC7fm1nynjwyU98Ib7mlBExFcIkwuQ/0', 'oyP7DwPOFdBkEdTY9cxhjTtAAZ6k', '', '0', '', '1', '1', '0', '0', '', '1473141166');
INSERT INTO `tyms_users` VALUES ('2450', '力涛', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QkibnBN2wBf7f1teJc28GMUSib3M91iaPnawAKkBSQicDfKg1kpmxgnNYvnYkV2o3HCicakoRztKPia2o/0', 'oyP7DwPse1R_enWOl3FC9a-3c-6M', '', '0', '', '1', '1', '0', '0', '', '1473141633');
INSERT INTO `tyms_users` VALUES ('2451', '吉祥如意喜训如山', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB62AUkahThYsBmy2huFgbx3N8PLvJVbGb9sjMwRuo3nEH2sCmx75acDZYpJc4OEibRrcTicNTArt53NeEDrKC7ia6iccEeJZsSRPM/0', 'oyP7DwDhOj83qQCGco8NrGFi34_c', '', '0', '', '1', '1', '0', '0', '', '1473142835');
INSERT INTO `tyms_users` VALUES ('2452', 'Klaus', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEMcJVgt5VibFnFjFjUEevEeaOibqG1QPeyYbP1OTNf3AvbBr1Ov0evQVY1vQicOqNRJ9D8EajicHlNzia/0', 'oyP7DwCdOcLNMKdV5agzPct5QInU', '', '0', '', '1', '1', '0', '0', '', '1473144209');
INSERT INTO `tyms_users` VALUES ('2453', '张涵宇', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3UbT7YAPiakgkorqVh6Vico9nWicxnQtabXUAobnaNCiaQniaicDWIyPRZibfIn9I88xgNo2MGqWxhuFxxd3mNyElFP0t/0', 'oyP7DwNwQulRkf7zJtBAYi8qkJAw', '', '0', '', '1', '1', '0', '0', '', '1473144952');
INSERT INTO `tyms_users` VALUES ('2454', '淡水', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELBrTRCgEvO3bGHD9Ksnj0bgiclDlibYMz7sbCmoZkdd6nOryFkFeDziblqlNKjCVX5FyyibJBoctYT6Q/0', 'oyP7DwKugbXzKOPJE-eX8AJ09NhE', '', '0', '', '1', '1', '0', '0', '', '1473146482');
INSERT INTO `tyms_users` VALUES ('2455', '等潇湘[太阳]', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0RibdWBkmp2fMBz58qIibDARcoho8YfyD5JDRQcmYXFytIagpwatT3OXt00KN6XE9rsZz7juicUytdV/0', 'oyP7DwMxUQiJ3I8lMzfRyjC_rm28', '', '0', '', '1', '1', '0', '0', '', '1473147422');
INSERT INTO `tyms_users` VALUES ('2456', 'QQ用户', null, '25B6226FC55A42A2B28FCA1C3DCD226C', '', '0', '', '1', '1', '0', '0', '', '1473147666');
INSERT INTO `tyms_users` VALUES ('2457', '老凯啊！', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia47m1k3vL0h30AQQPGxnOs7p8e6h38dyJF1Bia9ibhHbCxBaaokTIuuyfrhTBuwDqmbiaC9qfXdcnz4/0', 'oyP7DwA0JrTAZEE0Wuc7Fk_OmApY', '', '0', '', '1', '1', '0', '0', '', '1473148235');
INSERT INTO `tyms_users` VALUES ('2458', '特种兵', 'http://wx.qlogo.cn/mmopen/ZV9ibMY2iaOQBFXz9l74WY525JRiayIRzJcD2sn9uNzdvCHJiabcVbvEflNCj9zvTFVia3EMr8sFYZNhe90fv0vpgxp4XrSmUbM6D/0', 'oyP7DwGJkXjOkx_lpKlJCu3hywJ0', '', '0', '', '1', '1', '0', '0', '', '1473148831');
INSERT INTO `tyms_users` VALUES ('2459', '安东州精品商城andongzhou.com', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0QicGznwLBWxa0iatLEoErC41nv84pFsr2JWf5UTcGZfzb6gVuzWZGDxdLCDhFMNfDiaC67BkNMHqCs/0', 'oyP7DwJmPCcCoQaxVY1DYZtZMfyc', '', '0', '', '1', '1', '0', '0', '', '1473149514');
INSERT INTO `tyms_users` VALUES ('2460', '冣賢', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3YQNEP3k0AyibaLesXfbXqWKlLWt0k465RWDDKxM87Q9ZtaticbxFjWum6TMV2jiacPPquDAd4KFVwg/0', 'oyP7DwLuCWq1roDfaT2AwW6k50OA', '', '0', '', '1', '1', '0', '0', '', '1473150236');
INSERT INTO `tyms_users` VALUES ('2461', 'QQ用户', null, 'D2457C2769A0F1143119B22884FD251B', '', '0', '', '1', '1', '0', '0', '', '1473150485');
INSERT INTO `tyms_users` VALUES ('2462', '草莓', 'http://wx.qlogo.cn/mmopen/BzWCcPP22nOy45LczFRHcZO2bPKNkB1kX2MczVwy6KFhGwvU4Y2ysdRRjZibMKQNiciacfqiaUPibg7gDY4ic5mOGYr3OAY4r8bF1b/0', 'oyP7DwAj4eQIUYClkNAfP5E4lAWc', '', '0', '', '1', '1', '0', '0', '', '1473150819');
INSERT INTO `tyms_users` VALUES ('2463', '赵小八', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAMcnwSWKiaXstXYcFnkvaQvmEJm8PXvHQDPyD7SVPR4c0TDSC3PLbQRySSOPzVZZiaGKfj2V030x0Q/0', 'oyP7DwD-5ozV9bIB_IA1_cWfb2Zk', '', '0', '', '1', '1', '0', '0', '', '1473151175');
INSERT INTO `tyms_users` VALUES ('2464', 'pei', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCg7tzl4j1tDXdxvSBXdvebSP4SQtHtYs1MYOxl7GAJAKsGMbmfricRFicVf9b17axicvvmGBZovmSicg/0', 'oyP7DwJ21Zahe-flCqaDVREYzBRk', '', '0', '', '1', '1', '0', '0', '', '1473151475');
INSERT INTO `tyms_users` VALUES ('2465', '大白', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeos4uwWxfpJ804o6Zribb3WfRkYcia0qBK1m8AuicZnbd4l2YV3ox5yh7cKoGjaUXZGl0CsV6uYHWqcDnicywic5wCia/0', 'oyP7DwOmWw6hv1ewYYvxFDrqDRqQ', '', '0', '', '1', '1', '0', '0', '', '1473153618');
INSERT INTO `tyms_users` VALUES ('2466', '梅花一点默', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4ial2aKkDE9V7p5aibRUruCtNEDnKCibAJVZQXAyOgicANtK0rbzN3ibFyfSmn1fZvs5rguAlFZcQXR5w/0', 'oyP7DwEEyRaZeBCiADwLFqcF72VA', '', '0', '', '1', '1', '0', '0', '', '1473153671');
INSERT INTO `tyms_users` VALUES ('2467', '天蓝', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3Uf81O59cia4rxIdmWxnL73zIlU6mC3116qLCugxc2c6edw5EgYO3gFwRpl66FribqtyF6WZvV6J5g/0', 'oyP7DwLTfKKio_rHT8BGlpviQack', '', '0', '', '1', '1', '0', '0', '', '1473157170');
INSERT INTO `tyms_users` VALUES ('2468', '测试', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0Ckyz8US4WiaCcmmsR8Jw9MgPSAgHF9l07BwIxwElHkFuic2XdicKjnjlF6scdSIDMvhqbicN8rJCyB/0', 'oyP7DwF-xoz2p7rB10MpkT2JJFQA', '', '0', '', '1', '1', '0', '0', '', '1473158893');
INSERT INTO `tyms_users` VALUES ('2469', 'Stroustrup_Lee', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP0RvV7Afp8wrdYNC2kGXMribxpic4cibO0qvKNG3bgMANWMK2xdZkiata0HHqiawm0TtU6s47pf3bkNmLNQLicoPiaMDjF/0', 'oyP7DwGBF4KkmblFw54cM_u0JWE4', '', '0', '', '1', '1', '0', '0', '', '1473158986');
INSERT INTO `tyms_users` VALUES ('2470', 'AAA十倍不是梦', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP3qaDNsCRUQvBrFaicSSNMk2UR11dpkibDGInmpZ7FWsXVK0nF0dnz4jIibKyY6tW3zIZKZPICiaqiaD5fh3Zds45tMT/0', 'oyP7DwKtiZc7G6R6znh_mtVROh0c', '', '0', '', '1', '1', '0', '0', '', '1473160648');
INSERT INTO `tyms_users` VALUES ('2471', '淡忘', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibepibq4vHMUYJQg9ZawSGU90icna5ibtHL7AWBbj4OWMNfe6PZsrrFn09Uocqsa5dAttE9OEjxVqYQDg/0', 'oyP7DwDNINN0zV6n-uzWG4nCUzUc', '', '0', '', '1', '1', '0', '0', '', '1473162381');
INSERT INTO `tyms_users` VALUES ('2472', '林贵良', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia0yK7WOBsYgAvicWIRYzcjHkMajibsqVHaSV0H9VQJLCXGE2QA6bLa5um1kpmUf9V68o7RYZ7fEy5v/0', 'oyP7DwNObImdP-3-vNkoQAVd4NuE', '', '0', '', '1', '1', '0', '0', '', '1473164314');
INSERT INTO `tyms_users` VALUES ('2473', '百里奚', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIy00PHyESZGQZibo2M44KEvjon3gfB5UUcFiaFjqhQ2Rj1dFJXuzQicEA2mJ6yrggJEmiaOwTjzpFZeA/0', 'oyP7DwPQ4QrRzXvxwz2YNrnHAVio', '', '0', '', '1', '1', '0', '0', '', '1473169295');
INSERT INTO `tyms_users` VALUES ('2474', '瑞班克', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayYia9HCv45D2n9J1mNWDxibNQCxUX44n4n7xHLJEK9tro4Epql4RvKNHRqyvrqdzlQVW3VsomNYZ7/0', 'oyP7DwIU_odcheau81rNUklohqJE', '', '0', '', '1', '1', '0', '0', '', '1473169788');
INSERT INTO `tyms_users` VALUES ('2475', '海纳百川', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcoic0xFZSEtaBjU6mK0Hth5PnmviaDrHWQz68BrYdlqibKRoRRCrpBGxX9rafic6yaD0YlZbcgc3Wd0g/0', 'oyP7DwNETn9cHy1Uc7N1g08xEVHo', '', '0', '', '1', '1', '0', '0', '', '1473174122');
INSERT INTO `tyms_users` VALUES ('2476', '大神', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCCdDpJF0HLA4pSCnn5iccQTRklRInibFcsiaWYkFOCx1UYHodiccTqBx23VcZO3yJZT6c52Q4tyf2oBjzMD0SDWYibiakWZ6Jmeqyso/0', 'oyP7DwALPtHTEUGWpCL0fKFjeOqQ', '', '0', '', '1', '1', '0', '0', '', '1473174695');
INSERT INTO `tyms_users` VALUES ('2477', '胖胖灰太狼', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5kLBFeEqOa4s9TzUEFxVIjCvMGCvgR9dEKXxhbg3HgybTZR4dW33PWXHG1cibsCtTASr1qzOibuboA/0', 'oyP7DwG6XoX-bPJAAUYTFW6qbD7s', '', '0', '', '1', '1', '0', '0', '', '1473176002');
INSERT INTO `tyms_users` VALUES ('2478', '谢凌剑 Linkin', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdiaYc8hFicrMvMqD7RzWSNFSneVlnmqFWrklrlljqYOQYKkwobIugHMPVcd3jc9yT5acvruWZoAibAw/0', 'oyP7DwIY5Zn0T6WeG4vj3bWQcTww', '', '0', '', '1', '1', '0', '0', '', '1473176508');
INSERT INTO `tyms_users` VALUES ('2479', '吾皇万岁', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0W2zKKxLGBI0HYR7OPtSUtGRD4hUv8ic9CTT7hvvIWKoDmFnRa9FvXibKesA0P3ZAmwFUWuYj0wgk8/0', 'oyP7DwJHEmCE14xg3HdZ3N5kXfms', '', '0', '', '1', '1', '0', '0', '', '1473208844');
INSERT INTO `tyms_users` VALUES ('2480', 'D.C', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0VB0GdFR3kznJibE5JhiaeW7ThFIK0CpDfIibeY28HKaxKDvvuXib8GXM3UicbfjGF0KzibiaL2JT5XKbm7/0', 'oyP7DwCLFOVwTPwgP4yJJPvyKKic', '', '0', '', '1', '1', '0', '0', '', '1473209662');
INSERT INTO `tyms_users` VALUES ('2481', '墙', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eOYs2AgZaibbq7ictKOkrqAfkJQ7vpCPovXDic64tmI5v6O0fmvwYCJWWK6sTrSSTNCAaVAoKKHezzt/0', 'oyP7DwDz0-rn7urarikWcNUCA2c4', '', '0', '', '1', '1', '0', '0', '', '1473210650');
INSERT INTO `tyms_users` VALUES ('2482', '韩振军', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIgp7SQsFMZGMn6uTYL1iatfy9mBthmibjaObpldPyibpLIic0q2hP3WxyNI9icic8AlSM1iaMia6ASLx8wN/0', 'oyP7DwDK5IHjyfx7H__XQLd9PDdY', '', '0', '', '1', '1', '0', '0', '', '1473210981');
INSERT INTO `tyms_users` VALUES ('2483', '喜马拉雅', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM74kP9icupNjsp9iclibARsaDdE2ZflYB2Fial5UT0WhHa2bJpRWZfP2u9de6y8MF6MHDxdIIE3RYiaf3Nu4Sxeg2soEcRr51SUcaK4/0', 'oyP7DwGZPdIGGY3_uaQjg77ZH4es', '', '0', '', '1', '1', '0', '0', '', '1473211330');
INSERT INTO `tyms_users` VALUES ('2484', '醉·清风', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCfaxkRjnBXzsxf0A3Rn9b445DNEibJE84EO7s0VQJhPNmjibZ0HJ2Fp2kvuyiahVsbrNGIlc0SKhnCg/0', 'oyP7DwJWbQudaY4Ok8imPz5Wl7_4', '', '0', '', '1', '1', '0', '0', '', '1473211386');
INSERT INTO `tyms_users` VALUES ('2485', 'JasonTang', '', 'oyP7DwNTywBLCm_6bo7_48fsUHqk', '', '0', '', '1', '1', '0', '0', '', '1473212190');
INSERT INTO `tyms_users` VALUES ('2486', '寒星晓月', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1Z3W2Kb0YMuQDAfT8qSjohoDtt5Q76iclfhLlZibQPlMAgria36jEMibmakDSuribUHFDzKTpPHNoFIxdGw2KM4bicJr/0', 'oyP7DwI2eYVV6DUU5rnU1y5VM-4Q', '', '0', '', '1', '1', '0', '0', '', '1473213358');
INSERT INTO `tyms_users` VALUES ('2487', '瓢儿白', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia9gz8xFZfXj7q8BBh9jMvJvAqf0YSlmdm5lII3heXjEx39iaPMEC42OtpKNQibicYNZncHAzibklFmvK/0', 'oyP7DwER8GVECy1l9WbwRD6m_Jms', '', '0', '', '1', '1', '0', '0', '', '1473213584');
INSERT INTO `tyms_users` VALUES ('2488', 'fishstudio', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5YgeHY5MlXbEjhxcDppic1lGSBKET2T1jlCf9Asbx2tncF2K3gpOLpibIjvkfKEicBg70nEzdN2icxy75I9nIHmO5a/0', 'oyP7DwLjJxcrtVJbVxHlJ-fEidpM', '', '0', '', '1', '1', '0', '0', '', '1473214689');
INSERT INTO `tyms_users` VALUES ('2489', 'Carsen赖志华', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC7BVu3pChC0bJJBH9MGKDPhdHDeJBEPDsg7Gju8wC007ES0QHvGxWiakwGNFic3uLU35FHsWsLHGoA/0', 'oyP7DwBxss0aEGnUNlZhARzBlIxM', '', '0', '', '1', '1', '0', '0', '', '1473217776');
INSERT INTO `tyms_users` VALUES ('2490', 'Mr.郑恒锋', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UPoaHsqcYpRh74ZrW47rBoyHziccyZRxEWA5FhZ9bgOBIa9pY8Rfkfxe9eXibXBEL2NnNdCibDsKBo8/0', 'oyP7DwJfK_uzhS4p3S1dbbcUefi8', '', '0', '', '1', '1', '0', '0', '', '1473218609');
INSERT INTO `tyms_users` VALUES ('2491', '冯仲伟『物联网＋平台开发实力派』', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1gMuFN5wtfDiazbOZTe0vbY5Bk44N9xGaZHlRCPKVXp2wF0VtKMVEibicJfAZpD9w4NKRO6e83zP4O/0', 'oyP7DwIYjWeqgcb7Dr421RXzevJ8', '', '0', '', '1', '1', '0', '0', '', '1473219320');
INSERT INTO `tyms_users` VALUES ('2492', '冉', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOY9GNSVy4yAouKCjeYkJ02tN9PNSs7w0dWxemaI4k1cKM3cK1Pm0yIYLjH6OdIDx8UIyMUibB7fP/0', 'oyP7DwKXaaBfiSfKp_yakRLdMRkU', '', '0', '', '1', '1', '0', '0', '', '1473219583');
INSERT INTO `tyms_users` VALUES ('2493', '宋恒冲|物联网互联网电商平台建设', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEBNciaQic69V7CjDMM9TPZbTibw1910jGNfCywKdWy44gslTQjHTukI2c6MrLfFPJMUGENsecVe6N92/0', 'oyP7DwKfGvA7k3w5b9PlQhOqFi2A', '', '0', '', '1', '1', '0', '0', '', '1473219915');
INSERT INTO `tyms_users` VALUES ('2494', 'Joy', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBPaNVJVKyKich83acZAckZA4DWqjHEGlKjoBqkZNl1KicUyy3FT8Sk1Fzno6tZXibKic4wp7zWaCUFSA/0', 'oyP7DwONtyNgqOBhzxdW8OEbba3g', '', '0', '', '1', '1', '0', '0', '', '1473220016');
INSERT INTO `tyms_users` VALUES ('2495', '李淋', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1WrzV1w7894Lb0oicR9Dahhibyup2YunoV8m84tHj9JCy3LMWD7JFWhXZB1xPibGa4NftFtrHLaJsUibMco3WWfZrd/0', 'oyP7DwFSUAQPzoKQhQ96D7vaartA', '', '0', '', '1', '1', '0', '0', '', '1473230572');
INSERT INTO `tyms_users` VALUES ('2496', '业', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0fqbr0ySqXFxHQ7RJ3q8wGfp5Ef1Vg8hJwssTyR1tu2R5lCFknVe0rjwxpIC5G03jJTDQy2Pv7x1/0', 'oyP7DwIe6uZM5L9sCO28B6bBcvjI', '', '0', '', '1', '1', '0', '0', '', '1473231161');
INSERT INTO `tyms_users` VALUES ('2497', '肖柯', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0SSkOmE2OTGM5gH8H4RgoK7efsnEbpf7cicAIq2947Krq0NFn2XAVpchPxV3cKicmhjcMh6OqMgQTh/0', 'oyP7DwPgxKb388u3SspRnCHEi000', '', '0', '', '1', '1', '0', '0', '', '1473231546');
INSERT INTO `tyms_users` VALUES ('2498', '肖志斌', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMt0vwPzr2z2A9HyPDBsx8eMnRTWKWnl4ztYzXX69bpBJYibUmcFe10RcZNHnPGyz5UKWlJEbH6O5/0', 'oyP7DwHCEncpD6ZhlQu-I41lrh-U', '', '0', '', '1', '1', '0', '0', '', '1473231786');
INSERT INTO `tyms_users` VALUES ('2499', 'David_ssc', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4JRgAp5blkfSORWoAkoQTAJJ6s9IqjicA7aiaf1jBQgUlvOvPYSNWAMNNa2adWqsddHLRAQbIXDN3Bib9Gypb30H6/0', 'oyP7DwM29zE6vVteHlj1i7qjDhRs', '', '0', '', '1', '1', '0', '0', '', '1473232498');
INSERT INTO `tyms_users` VALUES ('2500', 'JHC', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCNqs6siby7EY1UY7OL7CQprVkM5pFyeBuYg3luRlvyVSPo9yb3HrksfFdeBQc9fUhqxic5OQ2kNdLA/0', 'oyP7DwLZ6wj4eD3tyyvm3aoQhdgQ', '', '0', '', '1', '1', '0', '0', '', '1473236492');
INSERT INTO `tyms_users` VALUES ('2501', '叫我林山', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECXW8gYMs54DMKxjO8C0NSvb8Via5YqegBDJBJdVqdce8bSLh84IaFXZ67qtVmVx1mU9AvRkib4rVe/0', 'oyP7DwLA_tgReV-E_w7s1vo4Bdak', '', '0', '', '1', '1', '0', '0', '', '1473236647');
INSERT INTO `tyms_users` VALUES ('2502', '来自地狱的勇士', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBULQOf805sUHmcdukVSsJjw89TId9JrzS1fXZc70uBbAr7nibDVwMGeossr5UbIoA9M2vvCh0wp5Q/0', 'oyP7DwPCV3Z9AvwpfhPsmZdfks4k', '', '0', '', '1', '1', '0', '0', '', '1473236909');
INSERT INTO `tyms_users` VALUES ('2503', '哆唻咪', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEAmTib4DMZib7sQ9h2pSJ80Wp5ibK3DgQicavte3JhXqWGibB5xWLzSLYwG6j7fJjywVwz4keaPb8mClF/0', 'oyP7DwCwxvPAJvXgS2PnXuGFKU4Q', '', '0', '', '1', '1', '0', '0', '', '1473239300');
INSERT INTO `tyms_users` VALUES ('2504', '夏至未至', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5tDQw57uAQTpicP1VXibReAmTRbJG5gF2EmKBibJvPrHlXgKUtURpeTKo7TUgicONzglXt8HqZRDjX7wuQlJszw8Wz/0', 'oyP7DwPuFHsBC3nTwLZ4J4PzoPxY', '', '0', '', '1', '1', '0', '0', '', '1473239329');
INSERT INTO `tyms_users` VALUES ('2505', 'A#  言•者 ¹²³ 〰', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iayQpdFvMS4Rra6icIDol8yJyAI5DiaOEe7fjuIuslb7b6GK6cMjRFQ7sEibcBAjAB3HXotzURfqVJiah/0', 'oyP7DwOKRMFZ86LmF6Tfz5GEBt9Y', '', '0', '', '1', '1', '0', '0', '', '1473239506');
INSERT INTO `tyms_users` VALUES ('2506', 'QQ用户', null, 'B78557EE910CF56122E938414457D579', '', '0', '', '1', '1', '0', '0', '', '1473239546');
INSERT INTO `tyms_users` VALUES ('2507', 'A  +  V龚', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibLbssBVkFJwaIOjsuNAicCXJLRwX086O2oCKnVm0KYNZDnt1VqeSw5dIcnr8ADfZgFCdEAbdsxVC/0', 'oyP7DwNXk3bv2VhY-xqo8m5ENjsY', '', '0', '', '1', '1', '0', '0', '', '1473239827');
INSERT INTO `tyms_users` VALUES ('2508', 'Temp', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI3hjB76DFplI2UAX0OJ1IiaibxkUm0ERibAUgMONwKWkKicRc3RdyqibanwEH3Cnw1wpudDwa7yHyJp8g/0', 'oyP7DwB7z8kg0G6JEht6hrtvHjg4', '', '0', '', '1', '1', '0', '0', '', '1473241051');
INSERT INTO `tyms_users` VALUES ('2509', '', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfdhbPQwmTImASj1HvLfOLSW0mlw2RmSt5ybYPmsQSh4ZMu5I4ib90aqDticAspjc1wY5XxjDo3EQgkmkciaK62vO7/0', 'oyP7DwMJW_idDWrWMAwfHv4CP_q8', '', '0', '', '1', '1', '0', '0', '', '1473242079');
INSERT INTO `tyms_users` VALUES ('2510', '诺诺', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4w1kCvsF481t3aZKudIw5ic0xZ7O3SkF9DC8FXDScA12pkDxJKj0SPkx2sgZx23e33o8hgxdRH8zDvVvSfOpToYqYnvnHmUhx4/0', 'oyP7DwDJTomxOGwEFVWXPkB0wXUU', '', '0', '', '1', '1', '0', '0', '', '1473242443');
INSERT INTO `tyms_users` VALUES ('2511', '小巫师', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL4uYoCYE5dQgicetHH8nLt1ltNC6EXLSf7gb3fSKflrG5PLCcZDruicYOqncZsb3kd7vPgeR7pqqiaFA/0', 'oyP7DwIwmUsQkv6kltGH97_nxU2k', '', '0', '', '1', '1', '0', '0', '', '1473243050');
INSERT INTO `tyms_users` VALUES ('2512', '张惜兮', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90MHQhThXqfhOPzaDfu8G7KS0aBO6tg8icLGKicYRORJk72icTtuVOPe6NT5C6tgjXhiaRGqiaNebKicycp/0', 'oyP7DwOJZIYDAFkvGuyUicDlauzM', '', '0', '', '1', '1', '0', '0', '', '1473243635');
INSERT INTO `tyms_users` VALUES ('2513', '哲哲', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4mEquav8RmeP0pt1ke6BoSaSdyKVyIpTbm8GP80m05NfFArLvXAHTfwrrCPjFLshxiaLJdE1c7rsg/0', 'oyP7DwEth1tanLDpslNX4BIt5sI4', '', '0', '', '1', '1', '0', '0', '', '1473243766');
INSERT INTO `tyms_users` VALUES ('2514', 'Toby', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM43PoopDw9WXicv2yhT8t1AoZTLhM8v53Q1nbmYmukxjDvJ2GP2vqdZfFBlic0j5ziaWLK1275wu2HdA/0', 'oyP7DwHVctuF6XGZpnBA9alBM0is', '', '0', '', '1', '1', '0', '0', '', '1473244558');
INSERT INTO `tyms_users` VALUES ('2515', 'PAGE Life', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNfnOdibnQvfC9uqEqDy8W3npsiaRsMM8vRasyRWGbY8OORZnFHWiapXlLclTbaEqVRibKEDydOemIb0z6ic8Ew0JlMKteTw9l2tH4/0', 'oyP7DwFdv6Ewm0m3yrLRiEix4nSY', '', '0', '', '1', '1', '0', '0', '', '1473248373');
INSERT INTO `tyms_users` VALUES ('2516', 'beborn', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECiaicnv66NtXACSLm1qFEvdEFWXicHQxZOBwKFxiaDK1MAzIDyribNuztm4wjRwtDiagLG4Y7WDl4jfWC/0', 'oyP7DwDM40sdfLP002_ttWdpRi70', '', '0', '', '1', '1', '0', '0', '', '1473249693');
INSERT INTO `tyms_users` VALUES ('2517', '喵帕斯', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6pwTZtay1k4ckIibgcTaHLJwA2qc7eqibic8JJ1Z1MC8S9yoliciclbAXpPCSuMVRJ1J0JibdLKE1zQJlg/0', 'oyP7DwLPFtuKss3Ajgycbie07chs', '', '0', '', '1', '1', '0', '0', '', '1473253532');
INSERT INTO `tyms_users` VALUES ('2518', '▇▇▇▇▇刮开有奖', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eIiaHfgiaMp3IqF6diaFQnbIJyeicrgzcVx3jSb1RcAXXrXxjGFKJtY4bumGyN89fK5CcEicxzoeXDChD/0', 'oyP7DwKPLa8R2d0CrD3ESxTCf1qk', '', '0', '', '1', '1', '0', '0', '', '1473254974');
INSERT INTO `tyms_users` VALUES ('2519', '优配菜888', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2icdkfLQ0H2HTNfgVxp74VRv7VfvpeSDylLicgpyKTF9iaiahcicambzHQpxH7FEjJEDHUF44rHnXnJvg/0', 'oyP7DwAiwJQhlijoeLHem3M_aZTo', '', '0', '', '1', '1', '0', '0', '', '1473257378');
INSERT INTO `tyms_users` VALUES ('2520', '_Change', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEDavibkhUbLzLORjlH7RicR17rRtcx59yFs0ECdkSxjF0znwicI6GtvE4nMTHOQsW4GrFFicUOibnfTBO/0', 'oyP7DwMjHrnLat9XJ3wQeiqrVyxE', '', '0', '', '1', '1', '0', '0', '', '1473258970');
INSERT INTO `tyms_users` VALUES ('2521', '信仰', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dELCpdjlnsZ4yibLC6FEmKVYQenoub2oTTOb5hicwQ9hRLFOJASPMM9IvlDRibZUY3lsveNVI0osZq6s/0', 'oyP7DwIhikGlZcjrBWPeFm2DjEAY', '', '0', '', '1', '1', '0', '0', '', '1473261975');
INSERT INTO `tyms_users` VALUES ('2522', 'Hhj', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOXxxjQYbNfPdicGOmNVMAx4cOI5sHJH57uTMibhN61GialWiaNt2KK4DBAYVBwKBtMxtibiaUgg6CLVth/0', 'oyP7DwD_M02eqFicgo509jqNhndk', '', '0', '', '1', '1', '0', '0', '', '1473268303');
INSERT INTO `tyms_users` VALUES ('2523', '承一', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1ShCFbMHxSgT7HPoYYJ9Bu3Cd4rRbFLGhP9osW48dLQF1MUFnAgibTwKM9A8HVF65Afibzkgvib4Fd/0', 'oyP7DwOIqpTuAU1wILnwx6zMJino', '', '0', '', '1', '1', '0', '0', '', '1473277846');
INSERT INTO `tyms_users` VALUES ('2524', '下一秒べ变坏', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeYomv8uj8bibNc2D7qgJfh3rD753IFBiczfyS95QhTCibOFV9aaguzPmgic1WojGuv1nvyWqXbEVvPPQ/0', 'oyP7DwDMUcJLmyLrr8IACswLRLe0', '', '0', '', '1', '1', '0', '0', '', '1473295082');
INSERT INTO `tyms_users` VALUES ('2525', '梦在迪拜', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEFZkmrxLtNpbWZpnMesnnOuLuBdpF3LhpQO6JAcLxiaibQIx4fN30owVqyfLE9CNibt8e3Eulk9LTI0/0', 'oyP7DwBFitqUu2a6rr7Mb7QQTlbc', '', '0', '', '1', '1', '0', '0', '', '1473295304');
INSERT INTO `tyms_users` VALUES ('2526', '安安', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90OiaCTCUqia0cyBUhQIPCs5QhXC4SSxuFsexR27ThoQNc5icic1ZiahoJo1wzKGaqr9cA6GIRLs9TW7Q8/0', 'oyP7DwByU_MpCpKccVqMMHQwRcBA', '', '0', '', '1', '1', '0', '0', '', '1473297519');
INSERT INTO `tyms_users` VALUES ('2527', '范才林-互联', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0cxfhVhIyL8pf4XG7XlgicnuFtl5pA0b2vupEdwroDF1PzDfEiackAfzYV0CKMic1htUgmxC5iaKJEzV/0', 'oyP7DwD62boGCLWVv1ziqkvxupgE', '', '0', '', '1', '1', '0', '0', '', '1473297563');
INSERT INTO `tyms_users` VALUES ('2528', '北吉星网络', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKibMFa0q2UEDKbwCicXUDia5vfDYnQBxhDibjyuqDicu4QlEAeicKX3RxxbUkLnRJQCBhNGWc3VdmMEZPw/0', 'oyP7DwKfhogLpjqnbhCzEHNjquiY', '', '0', '', '1', '1', '0', '0', '', '1473297614');
INSERT INTO `tyms_users` VALUES ('2529', '姚金星', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDRGzFD1mMJUQRBAd16x9X8N3JvQIrv2yRMeicVIrquN5lLnNfeciaiaEA8yGiabQJgeNOe5mxlRjKzIA/0', 'oyP7DwDjMS28mmJ3tZUaEGwRBAlU', '', '0', '', '1', '1', '0', '0', '', '1473298963');
INSERT INTO `tyms_users` VALUES ('2530', '沙拉哥', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKxBZwROHicQV73mYk2CfJ3CdMDjUNFCmWWAIkiaHIeBJ4dKBo055d9ibT5icxkuFdW4f1e9iae7URveKQ/0', 'oyP7DwA9yi6PqKk9Peoxk5-6TXq4', '', '0', '', '1', '1', '0', '0', '', '1473299781');
INSERT INTO `tyms_users` VALUES ('2531', '阿阳哥', 'http://wx.qlogo.cn/mmopen/WpRX2NRt6oarfiambFwvkN29XVbWhUEwl9YjCnGuBLL6iaMEHyo8Z9eDiaFEUqiahXBFYia6atw90ibCrRq1q340blic5xLlJ5hjZgL/0', 'oyP7DwC3Y8jdbR7FG9j3AB6MD_mo', '', '0', '', '1', '1', '0', '0', '', '1473301546');
INSERT INTO `tyms_users` VALUES ('2532', 'WangJIa', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBibpuib3O0vRHaHZvPIP6cic9ibWcjSutSYzDB0jaGXcsDREydrKm5wib2QMLYlaejOuN0ico0PfdfbibuQ/0', 'oyP7DwCb43hap-Wquw0fV580Xr9M', '', '0', '', '1', '1', '0', '0', '', '1473303021');
INSERT INTO `tyms_users` VALUES ('2533', '来，打死我吧', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eMlOKXRKicGF9LGeiaHe3wuz8Cbu2tZJqFRR1QBxuoWpjZN6NMyb0T9eoXAVp3JR2E7OWXsWwlx3ZU/0', 'oyP7DwNhsNF0MH5cQGMI2e35BFJo', '', '0', '', '1', '1', '0', '0', '', '1473303052');
INSERT INTO `tyms_users` VALUES ('2534', 'AbcKevin', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP2TQDic4Z3bZUh9FSvc1QiaRlEWicjDewgGtS41WbbRSxUJ3RibUWicKvciag7WSEt5gmNticIlricXUgOrjw/0', 'oyP7DwL-OushYBCDeexzL1vg27ms', '', '0', '', '1', '1', '0', '0', '', '1473303965');
INSERT INTO `tyms_users` VALUES ('2535', 'mwenhua', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaibnKUuKNRfcwqJzTxPcO39dd6wqia7t9Hy7EDZZQHx1Yqe420cibpbJ0EDOXKZNAEWQhc1NJz4xYVl/0', 'oyP7DwOgsSvDxEQsrUX3CQGM3uOg', '', '0', '', '1', '1', '0', '0', '', '1473305375');
INSERT INTO `tyms_users` VALUES ('2536', '祢个怂样子', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdKZIzzO43nY1uF3o1iaDaNk2icuwyh6hD9LZT4wDbKbFZI138kGmclaZGxzLiaptm7hBauBP0En9Kicg/0', 'oyP7DwNmJPRMWxkWbn1iiuvxJIsk', '', '0', '', '1', '1', '0', '0', '', '1473305690');
INSERT INTO `tyms_users` VALUES ('2537', '〆乂、尊 ♡上', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdRdZbn4OIatu8ic910qYVyf7oWqtFrFsiazliaeq9ibyYr8doibp1oOLsJy1IJln8uyhcuSRKwRSmwMDQ/0', 'oyP7DwE0zAV3djpBJ-rWj_ZEUQqU', '', '0', '', '1', '1', '0', '0', '', '1473305859');
INSERT INTO `tyms_users` VALUES ('2538', '风继续吹', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibeD2efaCxq3icfLjWSrR6YiaKKgLiafneuw30uh8lGJYtmSaxAR6O1Yiayod8V6w927rH7wKDniby9T3ww/0', 'oyP7DwNPzzhZtQw4pl3b-tIRkkPE', '', '0', '', '1', '1', '0', '0', '', '1473306504');
INSERT INTO `tyms_users` VALUES ('2539', 'Jigsaw', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3jrYpXQDtX9IeQiaE5X0r7Tl5EhHibLic97jep979tEt4O856IwqY1h3gw5RBPq7GkRFP38toTfdhqlnsHZvR7K6y/0', 'oyP7DwH0xTN77PEX8T-TKTbMqqb4', '', '0', '', '1', '1', '0', '0', '', '1473306596');
INSERT INTO `tyms_users` VALUES ('2540', '乐乐呵呵', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p2xObVia7eKSbe8dZWR5WLDKBnrQBDdBzuPrlyl3dcsLztd5WKFwl1EKGYwmd5Yia3icRTyQHZJeWqWEe94B7Q0Stk/0', 'oyP7DwJu-62hASvMo-JMwq0bsB3Y', '', '0', '', '1', '1', '0', '0', '', '1473306872');
INSERT INTO `tyms_users` VALUES ('2541', '李本伟', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEPwPW7sicoAINSE4JSFzz728q79kzzVGKntuJYsBiah9NEQLgjkbEAJSt24xM5O1BicAeKu6XwOpfaZ/0', 'oyP7DwIsimu38W5bSS0EwaI3TVFs', '', '0', '', '1', '1', '0', '0', '', '1473307716');
INSERT INTO `tyms_users` VALUES ('2542', '。。。123', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibfkX1EqDick8oKUVrBHbGjiaXicHMJQpniarHWDcqPJACrwVUo1TBWib4H3kEq98NqHsuMzQf5XxU34Msg/0', 'oyP7DwPnG8QSNOf3XD8Wda4mrXOI', '', '0', '', '1', '1', '0', '0', '', '1473312195');
INSERT INTO `tyms_users` VALUES ('2543', '自由', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dEOtQzBfpPX3eNQDkUx4LhRFxc4b6uvQ9zycSYyEaXf0icjvRibGjPbIWlqG52iaMNZECm0NoHm9zMYr/0', 'oyP7DwBfTiu0-e_pEWpXKoiehLKI', '', '0', '', '1', '1', '0', '0', '', '1473312532');
INSERT INTO `tyms_users` VALUES ('2544', 'A道哥', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4LmkIFibfS6fMrtavTOXNGn4HaGlxv8r127MPBHhLKLrINqGGxOSkChviaLS27JrcXxe10zuqicvPQ/0', 'oyP7DwBZpftEkRR8-yYjM7Z702xk', '', '0', '', '1', '1', '0', '0', '', '1473312660');
INSERT INTO `tyms_users` VALUES ('2545', 'QQ用户', null, 'A8E61C688F0D7AC73B563AE37474661B', '', '0', '', '1', '1', '0', '0', '', '1473313466');
INSERT INTO `tyms_users` VALUES ('2546', '安强', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4IGUWpIAUlDkrA8mrK5qraN2gU7oQEKCvzduNjKWXqybgwQcb6JZpp5nlFymB24nsm3sSmQngbiaic24L1KicpFw9IEZ7Wc7KMKk/0', 'oyP7DwLBa991tKw3zgNS3Ccfjfdg', '', '0', '', '1', '1', '0', '0', '', '1473314103');
INSERT INTO `tyms_users` VALUES ('2547', '半条毛毛虫', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UBdkOgecLjMDyoiarnjr4eRpN4Hg74IVdTiazEDmQId3noMkMLxPdOfTTMyl8ef9ExVn8iccldQVl8X/0', 'oyP7DwAgKgcuSib89QYPG6wiBs_w', '', '0', '', '1', '1', '0', '0', '', '1473314575');
INSERT INTO `tyms_users` VALUES ('2548', 'A消臭除醛', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5U2a3syJha8yNqo8HQL6c5YVCCXNCqxHPMSQiafiaEZhjsb7fiacojckvLuaHRr3OslyNSkY2we6R1tGGroq6OobJ/0', 'oyP7DwH4nvfv0CMGEjTbYzOQm8Kk', '', '0', '', '1', '1', '0', '0', '', '1473315141');
INSERT INTO `tyms_users` VALUES ('2549', 'A远方的朋友', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4sS8NWwUccBx2y7X0KV2QQdhUtCKwS8jy6EsWKrJAgws53IfYHWslrcP370jwEiaAiaCHZoYBz6CoC/0', 'oyP7DwDDwfhWxBdxTylL1bOVEIsI', '', '0', '', '1', '1', '0', '0', '', '1473315665');
INSERT INTO `tyms_users` VALUES ('2550', 'clement', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1bopXxUwWSgE8tBucyXaaRyXo2N7lbTF3wC3ghSIhLqoaIdJX3hPseYG9rIUhzHARPo5MY38licWw/0', 'oyP7DwGiabwNojMbz-idayajMZ4o', '', '0', '', '1', '1', '0', '0', '', '1473317413');
INSERT INTO `tyms_users` VALUES ('2551', 'zoyzo', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELoj7XCfHfKMXgSUHRSTiby5qeyMnvWTd3aqITajWibCPzHpMxK8j6bdKqibZ2G46Q3sgL5x4pWGVCtw/0', 'oyP7DwKMLmK4PfABdpc569tqtVAk', '', '0', '', '1', '1', '0', '0', '', '1473317556');
INSERT INTO `tyms_users` VALUES ('2552', 'Kevin', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia4AicHNQhqapVK4LYrscYqQ26UibTw8wH9rLjDccfAibfP4vMHDEUu0MibFUT5oxEYAEIwq0FADow5xX/0', 'oyP7DwBF8-txxdheBFpNsk2-dlpk', '', '0', '', '1', '1', '0', '0', '', '1473317648');
INSERT INTO `tyms_users` VALUES ('2553', '郭宝平', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UHDwIt6v1G0UDdZNmkAp45ZLU5bd3P8hDe4Z1uOuY9icHZQE8mk33ajCHxqRt7q6ju7T3yFWKgkDQ/0', 'oyP7DwAidiGwSPXfLv2aB3PvWQ5c', '', '0', '', '1', '1', '0', '0', '', '1473319262');
INSERT INTO `tyms_users` VALUES ('2554', 'A ', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKhJ7RBQgWUVJjosZyWYcBDe6GIANlvgy7gLkV5PZyvztruibREkUFMpia4ol8DWD1icvqibWmUe9yuow/0', 'oyP7DwM7n393ec2071b4mvOmzWvI', '', '0', '', '1', '1', '0', '0', '', '1473319279');
INSERT INTO `tyms_users` VALUES ('2555', '木Duang-', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p0ONZ5DHJoT6vPmkxpDsJa5PaZjNus28yG6UMghZl0VOia7Eo7p7HR3ia65YA1dsI9zKBA7nicMfQiauKjgX8ObeoMv/0', 'oyP7DwEgkJacg1rLqvI5l9skH_1E', '', '0', '', '1', '1', '0', '0', '', '1473319547');
INSERT INTO `tyms_users` VALUES ('2556', '阿斌', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9ia1BbHdNpOzEq1CEd7ABg0eliatR8WyRPfhxFnAvFX0baYBRCueTGS1M6EznUyKM8DL74cDiahhEuMf/0', 'oyP7DwPLGxCGi1vXAXQ9zhvqQeTg', '', '0', '', '1', '1', '0', '0', '', '1473319948');
INSERT INTO `tyms_users` VALUES ('2557', 'x_wchong', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3UQQCibibIY2keY2F2EqkpKkT4o3iaZBicFQvAicicWbw8icDR8empaGbFj1KC3o6MOlowKhCwib91yzibc6ML03jhWPIrO/0', 'oyP7DwDxeke9Scd9bzEsVVcHhP04', '', '0', '', '1', '1', '0', '0', '', '1473320597');
INSERT INTO `tyms_users` VALUES ('2558', '大A', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEItWpoVYAiaZADdia6icNTdG6J6ARd52Vy2jWlpoXjaiaicggFuL1AhQUQb6mSFv6dQKuMNG5HeiaY6cp5Q/0', 'oyP7DwMcDK9kt4Q68sXmuHU7j-mU', '', '0', '', '1', '1', '0', '0', '', '1473321710');
INSERT INTO `tyms_users` VALUES ('2559', '彭伍阳', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5d9T65ZIxQfRLsxRLAWMHwHuNqB8wVeTXyfSO78MIoVMb2JPLA77Dtpd7VD9icZ6WnST8gL0cr4puibIRt2NibINe/0', 'oyP7DwJFGW3zk4pdlAwbhAqu_TMg', '', '0', '', '1', '1', '0', '0', '', '1473324033');
INSERT INTO `tyms_users` VALUES ('2560', 'ekinger', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaicpSiaSiaA6CF11ibjL0BaFU4n9c99S2h8ibAqicFjL0gbUHp19ga3JqOmsWpQo8IuUzXSy8OxR6aYfRd/0', 'oyP7DwMP7gmHEKMQFvDsz8ct9KIQ', '', '0', '', '1', '1', '0', '0', '', '1473324261');
INSERT INTO `tyms_users` VALUES ('2561', '翔', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibcCap4KxQDSCf82RGHwtyOODznLclCfibOicvnaw7UeQqsdo5WX99ockc3Y4nGho3NqSiaoSwW25Gwrw/0', 'oyP7DwNcHmyPJrbQ7WmW5Itxx94Y', '', '0', '', '1', '1', '0', '0', '', '1473325462');
INSERT INTO `tyms_users` VALUES ('2562', 'Alan', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDk3Q9LyeAkUPichYWRXInhGlZNs9sjCLmyXOLOIAncFIgeHuRlSKytkBJ7w3jpM5w3j6j0ib1BSHQw/0', 'oyP7DwCUXy6ZKDPuUQvIwHzWqXro', '', '0', '', '1', '1', '0', '0', '', '1473326389');
INSERT INTO `tyms_users` VALUES ('2563', '傻鸭', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1ePoN09tncLozZmHXFicgMlxStoeAYMkHVmZPRLbok72UVC31e8hwvicbY91BJ5uq4SwkXJlianbL1Zg/0', 'oyP7DwHoKZRH3MxDZ6SCn4w7P3C4', '', '0', '', '1', '1', '0', '0', '', '1473326581');
INSERT INTO `tyms_users` VALUES ('2564', 'sanclark', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP1d7ic9CRs5lQ2PhwzkgibmRNpwGojUGg5xhE4gyfNDicHgUmvsx40ThRtrhjoFicZTAeCqNBktDs3X5g/0', 'oyP7DwIfS_cexb7YolqCnHLq_9Uc', '', '0', '', '1', '1', '0', '0', '', '1473326609');
INSERT INTO `tyms_users` VALUES ('2565', '天心', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5BqaUL4lp52WN73255PeSKZn78XEIey7DAK64yEibqz7vg76Cz7dKMJ7RFa1FBZL6UK5NHzzQ7wXzUJEuXxOkpG/0', 'oyP7DwBlL9Iag4D2aT3n4-NtVkzI', '', '0', '', '1', '1', '0', '0', '', '1473336296');
INSERT INTO `tyms_users` VALUES ('2566', '虹机么么哒', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4hxlAg8G02KHuQBjIqHc3nZClaLVP1sNp6k9N68oLiaB0hX7aVkeVIH30aOzWdEEb0t4LIQ2iaSPWD/0', 'oyP7DwJD-7MVgxKrMHVYUZC_5fH0', '', '0', '', '1', '1', '0', '0', '', '1473337888');
INSERT INTO `tyms_users` VALUES ('2567', '阿豪', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eOtoUYS6mII33N7QK7wg8168QKUicexA7WG23hD1XxkEKDTQHodjuoPQYf1HH2ZVfcn7xYjt6t9Wia/0', 'oyP7DwHzLkGXwfznwJarggGWYD-0', '', '0', '', '1', '1', '0', '0', '', '1473339324');
INSERT INTO `tyms_users` VALUES ('2568', '我很温柔。', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5jwv9jzV3dECFApGxyZQFX1xiaPK8g4kxLg3oIzmxmNzWTib4iaL5qec1ibAUuoaHtN9mbkbZRb3RKjU8xibMKBdSvU/0', 'oyP7DwKWcjEf_ZtpRUAL1juS7PH0', '', '0', '', '1', '1', '0', '0', '', '1473339483');
INSERT INTO `tyms_users` VALUES ('2569', '王', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90JFzxbbticch9HibW8LbgIQ3lr0szORJwqCLMhic4va7xMZATpEKEnyCoceafyDpwNoGdT7XSdEHM0I/0', 'oyP7DwCfZg3uxhT7X1Z1o-B_W6WA', '', '0', '', '1', '1', '0', '0', '', '1473341804');
INSERT INTO `tyms_users` VALUES ('2570', '容仲华', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdVCxbQDicrvp2KWQgg6RIOia1BsQewuNzA7LTAuP1vCvdMkc4a77tDB7Af5flTV6JHN72aEWX8VKYp0P7L99gfmO/0', 'oyP7DwARSnXw_bCims8dohH_Mtj8', '', '0', '', '1', '1', '0', '0', '', '1473344244');
INSERT INTO `tyms_users` VALUES ('2571', '乐桃利', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p3ty0a0Iz3U0UYOe6ywe1LqcsND13OGJ9B59evEcWY7VqaqxZwjzvOpLVEtLnZ1BovY4B1DleoRDEEMUVfls5jc/0', 'oyP7DwNOUCW0qOIlOhaqgRgLFiYg', '', '0', '', '1', '1', '0', '0', '', '1473345085');
INSERT INTO `tyms_users` VALUES ('2572', '皈依三宝', 'http://wx.qlogo.cn/mmopen/25Z0shpDkP30Oz0VMes9iaickfvQTvBz5TmxSztawewTCXWlJQOibfGGUD2sQThcW9yvhUVZplicKsAguBzuyrZLPpBBzUpgP3vB/0', 'oyP7DwG7c4aY4gEcj_eCoY3Jyl6c', '', '0', '', '1', '1', '0', '0', '', '1473345922');
INSERT INTO `tyms_users` VALUES ('2573', '地瓜叶', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6eWHev6FswtYrU5ic4Srd60Jy9FvQwEx9wLXibAkO9WzFKV2t6eIylaln09DpOnBk4mCC90K4seQVcq6nfhbKjht7oQe3euVWeU/0', 'oyP7DwIuIbGlBY31Reswekj3cIiM', '', '0', '', '1', '1', '0', '0', '', '1473348658');
INSERT INTO `tyms_users` VALUES ('2574', '吴世威', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKtRMicnIyenXNa79yZricKlmQpE02paDZpE3iclG9BFJJRsXW6iaiaCm6IViaRlJ9B6UjPtsOtS9qIUmfQ/0', 'oyP7DwDf4pv5ZwlS_0ALambS4pFs', '', '0', '', '1', '1', '0', '0', '', '1473350807');
INSERT INTO `tyms_users` VALUES ('2575', 'A粤（鸿粤网络，新丰同城）', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p00Uxzdrib0snx4JWxowJib1ff3RyZGtdS5MWkLUxiaTM9xUeRx8jCicc4Vh972VlLfcicwhGrJbSbTGG0Zgg3gmpLen/0', 'oyP7DwFS3P8yItGkbL1rT08d3MnA', '', '0', '', '1', '1', '0', '0', '', '1473365960');
INSERT INTO `tyms_users` VALUES ('2576', 'hou', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIibTMXmxAyRtfUvvoSpbagTDaZOW0OaHrbksTrIuZtJ5sGPPqR6I5TGTlVDVvp0zfJx9ERw5JGPiaQ/0', 'oyP7DwJGpVWTktzBl_Y2dAfvHw6g', '', '0', '', '1', '1', '0', '0', '', '1473374448');
INSERT INTO `tyms_users` VALUES ('2577', '袁学飞', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL53jKAK14HxVXbuOCnzCQt0j0tiaxgASjQQX5pm8bywpBCuR2wUD5JXJN5eDIjiabZom0nRUpjiboXX8Y01btuHVOC/0', 'oyP7DwJp2I6Z10mT-les7FV1zR20', '', '0', '', '1', '1', '0', '0', '', '1473382925');
INSERT INTO `tyms_users` VALUES ('2578', 'sImple', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibdtgJM1pbD1eOogibib12ncnTVekVQVAFTQyYsrPAmyO04XXX4CEHabaRpYccfPDN3RTzNDzYT8dztXHr83TxBAId/0', 'oyP7DwF6zSWHioWdWYpOwHL59nSg', '', '0', '', '1', '1', '0', '0', '', '1473383596');
INSERT INTO `tyms_users` VALUES ('2579', '电商平台、APP定制02885758275', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4qSW4ZOQ31W1LuoYghCh8FxWmkCZa8jmQXJ9tmM1kCaeuBymPzXhiaczKRzibzxP8mMSOlNh8cpyJ4/0', 'oyP7DwLVryu4xL-ff_BmLGuX_L1A', '', '0', '', '1', '1', '0', '0', '', '1473385796');
INSERT INTO `tyms_users` VALUES ('2580', 'Forest～π_π', 'http://wx.qlogo.cn/mmopen/vzdiaa5rSAQ5z2VfdYML8UFrJT9hbbaIjp0KqkfOpNuhCPIXibluRCp8UeeKia3joq2KEicdF3rCvx9Ha3jhGnRsjccQ90ftMmaK/0', 'oyP7DwLFI8a-ctDM0ELT0IrNk9KU', 'xiaofeng', '4', '', '4', '1', '100', '80', '', '1473387192');
INSERT INTO `tyms_users` VALUES ('2581', 'T_T', 'http://wx.qlogo.cn/mmopen/3ydx8qAabL5FibLNtP3vw4v7EXjwnL3OeHzA7TpbxSjZX6NFXKC1iabRrzicSicztVk3ibUpknULU1VzxxdQ0MJkfEUdhqhXav1tI/0', 'oyP7DwM_-VMY3RqimrPoIqZzyBa8', 'roc', '4', '', '4', '1', '80', '60', '', '1473388242');
INSERT INTO `tyms_users` VALUES ('2582', '囧', 'http://wx.qlogo.cn/mmopen/Q8uXlhcy3p09e9nl5xN90I256wyDlInwrj1icqEaIZLKibRGClh6Drdvax0fzyI2VBrrtqrYLsYFxyftCGyqmARt2Um8KE6f9ib/0', 'oyP7DwM7CpW-r45Hx9kS1ofhJNsg', '', '3', '', '3', '1', '0', '0', '', '1473389160');
INSERT INTO `tyms_users` VALUES ('2583', '施好好', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibelAltw240OgZiankOhlKSx7YxHCJbS6FkOwqT7FLC2CWicw6nMfj6kicFzq69vxRubIl1Nvrg54N6LQ/0', 'oyP7DwGkhVvAHOR7niEOOG1bDkrI', '', '3', '', '3', '1', '0', '0', '', '1473390291');
INSERT INTO `tyms_users` VALUES ('2588', '511482696@qq.com', null, null, '', '2', '', '2', '1', '0', '0', '', '1477639961');
INSERT INTO `tyms_users` VALUES ('2589', '13554754719', null, null, '', '2', '13554754719', '2', '1', '0', '0', '', '1490597950');
INSERT INTO `tyms_users` VALUES ('2590', '13554754711', null, null, '', '1', '13554754711', '1', '1', '0', '0', '', '1495453354');
INSERT INTO `tyms_users` VALUES ('2591', '1273276548@qq.com', 'http://wx.qlogo.cn/mmopen/FrdAUicrPIibelAltw240OgZiankOhlKSx7YxHCJbS6FkOwqT7FLC2CWicw6nMfj6kicFzq69vxRubIl1Nvrg54N6LQ/0', 'oyP7DwGkhVvAHOR7niEOOG1bDkrI', '小五', '1', '15281812281', '1', '1', '0', '0', '', '1495509974');

-- ----------------------------
-- Table structure for `tyms_users_type`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_users_type`;
CREATE TABLE `tyms_users_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '会员类型名称',
  `commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '固定佣金',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `backimg` varchar(250) NOT NULL COMMENT '会员类型背景图',
  PRIMARY KEY (`id`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_users_type
-- ----------------------------
INSERT INTO `tyms_users_type` VALUES ('1', '公司员工', '999.00', '1501662179', '0', '3');
INSERT INTO `tyms_users_type` VALUES ('2', '美容院', '0.00', '1501663713', '0', '4');
INSERT INTO `tyms_users_type` VALUES ('3', '美容师', '666.00', '1501663719', '0', '5');
INSERT INTO `tyms_users_type` VALUES ('4', '顾客', '111.00', '1501663725', '0', '6');

-- ----------------------------
-- Table structure for `tyms_withdrawals`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_withdrawals`;
CREATE TABLE `tyms_withdrawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现申请表',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `create_time` int(11) DEFAULT '0' COMMENT '申请日期',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '提现金额',
  `bank_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行名称 如支付宝 微信 中国银行 农业银行等',
  `account_bank` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账号',
  `account_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '银行账户名 可以是支付宝可以其他银行',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '提现备注',
  `status` tinyint(1) DEFAULT '0' COMMENT '提现状态0申请中1申请成功2申请失败',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tyms_withdrawals
-- ----------------------------
INSERT INTO `tyms_withdrawals` VALUES ('1', '1', '1466248005', '100.00', '支付宝', '5464646@qq.com', '黄女士', '测试通过', '1');
INSERT INTO `tyms_withdrawals` VALUES ('3', '1', '1483350096', '15000.00', '支付宝', '13358855255', 'dfsdaafuhns', '', '1');
INSERT INTO `tyms_withdrawals` VALUES ('4', '1', '1483352467', '2000.00', '支付宝', '20000000', '13800138006', 'sdfsdf', '1');
INSERT INTO `tyms_withdrawals` VALUES ('5', '1', '1486606724', '10.00', '建设银行', '6217007200006342680', '第三方第三', '', '0');

-- ----------------------------
-- Table structure for `tyms_wx_img`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_wx_img`;
CREATE TABLE `tyms_wx_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `desc` text NOT NULL COMMENT '简介',
  `pic` char(255) NOT NULL COMMENT '封面图片',
  `url` char(255) NOT NULL COMMENT '图文外链地址',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `token` char(30) NOT NULL COMMENT 'token',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='微信图文';

-- ----------------------------
-- Records of tyms_wx_img
-- ----------------------------
INSERT INTO `tyms_wx_img` VALUES ('26', 'demo', 'dss', '3', 'demo', '1495338515', '', 'eesops1462769263', 'demo', '0', '');

-- ----------------------------
-- Table structure for `tyms_wx_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_wx_keyword`;
CREATE TABLE `tyms_wx_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `pid` int(11) NOT NULL COMMENT '对应表ID',
  `token` varchar(60) NOT NULL COMMENT 'token',
  `type` varchar(30) DEFAULT 'TEXT' COMMENT '关键词操作类型',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COMMENT='微信关键字';

-- ----------------------------
-- Records of tyms_wx_keyword
-- ----------------------------
INSERT INTO `tyms_wx_keyword` VALUES ('331', '你好', '14', 'eesops1462769263', 'TEXT');
INSERT INTO `tyms_wx_keyword` VALUES ('334', 'demo', '26', 'eesops1462769263', 'IMG');

-- ----------------------------
-- Table structure for `tyms_wx_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_wx_menu`;
CREATE TABLE `tyms_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level` tinyint(1) DEFAULT '1' COMMENT '菜单级别',
  `name` varchar(50) NOT NULL COMMENT 'name',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) DEFAULT NULL COMMENT 'value',
  `token` varchar(50) NOT NULL COMMENT 'token',
  `pid` int(11) DEFAULT '0' COMMENT '上级菜单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='微信菜单';

-- ----------------------------
-- Records of tyms_wx_menu
-- ----------------------------
INSERT INTO `tyms_wx_menu` VALUES ('34', '1', '首页', '0', 'view', 'http://www.qq.com', 'eesops1462769263', '0');
INSERT INTO `tyms_wx_menu` VALUES ('35', '2', '二级菜单', '0', 'view', 'http://www.baidu.com', 'eesops1462769263', '34');

-- ----------------------------
-- Table structure for `tyms_wx_msg`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_wx_msg`;
CREATE TABLE `tyms_wx_msg` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '系统用户ID',
  `titile` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sendtime` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `issend` tinyint(1) DEFAULT '0' COMMENT '0未发送1成功2失败',
  `sendtype` tinyint(1) DEFAULT '1' COMMENT '0单人1所有',
  PRIMARY KEY (`msgid`),
  KEY `uid` (`admin_id`),
  KEY `createymd` (`sendtime`),
  KEY `fake_id` (`titile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信消息';

-- ----------------------------
-- Records of tyms_wx_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_wx_news`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_wx_news`;
CREATE TABLE `tyms_wx_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT 'keyword',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `token` char(30) NOT NULL COMMENT 'token',
  `img_id` varchar(50) DEFAULT NULL COMMENT '图文组合id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='微信图文';

-- ----------------------------
-- Records of tyms_wx_news
-- ----------------------------

-- ----------------------------
-- Table structure for `tyms_wx_text`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_wx_text`;
CREATE TABLE `tyms_wx_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(90) NOT NULL COMMENT '用户名',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `precisions` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'precisions',
  `text` text NOT NULL COMMENT 'text',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `updatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `click` int(11) NOT NULL COMMENT '点击',
  `token` char(30) NOT NULL COMMENT 'token',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='文本回复表';

-- ----------------------------
-- Records of tyms_wx_text
-- ----------------------------
INSERT INTO `tyms_wx_text` VALUES ('14', '0', '', '你好', '0', '你更好!', '1490888710', '', '0', 'eesops1462769263');

-- ----------------------------
-- Table structure for `tyms_wx_user`
-- ----------------------------
DROP TABLE IF EXISTS `tyms_wx_user`;
CREATE TABLE `tyms_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `headerpic` char(255) NOT NULL COMMENT '头像地址',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) NOT NULL COMMENT ' 网页授权token',
  `web_refresh_token` varchar(200) NOT NULL COMMENT 'web_refresh_token',
  `web_expires` int(11) NOT NULL COMMENT '过期时间',
  `qr` varchar(200) NOT NULL COMMENT 'qr',
  `menu_config` text COMMENT '菜单',
  `wait_access` tinyint(1) DEFAULT '0' COMMENT '微信接入状态,0待接入1已接入',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid_2` (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='微信公共帐号';

-- ----------------------------
-- Records of tyms_wx_user
-- ----------------------------
INSERT INTO `tyms_wx_user` VALUES ('25', '0', '阿星', '', '0', 'wxe65d8f3a90f86b3d', 'e75814258dd534e6a36f7107b01fe550', 'gh_f8f1a0dfa350', 'axing6666666', 'uploads/20170330ed1d16ff65e5060dd263ce184f044415.jpg', 'eesops1462769263', 'liuxing', '1486797230', '0', '', '', '', '', '', '', '1', 'KDEFZyXtg-gAY2kR2XIBrNdR4KuRnt9awp64H0WeLFhvVL6KgtylBTcqku14dktaswMeVMW8EgHZY0hu7wI4sUhP_n3VCMX4smPSRAMYHvI-A3t-RWMFNc6k58I6CN1hNORdACAZAD', '', '1490931171', 'uploads/2017033047e4f67ac220d6276b638653f1cf235.jpg', '', '1');
