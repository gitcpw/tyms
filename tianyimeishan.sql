-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 08 月 09 日 21:40
-- 服务器版本: 5.5.27
-- PHP 版本: 5.2.17p1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `tianyimeishan`
--

-- --------------------------------------------------------

--
-- 表的结构 `tyms_action`
--

CREATE TABLE IF NOT EXISTS `tyms_action` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `tyms_action`
--

INSERT INTO `tyms_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 1, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 1, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 1, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类.', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_action_log`
--

CREATE TABLE IF NOT EXISTS `tyms_action_log` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=60 ;

--
-- 转存表中的数据 `tyms_action_log`
--

INSERT INTO `tyms_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1501066723),
(2, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/33.html', 1, 1501066757),
(3, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1501067495),
(4, 10, 1, 2130706433, 'Menu', 14, '操作url：/admin/menu/edit/id/14.html', 1, 1501067541),
(5, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1501068323),
(6, 10, 1, 2130706433, 'Menu', 14, '操作url：/admin/menu/edit/id/14.html', 1, 1501068336),
(7, 10, 1, 2130706433, 'Menu', 0, '操作url：/admin/menu/del/id/25.html', 1, 1501069860),
(8, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1501069900),
(9, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1501069931),
(10, 10, 1, 2130706433, 'Menu', 14, '操作url：/admin/menu/edit/id/14.html', 1, 1501069969),
(11, 10, 1, 2130706433, 'Menu', 15, '操作url：/admin/menu/edit/id/15.html', 1, 1501069976),
(12, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1501070058),
(13, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1501070080),
(14, 10, 1, 2130706433, 'Menu', 14, '操作url：/admin/menu/edit/id/14.html', 1, 1501070088),
(15, 10, 1, 2130706433, 'Menu', 15, '操作url：/admin/menu/edit/id/15.html', 1, 1501070093),
(16, 9, 1, 2130706433, 'channel', 2, '操作url：/admin/channel/edit/id/2/pid/0.html', 1, 1501071617),
(17, 9, 1, 2130706433, 'channel', 2, '操作url：/admin/channel/edit/id/2/pid/0.html', 1, 1501071649),
(18, 7, 1, 2130706433, 'model', 2, '操作url：/admin/model/edit/id/2.html', 1, 1501071740),
(19, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1501116978),
(20, 10, 1, 2130706433, 'Menu', 21, '操作url：/admin/menu/edit/id/21.html', 1, 1501116998),
(21, 10, 1, 2130706433, 'Menu', 0, '操作url：/admin/menu/del/id/5.html', 1, 1501117015),
(22, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1501117097),
(23, 7, 1, 2130706433, 'model', 2, '操作url：/admin/model/edit/id/2.html', 1, 1501118838),
(24, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1501124177),
(25, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/35.html', 1, 1501124203),
(26, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1501125366),
(27, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1501125386),
(28, 10, 1, 2130706433, 'Menu', 12, '操作url：/admin/menu/edit/id/12.html', 1, 1501125463),
(29, 10, 1, 2130706433, 'Menu', 0, '操作url：/admin/menu/del/id/11.html', 1, 1501125472),
(30, 10, 1, 2130706433, 'Menu', 38, '操作url：/admin/menu/edit/id/38.html', 1, 1501125582),
(31, 10, 1, 2130706433, 'Menu', 12, '操作url：/admin/menu/edit/id/12.html', 1, 1501125590),
(32, 10, 1, 2130706433, 'Menu', 8, '操作url：/admin/menu/edit/id/8.html', 1, 1501126257),
(33, 10, 1, 2130706433, 'Menu', 4, '操作url：/admin/menu/edit/id/4.html', 1, 1501127673),
(34, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/33.html', 1, 1501138761),
(35, 10, 1, 2130706433, 'Menu', 39, '操作url：/admin/menu/edit/id/39.html', 1, 1501138805),
(36, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1501145342),
(37, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/40.html', 1, 1501145364),
(38, 10, 1, 2130706433, 'Menu', 23, '操作url：/index.php/admin/menu/edit/id/23.html', 1, 1501145948),
(39, 10, 1, 2130706433, 'Menu', 24, '操作url：/index.php/admin/menu/edit/id/24.html', 1, 1501145968),
(40, 10, 1, 2130706433, 'Menu', 0, '操作url：/index.php/admin/menu/del/id/6.html', 1, 1501145976),
(41, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1501204283),
(42, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1501204363),
(43, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/33.html', 1, 1501211657),
(44, 10, 1, 2130706433, 'Menu', 42, '操作url：/admin/menu/edit/id/42.html', 1, 1501213372),
(45, 10, 1, 2130706433, 'Menu', 42, '操作url：/index.php/admin/menu/edit/id/42.html', 1, 1501667313),
(46, 10, 1, 2130706433, 'Menu', 1, '操作url：/index.php/admin/menu/add/pid/1.html', 1, 1501746767),
(47, 11, 1, 1032524872, 'category', 1, '操作url：/index.php/admin/category/add.html', 1, 1502269628),
(48, 11, 1, 1032524872, 'category', 8, '操作url：/index.php/admin/category/edit.html', 1, 1502269645),
(49, 11, 1, 1032524872, 'category', 1, '操作url：/index.php/admin/category/add.html', 1, 1502269664),
(50, 11, 1, 1032524872, 'category', 1, '操作url：/index.php/admin/category/add.html', 1, 1502269676),
(51, 11, 1, 1032524872, 'category', 1, '操作url：/index.php/admin/category/edit.html', 1, 1502269697),
(52, 11, 1, 1032524872, 'category', 1, '操作url：/index.php/admin/category/edit.html', 1, 1502269702),
(53, 11, 1, 1032524872, 'category', 8, '操作url：/index.php/admin/category/edit.html', 1, 1502269719),
(54, 11, 1, 1032524872, 'category', 9, '操作url：/index.php/admin/category/edit.html', 1, 1502269738),
(55, 11, 1, 1032524872, 'category', 10, '操作url：/index.php/admin/category/edit.html', 1, 1502269754),
(56, 11, 1, 1032524872, 'category', 1, '操作url：/index.php/admin/category/edit.html', 1, 1502271052),
(57, 11, 1, 1032524872, 'category', 8, '操作url：/index.php/admin/category/edit.html', 1, 1502271363),
(58, 11, 1, 1032524872, 'category', 9, '操作url：/index.php/admin/category/edit.html', 1, 1502271380),
(59, 11, 1, 1032524872, 'category', 10, '操作url：/index.php/admin/category/edit.html', 1, 1502271390);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_ad`
--

CREATE TABLE IF NOT EXISTS `tyms_ad` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tyms_ad`
--

INSERT INTO `tyms_ad` (`id`, `place_id`, `title`, `cover_id`, `photolist`, `url`, `listurl`, `background`, `content`, `create_time`, `update_time`, `status`) VALUES
(1, 1, '1', 20, '', '', '', '', '', 1440433466, 1502283612, 1),
(2, 1, '2', 19, '', '', '', '', '', 1440433531, 1502283648, 1),
(3, 1, '3', 22, '', '', '', '', '', 1440433554, 1502283747, 1),
(4, 1, '4', 21, '', 'http://www.yizukeji.cn', '', '', '', 1440433571, 1502283730, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_addons`
--

CREATE TABLE IF NOT EXISTS `tyms_addons` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `tyms_addons`
--

INSERT INTO `tyms_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `isinstall`, `create_time`, `has_adminlist`) VALUES
(1, 'Devteam', '开发团队信息', '开发团队成员信息', 0, '', 'molong', '0.1', 1, 0, 0),
(2, 'Sitestat', '站点统计信息', '统计站点的基础信息', 0, '', 'thinkphp', '0.2', 1, 0, 0),
(3, 'Systeminfo', '系统环境信息', '用于显示一些服务器的信息', 1, '', 'molong', '0.1', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_ad_place`
--

CREATE TABLE IF NOT EXISTS `tyms_ad_place` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告位表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tyms_ad_place`
--

INSERT INTO `tyms_ad_place` (`id`, `title`, `name`, `show_type`, `show_num`, `start_time`, `end_time`, `create_time`, `update_time`, `template`, `status`) VALUES
(1, '百问百答广告管理', 'banner', 1, 5, 1970, 1970, 1440433367, 1502270465, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_article`
--

CREATE TABLE IF NOT EXISTS `tyms_article` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='百问百答' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tyms_article`
--

INSERT INTO `tyms_article` (`id`, `title`, `category_id`, `uid`, `cover_id`, `description`, `content`, `status`, `is_top`, `view`, `update_time`, `create_time`) VALUES
(2, 'asdfsadf ', 1, 0, 7, 'asdfasdf', '<p>asdfdsfasdf</p>', 1, 0, 0, 1502269796, 1502269790);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_attachment`
--

CREATE TABLE IF NOT EXISTS `tyms_attachment` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `tyms_attachment`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_attribute`
--

CREATE TABLE IF NOT EXISTS `tyms_attribute` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `tyms_attribute`
--

INSERT INTO `tyms_attribute` (`id`, `name`, `title`, `length`, `type`, `value`, `remark`, `extra`, `model_id`, `is_show`, `is_must`, `group_id`, `sort`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(20, 'view', '浏览数量', '11', 'num', '0', '浏览数量', '', 2, 0, 1, 1, 0, 0, 1501071681, 1501071681, '', 0, '', '', '', 0, ''),
(19, 'is_top', '是否置顶', '2', 'bool', '0', '是否置顶', '', 2, 0, 1, 1, 0, 0, 1501071681, 1501071681, '', 0, '', '', '', 0, ''),
(18, 'status', '数据状态', '2', 'select', '1', '数据状态', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 2, 1, 1, 1, 5, 0, 1501071681, 1501071681, '', 0, '', '', '', 0, ''),
(16, 'description', '内容描述', '', 'textarea', '', '内容描述', '', 2, 1, 0, 1, 2, 0, 1501071681, 1501071681, '', 0, '', '', '', 0, ''),
(17, 'content', '内容', '', 'editor', '', '内容', '', 2, 1, 0, 1, 4, 0, 1501071681, 1501071681, '', 0, '', '', '', 0, ''),
(15, 'cover_id', '内容封面', '10', 'image', '', '内容封面', '', 2, 1, 0, 1, 3, 0, 1501071681, 1501071681, '', 0, '', '', '', 0, ''),
(14, 'uid', '用户UID', '11', 'num', '0', '用户UID', '', 2, 0, 1, 1, 0, 0, 1501071680, 1501071680, '', 0, '', '', '', 0, ''),
(13, 'category_id', '栏目', '10', 'bind', '0', '栏目', 'category', 2, 1, 1, 1, 1, 0, 1501071680, 1501071680, '', 0, '', '', '', 0, ''),
(12, 'title', '标题', '200', 'text', '', '标题', '', 2, 1, 1, 1, 0, 0, 1501071680, 1501071680, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', '11', 'datetime', '0', '更新时间', '', 2, 0, 1, 1, 0, 0, 1501071681, 1501071681, '', 0, '', '', '', 0, ''),
(22, 'create_time', '添加时间', '11', 'datetime', '0', '添加时间', '', 2, 0, 1, 1, 0, 0, 1501071681, 1501071681, '', 0, '', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_auth_extend`
--

CREATE TABLE IF NOT EXISTS `tyms_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `tyms_auth_extend`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_auth_group`
--

CREATE TABLE IF NOT EXISTS `tyms_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tyms_auth_group`
--

INSERT INTO `tyms_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', '1', '网站编辑', '网站编辑，针对内容进行管理', 1, '2,1'),
(2, 'admin', '1', '网站运营', '针对网站SEO进行管理', 1, '21,20,14,12,3,19,18,17,16,15,13,1');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `tyms_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tyms_auth_group_access`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_auth_rule`
--

CREATE TABLE IF NOT EXISTS `tyms_auth_rule` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `tyms_auth_rule`
--

INSERT INTO `tyms_auth_rule` (`id`, `module`, `type`, `name`, `title`, `group`, `status`, `condition`) VALUES
(1, 'admin', 2, 'admin/index/index', '后台首页', '首页管理', 1, ''),
(2, 'admin', 2, 'admin/form/index', '自定义表单', '运营管理', 1, ''),
(3, 'admin', 2, 'admin/addons/hooks', '钩子列表', '扩展管理', 1, ''),
(4, 'admin', 2, 'admin/addons/index', '插件列表', '扩展管理', 1, ''),
(5, 'admin', 2, 'admin/ad/index', '广告管理', '运营管理', 1, ''),
(6, 'admin', 2, 'admin/link/index', '友链管理', '运营管理', 1, ''),
(7, 'admin', 2, 'admin/action/log', '行为日志', '会员管理', 1, ''),
(8, 'admin', 2, 'admin/action/index', '行为列表', '会员管理', 1, ''),
(9, 'admin', 2, 'admin/group/access', '权限列表', '会员管理', 1, ''),
(10, 'admin', 2, 'admin/group/index', '用户组表', '会员管理', 1, ''),
(11, 'admin', 2, 'admin/user/index', '用户列表', '会员管理', 1, ''),
(12, 'admin', 2, 'admin/model/index', '模型管理', '内容管理', 1, ''),
(13, 'admin', 2, 'admin/category/index', '栏目管理', '内容管理', 1, ''),
(14, 'admin', 2, 'admin/seo/index', 'SEO设置', '系统管理', 1, ''),
(15, 'admin', 2, 'admin/database/index?type=import', '数据恢复', '系统管理', 1, ''),
(16, 'admin', 2, 'admin/database/index?type=export', '数据备份', '系统管理', 1, ''),
(17, 'admin', 2, 'admin/channel/index', '导航管理', '系统管理', 1, ''),
(18, 'admin', 2, 'admin/menu/index', '菜单管理', '系统管理', 1, ''),
(19, 'admin', 2, 'admin/config/group', '配置管理', '系统管理', 1, ''),
(20, 'admin', 2, 'admin/index/clear', '更新缓存', '首页管理', 1, ''),
(21, 'admin', 1, 'admin/config/add', '配置添加', '系统管理', 1, ''),
(22, 'admin', 2, 'admin/content/index', '内容列表', '内容管理', 1, ''),
(23, 'admin', 2, 'admin/content/add', '内容添加', '内容管理', 1, ''),
(24, 'admin', 1, 'admin/content/edit', '内容编辑', '内容管理', 1, ''),
(25, 'admin', 1, 'admin/content/del', '内容删除', '内容管理', 1, ''),
(26, 'admin', 1, 'admin/content/status', '内容设置状态', '内容管理', 1, ''),
(27, 'admin', 1, 'admin/category/add', '栏目添加', '内容管理', 1, ''),
(28, 'admin', 1, 'admin/category/edit', '栏目编辑', '内容管理', 1, ''),
(29, 'admin', 1, 'admin/category/editable', '栏目单字编辑', '内容管理', 1, ''),
(30, 'admin', 1, 'admin/category/remove', '栏目删除', '内容管理', 1, ''),
(31, 'admin', 1, 'admin/category/merge', '栏目合并', '内容管理', 1, ''),
(32, 'admin', 1, 'admin/category/move', '栏目移动', '内容管理', 1, ''),
(33, 'admin', 1, 'admin/category/status', '栏目状态', '内容管理', 1, ''),
(34, 'admin', 1, 'admin/scan/index', '木马查杀', '首页管理', 1, ''),
(35, 'admin', 1, 'admin/wechat/index', '公众号设置', '微信管理', 1, ''),
(36, 'admin', 1, 'admin/wechat/menu', '微信菜单', '微信管理', 1, ''),
(37, 'admin', 1, 'admin/wechat/text', '文本回复', '微信管理', 1, ''),
(38, 'admin', 1, 'admin/wechat/img', '图文回复', '微信管理', 1, ''),
(39, 'admin', 1, 'admin/wechat/setting', '公众号配置编辑', '微信管理', 1, ''),
(40, 'admin', 1, 'admin/wechat/add_menu', '新增菜单', '微信管理', 1, ''),
(41, 'admin', 1, 'admin/wechat/edit_menu', '编辑菜单', '微信管理', 1, ''),
(42, 'admin', 1, 'admin/wechat/del_menu', '删除菜单', '微信管理', 1, ''),
(43, 'admin', 1, 'admin/wechat/pub_menu', '发布菜单', '微信管理', 1, ''),
(44, 'admin', 1, 'admin/wechat/add_text', '添加文本回复', '微信管理', 1, ''),
(45, 'admin', 1, 'admin/wechat/del_text', '删除文本回复', '微信管理', 1, ''),
(46, 'admin', 1, 'admin/wechat/add_img', '添加图文', '微信管理', 1, ''),
(47, 'admin', 1, 'admin/wechat/del_img', '删除图文回复', '微信管理', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_beauty_salon`
--

CREATE TABLE IF NOT EXISTS `tyms_beauty_salon` (
  `user_id` int(10) unsigned NOT NULL COMMENT '美容院用户id',
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '美容院名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '美容院描述',
  `contact` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `add_link` varchar(255) NOT NULL DEFAULT '' COMMENT '一键导航连接'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tyms_beauty_salon`
--

INSERT INTO `tyms_beauty_salon` (`user_id`, `name`, `description`, `contact`, `phone`, `address`, `add_link`) VALUES
(18, '春暖花开美容院', '美容院描述', '郭雷', '13788692145', '锦江区万达广场11B26楼38号', '');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_beauty_salon_img`
--

CREATE TABLE IF NOT EXISTS `tyms_beauty_salon_img` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '美容院用户id',
  `img` varchar(255) NOT NULL COMMENT '美容院图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `tyms_beauty_salon_img`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_category`
--

CREATE TABLE IF NOT EXISTS `tyms_category` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `tyms_category`
--

INSERT INTO `tyms_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'jz', '减脂', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', 'null', 1379474947, 1502271052, 1, 14, ''),
(8, 'dy', '答疑', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1502269628, 1502271363, 1, 15, ''),
(9, 'sk', '食库', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1502269664, 1502271380, 1, 16, ''),
(10, 'al', '案例', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1502269676, 1502271390, 1, 17, '');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_channel`
--

CREATE TABLE IF NOT EXISTS `tyms_channel` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `tyms_channel`
--

INSERT INTO `tyms_channel` (`id`, `pid`, `title`, `url`, `type`, `sort`, `icon`, `color`, `band_color`, `band_text`, `active`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '网站首页', 'index/index/index', 0, 1, 'home', '', '', '', 'home', 1379475111, 1464490544, 1, 0),
(2, 0, '新闻资讯', 'article/list/1', 1, 1, 'article', '', '', '', 'article', 1379475111, 1501071649, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_config`
--

CREATE TABLE IF NOT EXISTS `tyms_config` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `tyms_config`
--

INSERT INTO `tyms_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `icon`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'config_group_list', 'textarea', '配置分组', 99, '', '', '', 1447305542, 1452323143, 1, '1:基本\r\n2:会员\r\n3:邮件\r\n4:微信\r\n99:系统', 0),
(2, 'hooks_type', 'textarea', '钩子的类型', 99, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(3, 'auth_config', 'textarea', 'Auth配置', 99, '', '自定义Auth.class.php类配置', '', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(5, 'data_backup_path', 'text', '数据库备份根路径', 99, '', '路径必须以 / 结尾', '', 1381482411, 1381482411, 1, './data/backup/', 5),
(6, 'data_backup_part_size', 'text', '数据库备份卷大小', 99, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', 1381482488, 1381729564, 1, '20971520', 7),
(7, 'data_backup_compress', 'bool', '数据库备份文件是否启用压缩', 99, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '', 1381713345, 1447306018, 1, '1', 9),
(8, 'data_backup_compress_level', 'select', '数据库备份文件压缩级别', 99, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', 1381713408, 1447305979, 1, '9', 10),
(9, 'develop_mode', 'bool', '开启开发者模式', 99, '0:关闭\r\n1:开启', '是否开启开发者模式', '', 1383105995, 1447305960, 1, '1', 11),
(10, 'allow_visit', 'textarea', '不受限控制器方法', 99, '', '', '', 1386644047, 1438075615, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(11, 'deny_visit', 'textarea', '超管专限控制器方法', 99, '', '仅超级管理员可访问的控制器方法', '', 1386644141, 1438075628, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(12, 'admin_allow_ip', 'text', '后台允许访问IP', 99, '', '多个用逗号分隔，如果不配置表示不限制IP访问', '', 1387165454, 1452307198, 1, '', 12),
(13, 'app_debug', 'bool', '是否调试模式', 99, '0:关闭\r\n1:开启', '是否调试模式', '', 1387165685, 1481539829, 1, '0', 6),
(14, 'web_site_title', 'text', '网站标题', 1, '', '网站标题前台显示标题', '', 1378898976, 1379235274, 1, 'YizuCMS网站管理系统', 0),
(15, 'web_site_url', 'text', '网站URL', 1, '', '网站网址', '', 1378898976, 1379235274, 1, 'http://tyms001.com', 1),
(16, 'web_site_description', 'textarea', '网站描述', 1, '', '网站搜索引擎描述', '', 1378898976, 1379235841, 1, 'YizuCMS网站管理系统', 3),
(17, 'web_site_keyword', 'textarea', '网站关键字', 1, '', '网站搜索引擎关键字', '', 1378898976, 1381390100, 1, 'YizuCMS网站管理系统,YizuCMS', 6),
(18, 'web_site_close', 'bool', '关闭站点', 1, '0:否,1:是', '站点关闭后其他用户不能访问，管理员可以正常访问', '', 1378898976, 1447321395, 1, '0', 4),
(19, 'web_site_icp', 'text', '网站备案号', 1, '', '设置在网站底部显示的备案号，如“赣ICP备13006622号', '', 1378900335, 1379235859, 1, '赣ICP备13006622号', 7),
(20, 'open_mobile_site', 'bool', '开启手机站', 1, '0:关闭\r\n1:开启', '', '', 1440901307, 1440901543, 1, '0', 4),
(21, 'list_rows', 'num', '列表条数', 99, '', '', '', 1448937662, 1448937662, 1, '20', 10),
(22, 'user_allow_register', 'bool', '是否可注册', 2, '1:是\r\n0:否', '', '', 1449043544, 1449043586, 1, '1', 0),
(23, 'user_group_type', 'textarea', '会员分组类别', 2, '', '', '', 1449196835, 1449196835, 1, 'admin:系统管理员\r\nfront:会员等级', 1),
(24, 'config_type_list', 'textarea', '字段类型', 99, '', '', '', 1459136529, 1459136529, 1, 'text:单行文本:varchar\r\nstring:字符串:int\r\npassword:密码:varchar\r\ntextarea:文本框:text\r\nbool:布尔型:int\r\nselect:选择:varchar\r\nnum:数字:int\r\ndecimal:金额:decimal\r\ntags:标签:varchar\r\ndatetime:时间控件:int\r\ndate:日期控件:varchar\r\neditor:编辑器:text\r\nbind:模型绑定:int\r\nimage:图片上传:int\r\nimages:多图上传:varchar\r\nattach:文件上传:varchar', 0),
(25, 'document_position', 'textarea', '文档推荐位', 99, '', '', '', 1453449698, 1453449698, 1, '1:首页推荐\r\n2:列表推荐', 0),
(26, 'mail_host', 'text', 'smtp服务器的名称', 3, '', 'smtp服务器的名称', '', 1455690530, 1455690556, 1, 'smtp.163.com', 0),
(27, 'mail_smtpauth', 'select', '启用smtp认证', 3, '0:否,1:是', '启用smtp认证', '', 1455690641, 1455690689, 1, '1', 0),
(28, 'mail_username', 'text', '邮件发送用户名', 3, '', '邮件发送用户名', '', 1455690771, 1455690771, 1, '你的邮箱账号', 0),
(29, 'mail_password', 'text', '邮箱密码', 3, '', '邮箱密码，如果是qq邮箱，则填安全密码', '', 1455690802, 1455690802, 1, '你的邮箱密码', 0),
(30, 'mail_fromname', 'text', '发件人姓名', 3, '', '发件人姓名', '', 1455690838, 1455690838, 1, '发件人姓名', 0),
(31, 'mail_ishtml', 'select', '是否HTML格式邮件', 3, '0:否,1:是', '是否HTML格式邮件', '', 1455690888, 1455690888, 1, '1', 0),
(32, 'mail_charset', 'text', '邮件编码', 3, '', '设置发送邮件的编码', '', 1455690920, 1455690920, 1, 'UTF8', 0),
(33, 'wechat_name', 'text', '微信名称', 4, '', '填写微信名称', '', 1459136529, 1461898406, 1, '', 0),
(41, 'pc_themes', 'text', 'PC站模板', 0, '', '', '', 1480043043, 1480043043, 1, 'default', 0),
(42, 'mobile_themes', 'text', '手机站模板', 0, '', '', '', 1480043066, 1480043066, 1, '', 0),
(43, 'nav_type_list', 'textarea', '导航分类', 99, '', '', '', 1481539756, 1481539801, 1, '1:顶部\r\n2:底部', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_district`
--

CREATE TABLE IF NOT EXISTS `tyms_district` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表' AUTO_INCREMENT=45052 ;

--
-- 转存表中的数据 `tyms_district`
--

INSERT INTO `tyms_district` (`id`, `name`, `level`, `upid`) VALUES
(1, '北京市', 1, 0),
(2, '天津市', 1, 0),
(3, '河北省', 1, 0),
(4, '山西省', 1, 0),
(5, '内蒙古自治区', 1, 0),
(6, '辽宁省', 1, 0),
(7, '吉林省', 1, 0),
(8, '黑龙江省', 1, 0),
(9, '上海市', 1, 0),
(10, '江苏省', 1, 0),
(11, '浙江省', 1, 0),
(12, '安徽省', 1, 0),
(13, '福建省', 1, 0),
(14, '江西省', 1, 0),
(15, '山东省', 1, 0),
(16, '河南省', 1, 0),
(17, '湖北省', 1, 0),
(18, '湖南省', 1, 0),
(19, '广东省', 1, 0),
(20, '广西壮族自治区', 1, 0),
(21, '海南省', 1, 0),
(22, '重庆市', 1, 0),
(23, '四川省', 1, 0),
(24, '贵州省', 1, 0),
(25, '云南省', 1, 0),
(26, '西藏自治区', 1, 0),
(27, '陕西省', 1, 0),
(28, '甘肃省', 1, 0),
(29, '青海省', 1, 0),
(30, '宁夏回族自治区', 1, 0),
(31, '新疆维吾尔自治区', 1, 0),
(32, '台湾省', 1, 0),
(33, '香港特别行政区', 1, 0),
(34, '澳门特别行政区', 1, 0),
(35, '海外', 1, 0),
(36, '其他', 1, 0),
(37, '东城区', 2, 1),
(38, '西城区', 2, 1),
(39, '崇文区', 2, 1),
(40, '宣武区', 2, 1),
(41, '朝阳区', 2, 1),
(42, '丰台区', 2, 1),
(43, '石景山区', 2, 1),
(44, '海淀区', 2, 1),
(45, '门头沟区', 2, 1),
(46, '房山区', 2, 1),
(47, '通州区', 2, 1),
(48, '顺义区', 2, 1),
(49, '昌平区', 2, 1),
(50, '大兴区', 2, 1),
(51, '怀柔区', 2, 1),
(52, '平谷区', 2, 1),
(53, '密云县', 2, 1),
(54, '延庆县', 2, 1),
(55, '和平区', 2, 2),
(56, '河东区', 2, 2),
(57, '河西区', 2, 2),
(58, '南开区', 2, 2),
(59, '河北区', 2, 2),
(60, '红桥区', 2, 2),
(61, '塘沽区', 2, 2),
(62, '汉沽区', 2, 2),
(63, '大港区', 2, 2),
(64, '东丽区', 2, 2),
(65, '西青区', 2, 2),
(66, '津南区', 2, 2),
(67, '北辰区', 2, 2),
(68, '武清区', 2, 2),
(69, '宝坻区', 2, 2),
(70, '宁河县', 2, 2),
(71, '静海县', 2, 2),
(72, '蓟县', 2, 2),
(73, '石家庄市', 2, 3),
(74, '唐山市', 2, 3),
(75, '秦皇岛市', 2, 3),
(76, '邯郸市', 2, 3),
(77, '邢台市', 2, 3),
(78, '保定市', 2, 3),
(79, '张家口市', 2, 3),
(80, '承德市', 2, 3),
(81, '衡水市', 2, 3),
(82, '廊坊市', 2, 3),
(83, '沧州市', 2, 3),
(84, '太原市', 2, 4),
(85, '大同市', 2, 4),
(86, '阳泉市', 2, 4),
(87, '长治市', 2, 4),
(88, '晋城市', 2, 4),
(89, '朔州市', 2, 4),
(90, '晋中市', 2, 4),
(91, '运城市', 2, 4),
(92, '忻州市', 2, 4),
(93, '临汾市', 2, 4),
(94, '吕梁市', 2, 4),
(95, '呼和浩特市', 2, 5),
(96, '包头市', 2, 5),
(97, '乌海市', 2, 5),
(98, '赤峰市', 2, 5),
(99, '通辽市', 2, 5),
(100, '鄂尔多斯市', 2, 5),
(101, '呼伦贝尔市', 2, 5),
(102, '巴彦淖尔市', 2, 5),
(103, '乌兰察布市', 2, 5),
(104, '兴安盟', 2, 5),
(105, '锡林郭勒盟', 2, 5),
(106, '阿拉善盟', 2, 5),
(107, '沈阳市', 2, 6),
(108, '大连市', 2, 6),
(109, '鞍山市', 2, 6),
(110, '抚顺市', 2, 6),
(111, '本溪市', 2, 6),
(112, '丹东市', 2, 6),
(113, '锦州市', 2, 6),
(114, '营口市', 2, 6),
(115, '阜新市', 2, 6),
(116, '辽阳市', 2, 6),
(117, '盘锦市', 2, 6),
(118, '铁岭市', 2, 6),
(119, '朝阳市', 2, 6),
(120, '葫芦岛市', 2, 6),
(121, '长春市', 2, 7),
(122, '吉林市', 2, 7),
(123, '四平市', 2, 7),
(124, '辽源市', 2, 7),
(125, '通化市', 2, 7),
(126, '白山市', 2, 7),
(127, '松原市', 2, 7),
(128, '白城市', 2, 7),
(129, '延边朝鲜族自治州', 2, 7),
(130, '哈尔滨市', 2, 8),
(131, '齐齐哈尔市', 2, 8),
(132, '鸡西市', 2, 8),
(133, '鹤岗市', 2, 8),
(134, '双鸭山市', 2, 8),
(135, '大庆市', 2, 8),
(136, '伊春市', 2, 8),
(137, '佳木斯市', 2, 8),
(138, '七台河市', 2, 8),
(139, '牡丹江市', 2, 8),
(140, '黑河市', 2, 8),
(141, '绥化市', 2, 8),
(142, '大兴安岭地区', 2, 8),
(143, '黄浦区', 2, 9),
(144, '卢湾区', 2, 9),
(145, '徐汇区', 2, 9),
(146, '长宁区', 2, 9),
(147, '静安区', 2, 9),
(148, '普陀区', 2, 9),
(149, '闸北区', 2, 9),
(150, '虹口区', 2, 9),
(151, '杨浦区', 2, 9),
(152, '闵行区', 2, 9),
(153, '宝山区', 2, 9),
(154, '嘉定区', 2, 9),
(155, '浦东新区', 2, 9),
(156, '金山区', 2, 9),
(157, '松江区', 2, 9),
(158, '青浦区', 2, 9),
(159, '南汇区', 2, 9),
(160, '奉贤区', 2, 9),
(161, '崇明县', 2, 9),
(162, '南京市', 2, 10),
(163, '无锡市', 2, 10),
(164, '徐州市', 2, 10),
(165, '常州市', 2, 10),
(166, '苏州市', 2, 10),
(167, '南通市', 2, 10),
(168, '连云港市', 2, 10),
(169, '淮安市', 2, 10),
(170, '盐城市', 2, 10),
(171, '扬州市', 2, 10),
(172, '镇江市', 2, 10),
(173, '泰州市', 2, 10),
(174, '宿迁市', 2, 10),
(175, '杭州市', 2, 11),
(176, '宁波市', 2, 11),
(177, '温州市', 2, 11),
(178, '嘉兴市', 2, 11),
(179, '湖州市', 2, 11),
(180, '绍兴市', 2, 11),
(181, '舟山市', 2, 11),
(182, '衢州市', 2, 11),
(183, '金华市', 2, 11),
(184, '台州市', 2, 11),
(185, '丽水市', 2, 11),
(186, '合肥市', 2, 12),
(187, '芜湖市', 2, 12),
(188, '蚌埠市', 2, 12),
(189, '淮南市', 2, 12),
(190, '马鞍山市', 2, 12),
(191, '淮北市', 2, 12),
(192, '铜陵市', 2, 12),
(193, '安庆市', 2, 12),
(194, '黄山市', 2, 12),
(195, '滁州市', 2, 12),
(196, '阜阳市', 2, 12),
(197, '宿州市', 2, 12),
(198, '巢湖市', 2, 12),
(199, '六安市', 2, 12),
(200, '亳州市', 2, 12),
(201, '池州市', 2, 12),
(202, '宣城市', 2, 12),
(203, '福州市', 2, 13),
(204, '厦门市', 2, 13),
(205, '莆田市', 2, 13),
(206, '三明市', 2, 13),
(207, '泉州市', 2, 13),
(208, '漳州市', 2, 13),
(209, '南平市', 2, 13),
(210, '龙岩市', 2, 13),
(211, '宁德市', 2, 13),
(212, '南昌市', 2, 14),
(213, '景德镇市', 2, 14),
(214, '萍乡市', 2, 14),
(215, '九江市', 2, 14),
(216, '新余市', 2, 14),
(217, '鹰潭市', 2, 14),
(218, '赣州市', 2, 14),
(219, '吉安市', 2, 14),
(220, '宜春市', 2, 14),
(221, '抚州市', 2, 14),
(222, '上饶市', 2, 14),
(223, '济南市', 2, 15),
(224, '青岛市', 2, 15),
(225, '淄博市', 2, 15),
(226, '枣庄市', 2, 15),
(227, '东营市', 2, 15),
(228, '烟台市', 2, 15),
(229, '潍坊市', 2, 15),
(230, '济宁市', 2, 15),
(231, '泰安市', 2, 15),
(232, '威海市', 2, 15),
(233, '日照市', 2, 15),
(234, '莱芜市', 2, 15),
(235, '临沂市', 2, 15),
(236, '德州市', 2, 15),
(237, '聊城市', 2, 15),
(238, '滨州市', 2, 15),
(239, '菏泽市', 2, 15),
(240, '郑州市', 2, 16),
(241, '开封市', 2, 16),
(242, '洛阳市', 2, 16),
(243, '平顶山市', 2, 16),
(244, '安阳市', 2, 16),
(245, '鹤壁市', 2, 16),
(246, '新乡市', 2, 16),
(247, '焦作市', 2, 16),
(248, '濮阳市', 2, 16),
(249, '许昌市', 2, 16),
(250, '漯河市', 2, 16),
(251, '三门峡市', 2, 16),
(252, '南阳市', 2, 16),
(253, '商丘市', 2, 16),
(254, '信阳市', 2, 16),
(255, '周口市', 2, 16),
(256, '驻马店市', 2, 16),
(257, '济源市', 2, 16),
(258, '武汉市', 2, 17),
(259, '黄石市', 2, 17),
(260, '十堰市', 2, 17),
(261, '宜昌市', 2, 17),
(262, '襄樊市', 2, 17),
(263, '鄂州市', 2, 17),
(264, '荆门市', 2, 17),
(265, '孝感市', 2, 17),
(266, '荆州市', 2, 17),
(267, '黄冈市', 2, 17),
(268, '咸宁市', 2, 17),
(269, '随州市', 2, 17),
(270, '恩施土家族苗族自治州', 2, 17),
(271, '仙桃市', 2, 17),
(272, '潜江市', 2, 17),
(273, '天门市', 2, 17),
(274, '神农架林区', 2, 17),
(275, '长沙市', 2, 18),
(276, '株洲市', 2, 18),
(277, '湘潭市', 2, 18),
(278, '衡阳市', 2, 18),
(279, '邵阳市', 2, 18),
(280, '岳阳市', 2, 18),
(281, '常德市', 2, 18),
(282, '张家界市', 2, 18),
(283, '益阳市', 2, 18),
(284, '郴州市', 2, 18),
(285, '永州市', 2, 18),
(286, '怀化市', 2, 18),
(287, '娄底市', 2, 18),
(288, '湘西土家族苗族自治州', 2, 18),
(289, '广州市', 2, 19),
(290, '韶关市', 2, 19),
(291, '深圳市', 2, 19),
(292, '珠海市', 2, 19),
(293, '汕头市', 2, 19),
(294, '佛山市', 2, 19),
(295, '江门市', 2, 19),
(296, '湛江市', 2, 19),
(297, '茂名市', 2, 19),
(298, '肇庆市', 2, 19),
(299, '惠州市', 2, 19),
(300, '梅州市', 2, 19),
(301, '汕尾市', 2, 19),
(302, '河源市', 2, 19),
(303, '阳江市', 2, 19),
(304, '清远市', 2, 19),
(305, '东莞市', 2, 19),
(306, '中山市', 2, 19),
(307, '潮州市', 2, 19),
(308, '揭阳市', 2, 19),
(309, '云浮市', 2, 19),
(310, '南宁市', 2, 20),
(311, '柳州市', 2, 20),
(312, '桂林市', 2, 20),
(313, '梧州市', 2, 20),
(314, '北海市', 2, 20),
(315, '防城港市', 2, 20),
(316, '钦州市', 2, 20),
(317, '贵港市', 2, 20),
(318, '玉林市', 2, 20),
(319, '百色市', 2, 20),
(320, '贺州市', 2, 20),
(321, '河池市', 2, 20),
(322, '来宾市', 2, 20),
(323, '崇左市', 2, 20),
(324, '海口市', 2, 21),
(325, '三亚市', 2, 21),
(326, '五指山市', 2, 21),
(327, '琼海市', 2, 21),
(328, '儋州市', 2, 21),
(329, '文昌市', 2, 21),
(330, '万宁市', 2, 21),
(331, '东方市', 2, 21),
(332, '定安县', 2, 21),
(333, '屯昌县', 2, 21),
(334, '澄迈县', 2, 21),
(335, '临高县', 2, 21),
(336, '白沙黎族自治县', 2, 21),
(337, '昌江黎族自治县', 2, 21),
(338, '乐东黎族自治县', 2, 21),
(339, '陵水黎族自治县', 2, 21),
(340, '保亭黎族苗族自治县', 2, 21),
(341, '琼中黎族苗族自治县', 2, 21),
(342, '西沙群岛', 2, 21),
(343, '南沙群岛', 2, 21),
(344, '中沙群岛的岛礁及其海域', 2, 21),
(345, '万州区', 2, 22),
(346, '涪陵区', 2, 22),
(347, '渝中区', 2, 22),
(348, '大渡口区', 2, 22),
(349, '江北区', 2, 22),
(350, '沙坪坝区', 2, 22),
(351, '九龙坡区', 2, 22),
(352, '南岸区', 2, 22),
(353, '北碚区', 2, 22),
(354, '双桥区', 2, 22),
(355, '万盛区', 2, 22),
(356, '渝北区', 2, 22),
(357, '巴南区', 2, 22),
(358, '黔江区', 2, 22),
(359, '长寿区', 2, 22),
(360, '綦江县', 2, 22),
(361, '潼南县', 2, 22),
(362, '铜梁县', 2, 22),
(363, '大足县', 2, 22),
(364, '荣昌县', 2, 22),
(365, '璧山县', 2, 22),
(366, '梁平县', 2, 22),
(367, '城口县', 2, 22),
(368, '丰都县', 2, 22),
(369, '垫江县', 2, 22),
(370, '武隆县', 2, 22),
(371, '忠县', 2, 22),
(372, '开县', 2, 22),
(373, '云阳县', 2, 22),
(374, '奉节县', 2, 22),
(375, '巫山县', 2, 22),
(376, '巫溪县', 2, 22),
(377, '石柱土家族自治县', 2, 22),
(378, '秀山土家族苗族自治县', 2, 22),
(379, '酉阳土家族苗族自治县', 2, 22),
(380, '彭水苗族土家族自治县', 2, 22),
(381, '江津市', 2, 22),
(382, '合川市', 2, 22),
(383, '永川市', 2, 22),
(384, '南川市', 2, 22),
(385, '成都市', 2, 23),
(386, '自贡市', 2, 23),
(387, '攀枝花市', 2, 23),
(388, '泸州市', 2, 23),
(389, '德阳市', 2, 23),
(390, '绵阳市', 2, 23),
(391, '广元市', 2, 23),
(392, '遂宁市', 2, 23),
(393, '内江市', 2, 23),
(394, '乐山市', 2, 23),
(395, '南充市', 2, 23),
(396, '眉山市', 2, 23),
(397, '宜宾市', 2, 23),
(398, '广安市', 2, 23),
(399, '达州市', 2, 23),
(400, '雅安市', 2, 23),
(401, '巴中市', 2, 23),
(402, '资阳市', 2, 23),
(403, '阿坝藏族羌族自治州', 2, 23),
(404, '甘孜藏族自治州', 2, 23),
(405, '凉山彝族自治州', 2, 23),
(406, '贵阳市', 2, 24),
(407, '六盘水市', 2, 24),
(408, '遵义市', 2, 24),
(409, '安顺市', 2, 24),
(410, '铜仁地区', 2, 24),
(411, '黔西南布依族苗族自治州', 2, 24),
(412, '毕节地区', 2, 24),
(413, '黔东南苗族侗族自治州', 2, 24),
(414, '黔南布依族苗族自治州', 2, 24),
(415, '昆明市', 2, 25),
(416, '曲靖市', 2, 25),
(417, '玉溪市', 2, 25),
(418, '保山市', 2, 25),
(419, '昭通市', 2, 25),
(420, '丽江市', 2, 25),
(421, '思茅市', 2, 25),
(422, '临沧市', 2, 25),
(423, '楚雄彝族自治州', 2, 25),
(424, '红河哈尼族彝族自治州', 2, 25),
(425, '文山壮族苗族自治州', 2, 25),
(426, '西双版纳傣族自治州', 2, 25),
(427, '大理白族自治州', 2, 25),
(428, '德宏傣族景颇族自治州', 2, 25),
(429, '怒江傈僳族自治州', 2, 25),
(430, '迪庆藏族自治州', 2, 25),
(431, '拉萨市', 2, 26),
(432, '昌都地区', 2, 26),
(433, '山南地区', 2, 26),
(434, '日喀则地区', 2, 26),
(435, '那曲地区', 2, 26),
(436, '阿里地区', 2, 26),
(437, '林芝地区', 2, 26),
(438, '西安市', 2, 27),
(439, '铜川市', 2, 27),
(440, '宝鸡市', 2, 27),
(441, '咸阳市', 2, 27),
(442, '渭南市', 2, 27),
(443, '延安市', 2, 27),
(444, '汉中市', 2, 27),
(445, '榆林市', 2, 27),
(446, '安康市', 2, 27),
(447, '商洛市', 2, 27),
(448, '兰州市', 2, 28),
(449, '嘉峪关市', 2, 28),
(450, '金昌市', 2, 28),
(451, '白银市', 2, 28),
(452, '天水市', 2, 28),
(453, '武威市', 2, 28),
(454, '张掖市', 2, 28),
(455, '平凉市', 2, 28),
(456, '酒泉市', 2, 28),
(457, '庆阳市', 2, 28),
(458, '定西市', 2, 28),
(459, '陇南市', 2, 28),
(460, '临夏回族自治州', 2, 28),
(461, '甘南藏族自治州', 2, 28),
(462, '西宁市', 2, 29),
(463, '海东地区', 2, 29),
(464, '海北藏族自治州', 2, 29),
(465, '黄南藏族自治州', 2, 29),
(466, '海南藏族自治州', 2, 29),
(467, '果洛藏族自治州', 2, 29),
(468, '玉树藏族自治州', 2, 29),
(469, '海西蒙古族藏族自治州', 2, 29),
(470, '银川市', 2, 30),
(471, '石嘴山市', 2, 30),
(472, '吴忠市', 2, 30),
(473, '固原市', 2, 30),
(474, '中卫市', 2, 30),
(475, '乌鲁木齐市', 2, 31),
(476, '克拉玛依市', 2, 31),
(477, '吐鲁番地区', 2, 31),
(478, '哈密地区', 2, 31),
(479, '昌吉回族自治州', 2, 31),
(480, '博尔塔拉蒙古自治州', 2, 31),
(481, '巴音郭楞蒙古自治州', 2, 31),
(482, '阿克苏地区', 2, 31),
(483, '克孜勒苏柯尔克孜自治州', 2, 31),
(484, '喀什地区', 2, 31),
(485, '和田地区', 2, 31),
(486, '伊犁哈萨克自治州', 2, 31),
(487, '塔城地区', 2, 31),
(488, '阿勒泰地区', 2, 31),
(489, '石河子市', 2, 31),
(490, '阿拉尔市', 2, 31),
(491, '图木舒克市', 2, 31),
(492, '五家渠市', 2, 31),
(493, '台北市', 2, 32),
(494, '高雄市', 2, 32),
(495, '基隆市', 2, 32),
(496, '台中市', 2, 32),
(497, '台南市', 2, 32),
(498, '新竹市', 2, 32),
(499, '嘉义市', 2, 32),
(500, '台北县', 2, 32),
(501, '宜兰县', 2, 32),
(502, '桃园县', 2, 32),
(503, '新竹县', 2, 32),
(504, '苗栗县', 2, 32),
(505, '台中县', 2, 32),
(506, '彰化县', 2, 32),
(507, '南投县', 2, 32),
(508, '云林县', 2, 32),
(509, '嘉义县', 2, 32),
(510, '台南县', 2, 32),
(511, '高雄县', 2, 32),
(512, '屏东县', 2, 32),
(513, '澎湖县', 2, 32),
(514, '台东县', 2, 32),
(515, '花莲县', 2, 32),
(516, '中西区', 2, 33),
(517, '东区', 2, 33),
(518, '九龙城区', 2, 33),
(519, '观塘区', 2, 33),
(520, '南区', 2, 33),
(521, '深水埗区', 2, 33),
(522, '黄大仙区', 2, 33),
(523, '湾仔区', 2, 33);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_file`
--

CREATE TABLE IF NOT EXISTS `tyms_file` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `tyms_file`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_form`
--

CREATE TABLE IF NOT EXISTS `tyms_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '表单名称',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '表单标识',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='自定义表单' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tyms_form`
--

INSERT INTO `tyms_form` (`id`, `title`, `name`, `create_time`, `update_time`) VALUES
(1, 'form', 'form', 1501069567, 1501069567);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_form_form`
--

CREATE TABLE IF NOT EXISTS `tyms_form_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='form' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `tyms_form_form`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_goods_config`
--

CREATE TABLE IF NOT EXISTS `tyms_goods_config` (
  `goods_id` mediumint(1) unsigned NOT NULL COMMENT '商品id不自增',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `goods_description` varchar(255) NOT NULL DEFAULT '' COMMENT '商品描述',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`goods_id`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tyms_goods_config`
--

INSERT INTO `tyms_goods_config` (`goods_id`, `goods_name`, `goods_price`, `goods_description`, `goods_img`, `update_time`) VALUES
(1, '纤必达21天系统营养塑身套餐', 888.00, '快速塑身套餐', '2', 1501133689);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_hooks`
--

CREATE TABLE IF NOT EXISTS `tyms_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `tyms_hooks`
--

INSERT INTO `tyms_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, '', 1),
(3, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'Sitestat,Devteam,Systeminfo', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_link`
--

CREATE TABLE IF NOT EXISTS `tyms_link` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `tyms_link`
--

INSERT INTO `tyms_link` (`id`, `ftype`, `title`, `url`, `cover_id`, `descrip`, `sort`, `hits`, `update_time`, `uid`, `status`) VALUES
(1, 1, '蚁族科技', 'http://www.yizukeji.cn', 0, '', 0, 0, 1462496026, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_member`
--

CREATE TABLE IF NOT EXISTS `tyms_member` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tyms_member`
--

INSERT INTO `tyms_member` (`uid`, `username`, `password`, `nickname`, `email`, `mobile`, `sex`, `birthday`, `qq`, `score`, `signature`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `salt`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', '7525b1f1d883957e49451843911fd5b2', 'admin', 'admin@admin.com', NULL, 0, '0000-00-00', '123123', 0, '', 0, 0, 0, 0, 'iJhmGg', 24, 0, 1501066646, 1032524872, 1502282542, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_member_extend`
--

CREATE TABLE IF NOT EXISTS `tyms_member_extend` (
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `education` int(10) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tyms_member_extend`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_member_extend_group`
--

CREATE TABLE IF NOT EXISTS `tyms_member_extend_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) NOT NULL COMMENT '分组数据表',
  `profile_name` varchar(25) NOT NULL COMMENT '扩展分组名称',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `visiable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见，1可见，0不可见',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tyms_member_extend_group`
--

INSERT INTO `tyms_member_extend_group` (`id`, `name`, `profile_name`, `createTime`, `sort`, `visiable`, `status`) VALUES
(1, 'member_extend', '个人资料', 1403847366, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_member_extend_setting`
--

CREATE TABLE IF NOT EXISTS `tyms_member_extend_setting` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员字段表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tyms_member_extend_setting`
--

INSERT INTO `tyms_member_extend_setting` (`id`, `name`, `title`, `length`, `type`, `value`, `remark`, `is_show`, `extra`, `is_must`, `status`, `update_time`, `create_time`) VALUES
(1, 'education', '学历', '10', 'select', '', '', 1, '1:小学\r\n2:初中\r\n3:高中', 0, 1, 1455930923, 1455930787);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_menu`
--

CREATE TABLE IF NOT EXISTS `tyms_menu` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `tyms_menu`
--

INSERT INTO `tyms_menu` (`id`, `title`, `type`, `icon`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 'admin', 'home', 0, 0, 'admin/index/index', 0, '', '', 0, 0),
(2, '系统', 'admin', 'laptop', 0, 9, 'admin/config/group', 0, '', '', 0, 0),
(3, '内容', 'admin', 'list', 0, 6, 'admin/category/index', 0, '', '', 0, 0),
(4, '权限', 'admin', 'lock', 0, 7, 'admin/user/index', 0, '', '', 0, 0),
(35, '产品', 'admin', 'shopping-cart', 0, 1, 'admin/goods/index', 0, '', '', 0, 0),
(21, '友链管理', 'admin', 'link', 3, 0, 'admin/link/index', 1, '', '运营管理', 0, 0),
(7, '更新缓存', 'admin', 'refresh', 1, 0, 'admin/index/clear', 0, '', '后台首页', 0, 0),
(8, '配置管理', 'admin', 'cogs', 2, 0, 'admin/config/group', 0, '', '系统配置', 0, 0),
(9, '菜单管理', 'admin', 'book', 2, 0, 'admin/menu/index', 0, '', '系统配置', 0, 0),
(10, '导航管理', 'admin', 'map-marker', 2, 0, 'admin/channel/index', 0, '', '系统配置', 0, 0),
(12, '数据恢复', 'admin', 'mail-reply', 37, 2, 'admin/database/index?type=import', 0, '', '', 0, 0),
(13, 'SEO设置', 'admin', 'anchor', 2, 0, 'admin/seo/index', 0, '', '优化设置', 0, 0),
(14, '文章分类', 'admin', 'list-ol', 3, 1, 'admin/category/index', 0, '', '内容配置', 0, 0),
(15, '模型管理', 'admin', 'th-list', 3, 2, 'admin/model/index', 0, '', '内容配置', 0, 0),
(16, '管理员列表', 'admin', 'user', 4, 0, 'admin/user/index', 0, '', '用户管理', 0, 0),
(17, '管理员组别', 'admin', 'users', 4, 0, 'admin/group/index', 0, '', '用户管理', 0, 0),
(18, '权限列表', 'admin', 'paw', 4, 0, 'admin/group/access', 0, '', '用户管理', 0, 0),
(19, '行为列表', 'admin', 'file-text', 4, 0, 'admin/action/index', 1, '', '行为管理', 0, 0),
(20, '行为日志', 'admin', 'clipboard', 4, 0, 'admin/action/log', 1, '', '行为管理', 0, 0),
(22, '广告管理', 'admin', 'cc', 2, 0, 'admin/ad/index', 0, '', '运营管理', 0, 0),
(23, '插件列表', 'admin', 'usb', 2, 0, 'admin/addons/index', 0, '', '插件管理', 0, 0),
(24, '钩子列表', 'admin', 'code', 2, 0, 'admin/addons/hooks', 0, '', '插件管理', 0, 0),
(26, '伪静态规则', 'admin', 'magnet', 2, 0, 'admin/seo/rewrite', 0, '', '优化设置', 0, 0),
(27, '主题管理', 'admin', 'heartbeat', 2, 0, 'admin/config/themes', 0, '', '系统配置', 0, 0),
(28, '木马查杀', 'admin', 'medkit', 1, 0, 'admin/scan/index', 0, '', '后台首页', 0, 0),
(29, ' 公众号设置', 'admin', 'comments', 1, 0, 'admin/wechat/index', 0, '', '微信管理', 0, 0),
(30, '微信菜单', 'admin', 'navicon', 1, 0, 'admin/wechat/menu', 0, '', '微信管理', 0, 0),
(31, ' 文本回复', 'admin', 'file-text-o', 1, 0, 'admin/wechat/text', 0, '', '微信管理', 0, 0),
(32, ' 图文回复', 'admin', 'file-picture-o', 1, 0, 'admin/wechat/img', 0, '', '微信管理', 0, 0),
(33, '会员', 'admin', 'user', 0, 3, 'admin/member/index', 0, '', '', 0, 0),
(34, '会员列表', 'admin', 'user', 33, 1, 'admin/member/index', 0, '', '会员管理', 0, 0),
(36, '产品管理', 'admin', 'shopping-cart', 35, 0, 'admin/goods/index', 0, '', '', 0, 0),
(37, '数据库', 'admin', 'database', 0, 4, 'admin/database/index?type=export', 0, '', '', 0, 0),
(38, '数据备份', 'admin', 'exchange', 37, 1, 'admin/database/index?type=export', 0, '', '', 0, 0),
(39, '提现申请', 'admin', 'money', 33, 2, 'admin/member/withdrawals', 0, '', '提现管理', 0, 0),
(40, '订单', 'admin', 'credit-card', 0, 2, 'admin/order/index', 0, '', '', 0, 0),
(41, '订单列表', 'admin', 'credit-card', 40, 0, 'admin/order/index', 0, '', '', 0, 0),
(42, '会员类型', 'admin', 'user', 33, 0, 'admin/member/users_type', 0, '', '会员管理', 0, 0),
(43, '分享信息', 'admin', 'file-picture-o', 1, 0, 'admin/wechat/shareinfo', 0, '', '微信管理', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_model`
--

CREATE TABLE IF NOT EXISTS `tyms_model` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tyms_model`
--

INSERT INTO `tyms_model` (`id`, `name`, `title`, `icon`, `is_doc`, `attribute_group`, `list_grid`, `list_row`, `search_key`, `search_list`, `template_list`, `template_add`, `template_edit`, `status`, `create_time`, `update_time`) VALUES
(2, 'article', '百问百答', '', 1, '1:基础', 'id:ID\r\ntitle:标题\r\ncreate_time:添加时间|time_format\r\nupdate_time:更新时间|time_format', 25, '', '', '', '', '', 1, 1501071680, 1501118838);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_order`
--

CREATE TABLE IF NOT EXISTS `tyms_order` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '订单金额',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `hexiao_time` int(11) unsigned DEFAULT '0' COMMENT '核销时间 0未核销 1已核销',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态 0未完成 1待核销 2已核销',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_description` varchar(255) NOT NULL DEFAULT '' COMMENT '商品描述',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '产皮价格',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '公司员工推荐人ID',
  `staff_id_commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '公司员工推荐人佣金',
  `beauty_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '美容院推荐人ID',
  `beauty_id_commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '美容院推荐人佣金',
  `beautician_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '美容师推荐人ID',
  `beautician_id_commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '美容师推荐人佣金',
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '顾客推荐人ID',
  `customer_id_commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '顾客推荐人佣金',
  `order_img` varchar(150) DEFAULT NULL COMMENT '核销图片',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  UNIQUE KEY `add_time` (`add_time`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tyms_order`
--

INSERT INTO `tyms_order` (`order_id`, `order_sn`, `user_id`, `order_price`, `add_time`, `pay_time`, `hexiao_time`, `order_status`, `pay_status`, `goods_name`, `goods_description`, `goods_price`, `staff_id`, `staff_id_commission`, `beauty_id`, `beauty_id_commission`, `beautician_id`, `beautician_id_commission`, `customer_id`, `customer_id_commission`, `order_img`) VALUES
(1, '201708021508', 18, 5000.00, 1501657709, 1502093008, 1502121600, 2, 1, '纤必达21天系统营养塑身套餐', '快速塑身套餐', 100.00, 2, 588.00, 9, 0.00, 17, 388.00, 0, 0.00, '1'),
(2, '201708071905', 14, 4888.00, 1502103893, 1502105613, 1502208001, 2, 1, '纤必达21天系统营养塑身套餐', '快速塑身套餐', 4888.00, 2, 588.00, 9, 0.00, 7, 388.00, 10, 288.00, '2');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_picture`
--

CREATE TABLE IF NOT EXISTS `tyms_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `tyms_picture`
--

INSERT INTO `tyms_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/uploads/picture/20170726/685cd12e2e907967aeea35b12592bda1.jpg', '/uploads/picture/20170726/685cd12e2e907967aeea35b12592bda1.jpg', '061edf0dbfaec088fd36eff434bfe038', '66e05f15e8fe483a5bcf4f6a7656d848097a6a49', 1, 1501068459),
(2, '/uploads/picture/20170727/fd604752e5a7332e1f37ca072b0837a9.png', '/uploads/picture/20170727/fd604752e5a7332e1f37ca072b0837a9.png', '8b4d73e6595f576ed81488dcd2bf023b', 'a7d3094e5fc76dd5ce0fefc2897a738ca9dbe231', 1, 1501122775),
(3, '/uploads/picture/20170802/c49ef6fd31d2bb82e4ec33e407786923.jpg', '/uploads/picture/20170802/c49ef6fd31d2bb82e4ec33e407786923.jpg', '7286df589338035c7395b51f8a9c43f4', '4a4330cd0274d03eedebb636b6a0371337661556', 1, 1501662114),
(4, '/uploads/picture/20170802/c01fc7ccef777d162954883fb40caa57.jpg', '/uploads/picture/20170802/c01fc7ccef777d162954883fb40caa57.jpg', '2cf182f0f9e13d019baaeab6d7bef397', 'd37c4d9aad8e29a5267082dff972fe887802d1ea', 1, 1501663712),
(5, '/uploads/picture/20170802/e6999171c851230e35f3f4a4d6d7d956.jpg', '/uploads/picture/20170802/e6999171c851230e35f3f4a4d6d7d956.jpg', 'c98c7ed8b0d77d4fc39be922d102d019', 'f367be3cd1f5502461728acae14a835ca87413a1', 1, 1501663718),
(6, '/uploads/picture/20170802/aa424482c2a613e134dd6c0d26776a7a.jpg', '/uploads/picture/20170802/aa424482c2a613e134dd6c0d26776a7a.jpg', '7286df589338035c7395b51f8a9c43f4', '4a4330cd0274d03eedebb636b6a0371337661556', 1, 1501663724),
(7, '/uploads/picture/20170809/443cf254deeededc4508688127311c23.jpg', '/uploads/picture/20170809/443cf254deeededc4508688127311c23.jpg', 'a2014bc4d474adb5fc7fdb3677668c4f', '87fb2a50621aa07077f0006e4d08c5499b543264', 1, 1502269695),
(8, '/uploads/picture/20170809/d3ed2f5fcd9ffd07e59d8a32e8e1f192.jpg', '/uploads/picture/20170809/d3ed2f5fcd9ffd07e59d8a32e8e1f192.jpg', '049bae09c809aa5c5162dcf1e9904c07', '3b77da2989920e93f30c78fee14e9cee81cbbcc5', 1, 1502269717),
(9, '/uploads/picture/20170809/999ec3e8017160e751df3bae7f3ad116.jpg', '/uploads/picture/20170809/999ec3e8017160e751df3bae7f3ad116.jpg', 'e81ebff0b5562b6b1c346ca9214d029f', '918bf1794ee80fd8e3b1ff148f1a18e9df2415c2', 1, 1502269728),
(10, '/uploads/picture/20170809/58eb803df02f7f5d41f398c8ce4485b9.jpg', '/uploads/picture/20170809/58eb803df02f7f5d41f398c8ce4485b9.jpg', '061edf0dbfaec088fd36eff434bfe038', '66e05f15e8fe483a5bcf4f6a7656d848097a6a49', 1, 1502269753),
(11, '/uploads/picture/20170809/2b52339d698e943c45de926f86a6084b.jpg', '/uploads/picture/20170809/2b52339d698e943c45de926f86a6084b.jpg', '1edfa3964de67bdd3ed8305e7f4b6690', 'b6645f57c7d122b7cbbcd80fc19c40f2033eb42d', 1, 1502270485),
(12, '/uploads/picture/20170809/cb2c2da5401f7efae5a3f658a23f40dc.jpg', '/uploads/picture/20170809/cb2c2da5401f7efae5a3f658a23f40dc.jpg', '4242eba8cbbbbc9334fd7a611d5d2c43', '8019668ec338ff635dd8347f6c0576b02e48fba1', 1, 1502270485),
(13, '/uploads/picture/20170809/e846fe4d94aac53d65bc6627baf11b8d.jpg', '/uploads/picture/20170809/e846fe4d94aac53d65bc6627baf11b8d.jpg', 'de7674dfafdb231939c13d6e74e39b42', 'c7c95473c1f5dcd65fd5c4a558b6fbf1da4366ef', 1, 1502270485),
(14, '/uploads/picture/20170809/a49cca2282ecff4e73d003be1fb24f19.jpg', '/uploads/picture/20170809/a49cca2282ecff4e73d003be1fb24f19.jpg', 'a2014bc4d474adb5fc7fdb3677668c4f', '87fb2a50621aa07077f0006e4d08c5499b543264', 1, 1502271051),
(15, '/uploads/picture/20170809/3fe0db0d68a0d05793e1cc447b9bc292.jpg', '/uploads/picture/20170809/3fe0db0d68a0d05793e1cc447b9bc292.jpg', '049bae09c809aa5c5162dcf1e9904c07', '3b77da2989920e93f30c78fee14e9cee81cbbcc5', 1, 1502271362),
(16, '/uploads/picture/20170809/15ec3f5affaf1d6023c439e714f1b16a.jpg', '/uploads/picture/20170809/15ec3f5affaf1d6023c439e714f1b16a.jpg', 'e81ebff0b5562b6b1c346ca9214d029f', '918bf1794ee80fd8e3b1ff148f1a18e9df2415c2', 1, 1502271379),
(17, '/uploads/picture/20170809/0996862fc120e4bbc175f582fa5aa7b5.jpg', '/uploads/picture/20170809/0996862fc120e4bbc175f582fa5aa7b5.jpg', '061edf0dbfaec088fd36eff434bfe038', '66e05f15e8fe483a5bcf4f6a7656d848097a6a49', 1, 1502271389),
(18, '/uploads/picture/20170809/cc35169c1d9b96f2f34ca37efdacd77e.png', '/uploads/picture/20170809/cc35169c1d9b96f2f34ca37efdacd77e.png', 'f0301f11bedd3fc08f95a6dcdfbdc2d6', 'a78669c46cd631d9ccb3a58455bf0f3de52e786a', 1, 1502282554),
(19, '/uploads/picture/20170809/bd99ad3ffe31a5360cce9384ccebafc6.jpg', '/uploads/picture/20170809/bd99ad3ffe31a5360cce9384ccebafc6.jpg', '4242eba8cbbbbc9334fd7a611d5d2c43', '8019668ec338ff635dd8347f6c0576b02e48fba1', 1, 1502283586),
(20, '/uploads/picture/20170809/998c40696a154cc4369988bee2c6de0d.jpg', '/uploads/picture/20170809/998c40696a154cc4369988bee2c6de0d.jpg', '4242eba8cbbbbc9334fd7a611d5d2c43', '8019668ec338ff635dd8347f6c0576b02e48fba1', 1, 1502283597),
(21, '/uploads/picture/20170809/7d4d11e6e8b9dc294860d5a102c2ed27.jpg', '/uploads/picture/20170809/7d4d11e6e8b9dc294860d5a102c2ed27.jpg', '4242eba8cbbbbc9334fd7a611d5d2c43', '8019668ec338ff635dd8347f6c0576b02e48fba1', 1, 1502283729),
(22, '/uploads/picture/20170809/165460f9695add298c67f1fc02573627.jpg', '/uploads/picture/20170809/165460f9695add298c67f1fc02573627.jpg', '4242eba8cbbbbc9334fd7a611d5d2c43', '8019668ec338ff635dd8347f6c0576b02e48fba1', 1, 1502283745);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_rewrite`
--

CREATE TABLE IF NOT EXISTS `tyms_rewrite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '规则',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='伪静态表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `tyms_rewrite`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_seo_rule`
--

CREATE TABLE IF NOT EXISTS `tyms_seo_rule` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `tyms_seo_rule`
--

INSERT INTO `tyms_seo_rule` (`id`, `title`, `app`, `controller`, `action`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `sort`) VALUES
(1, '整站标题', '', '', '', 1, 'YizuCMS网站管理系统', 'YizuCMS网站管理系统', 'YizuCMS网站管理系统', 7);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_sync_login`
--

CREATE TABLE IF NOT EXISTS `tyms_sync_login` (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `tyms_sync_login`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_users`
--

CREATE TABLE IF NOT EXISTS `tyms_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '微信昵称',
  `head_pic` varchar(255) DEFAULT NULL COMMENT '微信头像',
  `openid` varchar(100) DEFAULT NULL COMMENT '微信openid',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `users_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '会员类型 1公司员工 2美容院 3美容师 4顾客',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `present_weight` int(10) unsigned DEFAULT '0' COMMENT '目前体重 单位kg',
  `target_weight` int(10) unsigned DEFAULT '0' COMMENT '目标体重 单位kg',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `staff_id` int(11) unsigned DEFAULT '0' COMMENT '公司员工推荐人',
  `beauty_id` int(11) unsigned DEFAULT '0' COMMENT '美容院推荐ID',
  `beautician_id` int(11) unsigned DEFAULT '0' COMMENT '美容师推荐ID',
  `customer_id` int(11) unsigned DEFAULT '0' COMMENT '顾客推荐ID',
  `user_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '用户可提佣金',
  `distribut_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '累积佣金',
  `token` varchar(64) DEFAULT '',
  `qr` varchar(200) DEFAULT NULL COMMENT '用户分享二维码',
  `is_buy` tinyint(1) unsigned DEFAULT '0' COMMENT '是否购买 0未下单 1下单未支付 2已付款',
  `is_distribut` tinyint(1) unsigned DEFAULT '0' COMMENT '分销权限 0未拥有 1拥有',
  PRIMARY KEY (`user_id`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `tyms_users`
--

INSERT INTO `tyms_users` (`user_id`, `nickname`, `head_pic`, `openid`, `real_name`, `users_type`, `mobile`, `present_weight`, `target_weight`, `reg_time`, `staff_id`, `beauty_id`, `beautician_id`, `customer_id`, `user_money`, `distribut_money`, `token`, `qr`, `is_buy`, `is_distribut`) VALUES
(10, 'Ｅnterゝ', 'http://wx.qlogo.cn/mmopen/zqNia1W9r6dCtNDPJ15bhiaMlylFaDm4UEA01xciagz4tSv8kShpyYqIG7UwapbOQRibe738LpAK0v93XvOjicicDEo51ibYp8iaYGmG/0', 'oip7Ewm8DF1Pa7AawHqUE-GsJqi4', '', 4, NULL, 0, 0, 1502075312, 2, 18, 17, NULL, 288.00, 288.00, '714783487b817b5c8b8c85b4f7d48511', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEj8jwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZWlEN0V4YXVmNDIxMDAwMDAwN2YAAgS32YdZAwQAAAAA', 1, 1),
(2, '李辰炫', 'http://wx.qlogo.cn/mmopen/CzfePcefza6LmGuubScQVFz55u6adJ8M0H0WQV6IJhPBPMXN9WgEX91AqrXPrh01WgUoQ80SxeWr92xwqszGb9Z42xhGkkE2/0', 'oip7EwhOzxtcuQWlzKAcOQEKKKBo', '', 1, NULL, 0, 0, 1501924895, 0, 0, 0, NULL, 1176.00, 1176.00, '75a5071955d09718cf5f4c98f1c6d709', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQFf8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybnRoZ0ZwYXVmNDIxMDAwMGcwN1cAAgRKg4VZAwQAAAAA', 0, 1),
(17, '似曾相识', 'http://wx.qlogo.cn/mmopen/j87acicHZGT7ia71wss07rNeeKI6JMZEP0yow13Ql5LpuKKnlM5qzaAjh1tuvpoohibASJUkRNcZqZgtfn24ESbKtdBejOBuic0y/0', 'oip7EwheRgJ2AuYRCSAwVfXofzNU', '', 3, NULL, 0, 0, 1502276214, 2, 18, 0, 0, 388.00, 388.00, '1f701bb9cb1a1be7889a135c545315bf', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQH18DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycHdpRkVFYXVmNDIxMDAwMGcwN2kAAgR96opZAwQAAAAA', 0, 1),
(14, '(*ΦωΦ*)', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBQBw6EM7wSOYFbUpicFTGB2FA3KcMfSc3EMiaNf57TwRdbFfF6tzeLQPAeFVYibZ1uDMrJ1z2UibdojYuUia8XHkt5DGKraG7WgLzU/0', 'oip7EwkIrlqDFALz4FzxLn88pF5I', '黄晴月', 4, '15281812281', 75, 60, 1502096766, 2, 18, 17, 10, 0.00, 0.00, 'a03987b5588f22bb4f6fa5db6fd6b2b9', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGo8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycnF2S0YyYXVmNDIxMDAwMGcwN3EAAgSFLYhZAwQAAAAA', 2, 1),
(18, 'mr.chen', 'http://wx.qlogo.cn/mmopen/CzfePcefza4EJ7y57Bj2Y0V280h1LJpEoaGOOq5OLMwqTZaFcCOia5m1Xl0jmq5sWDH9YMpkojWz6MWS5yQcZU8WNAZjetFDR/0', 'oip7EwiZtvDPxo0WcnYoNuA0L2VA', '', 4, NULL, 0, 0, 1502277027, 2, 0, 0, 0, 0.00, 0.00, '97b223bd7bb6e202c4773439b4062f93', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEi8jwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya3dXMEY2YXVmNDIxMDAwME0wN2IAAgSp7YpZAwQAAAAA', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_users_type`
--

CREATE TABLE IF NOT EXISTS `tyms_users_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '会员类型名称',
  `commission` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '固定佣金',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `backimg` varchar(250) NOT NULL COMMENT '会员类型背景图',
  PRIMARY KEY (`id`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `tyms_users_type`
--

INSERT INTO `tyms_users_type` (`id`, `name`, `commission`, `update_time`, `sort`, `backimg`) VALUES
(1, '公司员工', 999.00, 1501662179, 0, '3'),
(2, '美容院', 0.00, 1501663713, 0, '4'),
(3, '美容师', 666.00, 1501663719, 0, '5'),
(4, '顾客', 111.00, 1501663725, 0, '6');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_withdrawals`
--

CREATE TABLE IF NOT EXISTS `tyms_withdrawals` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tyms_withdrawals`
--

INSERT INTO `tyms_withdrawals` (`id`, `user_id`, `create_time`, `money`, `bank_name`, `account_bank`, `account_name`, `remark`, `status`) VALUES
(1, 9, 1502182443, 388.00, '建设银行', '62284805068899729', '陈鹏伍', '已转账', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_wx_img`
--

CREATE TABLE IF NOT EXISTS `tyms_wx_img` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信图文' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `tyms_wx_img`
--

INSERT INTO `tyms_wx_img` (`id`, `keyword`, `desc`, `pic`, `url`, `createtime`, `uptatetime`, `token`, `title`, `goods_id`, `goods_name`) VALUES
(26, 'demo', 'dss', '3', 'demo', '1495338515', '', 'eesops1462769263', 'demo', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_wx_keyword`
--

CREATE TABLE IF NOT EXISTS `tyms_wx_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `pid` int(11) NOT NULL COMMENT '对应表ID',
  `token` varchar(60) NOT NULL COMMENT 'token',
  `type` varchar(30) DEFAULT 'TEXT' COMMENT '关键词操作类型',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `token` (`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信关键字' AUTO_INCREMENT=335 ;

--
-- 转存表中的数据 `tyms_wx_keyword`
--

INSERT INTO `tyms_wx_keyword` (`id`, `keyword`, `pid`, `token`, `type`) VALUES
(331, '你好', 14, 'eesops1462769263', 'TEXT'),
(334, 'demo', 26, 'eesops1462769263', 'IMG');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_wx_menu`
--

CREATE TABLE IF NOT EXISTS `tyms_wx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level` tinyint(1) DEFAULT '1' COMMENT '菜单级别',
  `name` varchar(50) NOT NULL COMMENT 'name',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT '0 view 1 click',
  `value` varchar(255) DEFAULT NULL COMMENT 'value',
  `token` varchar(50) NOT NULL COMMENT 'token',
  `pid` int(11) DEFAULT '0' COMMENT '上级菜单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信菜单' AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `tyms_wx_menu`
--

INSERT INTO `tyms_wx_menu` (`id`, `level`, `name`, `sort`, `type`, `value`, `token`, `pid`) VALUES
(34, 1, '首页', 0, 'view', 'http://tianyimeishan.yizukeji.cn', 'eesops1462769263', 0),
(37, 1, '会员中心', 0, 'view', 'http://tianyimeishan.yizukeji.cn/index/member/index', 'eesops1462769263', 0);

-- --------------------------------------------------------

--
-- 表的结构 `tyms_wx_msg`
--

CREATE TABLE IF NOT EXISTS `tyms_wx_msg` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信消息' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `tyms_wx_msg`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_wx_news`
--

CREATE TABLE IF NOT EXISTS `tyms_wx_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT 'keyword',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `token` char(30) NOT NULL COMMENT 'token',
  `img_id` varchar(50) DEFAULT NULL COMMENT '图文组合id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信图文' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `tyms_wx_news`
--


-- --------------------------------------------------------

--
-- 表的结构 `tyms_wx_text`
--

CREATE TABLE IF NOT EXISTS `tyms_wx_text` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文本回复表' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `tyms_wx_text`
--

INSERT INTO `tyms_wx_text` (`id`, `uid`, `uname`, `keyword`, `precisions`, `text`, `createtime`, `updatetime`, `click`, `token`) VALUES
(14, 0, '', '你好', 0, '你更好!', '1490888710', '', 0, 'eesops1462769263');

-- --------------------------------------------------------

--
-- 表的结构 `tyms_wx_user`
--

CREATE TABLE IF NOT EXISTS `tyms_wx_user` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='微信公共帐号' AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `tyms_wx_user`
--

INSERT INTO `tyms_wx_user` (`id`, `uid`, `wxname`, `aeskey`, `encode`, `appid`, `appsecret`, `wxid`, `weixin`, `headerpic`, `token`, `w_token`, `create_time`, `updatetime`, `tplcontentid`, `share_ticket`, `share_dated`, `authorizer_access_token`, `authorizer_refresh_token`, `authorizer_expires`, `type`, `web_access_token`, `web_refresh_token`, `web_expires`, `qr`, `menu_config`, `wait_access`) VALUES
(25, 0, '小五', '', 0, 'wx607a95578a618a8b', 'e4409cdd267bf9a82a4b551c24b1b2f7', 'gh_a06e822101f6', 'rocfive', 'uploads/20170330ed1d16ff65e5060dd263ce184f044415.jpg', 'eesops1462769263', 'JOfggDDrVhODrrGqnfRUvTGvthXdvtzV', 1486797230, 0, '', '', '', '', '', '', 3, 'JfYGhQLA6QB-cfBha9xg5-z7c59XyQKhzbs7aLz4PG0XHgGsY8ma6Q0zSI7Yt7Vu2fDwA7FCd_V8U0DghLPcsgfW_cjTdaobFrRu8pSGuLbsOkDVElZfkiGBjy5h_tPqCREfADAMBO', '', 1502077454, 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQFm8jwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZFBISUZPYXVmNDIxMDAwME0wN2cAAgSM04NZAwQAAAAA', '', 1);
