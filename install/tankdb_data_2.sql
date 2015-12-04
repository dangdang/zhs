-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2015 at 01:50 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easywork`
--
CREATE DATABASE IF NOT EXISTS `easywork` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `easywork`;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_config`
--

DROP TABLE IF EXISTS `dwin_config`;
CREATE TABLE IF NOT EXISTS `dwin_config` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `keyword` char(30) NOT NULL COMMENT '变量名',
  `vals` text NOT NULL COMMENT '变量值',
  `opts` text NOT NULL COMMENT 'opt值',
  `types` char(10) NOT NULL COMMENT '类型',
  `name` char(50) NOT NULL COMMENT '说明',
  `notes` varchar(80) NOT NULL DEFAULT '' COMMENT '解释',
  `gid` tinyint(2) NOT NULL COMMENT '所属组别',
  `sys` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否系统',
  `sort` mediumint(8) NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `one` (`keyword`),
  KEY `gid` (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dwin_config`
--

INSERT INTO `dwin_config` (`id`, `keyword`, `vals`, `opts`, `types`, `name`, `notes`, `gid`, `sys`, `sort`) VALUES
(1, 'CFG_NAME', 'easywork', 'easywork', 'char', '项目名称', '', 1, 1, 50),
(3, 'CFG_HOST', 'http://localhost', 'http://localhost', 'char', '系统地址', '', 1, 1, 50),
(6, 'CFG_PHONE', '13802901247', '13802901247', 'char', '公司电话', '', 1, 1, 50),
(7, 'APP_GROUP_LIST', 'Admin,Public', 'Admin,Public', 'char', '项目分组', '(请以“,”分开)', 4, 1, 50),
(8, 'DEFAULT_GROUP', 'Admin', 'Admin', 'char', '默认分组', '', 4, 1, 50),
(9, 'CFG_FAX', '13802901247', '13802901247', 'char', '公司传真', '', 1, 1, 50),
(10, 'CFG_MAIL', '68058382@qq.com', '68058382@qq.com', 'char', '公司邮箱', '', 1, 1, 50),
(11, 'CFG_ADDRESS', '广东深圳', '广东深圳', 'char', '公司地址', '', 1, 1, 50),
(13, 'CFG_APPID', 'CU2118K0WEDKY', 'CU2118K0WEDKY', 'char', '站点识别ID', '', -1, 1, 50),
(14, 'CODE_ON', '0', '0', 'bool', '验证码登录', '', 2, 1, 50),
(15, 'CFG_COPYRIGHT', 'Copyright 2015 九五时代', 'Copyright 2015 九五时代', 'text', '版权设置', '', 1, 1, 50),
(17, 'DB_FIELDS_CACHE', '1', '1', 'bool', '开启字段缓存', '', 2, 1, 50),
(18, 'CODE_MODEL', '1', '1=&gt;数字|2=&gt;字母|5=&gt;混合', 'select', '验证码模式', '(需要开启验证码登录)', 2, 1, 50),
(19, 'CODE_LEN', '4', '4', 'int', '验证码长度', '(需要开启验证码登录)', 2, 1, 50),
(20, 'MAIL_SMTP_SEAVER', 'smtp.qq.com', 'smtp.qq.com', 'char', 'SMTP服务器', '', 3, 1, 50),
(21, 'MAIL_SMTP_SSL', '', '', 'bool', '安全连接(SSL)', '', 3, 1, 50),
(22, 'MAIL_SMTP_PORT', '25', '25', 'int', 'SMTP服务器端口', '', 3, 1, 50),
(23, 'MAIL_SMTP_USER', '68058382@qq.com', '68058382@qq.com', 'char', 'SMTP用户名', '', 3, 1, 50),
(24, 'MAIL_SMTP_PWD', '123456', '123456', 'char', 'SMTP密码', '', 3, 1, 50),
(25, 'MAIL_SMTP_NAME', '九五时代', '九五时代', 'char', '发件箱名称', '', 3, 1, 50),
(32, 'CFG_CHARSET', 'UTF-8', 'UTF-8=&gt;UTF-8|GBK=&gt;GBK', 'select', '编码类型', '', 4, 1, 50),
(33, 'WALL_ON', '0', '0', 'bool', '开启防火墙', '', 52, 1, 50),
(34, 'WALL_KEY', '', '', 'char', '防火墙密钥', '(6~50个数字或字母)', 52, 1, 50),
(35, 'LOGIN_URL', '', '', 'char', '允许后台登陆的域名', '(如：http://www.piocms.com/index.php/admin)', 52, 1, 50),
(36, 'LOGIN_TIME', '', '', 'more', '允许登陆后台的时间点', '(不选为不限制)', 52, 1, 50),
(37, 'LOGIN_WEEK', '', '', 'more', '允许登陆后台的星期', '(不选为不限制) ', 52, 1, 50),
(39, 'CFG_NUM', '1', '1', 'int', '保留小数位', '(小数点后保留的位数)', 2, 1, 50),
(38, 'WALL_SHIELDING', '操你妈|鸡巴|性爱|毛泽东|共产党', '操你妈|鸡巴|性爱|毛泽东|共产党', 'text', '屏蔽敏感字符', '(多个用“|”格开，屏蔽前台所提交的内容)', 52, 1, 50),
(40, 'DATA_CACHE_TYPE', 'File', 'File|Apachenote|Apc|Eaccelerator|Memcache|Shmop|Sqlite|Db|Redis|Xcache', 'select', '数据缓存方式', '(部分缓存方式需要服务器支持)', 2, 1, 50),
(56, 'DATA_NOWRAP', '1', '1', 'bool', '自动截取', '(设置为true时，当表格数据长度超出范围时自动截取)', 2, 1, 50),
(55, 'DG_FIT_COLUMNS', '0', '0', 'bool', '自动列适应', '(设置为true时，避免表格出现水平滚动)', 2, 1, 50),
(54, 'SEARCH_ADV_ACTION', '0', '0', 'bool', '高級搜索动作', '(控制查询之后窗口是否自动关闭)', 2, 1, 50),
(41, 'DATA_CACHE_SUBDIR', '1', '1', 'bool', '哈希子目录缓存', '', 2, 1, 50),
(42, 'DATA_PATH_LEVEL', '2', '2', 'int', '哈希目录层次', '(需要开启哈希目录缓存)', 2, 1, 50),
(46, 'IMG_WIDTH', '180', '180', 'int', '默认缩略图宽度', '', 3, 1, 50),
(47, 'IMG_HEIGHT', '137', '137', 'int', '默认缩略图高度', '', 3, 1, 50),
(50, 'PAGE_ROW', '50', '0=&gt;0|10=&gt;10|30=&gt;30|50=&gt;50|80=&gt;80|100=&gt;100|1000=&gt;1000', 'select', '每页显示行数', '为"0"时表示不显示分页)', 2, 1, 50),
(57, 'UPLOAD_SIZE', '52428800', '52428800', 'int', '上传限制', '(单位：字节)', 3, 1, 50),
(53, 'SEARCH_ACTION', '0', '0', 'bool', '快速查询动作', '(控制快速查询之后窗口是否自动关闭)', 2, 1, 50),
(62, 'SKIN_COOKIE_EXPIRES', '365', '365', 'int', '皮肤过期时间', '(切换皮肤过期时间，单位：天)', 3, 1, 50),
(61, 'CFG_OPEN_TABS', '0', '0', 'bool', '选项卡打开方式', '(是否在新的选项卡打开项目)', 2, 1, 50),
(63, 'DB_SQL_BUILD_CACHE', '1', '1', 'bool', 'SQL解析缓存', '', 2, 1, 50),
(64, 'DB_SQL_BUILD_LENGTH', '30', '30', 'int', 'SQL解析缓存长度', '', 2, 1, 50),
(65, 'DB_SQL_BUILD_QUEUE', 'file', 'file|xcache|apc', 'select', 'SQL解析缓存方式', '', 2, 1, 50),
(66, 'DATA_CACHE_TIME', '0', '0', 'int', '数据缓存时间', '(“0”表示永久缓存，单位：秒)', 2, 1, 50),
(67, 'BROWSER_CACHE', '0', '0', 'bool', '调用浏览器缓存', '(是否调用浏览器缓存)', 2, 1, 50),
(68, 'DATAGRID_VIEW', '0', '0=&gt;无视图|scrollview=&gt;scrollview|bufferview=&gt;bufferview', 'select', '开启表格视图', '', 2, 1, 50),
(76, 'CFG_ON', '1', '1', 'bool', '系统开关', '(关闭时，系统将无法登录)', 4, 1, 50),
(77, 'BACKUP_SIZE', '500', '500', 'int', '备份文件大小', '(单个备份文件大小限制，单位：KB)', 3, 1, 50),
(71, 'SUBMIT_ACTION', '1', '1', 'bool', '提交成功动作', '(提交成功之后窗口是否自动关闭)', 2, 1, 50),
(78, 'USER_TO_MAIL', '0', '0', 'bool', '用户注册提醒', '(为新增的用户发送邮件提醒)', 3, 1, 50),
(79, 'MAIL_OF_USER', '0', '0', 'bool', '允许个人邮箱', '(开启后，允许用户更改自己的邮箱)', 3, 1, 50),
(81, 'SMS_AUTO_REPORT', '1', '1', 'bool', '信息自动提醒', '', 2, 1, 50),
(82, 'CFG_CLIENT_PRE', 'D', 'D', 'char', '项目代码前缀', '(设置客户编号前缀)', 3, 1, 50),
(84, 'UPLOAD_TYPE', 'jpg,png,gif,doc,xls,docx,xlsx,rar,zip,iso,tar,txt,pdf,apk,ipa', 'jpg,png,gif,doc,xls,docx,xlsx,rar,zip,iso,tar,txt,pdf,apk,ipa', 'text', '上传类型', '(允许上传的文件类型)', 3, 1, 50),
(85, 'VIEW_GRESS', '7', '7', 'int', '跟进默认天数', '(首页中客户跟进默认显示天数)', 3, 1, 50),
(86, 'MORE_COMY', '0', '0', 'bool', '开启子公司', '', 3, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `dwin_files_baseinfo_table`
--

DROP TABLE IF EXISTS `dwin_files_baseinfo_table`;
CREATE TABLE IF NOT EXISTS `dwin_files_baseinfo_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `files_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `files_id` (`files_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_files_main_table`
--

DROP TABLE IF EXISTS `dwin_files_main_table`;
CREATE TABLE IF NOT EXISTS `dwin_files_main_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` mediumint(8) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `files_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pro_id` (`pro_id`) USING BTREE,
  KEY `files_id` (`files_id`) USING BTREE,
  KEY `task_id` (`task_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_files_path_table`
--

DROP TABLE IF EXISTS `dwin_files_path_table`;
CREATE TABLE IF NOT EXISTS `dwin_files_path_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `files_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(180) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `files_id` (`files_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_linkage`
--

DROP TABLE IF EXISTS `dwin_linkage`;
CREATE TABLE IF NOT EXISTS `dwin_linkage` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `_parentId` smallint(4) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `text` char(35) NOT NULL DEFAULT '' COMMENT '名称',
  `val` varchar(120) NOT NULL DEFAULT '' COMMENT '值',
  `code` varchar(60) NOT NULL DEFAULT '' COMMENT '名称拼音',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` smallint(4) NOT NULL DEFAULT '50' COMMENT '排序',
  `deep` tinyint(1) NOT NULL DEFAULT '0',
  `layer` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dwin_linkage`
--

INSERT INTO `dwin_linkage` (`id`, `_parentId`, `text`, `val`, `code`, `status`, `sort`, `deep`, `layer`) VALUES
(5, 0, '任务类型', '任务类型', 'renwuleixing', 1, 1, 0, 1),
(6, 5, '子项目', '子项目', 'zixiangmu', 1, 1, 1, 1),
(7, 5, '控制账户', '控制账户', 'kongzhizhanghu', 1, 2, 1, 1),
(8, 0, '任务状态', '任务状态', 'renwuzhuangtai', 1, 2, 0, 1),
(9, 8, '未开始', '<div style=''background-color: #cf86cf; width:100%; text-align:center;''>未开始</div>', 'weikaishi', 1, 1, 1, 1),
(10, 8, '计划', '<div style=''background-color: #d2ff00; width:100%; text-align:center;''>计划</div>', 'jihua', 1, 2, 1, 1),
(11, 8, '进行中20%', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中20%</div>', 'jinxingzhong20', 1, 3, 1, 1),
(12, 8, '进行中40%', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中40%</div>', 'jinxingzhong40', 1, 4, 1, 1),
(13, 8, '进行中60%', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中60%</div>', 'jinxingzhong60', 1, 5, 1, 1),
(14, 0, '查看权限', '查看权限', 'chakanquanxian', 1, 3, 0, 1),
(15, 14, '相关客户', '相关客户', 'gongkai', 1, 3, 1, 1),
(16, 14, '内部所有人', '内部所有人', 'yingcang', 1, 1, 1, 1),
(17, 14, '项目相关人', '项目相关人', 'zhuanan', 1, 2, 1, 1),
(18, 0, '严重程度', '严重程度', 'yanzhongchengdu', 1, 4, 0, 1),
(21, 0, '项目状态', '项目状态', 'xiangmuzhuangtai', 1, 5, 0, 1),
(22, 0, '优先级', '优先级', 'youxianji', 1, 6, 0, 1),
(24, 18, '极低', '极低', 'jidi', 1, 2, 1, 1),
(25, 18, '低', '低', 'di', 1, 3, 1, 1),
(26, 18, '中', '中', 'zhong', 1, 4, 1, 1),
(27, 18, '高', '高', 'gao', 1, 5, 1, 1),
(35, 22, '极低', '极低', 'jidi', 1, 2, 1, 1),
(36, 22, '低', '低', 'di', 1, 3, 1, 1),
(37, 22, '中', '中', 'zhong', 1, 4, 1, 1),
(38, 22, '高', '高', 'gao', 1, 5, 1, 1),
(39, 22, '急紧', '急紧', 'jijin', 1, 6, 1, 1),
(46, 8, '进行中80%', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中80%</div>', 'jinxingzhong80', 1, 6, 1, 1),
(47, 8, '调试', '<div style=''background-color: #83a6fe; width:100%; text-align:center;''>调试</div>', 'jinxingzhong100', 1, 7, 1, 1),
(48, 8, '中断', '<div style=''background-color: #ccc; width:100%; text-align:center;''>中断</div>', 'zhongduan', 1, 13, 1, 1),
(49, 8, '推迟', '<div style=''background-color: #00ffae; width:100%; text-align:center;''>推迟</div>', 'tuichi', 1, 9, 1, 1),
(51, 8, '完成验收', '<div style=''background-color: #fb7575; width:100%; text-align:center;''>完成验收</div>', 'wanchengyanshou', 1, 11, 1, 1),
(52, 8, '驳回', '<div style=''background-color: #97d38b; width:100%; text-align:center;''>驳回</div>', 'bohui', 1, 12, 1, 1),
(53, 5, '项目管理', '项目管理', 'xiangmuguanli', 1, 3, 1, 1),
(54, 5, '产品设计', '产品设计', 'chanpinsheji', 1, 4, 1, 1),
(55, 5, '开发', '开发', 'kaifa', 1, 5, 1, 1),
(56, 5, 'Bug', 'Bug', 'bug', 1, 6, 1, 1),
(57, 5, '测试', '测试', 'ceshi', 1, 7, 1, 1),
(58, 5, '撰写文档', '撰写文档', 'zhuanxiewendang', 1, 8, 1, 1),
(59, 5, '需求调研', '需求调研', 'xuqiu', 1, 9, 1, 1),
(60, 5, '会议', '会议', 'huiyi', 1, 10, 1, 1),
(62, 5, '加班', '加班', 'jiaban', 1, 12, 1, 1),
(63, 5, '其它', '其它', 'qita', 1, 13, 1, 1),
(64, 18, '严重', '严重', 'yanzhong', 1, 6, 1, 1),
(65, 21, '已结束', '<div style=''background-color: #97d38b; width:100%; text-align:center;''>已结束</div>', 'xmyjs', 1, 51, 1, 1),
(66, 21, '已中断', '<div style=''background-color: #ccc; width:100%; text-align:center;''>已中断</div>', 'xmzd', 1, 53, 1, 1),
(67, 21, '已推迟', '<div style=''background-color: #00ffae; width:100%; text-align:center;''>已推迟</div>', 'tc', 1, 50, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dwin_log_dmain_table`
--

DROP TABLE IF EXISTS `dwin_log_dmain_table`;
CREATE TABLE IF NOT EXISTS `dwin_log_dmain_table` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL DEFAULT '0',
  `pro_id` int(8) NOT NULL DEFAULT '0',
  `task_id` int(8) NOT NULL DEFAULT '0',
  `worklog_id` int(11) NOT NULL DEFAULT '0',
  `files_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `log_id` (`log_id`) USING BTREE,
  KEY `pro_id` (`pro_id`) USING BTREE,
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `worklog_id` (`worklog_id`) USING BTREE,
  KEY `files_id` (`files_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_log_main_table`
--

DROP TABLE IF EXISTS `dwin_log_main_table`;
CREATE TABLE IF NOT EXISTS `dwin_log_main_table` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL DEFAULT '0',
  `pro_id` int(8) NOT NULL DEFAULT '0',
  `task_id` int(8) NOT NULL DEFAULT '0',
  `worklog_id` int(11) NOT NULL DEFAULT '0',
  `files_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `log_id` (`log_id`) USING BTREE,
  KEY `pro_id` (`pro_id`) USING BTREE,
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `worklog_id` (`worklog_id`) USING BTREE,
  KEY `files_id` (`files_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_menu`
--

DROP TABLE IF EXISTS `dwin_menu`;
CREATE TABLE IF NOT EXISTS `dwin_menu` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `_parentId` smallint(4) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `deep` tinyint(1) NOT NULL DEFAULT '0' COMMENT '深度',
  `code` char(20) NOT NULL DEFAULT '' COMMENT '识别码',
  `text` char(35) NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '连接',
  `iconCls` char(50) DEFAULT NULL COMMENT '标题图片',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `state` char(6) NOT NULL DEFAULT 'open' COMMENT '状态',
  `mode` tinyint(1) NOT NULL DEFAULT '1',
  `type` char(5) NOT NULL DEFAULT '' COMMENT '类型',
  `level` char(15) NOT NULL DEFAULT '10' COMMENT '权限',
  `view` text NOT NULL COMMENT '开放用户',
  `sort` smallint(4) NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `mode` (`mode`) USING BTREE,
  KEY `states` (`state`,`status`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `_parentId` (`_parentId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dwin_menu`
--

INSERT INTO `dwin_menu` (`id`, `_parentId`, `deep`, `code`, `text`, `url`, `iconCls`, `status`, `state`, `mode`, `type`, `level`, `view`, `sort`) VALUES
(1, 0, 0, '', '系统管理', '', 'icon-setting', 1, 'open', 1, '>=', '999', '', 99),
(2, 1, 1, '', '基础设置', '', '', 1, 'open', 1, '>=', '999', '', 1),
(3, 2, 2, 'User', '用户管理', '/index.php?s=/user/index', '', 1, 'open', 1, '>=', '999', '', 2),
(4, 1, 1, '', '系统设置', '', '', 1, 'open', 1, '>=', '999', '', 2),
(5, 2, 2, 'Group', '角色管理', '/index.php?s=/group/index', '', 1, 'open', 1, '>=', '999', '', 3),
(6, 2, 2, 'Comy', '公司管理', '/index.php?s=/comy/index', '', 0, 'open', 1, '>=', '999', '', 4),
(7, 2, 2, 'Linkage', '联动管理', '/index.php?s=/linkage/index', '', 1, 'open', 1, '>=', '999', '', 7),
(8, 2, 2, 'Part', '部门管理', '/index.php?s=/part/index', '', 1, 'open', 1, '>=', '999', '', 6),
(9, 4, 2, 'Setting', '参数设置', '/index.php?s=/setting/index', '', 1, 'open', 1, '>=', '999', '', 1),
(10, 4, 2, 'Menu', '菜单设置', '/index.php?s=/menu/index', '', 1, 'open', 1, '>=', '9999', '', 2),
(11, 1, 1, '', '系统工具', '', '', 1, 'open', 1, '>=', '9999', '', 3),
(12, 11, 2, 'Backup', '数据备份', '/index.php?s=/backup/index', '', 1, 'open', 1, '>=', '9999', '', 1),
(13, 0, 0, '', '工作管理', '', 'icon-project', 1, 'open', 1, '>=', '10', '', 1),
(14, 13, 1, '', '项目管理', '', '', 1, 'open', 1, '>=', '10', '', 1),
(15, 14, 2, 'Log', '动态列表', '/index.php?s=/log/index', '', 1, 'open', 1, '>=', '10', '', 2),
(16, 13, 1, '', '属性管理', '', '', 1, 'open', 1, '>=', '50', '', 2),
(18, 16, 2, 'Client', '客户管理', '/index.php?s=/client/index', '', 1, 'open', 1, '>=', '50', '', 2),
(19, 14, 2, 'Project', '项目列表', '/index.php?s=/project/index', '', 1, 'open', 1, '>=', '10', '', 3),
(20, 14, 2, 'Files', '文档列表', '/index.php?s=/files/index', '', 1, 'open', 1, '>=', '10', '', 4),
(21, 14, 2, 'Notice', '公告列表', '/index.php?s=/notice/index', '', 1, 'open', 1, '>=', '30', '', 5),
(22, 14, 2, 'Task', '任务列表', '/index.php?s=/task/index', '', 1, 'open', 1, '>=', '10', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dwin_reply_main_table`
--

DROP TABLE IF EXISTS `dwin_reply_main_table`;
CREATE TABLE IF NOT EXISTS `dwin_reply_main_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` mediumint(8) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `worklog_id` int(11) NOT NULL DEFAULT '0',
  `reply_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pro_id` (`pro_id`) USING BTREE,
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `reply_id` (`reply_id`) USING BTREE,
  KEY `worklog_id` (`worklog_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_session`
--

DROP TABLE IF EXISTS `dwin_session`;
CREATE TABLE IF NOT EXISTS `dwin_session` (
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `session_expire` int(11) NOT NULL DEFAULT '0',
  `session_data` blob NOT NULL,
  UNIQUE KEY `session_id` (`session_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_sms_baseinfo_table`
--

DROP TABLE IF EXISTS `dwin_sms_baseinfo_table`;
CREATE TABLE IF NOT EXISTS `dwin_sms_baseinfo_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_id` (`sms_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_sms_receive_table`
--

DROP TABLE IF EXISTS `dwin_sms_receive_table`;
CREATE TABLE IF NOT EXISTS `dwin_sms_receive_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `sms_id` (`sms_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_task_baseinfo_table`
--

DROP TABLE IF EXISTS `dwin_task_baseinfo_table`;
CREATE TABLE IF NOT EXISTS `dwin_task_baseinfo_table` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `task_id` mediumint(8) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_task_main_table`
--

DROP TABLE IF EXISTS `dwin_task_main_table`;
CREATE TABLE IF NOT EXISTS `dwin_task_main_table` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `pro_id` mediumint(8) NOT NULL DEFAULT '0',
  `task_id` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pro_id` (`pro_id`) USING BTREE,
  KEY `task_id` (`task_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_upload_file`
--

DROP TABLE IF EXISTS `dwin_upload_file`;
CREATE TABLE IF NOT EXISTS `dwin_upload_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ModeName` char(20) NOT NULL DEFAULT '',
  `BelongFile` char(30) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ModeName` (`ModeName`) USING BTREE,
  KEY `BelongFile` (`BelongFile`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_user_company_table`
--

DROP TABLE IF EXISTS `dwin_user_company_table`;
CREATE TABLE IF NOT EXISTS `dwin_user_company_table` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `_parentId` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(16) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `access` smallint(5) UNSIGNED NOT NULL DEFAULT '10',
  `comment` char(15) NOT NULL DEFAULT '',
  `sort` smallint(6) NOT NULL DEFAULT '50',
  `smtp` varchar(100) NOT NULL DEFAULT '',
  `ssl` tinyint(1) NOT NULL DEFAULT '0',
  `port` smallint(6) NOT NULL DEFAULT '25',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `comment` (`comment`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dwin_user_group_table`
--

DROP TABLE IF EXISTS `dwin_user_group_table`;
CREATE TABLE IF NOT EXISTS `dwin_user_group_table` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `_parentId` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(16) NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `access` smallint(5) UNSIGNED NOT NULL DEFAULT '10',
  `comment` varchar(128) NOT NULL DEFAULT '',
  `sort` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dwin_user_group_table`
--

INSERT INTO `dwin_user_group_table` (`id`, `_parentId`, `name`, `status`, `access`, `comment`, `sort`) VALUES
(1, 0, '超级管理员', 0, 9999, '最高权限角色', 0),
(2, 0, '管理员', 1, 999, '没有菜单设置与系统工具权限', 0),
(3, 0, '项目经理', 1, 50, '没有系统管理权限', 0),
(4, 0, '普通用户', 1, 40, '没有项目管理权限', 0),
(5, 0, '访客', 1, 30, '只有查看功能', 0),
(6, 0, '客户', 1, 10, '只能看到自己所属的项目', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dwin_user_main_table`
--

DROP TABLE IF EXISTS `dwin_user_main_table`;
CREATE TABLE IF NOT EXISTS `dwin_user_main_table` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `part_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `company_id` int(5) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dwin_user_main_table`
--

INSERT INTO `dwin_user_main_table` (`id`, `part_id`, `user_id`, `group_id`, `company_id`) VALUES
(1, 0, 1, 1, 0),
(2, 1, 2, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dwin_user_part_table`
--

DROP TABLE IF EXISTS `dwin_user_part_table`;
CREATE TABLE IF NOT EXISTS `dwin_user_part_table` (
  `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `_parentId` smallint(5) NOT NULL DEFAULT '0',
  `name` varchar(16) NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `access` smallint(5) UNSIGNED NOT NULL DEFAULT '10',
  `comment` varchar(128) NOT NULL DEFAULT '',
  `sort` smallint(3) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dwin_user_part_table`
--

INSERT INTO `dwin_user_part_table` (`id`, `_parentId`, `name`, `status`, `access`, `comment`, `sort`) VALUES
(1, 0, '综合所', 1, 10, '', 50);

-- --------------------------------------------------------

--
-- Table structure for table `dwin_user_table`
--

DROP TABLE IF EXISTS `dwin_user_table`;
CREATE TABLE IF NOT EXISTS `dwin_user_table` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `realname` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '1',
  `access` smallint(6) NOT NULL DEFAULT '10',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `last_visit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `report` char(1) NOT NULL DEFAULT '0',
  `MailPwd` varchar(30) NOT NULL,
  `smtp` varchar(100) NOT NULL DEFAULT '',
  `ssl` tinyint(1) NOT NULL DEFAULT '0',
  `port` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `idx_enable` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dwin_user_table`
--

INSERT INTO `dwin_user_table` (`id`, `username`, `realname`, `password`, `email`, `status`, `access`, `login_count`, `last_visit`, `date_created`, `report`, `MailPwd`, `smtp`, `ssl`, `port`) VALUES
(1, 'admin', 'admin', 'd4a973e303ec37692cc8923e3148eef7', 'hi.zhaolin@foxmail.com', '1', 9999, 3, 1447799001, 1447797694, '0', '', '', 0, 0),
(2, 'jerry', 'jerry', '81dc9bdb52d04dc20036dbd8313ed055', 'hi.zhaolin@foxmail.com', '1', 10, 3, 1447799117, 1447798737, '0', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dwin_worklog_main_table`
--

DROP TABLE IF EXISTS `dwin_worklog_main_table`;
CREATE TABLE IF NOT EXISTS `dwin_worklog_main_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` mediumint(8) DEFAULT NULL,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `worklog_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pro_id` (`pro_id`) USING BTREE,
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `worklog_id` (`worklog_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Database: `tankdb`
--
CREATE DATABASE IF NOT EXISTS `tankdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tankdb`;

-- --------------------------------------------------------

--
-- Table structure for table `tk_announcement`
--

DROP TABLE IF EXISTS `tk_announcement`;
CREATE TABLE IF NOT EXISTS `tk_announcement` (
  `AID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_anc_title` varchar(80) NOT NULL,
  `tk_anc_text` text NOT NULL,
  `tk_anc_type` smallint(4) NOT NULL DEFAULT '0',
  `tk_anc_create` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_anc_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_announcement`
--

INSERT INTO `tk_announcement` (`AID`, `tk_anc_title`, `tk_anc_text`, `tk_anc_type`, `tk_anc_create`, `tk_anc_lastupdate`) VALUES
(2, '关于本系统问题请暂时在综合所群里反馈：-）', '<p>\r\n	关于本系统的以下问题请暂时在综合所群里反馈，谢谢：\r\n</p>\r\n<p>\r\n	（1）所项目管理过程中需要进一步增加、完善的功能；\r\n</p>\r\n<p>\r\n	（2）目前系统的bug等；\r\n</p>', 2, 1, '2015-01-05 04:35:53'),
(3, '请各位负责人创建新项目时注意查找是否有重复', '建议项目参加人员可提醒项目负责人来“新建项目”，然后自己可在该项目下新建任务', 2, 1, '2014-08-27 02:37:29');

-- --------------------------------------------------------

--
-- Table structure for table `tk_bug`
--

DROP TABLE IF EXISTS `tk_bug`;
CREATE TABLE IF NOT EXISTS `tk_bug` (
  `bugid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_bug_title` text,
  `tk_bug_description` text,
  `tk_bug_type` text,
  `tk_bug_priority` text,
  `tk_bug_project` text,
  `tk_bug_project_sub` text,
  `tk_bug_attachment` text,
  `tk_bug_log` text,
  `tk_bug_comment` text,
  `tk_bug_status` text,
  `tk_bug_from_team` text,
  `tk_bug_from` text,
  `tk_bug_to_team` text,
  `tk_bug_to` text,
  `tk_bug_url` text,
  `tk_bug_createtime` text,
  `tk_bug_lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tk_bug_backup1` text,
  `tk_bug_backup2` text,
  `tk_bug_backup3` text,
  `tk_bug_backup4` text,
  `tk_bug_backup5` text,
  `tk_bug_backup6` text,
  PRIMARY KEY (`bugid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_comment`
--

DROP TABLE IF EXISTS `tk_comment`;
CREATE TABLE IF NOT EXISTS `tk_comment` (
  `coid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_comm_title` text NOT NULL,
  `tk_comm_text` varchar(60) NOT NULL,
  `tk_comm_type` tinyint(2) NOT NULL DEFAULT '0',
  `tk_comm_user` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_comm_pid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_comm_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`coid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_document`
--

DROP TABLE IF EXISTS `tk_document`;
CREATE TABLE IF NOT EXISTS `tk_document` (
  `docid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_doc_title` varchar(80) NOT NULL,
  `tk_doc_description` longtext NOT NULL,
  `tk_doc_attachment` varchar(255) NOT NULL DEFAULT '',
  `tk_doc_class1` bigint(20) NOT NULL DEFAULT '0',
  `tk_doc_class2` bigint(20) NOT NULL DEFAULT '0',
  `tk_doc_type` varchar(20) NOT NULL,
  `tk_doc_create` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_doc_createtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tk_doc_edit` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_doc_edittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tk_doc_backup1` tinyint(2) NOT NULL DEFAULT '0',
  `tk_doc_backup2` varchar(60) NOT NULL,
  PRIMARY KEY (`docid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_document`
--

INSERT INTO `tk_document` (`docid`, `tk_doc_title`, `tk_doc_description`, `tk_doc_attachment`, `tk_doc_class1`, `tk_doc_class2`, `tk_doc_type`, `tk_doc_create`, `tk_doc_createtime`, `tk_doc_edit`, `tk_doc_edittime`, `tk_doc_backup1`, `tk_doc_backup2`) VALUES
(1, '项目成果', '', '', 44, 0, '', 31, '2014-09-12 09:19:20', 31, '2014-09-12 07:19:28', 1, ''),
(2, '项目成果', '中间成果', '', 44, 0, '', 31, '2014-09-12 09:19:46', 31, '2014-09-12 07:19:59', 1, ''),
(4, '资料文档', '', '', -1, -1, '', 7, '2014-09-22 11:14:13', 7, '2014-09-22 09:14:21', 1, ''),
(6, '2010年交通工作会议部长讲话', '', 'upload/63228973f9c43d6687275fe0960d5cb5_2010年交通工作会议部长讲话.docx', -1, 5, '', 7, '2014-09-22 11:19:09', 7, '2014-09-22 09:22:57', 0, ''),
(7, '2011年交通工作会议部长讲话', '', 'upload/42c37279bd46aa757bdcd7ec1740433d_2011年交通工作会议部长讲话.docx', -1, 5, '', 7, '2014-09-22 11:20:08', 7, '2014-09-22 09:21:50', 0, ''),
(8, '2013年交通工作会议部长讲话', '', 'upload/52e08a1e585457bb5d5101efb19993fb_2013年交通工作会议部长讲话.doc', -1, 5, '', 7, '2014-09-22 11:23:39', 7, '2014-09-22 09:23:58', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tk_item`
--

DROP TABLE IF EXISTS `tk_item`;
CREATE TABLE IF NOT EXISTS `tk_item` (
  `item_id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_item_key` varchar(60) CHARACTER SET utf8 NOT NULL,
  `tk_item_value` varchar(60) CHARACTER SET utf8 NOT NULL,
  `tk_item_title` varchar(60) CHARACTER SET utf8 NOT NULL,
  `tk_item_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tk_item_type` varchar(20) CHARACTER SET utf8 NOT NULL,
  `tk_item_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_item`
--

INSERT INTO `tk_item` (`item_id`, `tk_item_key`, `tk_item_value`, `tk_item_title`, `tk_item_description`, `tk_item_type`, `tk_item_lastupdate`) VALUES
(3, 'outofdate', 'on', '是否显示过期任务提醒', '”on“为开启，”off“为关闭', 'setting', '2012-06-10 06:03:36'),
(7, 'mail_create', 'off', '新任务提醒', '当有新任务到达时提醒任务执行人 "on" 为启用该功能, "off" 为禁用该功能', 'setting_mail', '2014-08-13 08:00:06'),
(8, 'mail_update', 'off', '任务更新提醒', '当任务状态更新时提醒任务负责人(来自谁) "on" 为启用该功能, "off" 为禁用该功能', 'setting_mail', '2012-07-04 14:02:50'),
(9, 'mail_comment', 'off', '新备注提醒', '当任务有新备注时提醒任务执行人 "on" 为启用该功能, "off" 为禁用该功能', 'setting_mail', '2012-07-04 14:02:53'),
(10, 'mail_host', 'smtp.tpri.gov.cn', 'SMTP邮件服务器', 'SMTP邮件服务器地址,如:smtp.sina.com', 'setting_mail', '2014-08-13 07:51:23'),
(11, 'mail_port', '25', 'SMTP邮件服务器端口', 'SMTP邮件服务器的端口号,默认为25，无需修改', 'setting_mail', '2012-06-16 15:00:04'),
(12, 'mail_username', 'yourname@sina.com', '用户名', '用户名:邮件帐号的用户名,如使用新浪邮箱，请填写完整的邮件地址,如: yourname@sina.com', 'setting_mail', '2012-07-04 14:03:05'),
(13, 'mail_password', 'yourpassword', '密码', '密码:邮件帐号的密码', 'setting_mail', '2012-07-04 14:03:19'),
(14, 'mail_from', 'yourname@sina.com', '发送邮件的邮箱', '发送邮件的邮箱,如: yourname@sina.com', 'setting_mail', '2012-07-04 14:03:10'),
(15, 'mail_fromname', 'WSS', '显示名称', '邮件发送人的显示名称', 'setting_mail', '2012-06-16 14:57:02'),
(16, 'mail_charset', 'UTF-8', '编码格式', '邮件编码格式设置，默认为UTF-8，无需修改', 'setting_mail', '2012-06-16 15:00:11'),
(17, 'mail_auth', 'true', 'SMTP验证', '启用SMTP验证功能，默认为true，无需修改', 'setting_mail', '2012-06-16 15:02:12'),
(18, 'maxrows_task', '100', '每页任务数', '任务列表页，每页显示的任务数量，只支持正整数', 'setting', '2014-08-27 02:41:44'),
(19, 'maxrows_timeout', '5', '每页过期任务数', '任务列表页，每页显示的过期任务数量，只支持正整数', 'setting', '2012-06-17 06:58:04'),
(20, 'maxrows_project', '100', '每页项目数', '项目列表页，每页显示的项目数量，只支持正整数', 'setting', '2014-08-27 02:41:53'),
(21, 'maxrows_user', '50', '每页用户数', '用户列表页，每页显示的用户数量，只支持正整数', 'setting', '2014-08-27 02:42:02'),
(22, 'maxrows_announcement', '30', '每页公告数', '公告列表页，每页显示的公告数量，只支持正整数', 'setting', '2014-08-27 02:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `tk_item01`
--

DROP TABLE IF EXISTS `tk_item01`;
CREATE TABLE IF NOT EXISTS `tk_item01` (
  `im01id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_im01_field01` text,
  `tk_im01_field02` text,
  `tk_im01_field03` text,
  `tk_im01_field04` text,
  `tk_im01_field05` text,
  `tk_im01_field06` text,
  `tk_im01_field07` text,
  `tk_im01_field08` text,
  `tk_im01_field09` text,
  `tk_im01_field10` text,
  `tk_im01_field11` text,
  `tk_im01_field12` text,
  `tk_im01_field13` text,
  `tk_im01_lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`im01id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_item02`
--

DROP TABLE IF EXISTS `tk_item02`;
CREATE TABLE IF NOT EXISTS `tk_item02` (
  `im02id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_im02_field01` text,
  `tk_im02_field02` text,
  `tk_im02_field03` text,
  `tk_im02_field04` text,
  `tk_im02_field05` text,
  `tk_im02_field06` text,
  `tk_im02_field07` text,
  `tk_im02_field08` text,
  `tk_im02_field09` text,
  `tk_im02_field10` text,
  `tk_im02_field11` text,
  `tk_im02_field12` text,
  `tk_im02_field13` text,
  `tk_im02_lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`im02id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_item03`
--

DROP TABLE IF EXISTS `tk_item03`;
CREATE TABLE IF NOT EXISTS `tk_item03` (
  `im03id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_im03_field01` text,
  `tk_im03_field02` text,
  `tk_im03_field03` text,
  `tk_im03_field04` text,
  `tk_im03_field05` text,
  `tk_im03_field06` text,
  `tk_im03_field07` text,
  `tk_im03_field08` text,
  `tk_im03_field09` text,
  `tk_im03_field10` text,
  `tk_im03_field11` text,
  `tk_im03_field12` text,
  `tk_im03_field13` text,
  `tk_im03_lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`im03id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_item04`
--

DROP TABLE IF EXISTS `tk_item04`;
CREATE TABLE IF NOT EXISTS `tk_item04` (
  `im04id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_im04_field01` text,
  `tk_im04_field02` text,
  `tk_im04_field03` text,
  `tk_im04_field04` text,
  `tk_im04_field05` text,
  `tk_im04_field06` text,
  `tk_im04_field07` text,
  `tk_im04_field08` text,
  `tk_im04_field09` text,
  `tk_im04_field10` text,
  `tk_im04_field11` text,
  `tk_im04_field12` text,
  `tk_im04_field13` text,
  `tk_im04_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`im04id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_item05`
--

DROP TABLE IF EXISTS `tk_item05`;
CREATE TABLE IF NOT EXISTS `tk_item05` (
  `im05id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_im05_field01` text,
  `tk_im05_field02` text,
  `tk_im05_field03` text,
  `tk_im05_field04` text,
  `tk_im05_field05` text,
  `tk_im05_field06` text,
  `tk_im05_field07` text,
  `tk_im05_field08` text,
  `tk_im05_field09` text,
  `tk_im05_field10` text,
  `tk_im05_field11` text,
  `tk_im05_field12` text,
  `tk_im05_field13` text,
  `tk_im05_lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`im05id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_item06`
--

DROP TABLE IF EXISTS `tk_item06`;
CREATE TABLE IF NOT EXISTS `tk_item06` (
  `im06id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_im06_field01` text,
  `tk_im06_field02` text,
  `tk_im06_field03` text,
  `tk_im06_field04` text,
  `tk_im06_field05` text,
  `tk_im06_field06` text,
  `tk_im06_field07` text,
  `tk_im06_field08` text,
  `tk_im06_field09` text,
  `tk_im06_field10` text,
  `tk_im06_field11` text,
  `tk_im06_field12` text,
  `tk_im06_field13` text,
  `tk_im06_field14` text,
  `tk_im06_field15` text,
  `tk_im06_field16` text,
  `tk_im06_field17` text,
  `tk_im06_field18` text,
  `tk_im06_field19` text,
  `tk_im06_field20` text,
  `tk_im06_field21` text,
  `tk_im06_field22` text,
  `tk_im06_field23` text,
  `tk_im06_field24` text,
  `tk_im06_field25` text,
  `tk_im06_field26` text,
  `tk_im06_field27` text,
  `tk_im06_field28` text,
  `tk_im06_lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`im06id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_kpi`
--

DROP TABLE IF EXISTS `tk_kpi`;
CREATE TABLE IF NOT EXISTS `tk_kpi` (
  `kpid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_kpi_user` text,
  `tk_kpi_type` text,
  `tk_kpi_kpi1` text,
  `tk_kpi_kpi2` text,
  `tk_kpi_kpi3` text,
  `tk_kpi_kpi4` text,
  `tk_kpi_kpi5` int(11) DEFAULT NULL,
  `tk_kpi_kpi6` int(11) DEFAULT NULL,
  `tk_kpi_create` text,
  `tk_kpi_lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tk_kpi_year` text,
  `tk_kpi_month` text,
  `tk_kpi_backup1` text,
  `tk_kpi_backup2` text,
  PRIMARY KEY (`kpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_log`
--

DROP TABLE IF EXISTS `tk_log`;
CREATE TABLE IF NOT EXISTS `tk_log` (
  `logid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_log_user` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_log_action` text NOT NULL,
  `tk_log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tk_log_type` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_log_class` tinyint(2) NOT NULL DEFAULT '0',
  `tk_log_description` varchar(60) NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=783 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_log`
--

INSERT INTO `tk_log` (`logid`, `tk_log_user`, `tk_log_action`, `tk_log_time`, `tk_log_type`, `tk_log_class`, `tk_log_description`) VALUES
(1, 2, '创建了任务', '2014-07-31 05:22:47', 1, 1, ''),
(2, 2, '创建了任务', '2014-07-31 05:24:13', 2, 1, ''),
(3, 1, '创建了任务', '2014-07-31 05:26:45', 3, 1, ''),
(4, 1, '创建了任务', '2014-07-31 05:27:40', 4, 1, ''),
(5, 2, '填写了 2014-07-28 日志，任务状态为：进行中，耗时：0小时&nbsp;&nbsp;', '2014-07-31 05:29:50', 2, 1, ''),
(6, 2, '填写了 2014-07-29 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;', '2014-07-31 05:30:08', 2, 1, ''),
(7, 2, '填写了 2014-07-30 日志，任务状态为：未开始，耗时：2.5小时&nbsp;&nbsp;', '2014-07-31 05:30:22', 2, 1, ''),
(8, 2, '修改了 2014-07-30 日志，任务状态为：进行中，耗时：2.5小时&nbsp;&nbsp;', '2014-07-31 05:30:36', 2, 1, ''),
(9, 2, '填写了 2014-07-31 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;<p>\r\n	主要干了神马事\r\n</p>\r\n<p>\r\n	完成了什么\r\n</p>', '2014-07-31 05:31:12', 2, 1, ''),
(10, 2, '创建了任务', '2014-07-31 05:36:10', 5, 1, ''),
(11, 2, '创建了文档', '2014-07-31 05:36:37', 1, 2, ''),
(12, 2, '创建了任务', '2014-07-31 05:41:45', 6, 1, ''),
(13, 1, '创建了任务', '2014-08-02 13:12:40', 7, 1, ''),
(14, 2, '填写了 2014-07-31 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;', '2014-08-02 13:18:00', 6, 1, ''),
(15, 2, '填写了 2014-07-31 日志，任务状态为：进行中，耗时：20小时&nbsp;&nbsp;', '2014-08-02 13:18:32', 1, 1, ''),
(16, 2, '创建了任务', '2014-08-13 04:28:54', 8, 1, ''),
(17, 2, '创建了任务', '2014-08-13 04:30:02', 9, 1, ''),
(18, 2, '创建了任务', '2014-08-13 04:30:44', 10, 1, ''),
(19, 3, '创建了任务', '2014-08-13 06:15:58', 11, 1, ''),
(20, 3, '创建了任务', '2014-08-13 06:17:41', 12, 1, ''),
(21, 3, '创建了任务', '2014-08-13 06:20:31', 13, 1, ''),
(22, 3, '编辑了任务', '2014-08-13 06:20:49', 13, 1, ''),
(23, 3, '创建了任务', '2014-08-13 06:26:39', 14, 1, ''),
(24, 1, '编辑了任务', '2014-08-13 06:28:52', 13, 1, ''),
(25, 3, '编辑了任务', '2014-08-13 06:29:05', 13, 1, ''),
(26, 3, '编辑了任务', '2014-08-13 06:29:25', 12, 1, ''),
(27, 3, '编辑了任务', '2014-08-13 06:29:52', 11, 1, ''),
(28, 2, '创建了任务', '2014-08-13 06:34:07', 15, 1, ''),
(29, 1, '创建了任务', '2014-08-13 06:45:13', 16, 1, ''),
(30, 1, '创建了任务', '2014-08-13 06:45:34', 17, 1, ''),
(31, 1, '编辑了任务', '2014-08-13 06:45:57', 16, 1, ''),
(32, 2, '创建了任务', '2014-08-13 06:48:08', 18, 1, ''),
(33, 2, '创建了任务', '2014-08-13 06:49:57', 19, 1, ''),
(34, 2, '创建了任务', '2014-08-13 06:51:01', 20, 1, ''),
(35, 4, '创建了任务', '2014-08-13 07:55:08', 21, 1, ''),
(36, 2, '填写了 2014-08-13 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;', '2014-08-14 07:04:14', 16, 1, ''),
(37, 2, '修改了 2014-08-13 日志，任务状态为：进行中80%，耗时：3.0小时&nbsp;&nbsp;', '2014-08-14 09:51:28', 16, 1, ''),
(38, 2, '填写了 2014-08-14 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;', '2014-08-14 09:52:28', 8, 1, ''),
(39, 2, '编辑了任务', '2014-08-14 09:53:20', 18, 1, ''),
(40, 1, '编辑了任务', '2014-08-14 09:54:14', 16, 1, ''),
(41, 1, '审核了任务，审核结果为：&nbsp;完成验收', '2014-08-14 09:58:49', 17, 1, ''),
(42, 3, '创建了任务', '2014-08-18 00:54:41', 22, 1, ''),
(43, 3, '编辑了任务', '2014-08-18 00:54:54', 22, 1, ''),
(44, 3, '编辑了任务', '2014-08-18 00:55:31', 14, 1, ''),
(45, 3, '填写了 2014-08-18 日志，任务状态为：完成100%，耗时：4小时&nbsp;&nbsp;', '2014-08-18 00:57:34', 15, 1, ''),
(46, 3, '填写了 2014-08-15 日志，任务状态为：完成100%，耗时：6小时&nbsp;&nbsp;进入修改阶段', '2014-08-18 00:58:15', 15, 1, ''),
(47, 3, '创建了任务', '2014-08-18 01:02:41', 23, 1, ''),
(48, 3, '创建了任务', '2014-08-18 01:04:50', 24, 1, ''),
(49, 3, '编辑了任务', '2014-08-18 01:05:35', 23, 1, ''),
(50, 3, '创建了任务', '2014-08-18 01:09:41', 25, 1, ''),
(51, 3, '编辑了任务', '2014-08-18 01:09:54', 25, 1, ''),
(52, 3, '编辑了任务', '2014-08-18 01:10:15', 13, 1, ''),
(53, 3, '填写了 2014-08-15 日志，任务状态为：进行中40%，耗时：3.5小时&nbsp;&nbsp;<p>\r\n	调整结构，学习浙江材料修改开发和运营模式\r\n</p>', '2014-08-18 01:14:58', 23, 1, ''),
(54, 3, '创建了任务', '2014-08-18 01:18:07', 26, 1, ''),
(55, 3, '编辑了任务', '2014-08-18 01:18:25', 26, 1, ''),
(56, 3, '填写了 2014-08-07 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;构建基本网（手绘）', '2014-08-18 01:19:09', 26, 1, ''),
(57, 3, '填写了 2014-08-07 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;构建基本网（手绘）', '2014-08-18 01:19:39', 26, 1, ''),
(58, 3, '编辑了任务', '2014-08-18 01:19:58', 26, 1, ''),
(59, 3, '填写了 2014-08-09 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;VBA学习', '2014-08-18 01:22:24', 26, 1, ''),
(60, 3, '填写了 2014-08-18 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;<p>\r\n	办公厅、运输管理部对接，待运输管理部领导反馈意见。有问题转往环境管理部的可能。\r\n</p>', '2014-08-18 07:38:52', 24, 1, ''),
(61, 3, '填写了 2014-08-18 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;<p>\r\n	准备西站上报函。\r\n</p>', '2014-08-18 07:40:14', 13, 1, ''),
(62, 3, '创建了任务', '2014-08-18 07:43:19', 27, 1, ''),
(63, 2, '创建了任务', '2014-08-18 09:51:39', 28, 1, ''),
(64, 2, '填写了 2014-08-18 日志，任务状态为：完成100%，耗时：4小时&nbsp;&nbsp;', '2014-08-18 09:51:56', 28, 1, ''),
(65, 3, '填写了 2014-08-18 日志，任务状态为：进行中80%，耗时：6.5小时&nbsp;&nbsp;<p>\r\n	发展模式、运营模式、盈利模式\r\n</p>', '2014-08-19 00:01:22', 23, 1, ''),
(66, 3, '修改了 2014-08-18 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;<p>\r\n	准备西站上报函。\r\n</p>\r\n<p>\r\n	协调项目组进度。\r\n</p>', '2014-08-19 00:02:26', 13, 1, ''),
(67, 3, '填写了 2014-08-19 日志，任务状态为：完成100%，耗时：2小时&nbsp;&nbsp;<p>\r\n	补充内容、文整\r\n</p>', '2014-08-19 02:33:15', 23, 1, ''),
(68, 9, '填写了 2014-08-18 日志，任务状态为：未开始，耗时：0小时&nbsp;&nbsp;<p>\r\n	各功能区工可研读，找相应投资估算\r\n</p>', '2014-08-19 03:08:03', 12, 1, ''),
(69, 9, '修改了 2014-08-18 日志，任务状态为：进行中40%，耗时：3.0小时&nbsp;&nbsp;<p>\r\n	各功能区工可研读，找相应投资估算\r\n</p>', '2014-08-19 03:08:35', 12, 1, ''),
(70, 9, '修改了 2014-08-18 日志，任务状态为：进行中40%，耗时：4小时&nbsp;&nbsp;<p>\r\n	各功能区工可研读，找相应投资估算\r\n</p>', '2014-08-19 03:08:48', 12, 1, ''),
(71, 9, '填写了 2014-08-19 日志，任务状态为：进行中20%，耗时：1小时&nbsp;&nbsp;解读重庆市综合运输枢纽体系研究编制要点与任务分工，提供调研所需资料', '2014-08-19 03:11:07', 12, 1, ''),
(72, 3, '填写了 2014-08-19 日志，任务状态为：进行中40%，耗时：1小时&nbsp;&nbsp;西站各部分内容协调，编写重点指引', '2014-08-19 05:37:17', 13, 1, ''),
(73, 3, '填写了 2014-08-19 日志，任务状态为：进行中80%，耗时：6小时&nbsp;&nbsp;收集材料，整理思路', '2014-08-20 00:26:16', 25, 1, ''),
(74, 3, '填写了 2014-08-20 日志，任务状态为：计划，耗时：1.5小时&nbsp;&nbsp;完成申请报告', '2014-08-20 00:26:57', 25, 1, ''),
(75, 3, '填写了 2014-08-20 日志，任务状态为：计划，耗时：8小时&nbsp;&nbsp;<p>\r\n	1、对接西站财务审计报告/主要财务报表；\r\n</p>\r\n<p>\r\n	2、布局方案、必要性、市政部分、选址部分；\r\n</p>', '2014-08-20 00:33:31', 13, 1, ''),
(76, 2, '创建了任务', '2014-08-21 04:59:37', 29, 1, ''),
(77, 2, '填写了 2014-08-20 日志，任务状态为：进行中，耗时：12小时&nbsp;&nbsp;', '2014-08-21 05:00:01', 29, 1, ''),
(78, 3, '填写了 2014-08-20 日志，任务状态为：完成100%，耗时：1.5小时&nbsp;&nbsp;讨论方案，修改', '2014-08-21 09:28:03', 14, 1, ''),
(79, 3, '修改了 2014-08-20 日志，任务状态为：进行中40%，耗时：2.5小时&nbsp;&nbsp;<p>\r\n	1、对接西站财务审计报告/主要财务报表；\r\n</p>\r\n<p>\r\n	2、协调分工，内容培训\r\n</p>', '2014-08-21 09:29:05', 13, 1, ''),
(80, 3, '修改了 2014-08-20 日志，任务状态为：进行中80%，耗时：4.5小时&nbsp;&nbsp;<p>\r\n	阅读资料\r\n</p>\r\n<p>\r\n	编写申请报告\r\n</p>', '2014-08-21 09:29:46', 25, 1, ''),
(81, 3, '填写了 2014-08-21 日志，任务状态为：完成100%，耗时：1.5小时&nbsp;&nbsp;提交初稿', '2014-08-21 09:29:57', 25, 1, ''),
(82, 3, '修改了 2014-08-20 日志，任务状态为：进行中80%，耗时：5.5小时&nbsp;&nbsp;<p>\r\n	阅读资料\r\n</p>\r\n<p>\r\n	编写申请报告\r\n</p>', '2014-08-21 09:30:59', 25, 1, ''),
(83, 3, '填写了 2014-08-21 日志，任务状态为：进行中60%，耗时：5小时&nbsp;&nbsp;<p>\r\n	总论修改、必要性修改、总平面修改\r\n</p>\r\n<p>\r\n	协助相关部分开展\r\n</p>', '2014-08-21 09:33:54', 13, 1, ''),
(84, 2, '填写了 2014-08-21 日志，任务状态为：进行中，耗时：12小时&nbsp;&nbsp;', '2014-08-22 01:24:13', 29, 1, ''),
(85, 2, '创建了任务', '2014-08-22 01:26:06', 30, 1, ''),
(86, 2, '填写了 2014-08-22 日志，任务状态为：完成100%，耗时：0.5小时&nbsp;&nbsp;', '2014-08-22 02:17:40', 30, 1, ''),
(87, 2, '修改了 2014-08-13 日志，任务状态为：完成100%，耗时：3.0小时&nbsp;&nbsp;', '2014-08-22 02:18:34', 16, 1, ''),
(88, 2, '审核了任务，审核结果为：&nbsp;完成验收', '2014-08-22 02:18:40', 16, 1, ''),
(89, 2, '审核了任务，审核结果为：&nbsp;完成验收', '2014-08-22 02:19:30', 30, 1, ''),
(90, 3, '创建了任务', '2014-08-22 05:59:33', 31, 1, ''),
(91, 4, '创建了任务', '2014-08-23 11:43:17', 32, 1, ''),
(92, 4, '创建了任务', '2014-08-23 11:46:22', 33, 1, ''),
(93, 4, '创建了任务', '2014-08-23 11:47:11', 34, 1, ''),
(94, 4, '创建了任务', '2014-08-23 11:52:00', 35, 1, ''),
(95, 4, '创建了任务', '2014-08-23 11:53:03', 36, 1, ''),
(96, 4, '创建了任务', '2014-08-23 11:55:37', 37, 1, ''),
(97, 4, '创建了任务', '2014-08-23 11:56:35', 38, 1, ''),
(98, 4, '创建了任务', '2014-08-23 11:58:47', 39, 1, ''),
(99, 4, '编辑了任务', '2014-08-23 11:59:00', 39, 1, ''),
(100, 4, '编辑了任务', '2014-08-24 04:42:55', 32, 1, ''),
(101, 4, '创建了任务', '2014-08-24 04:45:02', 40, 1, ''),
(102, 4, '创建了任务', '2014-08-24 04:47:49', 41, 1, ''),
(103, 4, '创建了任务', '2014-08-24 12:47:38', 42, 1, ''),
(104, 4, '创建了任务', '2014-08-24 12:49:27', 43, 1, ''),
(105, 1, '创建了任务', '2014-08-25 00:23:06', 44, 1, ''),
(106, 2, '填写了 2014-08-25 日志，任务状态为：进行中，耗时：12小时&nbsp;&nbsp;', '2014-08-25 00:25:14', 44, 1, ''),
(107, 2, '填写了 2014-08-26 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;', '2014-08-25 00:25:24', 44, 1, ''),
(108, 2, '审核了任务，审核结果为：&nbsp;完成验收', '2014-08-25 00:25:37', 44, 1, ''),
(109, 2, '填写了 2014-08-22 日志，任务状态为：进行中，耗时：14小时&nbsp;&nbsp;', '2014-08-25 00:26:34', 29, 1, ''),
(110, 2, '填写了 2014-08-24 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;', '2014-08-25 00:26:50', 29, 1, ''),
(111, 2, '修改了 2014-08-26 日志，任务状态为：完成100%，耗时：5小时&nbsp;&nbsp;', '2014-08-25 00:29:05', 44, 1, ''),
(112, 3, '填写了 2014-08-23 日志，任务状态为：完成100%，耗时：10.5小时&nbsp;&nbsp;', '2014-08-25 05:17:01', 31, 1, ''),
(113, 3, '填写了 2014-08-22 日志，任务状态为：进行中20%，耗时：1.5小时&nbsp;&nbsp;', '2014-08-25 05:17:12', 31, 1, ''),
(114, 3, '填写了 2014-08-22 日志，任务状态为：进行中80%，耗时：5小时&nbsp;&nbsp;', '2014-08-25 05:18:10', 13, 1, ''),
(115, 3, '填写了 2014-08-24 日志，任务状态为：进行中80%，耗时：10.5小时&nbsp;&nbsp;', '2014-08-25 05:18:27', 13, 1, ''),
(116, 3, '修改了 2014-08-24 日志，任务状态为：进行中80%，耗时：8小时&nbsp;&nbsp;', '2014-08-25 05:18:50', 13, 1, ''),
(117, 3, '修改了 2014-08-24 日志，任务状态为：进行中80%，耗时：4小时&nbsp;&nbsp;资金申请', '2014-08-25 05:19:16', 13, 1, ''),
(118, 3, '修改了 2014-08-24 日志，任务状态为：进行中80%，耗时：10.5小时&nbsp;&nbsp;工可及资金申请', '2014-08-25 05:19:32', 13, 1, ''),
(119, 3, '填写了 2014-08-25 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;<p>\r\n	资金生情初稿，打印；\r\n</p>\r\n<p>\r\n	工可初稿形成开始修改\r\n</p>', '2014-08-25 05:20:08', 13, 1, ''),
(120, 3, '修改了 2014-08-25 日志，任务状态为：完成100%，耗时：3.0小时&nbsp;&nbsp;<p>\r\n	资金申请初稿，打印；\r\n</p>\r\n<p>\r\n	工可初稿形成开始修改\r\n</p>', '2014-08-25 05:20:20', 13, 1, ''),
(121, 3, '修改了 2014-08-23 日志，任务状态为：完成100%，耗时：10.5小时&nbsp;&nbsp;', '2014-08-25 05:28:39', 31, 1, ''),
(122, 3, '审核了任务，审核结果为：&nbsp;完成验收 ，审核意见：同意初稿，抓紧修改，提交二三审。', '2014-08-25 05:31:03', 13, 1, ''),
(123, 3, '创建了任务', '2014-08-25 05:32:13', 45, 1, ''),
(124, 9, '创建了任务', '2014-08-25 08:33:12', 46, 1, ''),
(125, 9, '填写了 2014-08-19 日志，任务状态为：完成100%，耗时：2小时&nbsp;&nbsp;', '2014-08-25 08:33:33', 46, 1, ''),
(126, 9, '修改了 2014-08-19 日志，任务状态为：完成100%，耗时：2小时&nbsp;&nbsp;研读调研提纲，提供相关部分调研资料名单', '2014-08-25 08:34:26', 46, 1, ''),
(127, 9, '填写了 2014-08-25 日志，任务状态为：未开始，耗时：3小时&nbsp;&nbsp;研读调研总结、编写提纲', '2014-08-25 08:35:09', 46, 1, ''),
(128, 9, '修改了 2014-08-25 日志，任务状态为：完成100%，耗时：3.0小时&nbsp;&nbsp;研读调研总结、编写提纲', '2014-08-25 08:35:18', 46, 1, ''),
(129, 9, '修改了 2014-08-25 日志，任务状态为：完成100%，耗时：5小时&nbsp;&nbsp;研读调研总结、编写提纲。参加编写提纲讨论会', '2014-08-25 08:35:50', 46, 1, ''),
(130, 9, '修改了 2014-08-19 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;研读调研提纲，提供相关部分调研资料名单', '2014-08-25 08:43:45', 46, 1, ''),
(131, 9, '修改了 2014-08-25 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;研读调研总结、编写提纲。参加编写提纲讨论会', '2014-08-25 08:43:53', 46, 1, ''),
(132, 3, '填写了 2014-08-25 日志，任务状态为：进行中20%，耗时：3小时&nbsp;&nbsp;<p>\r\n	&nbsp;\r\n</p>', '2014-08-26 05:38:56', 45, 1, ''),
(133, 3, '填写了 2014-08-26 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;<p>\r\n	联系环保部，初步敲定时间，对接资料\r\n</p>', '2014-08-26 05:39:44', 24, 1, ''),
(134, 3, '填写了 2014-08-26 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;<p>\r\n	向甲方反馈工作情况\r\n</p>', '2014-08-26 05:40:50', 27, 1, ''),
(135, 3, '填写了 2014-08-26 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;<p>\r\n	对接方案变化（张主任）\r\n</p>\r\n<p>\r\n	申报项目表（阎）\r\n</p>', '2014-08-26 05:41:52', 45, 1, ''),
(136, 3, '填写了 2014-08-26 日志，任务状态为：完成100%，耗时：1.5小时&nbsp;&nbsp;修改完善', '2014-08-26 07:11:51', 25, 1, ''),
(137, 2, '填写了 2014-08-25 日志，任务状态为：完成100%，耗时：15小时&nbsp;&nbsp;', '2014-08-27 02:25:17', 29, 1, ''),
(138, 2, '填写了 2014-08-26 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;', '2014-08-27 02:25:54', 8, 1, ''),
(139, 2, '审核了任务，审核结果为：&nbsp;完成验收', '2014-08-27 02:27:50', 31, 1, ''),
(140, 2, '审核了任务，审核结果为：&nbsp;完成验收', '2014-08-27 02:28:04', 44, 1, ''),
(141, 2, '审核了任务，审核结果为：&nbsp;完成验收', '2014-08-27 02:28:17', 29, 1, ''),
(142, 4, '创建了任务', '2014-08-27 02:41:56', 47, 1, ''),
(143, 4, '创建了任务', '2014-08-27 02:42:46', 48, 1, ''),
(144, 4, '创建了任务', '2014-08-27 02:44:55', 49, 1, ''),
(145, 4, '创建了任务', '2014-08-27 02:46:13', 50, 1, ''),
(146, 4, '创建了任务', '2014-08-27 02:47:09', 51, 1, ''),
(147, 4, '创建了任务', '2014-08-27 02:48:36', 52, 1, ''),
(148, 12, '创建了任务', '2014-08-27 06:00:32', 53, 1, ''),
(149, 3, '填写了 2014-08-27 日志，任务状态为：进行中80%，耗时：6小时&nbsp;&nbsp;<p>\r\n	完成面上修改稿提交二三审\r\n</p>', '2014-08-28 01:14:02', 45, 1, ''),
(150, 3, '创建了任务', '2014-08-28 01:16:03', 54, 1, ''),
(151, 3, '创建了任务', '2014-08-28 01:18:07', 55, 1, ''),
(152, 3, '填写了 2014-08-27 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;确定调研时间为下周上午九点', '2014-08-28 06:34:38', 24, 1, ''),
(153, 4, '编辑了任务', '2014-08-28 12:23:22', 52, 1, ''),
(154, 4, '编辑了任务', '2014-08-28 12:23:34', 52, 1, ''),
(155, 4, '编辑了任务', '2014-08-28 12:23:59', 51, 1, ''),
(156, 4, '编辑了任务', '2014-08-28 12:24:43', 34, 1, ''),
(157, 4, '编辑了任务', '2014-08-28 12:25:42', 41, 1, ''),
(158, 4, '编辑了任务', '2014-08-28 12:25:54', 41, 1, ''),
(159, 4, '编辑了任务', '2014-08-28 12:26:06', 41, 1, ''),
(160, 4, '编辑了任务', '2014-08-28 12:26:41', 48, 1, ''),
(161, 4, '创建了任务', '2014-08-28 12:28:34', 56, 1, ''),
(162, 4, '创建了任务', '2014-08-28 12:29:59', 57, 1, ''),
(163, 4, '创建了任务', '2014-08-28 12:33:45', 58, 1, ''),
(164, 4, '编辑了任务', '2014-08-28 12:34:20', 58, 1, ''),
(165, 4, '编辑了任务', '2014-08-28 12:35:01', 21, 1, ''),
(166, 4, '创建了任务', '2014-08-28 12:35:43', 59, 1, ''),
(167, 4, '创建了任务', '2014-08-28 12:37:38', 60, 1, ''),
(168, 4, '创建了任务', '2014-08-28 12:46:04', 61, 1, ''),
(169, 4, '编辑了任务', '2014-08-28 12:47:08', 51, 1, ''),
(170, 4, '创建了任务', '2014-08-28 12:48:24', 62, 1, ''),
(171, 4, '创建了任务', '2014-08-29 03:24:32', 63, 1, ''),
(172, 1, '创建了任务', '2014-08-29 03:27:23', 64, 1, ''),
(173, 2, '填写了 2014-08-29 日志，任务状态为：进行中60%，耗时：6小时&nbsp;&nbsp;', '2014-08-29 03:28:09', 64, 1, ''),
(174, 4, '填写了 2014-08-30 日志，任务状态为：完成100%，耗时：1小时&nbsp;&nbsp;', '2014-08-30 15:33:20', 62, 1, ''),
(175, 4, '填写了 2014-08-30 日志，任务状态为：完成100%，耗时：3.5小时&nbsp;&nbsp;', '2014-08-30 15:33:52', 51, 1, ''),
(176, 7, '填写了 2014-09-01 日志，任务状态为：计划，耗时：0小时&nbsp;&nbsp;<p>\r\n	上周计划与两位委员陈宇毅和刘晨进行商定，但是由于均有会，时间上有些问题，周二之前完成商议，按计划周五进行！\r\n</p>', '2014-09-01 02:33:06', 63, 1, ''),
(177, 7, '创建了任务', '2014-09-01 02:36:56', 65, 1, ''),
(178, 7, '编辑了任务', '2014-09-01 02:37:12', 65, 1, ''),
(179, 3, '填写了 2014-08-28 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;工可修改', '2014-09-01 02:58:29', 45, 1, ''),
(180, 3, '填写了 2014-08-29 日志，任务状态为：完成100%，耗时：0小时&nbsp;&nbsp;修改申请书，检查，出版，签章，请鹏程带给顾主任', '2014-09-01 02:59:23', 55, 1, ''),
(181, 3, '修改了 2014-08-29 日志，任务状态为：完成100%，耗时：1小时&nbsp;&nbsp;修改申请书，检查，出版，签章，请鹏程带给顾主任', '2014-09-01 02:59:31', 55, 1, ''),
(182, 3, '填写了 2014-08-29 日志，任务状态为：未开始，耗时：4.5小时&nbsp;&nbsp;修改报告，添加规划选址理论内容', '2014-09-01 03:00:44', 45, 1, ''),
(183, 3, '修改了 2014-08-29 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;修改报告，添加规划选址理论内容', '2014-09-01 03:00:54', 45, 1, ''),
(184, 3, '修改了 2014-08-28 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;工可修改，工作流线设计、相关标准更新', '2014-09-01 03:01:22', 45, 1, ''),
(185, 3, '填写了 2014-08-29 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;<p>\r\n	答复提案与建议\r\n</p>', '2014-09-01 03:02:47', 54, 1, ''),
(186, 3, '填写了 2014-08-30 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;<p>\r\n	答复提案与建议\r\n</p>', '2014-09-01 03:02:58', 54, 1, ''),
(187, 7, '编辑了任务', '2014-09-01 05:31:26', 65, 1, ''),
(188, 7, '编辑了任务', '2014-09-01 05:39:36', 65, 1, ''),
(189, 7, '编辑了任务', '2014-09-01 05:40:03', 65, 1, ''),
(190, 7, '填写了 2014-09-01 日志，任务状态为：完成100%，耗时：5小时&nbsp;&nbsp;<p>\r\n	<a href="project_view.php?recordID=30">长江经济带湖北省综合交通运输体系规划</a><a href="default_task_edit.php?pagetab=alltask&amp;editID=65">通道及线网布局规划思路</a>\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>', '2014-09-01 05:41:50', 65, 1, ''),
(191, 4, '填写了 2014-09-01 日志，任务状态为：完成100%，耗时：5小时&nbsp;&nbsp;', '2014-09-01 08:14:58', 61, 1, ''),
(192, 4, '填写了 2014-09-01 日志，任务状态为：完成100%，耗时：1小时&nbsp;&nbsp;与刘所进行了沟通，烦请所里与水运所进行了沟通', '2014-09-01 08:20:25', 58, 1, ''),
(193, 4, '填写了 2014-09-01 日志，任务状态为：进行中60%，耗时：3小时&nbsp;&nbsp;', '2014-09-01 08:21:45', 60, 1, ''),
(194, 7, '创建了任务', '2014-09-01 08:22:06', 66, 1, ''),
(195, 4, '填写了 2014-09-01 日志，任务状态为：进行中20%，耗时：2小时&nbsp;&nbsp;', '2014-09-01 08:22:08', 56, 1, ''),
(196, 7, '填写了 2014-09-01 日志，任务状态为：完成100%，耗时：2小时&nbsp;&nbsp;重庆综合交通运输体系“十三五”发展规划工作大纲第三轮修改', '2014-09-01 08:22:59', 66, 1, ''),
(197, 7, '创建了任务', '2014-09-01 08:25:27', 67, 1, ''),
(198, 7, '填写了 2014-09-01 日志，任务状态为：完成100%，耗时：0.5小时&nbsp;&nbsp;“十三五”综合运输战略重点及对策研究中间成果咨询专家意见汇总', '2014-09-01 08:25:48', 67, 1, ''),
(199, 4, '创建了任务', '2014-09-01 08:29:13', 68, 1, ''),
(200, 4, '编辑了任务', '2014-09-01 09:04:14', 21, 1, ''),
(201, 3, '填写了 2014-09-01 日志，任务状态为：完成100%，耗时：2小时&nbsp;&nbsp;资金申请修改', '2014-09-02 06:44:02', 10, 1, ''),
(202, 3, '修改了 2014-09-01 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;<p>\r\n	&nbsp;\r\n</p>', '2014-09-02 06:44:29', 10, 1, ''),
(203, 3, '填写了 2014-09-01 日志，任务状态为：完成100%，耗时：6小时&nbsp;&nbsp;<p>\r\n	完成修改第一稿，包括资金申请修改\r\n</p>', '2014-09-02 06:45:27', 45, 1, ''),
(204, 3, '修改了 2014-09-01 日志，任务状态为：完成100%，耗时：6小时&nbsp;&nbsp;<p>\r\n	完成修改第一稿，包括资金申请修改\r\n</p>\r\n<p>\r\n	对接签章材料\r\n</p>', '2014-09-02 06:45:52', 45, 1, ''),
(205, 3, '填写了 2014-09-01 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;准备调研材料', '2014-09-02 06:46:51', 24, 1, ''),
(206, 3, '填写了 2014-09-02 日志，任务状态为：完成100%，耗时：3.5小时&nbsp;&nbsp;<p>\r\n	神华集团环保部调研\r\n</p>', '2014-09-02 06:47:16', 24, 1, ''),
(207, 3, '修改了 2014-09-01 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;<p>\r\n	整理相关附件\r\n</p>', '2014-09-02 06:49:03', 10, 1, ''),
(208, 3, '填写了 2014-09-02 日志，任务状态为：计划，耗时：0小时&nbsp;&nbsp;<p>\r\n	对接照片、土地证、财务报表、签章等需求\r\n</p>\r\n<p>\r\n	资金申请报告文字部分\r\n</p>', '2014-09-02 06:49:59', 10, 1, ''),
(209, 7, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-02 10:00:26', 66, 1, ''),
(210, 7, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-02 10:00:42', 67, 1, ''),
(211, 7, '创建了任务', '2014-09-02 10:03:09', 69, 1, ''),
(212, 7, '填写了 2014-09-02 日志，任务状态为：完成100%，耗时：1小时&nbsp;&nbsp;重庆市综合交通运输“十三五”发展规划研究工作大纲内部讨论会', '2014-09-02 10:04:07', 69, 1, ''),
(213, 7, '创建了任务', '2014-09-02 10:10:26', 70, 1, ''),
(214, 7, '创建了任务', '2014-09-02 10:13:05', 71, 1, ''),
(215, 7, '填写了 2014-09-02 日志，任务状态为：进行中20%，耗时：3小时&nbsp;&nbsp;', '2014-09-02 10:13:14', 71, 1, ''),
(216, 7, '编辑了任务', '2014-09-03 02:39:56', 71, 1, ''),
(217, 7, '创建了文档', '2014-09-03 02:44:53', 1, 2, ''),
(218, 7, '创建了任务', '2014-09-03 05:45:49', 72, 1, ''),
(219, 7, '编辑了任务', '2014-09-03 05:46:30', 72, 1, ''),
(220, 7, '编辑了任务', '2014-09-03 05:47:09', 66, 1, ''),
(221, 7, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-03 08:48:48', 66, 1, ''),
(222, 7, '创建了任务', '2014-09-03 08:51:59', 73, 1, ''),
(223, 7, '填写了 2014-09-03 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;', '2014-09-03 08:52:14', 73, 1, ''),
(224, 7, '填写了 2014-09-03 日志，任务状态为：进行中20%，耗时：2小时&nbsp;&nbsp;', '2014-09-03 08:52:44', 71, 1, ''),
(225, 7, '创建了任务', '2014-09-04 02:16:53', 74, 1, ''),
(226, 7, '填写了 2014-09-04 日志，任务状态为：进行中80%，耗时：2小时&nbsp;&nbsp;', '2014-09-04 02:17:25', 74, 1, ''),
(227, 7, '编辑了任务', '2014-09-04 02:19:54', 72, 1, ''),
(228, 7, '编辑了任务', '2014-09-04 05:42:41', 74, 1, ''),
(229, 7, '修改了 2014-09-04 日志，任务状态为：完成100%，耗时：4小时&nbsp;&nbsp;', '2014-09-04 05:42:53', 74, 1, ''),
(230, 7, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-04 08:05:26', 74, 1, ''),
(231, 11, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-04 08:07:04', 24, 1, ''),
(232, 3, '创建了任务', '2014-09-05 01:07:57', 75, 1, ''),
(233, 3, '修改了 2014-09-02 日志，任务状态为：进行中，耗时：3.0小时&nbsp;&nbsp;<p>\r\n	对接照片、土地证、财务报表、签章等需求\r\n</p>\r\n<p>\r\n	资金申请报告文字部分\r\n</p>', '2014-09-05 01:08:48', 10, 1, ''),
(234, 3, '填写了 2014-09-03 日志，任务状态为：进行中60%，耗时：3小时&nbsp;&nbsp;资金申请，对接资料，完善文本', '2014-09-05 01:09:15', 10, 1, ''),
(235, 3, '填写了 2014-09-04 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;完成报告编制，文整工作', '2014-09-05 01:09:51', 10, 1, ''),
(236, 3, '修改了 2014-09-04 日志，任务状态为：完成100%，耗时：3.0小时&nbsp;&nbsp;完成报告编制初稿，文整工作，提交二审', '2014-09-05 01:10:23', 10, 1, ''),
(237, 3, '填写了 2014-09-02 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;<br />', '2014-09-05 01:20:10', 75, 1, ''),
(238, 3, '填写了 2014-09-03 日志，任务状态为：进行中40%，耗时：3小时&nbsp;&nbsp;结合甲方反馈意见以及更名要求更新工可报告', '2014-09-05 01:20:47', 75, 1, ''),
(239, 3, '填写了 2014-09-04 日志，任务状态为：进行中60%，耗时：3.5小时&nbsp;&nbsp;根据甲方意见修改报告，完成更名报告的修改（包括工可报告）', '2014-09-05 01:37:43', 75, 1, ''),
(240, 3, '创建了任务', '2014-09-05 01:39:06', 76, 1, ''),
(241, 3, '填写了 2014-09-03 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;修改大纲编写及项目讨论会', '2014-09-05 01:39:56', 76, 1, ''),
(242, 3, '创建了任务', '2014-09-05 01:41:27', 77, 1, ''),
(243, 3, '填写了 2014-09-02 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;<br />', '2014-09-05 01:41:44', 77, 1, ''),
(244, 7, '编辑了任务', '2014-09-05 02:19:23', 72, 1, ''),
(245, 7, '填写了 2014-09-04 日志，任务状态为：进行中60%，耗时：4小时&nbsp;&nbsp;晚上加班3小时。', '2014-09-05 02:20:00', 72, 1, ''),
(246, 7, '修改了 2014-09-04 日志，任务状态为：进行中60%，耗时：7小时&nbsp;&nbsp;其中加班3小时。', '2014-09-05 02:31:28', 72, 1, ''),
(247, 4, '填写了 2014-09-03 日志，任务状态为：进行中20%，耗时：3小时&nbsp;&nbsp;可以放素材', '2014-09-05 05:21:06', 21, 1, ''),
(248, 4, '填写了 2014-09-04 日志，任务状态为：未开始，耗时：2小时&nbsp;&nbsp;继续放素材', '2014-09-05 05:21:23', 21, 1, ''),
(249, 4, '修改了 2014-09-04 日志，任务状态为：进行中40%，耗时：2小时&nbsp;&nbsp;继续放素材', '2014-09-05 05:22:01', 21, 1, ''),
(250, 4, '填写了 2014-09-02 日志，任务状态为：进行中60%，耗时：3.5小时&nbsp;&nbsp;继续梳理材料', '2014-09-05 05:22:57', 60, 1, ''),
(251, 4, '填写了 2014-09-03 日志，任务状态为：进行中60%，耗时：2.5小时&nbsp;&nbsp;材料的梳理', '2014-09-05 05:23:23', 60, 1, ''),
(252, 4, '填写了 2014-09-05 日志，任务状态为：进行中80%，耗时：6小时&nbsp;&nbsp;材料梳理基本完成', '2014-09-05 05:24:31', 60, 1, ''),
(253, 4, '编辑了任务', '2014-09-05 05:25:21', 60, 1, ''),
(254, 4, '填写了 2014-09-04 日志，任务状态为：进行中20%，耗时：3小时&nbsp;&nbsp;初步梳理了头绪', '2014-09-05 05:26:18', 56, 1, ''),
(255, 7, '填写了 2014-09-05 日志，任务状态为：进行中60%，耗时：4.5小时&nbsp;&nbsp;<p>\r\n	文字工作告一段落，等重庆交委补充工作小组和专家小组名单！\r\n</p>\r\n<p>\r\n	后续开展ppt的更新和修改工作\r\n</p>', '2014-09-05 06:57:28', 72, 1, ''),
(256, 7, '填写了 2014-09-08 日志，任务状态为：进行中80%，耗时：5小时&nbsp;&nbsp;更改PPT及相关内容~', '2014-09-09 00:44:35', 72, 1, ''),
(257, 10, '创建了任务', '2014-09-10 03:17:07', 78, 1, ''),
(258, 10, '创建了任务', '2014-09-10 03:19:01', 79, 1, ''),
(259, 10, '创建了任务', '2014-09-10 03:26:21', 80, 1, ''),
(260, 10, '创建了任务', '2014-09-10 03:32:59', 81, 1, ''),
(261, 10, '创建了任务', '2014-09-10 03:34:40', 82, 1, ''),
(262, 10, '创建了任务', '2014-09-10 03:38:30', 83, 1, ''),
(263, 10, '编辑了任务', '2014-09-10 03:41:16', 83, 1, ''),
(264, 10, '编辑了任务', '2014-09-10 03:41:41', 83, 1, ''),
(265, 10, '编辑了任务', '2014-09-10 03:42:30', 83, 1, ''),
(266, 10, '编辑了任务', '2014-09-10 03:43:28', 65, 1, ''),
(267, 10, '创建了任务', '2014-09-10 03:53:15', 84, 1, ''),
(268, 3, '填写了 2014-09-05 日志，任务状态为：完成100%，耗时：5小时&nbsp;&nbsp;完成资金申请报告的对应修改，与甲方协调相关批复和照片事宜', '2014-09-10 07:45:55', 75, 1, ''),
(269, 3, '修改了 2014-09-05 日志，任务状态为：进行中80%，耗时：5小时&nbsp;&nbsp;完成资金申请报告的对应修改，与甲方协调相关批复和照片事宜', '2014-09-10 07:47:34', 75, 1, ''),
(270, 3, '填写了 2014-09-09 日志，任务状态为：进行中80%，耗时：1小时&nbsp;&nbsp;与无锡市发改委，甲方对接批复时间内容，待市发改委与各部门沟通后出具批复', '2014-09-10 07:48:33', 75, 1, ''),
(271, 3, '编辑了任务', '2014-09-10 07:49:07', 75, 1, ''),
(272, 3, '编辑了任务', '2014-09-10 07:49:23', 75, 1, ''),
(273, 3, '创建了任务', '2014-09-10 07:51:38', 85, 1, ''),
(274, 3, '编辑了任务', '2014-09-10 07:54:24', 27, 1, ''),
(275, 3, '填写了 2014-09-09 日志，任务状态为：进行中60%，耗时：4.5小时&nbsp;&nbsp;整理美国中西部地区地形变化区域城镇发展史，暂定盐湖城盐湖城、丹佛、夏延具备借鉴的条件。但存在矿业城市影响的可能。', '2014-09-10 08:01:12', 27, 1, ''),
(276, 3, '填写了 2014-09-10 日志，任务状态为：未开始，耗时：3.5小时&nbsp;&nbsp;学习菲尼克斯经验，认为相对于政策型、矿产型，铁路型和牛镇更接近于米兰镇条件。更新大纲基本完成，准备细化编写大纲梳理观点', '2014-09-10 08:02:52', 27, 1, ''),
(277, 3, '修改了 2014-09-10 日志，任务状态为：进行中80%，耗时：3.5小时&nbsp;&nbsp;学习菲尼克斯经验，认为相对于政策型、矿产型，铁路型和牛镇更接近于米兰镇条件。更新大纲基本完成，准备细化编写大纲梳理观点', '2014-09-10 08:03:01', 27, 1, ''),
(278, 4, '编辑了任务', '2014-09-10 11:53:24', 56, 1, ''),
(279, 4, '填写了 2014-09-10 日志，任务状态为：进行中60%，耗时：1.5小时&nbsp;&nbsp;根据新的控规，做相关的更新', '2014-09-10 11:54:10', 56, 1, ''),
(280, 4, '编辑了任务', '2014-09-10 11:54:48', 21, 1, ''),
(281, 4, '填写了 2014-09-09 日志，任务状态为：进行中60%，耗时：2小时&nbsp;&nbsp;根据陈总的意见进行修改', '2014-09-10 11:55:17', 21, 1, ''),
(282, 4, '填写了 2014-09-10 日志，任务状态为：进行中80%，耗时：2小时&nbsp;&nbsp;添加更新内容', '2014-09-10 11:55:38', 21, 1, ''),
(283, 4, '填写了 2014-09-10 日志，任务状态为：进行中60%，耗时：1小时&nbsp;&nbsp;根据最新反馈的意见，进行适当的补充', '2014-09-10 11:56:28', 60, 1, ''),
(284, 4, '修改了 2014-09-10 日志，任务状态为：进行中80%，耗时：1小时&nbsp;&nbsp;根据最新反馈的意见，进行适当的补充', '2014-09-10 11:56:46', 60, 1, ''),
(285, 4, '编辑了任务', '2014-09-10 11:59:19', 61, 1, ''),
(286, 4, '填写了 2014-09-10 日志，任务状态为：进行中20%，耗时：2.5小时&nbsp;&nbsp;<p>\r\n	1、对区域比较分析拟定初步工作思路，抓交给刘影\r\n</p>\r\n<p>\r\n	2、排定大体的工作时间表\r\n</p>\r\n<p>\r\n	3、初步思考大纲的细化\r\n</p>', '2014-09-10 12:00:14', 61, 1, ''),
(287, 4, '填写了 2014-09-10 日志，任务状态为：进行中60%，耗时：0小时&nbsp;&nbsp;添加国际形势的判断以及外贸、煤炭和钢铁今年以来的月度变动情况', '2014-09-10 12:01:17', 38, 1, ''),
(288, 4, '修改了 2014-09-10 日志，任务状态为：进行中40%，耗时：2.5小时&nbsp;&nbsp;添加国际形势的判断以及外贸、煤炭和钢铁今年以来的月度变动情况', '2014-09-10 12:01:29', 38, 1, ''),
(289, 4, '填写了 2014-09-11 日志，任务状态为：进行中80%，耗时：1.5小时&nbsp;&nbsp;补充完成后，提交给胡总', '2014-09-10 12:04:59', 38, 1, ''),
(290, 4, '填写了 2014-09-11 日志，任务状态为：进行中40%，耗时：2小时&nbsp;&nbsp;<p>\r\n	进一步细化初稿，提交给李伟主任；\r\n</p>\r\n<p>\r\n	提炼出调研需求\r\n</p>', '2014-09-10 12:05:41', 61, 1, ''),
(291, 4, '填写了 2014-09-11 日志，任务状态为：进行中80%，耗时：3小时&nbsp;&nbsp;大体完成，并做到心里有数', '2014-09-10 12:06:20', 21, 1, ''),
(292, 7, '填写了 2014-09-10 日志，任务状态为：未开始，耗时：7小时&nbsp;&nbsp;稿子和ppt的修改，其中晚上加班2.5小时', '2014-09-10 12:06:55', 72, 1, ''),
(293, 7, '修改了 2014-09-10 日志，任务状态为：进行中80%，耗时：7小时&nbsp;&nbsp;稿子和ppt的修改，其中晚上加班2.5小时', '2014-09-10 12:07:07', 72, 1, ''),
(294, 7, '填写了 2014-09-09 日志，任务状态为：未开始，耗时：3小时&nbsp;&nbsp;稿子和ppt的修改', '2014-09-10 12:07:52', 72, 1, ''),
(295, 7, '修改了 2014-09-09 日志，任务状态为：进行中60%，耗时：3.0小时&nbsp;&nbsp;稿子和ppt的修改', '2014-09-10 12:08:01', 72, 1, ''),
(296, 7, '修改了 2014-09-08 日志，任务状态为：进行中40%，耗时：5小时&nbsp;&nbsp;更改PPT及相关内容~', '2014-09-10 12:08:10', 72, 1, ''),
(297, 7, '修改了 2014-09-09 日志，任务状态为：进行中80%，耗时：3.0小时&nbsp;&nbsp;稿子和ppt的修改', '2014-09-10 12:08:27', 72, 1, ''),
(298, 7, '修改了 2014-09-08 日志，任务状态为：进行中60%，耗时：5小时&nbsp;&nbsp;更改PPT及相关内容~', '2014-09-10 12:08:33', 72, 1, ''),
(299, 4, '修改了 2014-09-11 日志，任务状态为：进行中40%，耗时：4小时&nbsp;&nbsp;<p>\r\n	进一步细化初稿，提交给李伟主任；\r\n</p>\r\n<p>\r\n	提炼出调研需求\r\n</p>', '2014-09-10 12:13:29', 61, 1, ''),
(300, 7, '修改了 2014-09-09 日志，任务状态为：进行中80%，耗时：7小时&nbsp;&nbsp;稿子和ppt的修改', '2014-09-10 12:15:45', 72, 1, ''),
(301, 4, '创建了任务', '2014-09-10 12:19:05', 86, 1, ''),
(302, 7, '填写了 2014-09-10 日志，任务状态为：完成100%，耗时：1.5小时&nbsp;&nbsp;李伟主任就汇报的情况和省厅的意见等向项目组成员进行宣贯', '2014-09-10 12:19:27', 73, 1, ''),
(303, 4, '填写了 2014-09-09 日志，任务状态为：未开始，耗时：3.5小时&nbsp;&nbsp;中间进行思路的讨论，并沟通', '2014-09-10 12:19:32', 86, 1, ''),
(304, 4, '编辑了任务', '2014-09-10 12:20:01', 86, 1, ''),
(305, 4, '修改了 2014-09-09 日志，任务状态为：进行中20%，耗时：3.5小时&nbsp;&nbsp;中间进行思路的讨论，并沟通', '2014-09-10 12:20:16', 86, 1, ''),
(306, 4, '填写了 2014-09-08 日志，任务状态为：进行中60%，耗时：4小时&nbsp;&nbsp;初步拟定内容', '2014-09-10 12:20:59', 21, 1, ''),
(307, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-11 01:34:59', 28, 1, ''),
(308, 10, '创建了任务', '2014-09-11 01:52:26', 87, 1, ''),
(309, 10, '编辑了任务', '2014-09-11 01:54:36', 65, 1, ''),
(310, 10, '编辑了任务', '2014-09-11 01:56:45', 61, 1, ''),
(311, 10, '编辑了任务', '2014-09-11 01:56:57', 65, 1, ''),
(312, 10, '编辑了任务', '2014-09-11 01:57:11', 65, 1, ''),
(313, 10, '编辑了任务', '2014-09-11 01:58:27', 87, 1, ''),
(314, 10, '创建了任务', '2014-09-11 02:00:30', 88, 1, ''),
(315, 10, '编辑了任务', '2014-09-11 02:01:02', 65, 1, ''),
(316, 10, '编辑了任务', '2014-09-11 02:01:17', 65, 1, ''),
(317, 10, '编辑了任务', '2014-09-11 02:01:35', 88, 1, ''),
(318, 10, '编辑了任务', '2014-09-11 02:02:35', 84, 1, ''),
(319, 10, '编辑了任务', '2014-09-11 02:02:44', 84, 1, ''),
(320, 10, '编辑了任务', '2014-09-11 02:03:13', 84, 1, ''),
(321, 10, '创建了任务', '2014-09-11 02:05:08', 89, 1, ''),
(322, 10, '创建了任务', '2014-09-11 02:07:09', 90, 1, ''),
(323, 10, '创建了任务', '2014-09-11 02:08:46', 91, 1, ''),
(324, 10, '编辑了任务', '2014-09-11 02:14:26', 89, 1, ''),
(325, 10, '填写了 2014-07-15 日志，任务状态为：未开始，耗时：5小时&nbsp;&nbsp;开始消化湖北规划有关资料', '2014-09-11 02:14:56', 89, 1, ''),
(326, 10, '修改了 2014-07-15 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;开始消化湖北规划有关资料', '2014-09-11 02:15:13', 89, 1, ''),
(327, 10, '填写了 2014-07-18 日志，任务状态为：未开始，耗时：7小时&nbsp;&nbsp;消化湖北规划资料', '2014-09-11 02:15:42', 89, 1, ''),
(328, 10, '修改了 2014-07-18 日志，任务状态为：进行中，耗时：7小时&nbsp;&nbsp;消化湖北规划资料', '2014-09-11 02:15:55', 89, 1, ''),
(329, 10, '填写了 2014-07-22 日志，任务状态为：未开始，耗时：4小时&nbsp;&nbsp;消化湖北项目资料', '2014-09-11 02:17:23', 89, 1, ''),
(330, 10, '修改了 2014-07-22 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;消化湖北项目资料', '2014-09-11 02:17:32', 89, 1, ''),
(331, 10, '填写了 2014-07-25 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;修改完善工作大纲', '2014-09-11 02:17:56', 89, 1, ''),
(332, 10, '填写了 2014-07-28 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;湖北工作大纲', '2014-09-11 02:18:21', 89, 1, ''),
(333, 10, '填写了 2014-07-29 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;湖北工作大纲', '2014-09-11 02:18:43', 89, 1, ''),
(334, 10, '填写了 2014-07-30 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;湖北工作大纲', '2014-09-11 02:19:00', 89, 1, ''),
(335, 10, '修改了 2014-07-30 日志，任务状态为：完成100%，耗时：9小时&nbsp;&nbsp;湖北工作大纲', '2014-09-11 02:19:50', 89, 1, ''),
(336, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-11 02:20:00', 89, 1, ''),
(337, 10, '编辑了任务', '2014-09-11 02:21:10', 90, 1, ''),
(338, 10, '填写了 2014-08-05 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;初步思路文本编制', '2014-09-11 02:21:37', 90, 1, ''),
(339, 10, '填写了 2014-08-06 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;<span>初步思路文本编制</span>', '2014-09-11 02:21:54', 90, 1, ''),
(340, 4, '修改了 2014-09-11 日志，任务状态为：完成100%，耗时：1.5小时&nbsp;&nbsp;补充完成后，提交给胡总', '2014-09-11 02:25:33', 38, 1, ''),
(341, 10, '填写了 2014-08-07 日志，任务状态为：进行中，耗时：10小时&nbsp;&nbsp;<span>初步思路文本编制</span>', '2014-09-11 02:26:18', 90, 1, ''),
(342, 10, '填写了 2014-08-08 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<span>初步思路文本编制</span>', '2014-09-11 02:32:58', 90, 1, ''),
(343, 10, '填写了 2014-08-11 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<span>初步思路文本编制</span>', '2014-09-11 02:35:45', 90, 1, ''),
(344, 10, '填写了 2014-08-13 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;<span>初步思路文本编制</span>', '2014-09-11 02:36:06', 90, 1, ''),
(345, 10, '填写了 2014-08-14 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;<span>初步思路文本编制</span>', '2014-09-11 02:36:29', 90, 1, ''),
(346, 10, '填写了 2014-08-15 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<span>初步思路文本编制</span>', '2014-09-11 02:36:39', 90, 1, ''),
(347, 10, '填写了 2014-08-20 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;<span>初步思路文本编制</span>', '2014-09-11 02:37:03', 90, 1, ''),
(348, 10, '填写了 2014-08-28 日志，任务状态为：进行中，耗时：7小时&nbsp;&nbsp;<span>初步思路文本编制修改</span>', '2014-09-11 02:37:36', 90, 1, ''),
(349, 10, '修改了 2014-08-20 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;<span>陈总对初步思路文本编制提出指导修改意见</span>', '2014-09-11 02:37:55', 90, 1, ''),
(350, 10, '填写了 2014-08-29 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;<span>初步思路文本编制修改完善</span>', '2014-09-11 02:38:09', 90, 1, ''),
(351, 10, '填写了 2014-09-03 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;<span>初步思路文本编制修改完善</span>', '2014-09-11 02:38:34', 90, 1, ''),
(352, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-11 02:38:53', 90, 1, ''),
(353, 10, '编辑了任务', '2014-09-11 02:40:33', 91, 1, ''),
(354, 10, '填写了 2014-08-20 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;PPT制作', '2014-09-11 02:41:04', 91, 1, ''),
(355, 10, '填写了 2014-08-22 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', '2014-09-11 02:41:39', 91, 1, ''),
(356, 10, '填写了 2014-08-26 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', '2014-09-11 02:42:04', 91, 1, ''),
(357, 10, '填写了 2014-08-27 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', '2014-09-11 02:42:12', 91, 1, ''),
(358, 10, '填写了 2014-09-02 日志，任务状态为：进行中，耗时：10小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', '2014-09-11 02:42:46', 91, 1, ''),
(359, 10, '填写了 2014-09-03 日志，任务状态为：进行中，耗时：10.5小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', '2014-09-11 02:43:07', 91, 1, ''),
(360, 10, '填写了 2014-09-04 日志，任务状态为：完成100%，耗时：5小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT汇报前修改、完善</span>', '2014-09-11 02:43:37', 91, 1, ''),
(361, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-11 02:43:44', 91, 1, ''),
(362, 10, '创建了任务', '2014-09-11 02:47:18', 92, 1, ''),
(363, 10, '创建了任务', '2014-09-11 02:50:04', 93, 1, ''),
(364, 10, '编辑了任务', '2014-09-11 02:51:56', 93, 1, ''),
(365, 10, '填写了 2014-08-12 日志，任务状态为：完成100%，耗时：2小时&nbsp;&nbsp;项目启动会', '2014-09-11 02:52:16', 93, 1, ''),
(366, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-11 02:52:24', 93, 1, ''),
(367, 10, '创建了任务', '2014-09-11 02:54:24', 94, 1, ''),
(368, 10, '填写了 2014-09-03 日志，任务状态为：完成100%，耗时：4小时&nbsp;&nbsp;项目组全体参与讨论汇报PPT的完善方案', '2014-09-11 02:54:57', 94, 1, ''),
(369, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-11 02:55:04', 94, 1, ''),
(370, 10, '创建了任务', '2014-09-11 02:57:52', 95, 1, ''),
(371, 10, '填写了 2014-09-10 日志，任务状态为：完成100%，耗时：2.5小时&nbsp;&nbsp;内部通气布置会', '2014-09-11 02:58:28', 95, 1, ''),
(372, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-11 02:58:33', 95, 1, ''),
(373, 10, '编辑了任务', '2014-09-11 02:59:15', 87, 1, ''),
(374, 10, '编辑了任务', '2014-09-11 02:59:44', 87, 1, ''),
(375, 10, '创建了任务', '2014-09-11 03:01:46', 96, 1, ''),
(376, 10, '填写了 2014-09-04 日志，任务状态为：完成100%，耗时：6小时&nbsp;&nbsp;下去启程赴武汉', '2014-09-11 03:02:07', 96, 1, ''),
(377, 10, '填写了 2014-09-05 日志，任务状态为：完成100%，耗时：9.5小时&nbsp;&nbsp;<p>\r\n	上午汇报\r\n</p>\r\n<p>\r\n	中午课题组受到湖北一把手厅长接见、共进午餐\r\n</p>\r\n<p>\r\n	下午返京\r\n</p>', '2014-09-11 03:02:55', 96, 1, ''),
(378, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-11 03:03:02', 96, 1, ''),
(379, 10, '编辑了任务', '2014-09-11 03:03:16', 96, 1, ''),
(380, 10, '编辑了任务', '2014-09-11 03:04:34', 96, 1, ''),
(381, 10, '编辑了任务', '2014-09-11 03:13:56', 87, 1, ''),
(382, 10, '创建了任务', '2014-09-11 03:28:49', 97, 1, ''),
(383, 10, '编辑了任务', '2014-09-11 03:29:38', 87, 1, ''),
(384, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 00:52:24', 96, 1, ''),
(385, 10, '创建了任务', '2014-09-12 01:48:28', 98, 1, ''),
(386, 10, '编辑了任务', '2014-09-12 01:49:34', 82, 1, ''),
(387, 10, '编辑了任务', '2014-09-12 01:50:51', 81, 1, ''),
(388, 10, '编辑了任务', '2014-09-12 01:51:43', 82, 1, ''),
(389, 10, '编辑了任务', '2014-09-12 01:53:20', 80, 1, ''),
(390, 10, '创建了任务', '2014-09-12 01:55:07', 99, 1, ''),
(391, 10, '创建了任务', '2014-09-12 01:58:37', 100, 1, ''),
(392, 10, '编辑了任务', '2014-09-12 01:59:24', 100, 1, ''),
(393, 10, '填写了 2013-09-04 日志，任务状态为：未开始，耗时：10小时&nbsp;&nbsp;准备竞争性谈判文件', '2014-09-12 02:00:20', 100, 1, ''),
(394, 10, '修改了 2013-09-04 日志，任务状态为：进行中，耗时：10小时&nbsp;&nbsp;准备竞争性谈判文件', '2014-09-12 02:00:32', 100, 1, ''),
(395, 10, '填写了 2013-09-05 日志，任务状态为：进行中，耗时：10小时&nbsp;&nbsp;竞争性谈判文件报告编制', '2014-09-12 02:01:16', 100, 1, ''),
(396, 10, '填写了 2013-09-06 日志，任务状态为：进行中，耗时：10小时&nbsp;&nbsp;<span>竞争性谈判文件报告编制</span>', '2014-09-12 02:01:27', 100, 1, ''),
(397, 10, '填写了 2013-09-07 日志，任务状态为：进行中，耗时：12小时&nbsp;&nbsp;<span>竞争性谈判文件报告编制</span>', '2014-09-12 02:01:43', 100, 1, ''),
(398, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 02:02:04', 100, 1, ''),
(399, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 02:03:43', 98, 1, ''),
(400, 10, '审核了任务，审核结果为：&nbsp;驳回', '2014-09-12 02:03:54', 98, 1, ''),
(401, 10, '创建了任务', '2014-09-12 02:37:31', 101, 1, ''),
(402, 10, '创建了任务', '2014-09-12 02:38:50', 102, 1, ''),
(403, 10, '创建了任务', '2014-09-12 02:40:19', 103, 1, ''),
(404, 10, '编辑了任务', '2014-09-12 02:40:53', 48, 1, ''),
(405, 10, '编辑了任务', '2014-09-12 02:41:06', 47, 1, ''),
(406, 10, '编辑了任务', '2014-09-12 02:41:45', 22, 1, ''),
(407, 10, '编辑了任务', '2014-09-12 02:42:23', 20, 1, ''),
(408, 10, '编辑了任务', '2014-09-12 02:42:57', 19, 1, ''),
(409, 10, '编辑了任务', '2014-09-12 03:21:18', 87, 1, ''),
(410, 14, '创建了任务', '2014-09-12 03:26:14', 104, 1, ''),
(411, 14, '创建了任务', '2014-09-12 03:27:32', 105, 1, ''),
(412, 14, '编辑了任务', '2014-09-12 03:27:48', 105, 1, ''),
(413, 10, '创建了任务', '2014-09-12 05:20:51', 106, 1, ''),
(414, 10, '编辑了任务', '2014-09-12 05:24:52', 101, 1, ''),
(415, 10, '填写了 2013-09-27 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;竞争性谈判PPT', '2014-09-12 05:29:47', 100, 1, ''),
(416, 10, '填写了 2013-10-02 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;消化江苏资料；准备竞争性谈判', '2014-09-12 05:30:31', 100, 1, ''),
(417, 10, '填写了 2013-10-05 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；准备竞争性谈判PPT</span>', '2014-09-12 05:31:11', 100, 1, ''),
(418, 10, '填写了 2013-10-06 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；准备竞争性谈判PPT</span>', '2014-09-12 05:31:27', 100, 1, ''),
(419, 10, '填写了 2013-10-07 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；准备竞争性谈判PPT</span>', '2014-09-12 05:31:54', 100, 1, ''),
(420, 10, '填写了 2013-10-08 日志，任务状态为：未开始，耗时：0小时&nbsp;&nbsp;', '2014-09-12 05:32:05', 100, 1, ''),
(421, 10, '填写了 2013-10-10 日志，任务状态为：进行中，耗时：7小时&nbsp;&nbsp;<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；修改竞争性谈判PPT</span>', '2014-09-12 05:32:34', 100, 1, ''),
(422, 10, '填写了 2013-10-11 日志，任务状态为：完成100%，耗时：9小时&nbsp;&nbsp;<p>\r\n	<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；修改竞争性谈判PPT</span>\r\n</p>\r\n<p>\r\n	<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">下午进行竞争性谈判汇报（5家中获胜）</span>\r\n</p>', '2014-09-12 05:33:26', 100, 1, ''),
(423, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 05:33:39', 100, 1, ''),
(424, 10, '编辑了任务', '2014-09-12 05:33:58', 100, 1, ''),
(425, 10, '创建了任务', '2014-09-12 05:39:31', 107, 1, ''),
(426, 10, '填写了 2013-11-04 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;消化准备工作大纲编制', '2014-09-12 05:40:37', 107, 1, ''),
(427, 10, '填写了 2013-11-05 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;拟定大纲', '2014-09-12 05:40:56', 107, 1, ''),
(428, 10, '填写了 2013-11-14 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;利用赴江苏项目代部审查，进行工作大纲编制交流', '2014-09-12 05:41:44', 107, 1, ''),
(429, 10, '填写了 2013-12-12 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;拟定江苏工作大纲中的调研方案（结合江苏省院和我方课题组考虑）', '2014-09-12 05:42:58', 107, 1, ''),
(430, 10, '填写了 2013-12-14 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;加班修改江苏工作大纲和工作分工', '2014-09-12 05:44:57', 107, 1, ''),
(431, 10, '填写了 2013-12-19 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;修改完并向主管老总提交工作大纲', '2014-09-12 05:45:28', 107, 1, ''),
(432, 10, '填写了 2014-01-09 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;修改江苏工作大纲', '2014-09-12 05:46:21', 107, 1, ''),
(433, 10, '修改了 2014-01-09 日志，任务状态为：进行中，耗时：8.5小时&nbsp;&nbsp;修改江苏工作大纲', '2014-09-12 05:46:33', 107, 1, ''),
(434, 10, '编辑了任务', '2014-09-12 05:47:19', 100, 1, ''),
(435, 10, '填写了 2014-01-10 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;工作大纲PPT', '2014-09-12 05:55:06', 107, 1, ''),
(436, 10, '填写了 2014-01-14 日志，任务状态为：完成100%，耗时：4.5小时&nbsp;&nbsp;江苏工作大纲汇报', '2014-09-12 05:55:27', 107, 1, ''),
(437, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 05:55:34', 107, 1, ''),
(438, 10, '编辑了任务', '2014-09-12 05:55:47', 107, 1, ''),
(439, 10, '创建了任务', '2014-09-12 05:59:21', 108, 1, ''),
(440, 10, '创建了任务', '2014-09-12 06:02:18', 109, 1, ''),
(441, 10, '填写了 2014-03-05 日志，任务状态为：进行中，耗时：5.5小时&nbsp;&nbsp;赴南京进行调研方案座谈', '2014-09-12 06:03:33', 108, 1, ''),
(442, 10, '填写了 2014-04-11 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;江苏调研方案讨论修改', '2014-09-12 06:04:25', 108, 1, ''),
(443, 10, '填写了 2014-04-18 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;完善江苏调研方案', '2014-09-12 06:04:45', 108, 1, ''),
(444, 10, '填写了 2014-05-06 日志，任务状态为：进行中，耗时：6.5小时&nbsp;&nbsp;江苏调研方案讨论、修改、完善', '2014-09-12 06:05:22', 108, 1, ''),
(445, 10, '填写了 2014-05-07 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;修改江苏调研方案', '2014-09-12 06:05:45', 108, 1, ''),
(446, 10, '填写了 2014-05-12 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;协调江苏外业调研时间、组织、人员等', '2014-09-12 06:06:18', 108, 1, ''),
(447, 10, '填写了 2014-05-14 日志，任务状态为：进行中，耗时：3.5小时&nbsp;&nbsp;准备调研前与江苏省院方交流座谈材料', '2014-09-12 06:06:54', 108, 1, ''),
(448, 10, '填写了 2014-05-15 日志，任务状态为：进行中，耗时：2.5小时&nbsp;&nbsp;修改完善江苏调研方案', '2014-09-12 06:07:18', 108, 1, ''),
(449, 10, '修改了 2014-05-15 日志，任务状态为：进行中，耗时：6.5小时&nbsp;&nbsp;所内江苏调研动员和交流', '2014-09-12 06:08:11', 108, 1, ''),
(450, 10, '填写了 2014-05-16 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;修改省厅下发调研函', '2014-09-12 06:08:36', 108, 1, ''),
(451, 10, '填写了 2014-05-18 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;下午启程赴南京', '2014-09-12 06:08:56', 108, 1, ''),
(452, 10, '填写了 2014-05-19 日志，任务状态为：进行中，耗时：8.5小时&nbsp;&nbsp;<p>\r\n	分组调研\r\n</p>\r\n<p>\r\n	——江北组赴淮安，开始苏北地区调研\r\n</p>\r\n<p>\r\n	——江南组赴苏州，开展苏南地区调研\r\n</p>', '2014-09-12 06:09:44', 108, 1, ''),
(453, 10, '填写了 2014-05-20 日志，任务状态为：进行中，耗时：8.5小时&nbsp;&nbsp;苏州、无锡', '2014-09-12 06:10:02', 108, 1, ''),
(454, 10, '填写了 2014-05-21 日志，任务状态为：进行中，耗时：9.5小时&nbsp;&nbsp;上午无锡江阴、下午高新区', '2014-09-12 06:10:26', 108, 1, ''),
(455, 10, '填写了 2014-05-22 日志，任务状态为：进行中，耗时：8.5小时&nbsp;&nbsp;常州调研', '2014-09-12 06:10:41', 108, 1, ''),
(456, 10, '填写了 2014-05-23 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;南京调研', '2014-09-12 06:10:58', 108, 1, ''),
(457, 31, '创建了任务', '2014-09-12 06:11:32', 110, 1, ''),
(458, 10, '填写了 2014-05-24 日志，任务状态为：进行中，耗时：8.5小时&nbsp;&nbsp;与苏北组汇合；下午到晚上与省院碰撞观点，整理汇报材料', '2014-09-12 06:11:43', 108, 1, ''),
(459, 10, '填写了 2014-05-25 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;整理准备调研汇报', '2014-09-12 06:12:04', 108, 1, ''),
(460, 10, '填写了 2014-05-26 日志，任务状态为：完成100%，耗时：8.5小时&nbsp;&nbsp;<p>\r\n	上午向江苏省厅汇报调研情况；\r\n</p>\r\n<p>\r\n	下午与省发改、经信、商贸等部门座谈\r\n</p>', '2014-09-12 06:12:44', 108, 1, ''),
(461, 10, '填写了 2014-05-27 日志，任务状态为：完成100%，耗时：5.5小时&nbsp;&nbsp;上午启程返京', '2014-09-12 06:13:01', 108, 1, ''),
(462, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 06:13:06', 108, 1, ''),
(463, 31, '创建了任务', '2014-09-12 06:15:23', 111, 1, ''),
(464, 10, '创建了任务', '2014-09-12 06:15:24', 112, 1, ''),
(465, 31, '编辑了任务', '2014-09-12 06:15:49', 111, 1, ''),
(466, 31, '编辑了任务', '2014-09-12 06:16:02', 110, 1, ''),
(467, 10, '填写了 2014-06-06 日志，任务状态为：进行中，耗时：2.5小时&nbsp;&nbsp;<p>\r\n	拟定研究方案，细化分工，包括：\r\n</p>\r\n<p>\r\n	GIS、省院分工、外贸数据分析等\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2014-09-12 06:17:02', 112, 1, ''),
(468, 31, '创建了任务', '2014-09-12 06:17:26', 113, 1, ''),
(469, 10, '填写了 2014-07-08 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;针对各专题研究人员成果开展小规模讨论', '2014-09-12 06:17:51', 112, 1, ''),
(470, 31, '创建了任务', '2014-09-12 06:18:06', 114, 1, ''),
(471, 10, '填写了 2014-07-15 日志，任务状态为：进行中40%，耗时：5.5小时&nbsp;&nbsp;讨论推进江苏GIS分析', '2014-09-12 06:18:23', 112, 1, ''),
(472, 31, '创建了任务', '2014-09-12 06:18:52', 115, 1, ''),
(473, 10, '填写了 2014-07-17 日志，任务状态为：进行中，耗时：8.5小时&nbsp;&nbsp;<p>\r\n	1. 整理江苏项目思路、形势和现状\r\n</p>\r\n<p>\r\n	2. 江苏项目阶段性成果讨论（全体项目组）\r\n</p>', '2014-09-12 06:19:36', 112, 1, ''),
(474, 31, '编辑了任务', '2014-09-12 06:20:02', 114, 1, ''),
(475, 10, '填写了 2014-07-21 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;整理项目现状、问题、目标定位等', '2014-09-12 06:20:21', 112, 1, ''),
(476, 10, '填写了 2014-07-22 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;撰写项目现状部分', '2014-09-12 06:20:44', 112, 1, ''),
(477, 10, '填写了 2014-07-23 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;撰写项目现状部分', '2014-09-12 06:21:04', 112, 1, ''),
(478, 10, '填写了 2014-07-24 日志，任务状态为：进行中，耗时：6.5小时&nbsp;&nbsp;撰写项目分级分类部分内容', '2014-09-12 06:21:26', 112, 1, ''),
(479, 10, '填写了 2014-07-31 日志，任务状态为：进行中，耗时：8.5小时&nbsp;&nbsp;<p>\r\n	上午商议江苏物流枢纽项目汇报\r\n</p>\r\n<p>\r\n	下午启程赴南京\r\n</p>', '2014-09-12 06:22:04', 112, 1, ''),
(480, 10, '填写了 2014-08-01 日志，任务状态为：完成100%，耗时：8.5小时&nbsp;&nbsp;<p>\r\n	1. 上午参与江苏十三五规划研讨；\r\n</p>\r\n<p>\r\n	2. 下午进行江苏综合交通物流枢纽中间成果汇报\r\n</p>', '2014-09-12 06:23:11', 112, 1, ''),
(481, 10, '编辑了任务', '2014-09-12 06:24:18', 107, 1, ''),
(482, 10, '编辑了任务', '2014-09-12 06:24:48', 98, 1, ''),
(483, 10, '编辑了任务', '2014-09-12 06:25:02', 98, 1, ''),
(484, 10, '创建了任务', '2014-09-12 06:39:39', 116, 1, ''),
(485, 10, '创建了任务', '2014-09-12 06:40:56', 117, 1, ''),
(486, 10, '编辑了任务', '2014-09-12 06:41:07', 116, 1, ''),
(487, 10, '创建了任务', '2014-09-12 06:41:49', 118, 1, ''),
(488, 10, '创建了任务', '2014-09-12 06:45:43', 119, 1, ''),
(489, 10, '创建了任务', '2014-09-12 06:46:51', 120, 1, ''),
(490, 10, '创建了任务', '2014-09-12 06:47:51', 121, 1, ''),
(491, 10, '创建了任务', '2014-09-12 06:48:39', 122, 1, ''),
(492, 10, '创建了任务', '2014-09-12 06:49:17', 123, 1, ''),
(493, 10, '创建了任务', '2014-09-12 06:50:25', 124, 1, ''),
(494, 10, '创建了任务', '2014-09-12 06:51:06', 125, 1, ''),
(495, 10, '创建了任务', '2014-09-12 06:57:04', 126, 1, ''),
(496, 10, '编辑了任务', '2014-09-12 06:58:02', 119, 1, ''),
(497, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 07:00:19', 125, 1, ''),
(498, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 07:02:29', 70, 1, ''),
(499, 10, '创建了任务', '2014-09-12 07:07:42', 127, 1, ''),
(500, 31, '填写了 2014-09-12 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;完成了示范应用专题报告', '2014-09-12 07:15:08', 125, 1, ''),
(501, 31, '创建了文档', '2014-09-12 07:19:28', 1, 2, ''),
(502, 31, '创建了文档', '2014-09-12 07:19:59', 2, 2, ''),
(503, 41, '创建了任务', '2014-09-12 07:42:56', 128, 1, ''),
(504, 41, '创建了任务', '2014-09-12 07:59:15', 129, 1, ''),
(505, 41, '创建了任务', '2014-09-12 08:03:31', 130, 1, ''),
(506, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-12 08:04:28', 128, 1, ''),
(507, 41, '编辑了任务', '2014-09-12 08:07:59', 130, 1, ''),
(508, 10, '创建了任务', '2014-09-12 08:11:17', 131, 1, ''),
(509, 41, '创建了任务', '2014-09-12 08:11:31', 132, 1, ''),
(510, 10, '编辑了任务', '2014-09-12 08:11:35', 131, 1, ''),
(511, 41, '创建了任务', '2014-09-12 08:16:32', 133, 1, ''),
(512, 7, '填写了 2014-09-11 日志，任务状态为：进行中80%，耗时：12小时&nbsp;&nbsp;其中与李院长、石总、王所讨论稿子和ppt的修改2小时，下午修改ppt4小时，晚上加班修改ppt6小时', '2014-09-12 09:00:54', 72, 1, ''),
(513, 7, '填写了 2014-09-12 日志，任务状态为：进行中80%，耗时：9小时&nbsp;&nbsp;全天修改ppt', '2014-09-12 09:01:14', 72, 1, ''),
(514, 7, '修改了 2014-09-11 日志，任务状态为：进行中80%，耗时：12小时&nbsp;&nbsp;其中与李院长、石总、王所讨论稿子和ppt的修改2小时，下午修改ppt4小时，晚上加班修改ppt6小时，其中实习生曾维樵协助参与工作3小时', '2014-09-12 09:01:50', 72, 1, ''),
(515, 7, '创建了任务', '2014-09-12 09:04:00', 134, 1, ''),
(516, 7, '填写了 2014-09-11 日志，任务状态为：完成100%，耗时：2.5小时&nbsp;&nbsp;', '2014-09-12 09:04:15', 134, 1, ''),
(517, 7, '修改了 2014-09-11 日志，任务状态为：进行中80%，耗时：10小时&nbsp;&nbsp;下午修改ppt4小时，晚上加班修改ppt6小时，其中实习生曾维樵协助参与工作3小时', '2014-09-12 09:04:34', 72, 1, ''),
(518, 3, '创建了任务', '2014-09-16 02:31:21', 135, 1, ''),
(519, 41, '创建了任务', '2014-09-16 02:31:43', 136, 1, ''),
(520, 3, '填写了 2014-09-11 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;准备专家评审会会议材料', '2014-09-16 02:31:55', 135, 1, ''),
(521, 41, '填写了 2014-09-16 日志，任务状态为：计划，耗时：2.5小时&nbsp;&nbsp;参考之前的项目报告，确定方法以及基本数据。', '2014-09-16 02:32:30', 136, 1, ''),
(522, 3, '填写了 2014-09-12 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;交通部开项目讨论会，会务，会议记录', '2014-09-16 02:32:55', 135, 1, ''),
(523, 3, '填写了 2014-09-13 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;1309,封闭修改报告', '2014-09-16 02:33:34', 135, 1, ''),
(524, 3, '填写了 2014-09-14 日志，任务状态为：进行中，耗时：10小时&nbsp;&nbsp;1401封闭修改报告', '2014-09-16 02:33:52', 135, 1, ''),
(525, 3, '填写了 2014-09-15 日志，任务状态为：进行中，耗时：11小时&nbsp;&nbsp;18楼会议室集中封闭、讨论', '2014-09-16 02:35:04', 135, 1, ''),
(526, 3, '填写了 2014-09-16 日志，任务状态为：进行中80%，耗时：1小时&nbsp;&nbsp;修改润色提交金所、王所', '2014-09-16 02:35:29', 135, 1, ''),
(527, 3, '填写了 2014-09-15 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;修改目标市场思路与技术路线', '2014-09-16 02:36:49', 22, 1, ''),
(528, 3, '填写了 2014-09-12 日志，任务状态为：未开始，耗时：2小时&nbsp;&nbsp;修改需求结构及技术路线', '2014-09-16 02:37:16', 22, 1, ''),
(529, 3, '修改了 2014-09-12 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;修改需求结构及技术路线', '2014-09-16 02:37:23', 22, 1, ''),
(530, 3, '填写了 2014-09-11 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;修改报告结构、修改案例', '2014-09-16 02:38:57', 104, 1, ''),
(531, 3, '填写了 2014-09-10 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;', '2014-09-16 02:52:05', 104, 1, ''),
(532, 3, '填写了 2014-09-11 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;', '2014-09-16 02:52:30', 22, 1, ''),
(533, 10, '填写了 2014-09-16 日志，任务状态为：进行中，耗时：3.5小时&nbsp;&nbsp;消化资料；准备编写提纲的编制', '2014-09-16 07:37:19', 92, 1, ''),
(534, 10, '编辑了任务', '2014-09-16 07:37:38', 92, 1, ''),
(535, 41, '修改了 2014-09-16 日志，任务状态为：计划，耗时：3.5小时&nbsp;&nbsp;<p>\r\n	参考之前的项目报告，确定方法以及基本数据。\r\n</p>\r\n<p>\r\n	下午主要是用弹性系数法预测客运量，未完成。\r\n</p>\r\n<p>\r\n	然后做国内外经验借鉴的资料查询\r\n</p>', '2014-09-16 08:13:19', 136, 1, ''),
(536, 41, '填写了 2014-09-17 日志，任务状态为：进行中20%，耗时：4.5小时&nbsp;&nbsp;今天一直在编制赵主任给的任务，就是在transCAD上进行点点，以及查询国外物流经验借鉴的材料', '2014-09-17 04:07:59', 136, 1, ''),
(537, 7, '填写了 2014-09-13 日志，任务状态为：进行中80%，耗时：6小时&nbsp;&nbsp;加班修改ppt，完成初稿并提交给王所', '2014-09-17 06:40:15', 72, 1, ''),
(538, 7, '填写了 2014-09-14 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;王所指导修改ppt，并于下午乘坐飞机前往重庆。', '2014-09-17 06:40:54', 72, 1, ''),
(539, 7, '填写了 2014-09-15 日志，任务状态为：完成100%，耗时：4小时&nbsp;&nbsp;工作大纲会，李院长、关院长、石总、王所及我参加，重庆交委滕主任、陈主任，汪主任及相关处室，渝勘院等领导参会，下午乘机返回', '2014-09-17 06:42:17', 72, 1, ''),
(540, 7, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-17 06:42:44', 134, 1, ''),
(541, 7, '创建了任务', '2014-09-17 06:47:03', 137, 1, ''),
(542, 7, '填写了 2014-09-16 日志，任务状态为：进行中60%，耗时：12小时&nbsp;&nbsp;全天修改ppt，晚上加班5小时进行ppt的修改。', '2014-09-17 06:47:55', 137, 1, ''),
(543, 7, '填写了 2014-09-17 日志，任务状态为：进行中80%，耗时：3.5小时&nbsp;&nbsp;向翁部长汇报，并将根据其修改意见进行修改完善。', '2014-09-17 06:48:29', 137, 1, ''),
(544, 1, '创建了任务', '2014-09-18 00:38:40', 138, 1, ''),
(545, 1, '创建了任务', '2014-09-18 00:39:30', 139, 1, ''),
(546, 1, '创建了任务', '2014-09-18 00:41:04', 140, 1, ''),
(547, 1, '创建了任务', '2014-09-18 00:42:00', 141, 1, ''),
(548, 1, '创建了任务', '2014-09-18 00:44:31', 142, 1, ''),
(549, 2, '创建了任务', '2014-09-18 00:46:37', 143, 1, ''),
(550, 2, '创建了任务', '2014-09-18 00:53:40', 144, 1, ''),
(551, 2, '创建了任务', '2014-09-18 00:54:44', 145, 1, ''),
(552, 2, '创建了任务', '2014-09-18 00:55:27', 146, 1, ''),
(553, 2, '创建了任务', '2014-09-18 00:56:35', 147, 1, ''),
(554, 2, '创建了任务', '2014-09-18 00:57:11', 148, 1, ''),
(555, 10, '创建了任务', '2014-09-18 00:57:40', 149, 1, ''),
(556, 2, '填写了 2014-09-01 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;', '2014-09-18 00:58:24', 19, 1, ''),
(557, 10, '填写了 2014-09-17 日志，任务状态为：进行中，耗时：3.5小时&nbsp;&nbsp;根据部西部办形式审查要求，完善相关报告、补充核实有关财务、应用证明等材料', '2014-09-18 00:58:28', 149, 1, ''),
(558, 2, '填写了 2014-09-05 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;', '2014-09-18 00:58:37', 19, 1, ''),
(559, 2, '填写了 2014-09-06 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;', '2014-09-18 00:58:52', 19, 1, ''),
(560, 2, '填写了 2014-09-15 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;', '2014-09-18 00:59:10', 20, 1, ''),
(561, 2, '填写了 2014-09-16 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;', '2014-09-18 00:59:17', 20, 1, ''),
(562, 10, '创建了任务', '2014-09-18 00:59:59', 150, 1, ''),
(563, 10, '编辑了任务', '2014-09-18 01:00:40', 150, 1, ''),
(564, 2, '填写了 2014-09-09 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;', '2014-09-18 01:02:04', 140, 1, ''),
(565, 2, '填写了 2014-09-10 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;', '2014-09-18 01:02:12', 140, 1, ''),
(566, 2, '填写了 2014-09-11 日志，任务状态为：进行中，耗时：9小时&nbsp;&nbsp;', '2014-09-18 01:02:21', 140, 1, ''),
(567, 10, '创建了任务', '2014-09-18 01:04:26', 151, 1, ''),
(568, 10, '填写了 2014-09-17 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;根据形式审查要求，完善报告排版；审核补充有关分包方财务报告、应用证明等内容；', '2014-09-18 01:06:09', 151, 1, ''),
(569, 2, '填写了 2014-09-12 日志，任务状态为：完成100%，耗时：6小时&nbsp;&nbsp;', '2014-09-18 01:08:37', 141, 1, ''),
(570, 2, '修改了 2014-09-11 日志，任务状态为：完成100%，耗时：9小时&nbsp;&nbsp;', '2014-09-18 01:09:01', 140, 1, ''),
(571, 41, '填写了 2014-09-18 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;已完成上报项目的添加，现在正在进行产业园区的点的添加', '2014-09-18 01:42:24', 146, 1, ''),
(572, 3, '填写了 2014-09-17 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;<p>\r\n	参与交通运输部汇报\r\n</p>\r\n<p>\r\n	会后谈论修改方案\r\n</p>', '2014-09-18 02:08:49', 135, 1, ''),
(573, 3, '填写了 2014-09-16 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;修改方案', '2014-09-18 02:09:25', 22, 1, ''),
(574, 3, '填写了 2014-09-17 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;修改方案，统稿', '2014-09-18 02:09:43', 22, 1, ''),
(575, 3, '填写了 2014-09-16 日志，任务状态为：完成100%，耗时：1小时&nbsp;&nbsp;针对国家铁路局意见修改提案建议的回复', '2014-09-18 02:12:37', 54, 1, ''),
(576, 41, '修改了 2014-09-18 日志，任务状态为：进行中20%，耗时：4.5小时&nbsp;&nbsp;已完成上报项目的添加，现在正在进行产业园区的点的添加。', '2014-09-18 06:45:55', 146, 1, ''),
(577, 41, '修改了 2014-09-18 日志，任务状态为：进行中60%，耗时：4.5小时&nbsp;&nbsp;已完成上报项目的添加，现在正在进行产业园区的点的添加。', '2014-09-18 08:53:20', 146, 1, ''),
(578, 7, '填写了 2014-09-19 日志，任务状态为：完成100%，耗时：1小时&nbsp;&nbsp;根据王所的反馈意见进行了部分PPT的修改', '2014-09-19 06:59:35', 137, 1, ''),
(579, 41, '填写了 2014-09-19 日志，任务状态为：完成100%，耗时：0小时&nbsp;&nbsp;<p>\r\n	上午完成昨天的产业园区的任务。\r\n</p>\r\n<p>\r\n	下午对湖北经济带项目中的总量预测用回归分析法做了一下。\r\n</p>', '2014-09-19 07:45:57', 146, 1, '');
INSERT INTO `tk_log` (`logid`, `tk_log_user`, `tk_log_action`, `tk_log_time`, `tk_log_type`, `tk_log_class`, `tk_log_description`) VALUES
(580, 41, '修改了 2014-09-19 日志，任务状态为：完成100%，耗时：7小时&nbsp;&nbsp;<p>\r\n	上午完成昨天的产业园区的任务。\r\n</p>\r\n<p>\r\n	下午对湖北经济带项目中的总量预测用回归分析法做了一下。\r\n</p>', '2014-09-19 07:46:16', 146, 1, ''),
(581, 41, '修改了 2014-09-19 日志，任务状态为：完成100%，耗时：5小时&nbsp;&nbsp;<p>\r\n	上午完成昨天的产业园区的任务。\r\n</p>\r\n<p>\r\n	下午对湖北经济带项目中的总量预测用回归分析法做了一下。\r\n</p>', '2014-09-19 07:46:24', 146, 1, ''),
(582, 2, '创建了任务', '2014-09-19 08:16:56', 152, 1, ''),
(583, 41, '修改了 2014-09-18 日志，任务状态为：完成100%，耗时：4.5小时&nbsp;&nbsp;已完成上报项目的添加，现在正在进行产业园区的点的添加。', '2014-09-22 04:13:42', 146, 1, ''),
(584, 41, '填写了 2014-09-22 日志，任务状态为：进行中40%，耗时：2小时&nbsp;&nbsp;修改建模地图', '2014-09-22 04:14:04', 146, 1, ''),
(585, 3, '填写了 2014-09-18 日志，任务状态为：进行中，耗时：3.5小时&nbsp;&nbsp;综合运输指标体系初稿并提交', '2014-09-22 06:25:25', 135, 1, ''),
(586, 3, '填写了 2014-09-19 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;根据王所反馈意见，修改指标体系指标及报告', '2014-09-22 06:26:06', 135, 1, ''),
(587, 3, '修改了 2014-09-18 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;综合运输指标体系初稿并提交', '2014-09-22 06:26:30', 135, 1, ''),
(588, 3, '填写了 2014-09-18 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;与王总讨论修改方法', '2014-09-22 06:27:15', 22, 1, ''),
(589, 3, '填写了 2014-09-18 日志，任务状态为：未开始，耗时：3.5小时&nbsp;&nbsp;结合反馈意见修改报告结构', '2014-09-22 06:28:15', 104, 1, ''),
(590, 3, '修改了 2014-09-18 日志，任务状态为：进行中，耗时：3.5小时&nbsp;&nbsp;结合反馈意见修改报告结构', '2014-09-22 06:28:21', 104, 1, ''),
(591, 3, '填写了 2014-09-19 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;修改案例、文整', '2014-09-22 06:28:48', 104, 1, ''),
(592, 3, '填写了 2014-09-22 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;结合李可意见修改报告、提交二审', '2014-09-22 06:29:57', 104, 1, ''),
(593, 3, '填写了 2014-09-22 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;结合部关于各省资金生情报告评审的要求与无锡市运管处、西站物流沟通评审、批复时间，现场情况', '2014-09-22 06:32:06', 75, 1, ''),
(594, 3, '填写了 2014-09-19 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;东莞保税物流中心大纲、项目简介', '2014-09-22 06:34:26', 75, 1, ''),
(595, 41, '修改了 2014-09-22 日志，任务状态为：完成100%，耗时：2小时&nbsp;&nbsp;修改建模地图，完成。', '2014-09-22 07:00:51', 146, 1, ''),
(596, 7, '填写了 2014-09-22 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;消化资料', '2014-09-22 09:08:39', 65, 1, ''),
(597, 7, '填写了 2014-09-20 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;消化资料', '2014-09-22 09:08:51', 65, 1, ''),
(598, 7, '填写了 2014-09-19 日志，任务状态为：进行中，耗时：5.5小时&nbsp;&nbsp;消化资料', '2014-09-22 09:09:14', 65, 1, ''),
(599, 7, '修改了 2014-09-19 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;消化资料', '2014-09-22 09:09:41', 65, 1, ''),
(600, 7, '填写了 2014-09-18 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;消化资料', '2014-09-22 09:09:49', 65, 1, ''),
(601, 7, '修改了 2014-09-22 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;消化资料，并向李主任提交通道及现网布局规划的时间进度表', '2014-09-22 09:10:21', 65, 1, ''),
(602, 7, '编辑了任务', '2014-09-22 09:10:42', 66, 1, ''),
(603, 7, '创建了文档', '2014-09-22 09:14:00', 3, 2, ''),
(604, 7, '创建了文档', '2014-09-22 09:14:21', 4, 2, ''),
(605, 7, '创建了文档', '2014-09-22 09:19:05', 5, 2, ''),
(606, 7, '创建了文档', '2014-09-22 09:19:49', 6, 2, ''),
(607, 7, '创建了文档', '2014-09-22 09:20:44', 7, 2, ''),
(608, 7, '编辑了文档', '2014-09-22 09:21:50', 7, 2, ''),
(609, 7, '编辑了文档', '2014-09-22 09:22:57', 6, 2, ''),
(610, 7, '创建了文档', '2014-09-22 09:23:58', 8, 2, ''),
(611, 7, '填写了 2014-09-23 日志，任务状态为：完成100%，耗时：4小时&nbsp;&nbsp;根据于司长的要求进行修改', '2014-09-23 05:58:43', 137, 1, ''),
(612, 41, '填写了 2014-09-23 日志，任务状态为：进行中40%，耗时：5.5小时&nbsp;&nbsp;transCAD建模 确定底图以及底图配准 坐标变换等工作准备。', '2014-09-23 06:10:58', 136, 1, ''),
(613, 41, '编辑了任务', '2014-09-23 06:11:22', 136, 1, ''),
(614, 7, '修改了 2014-09-23 日志，任务状态为：完成100%，耗时：5.5小时&nbsp;&nbsp;根据于司长的要求进行修改，根据王所的要求进行了现有规划大纲与十二五的区别的梳理并修改ppt', '2014-09-23 10:38:46', 137, 1, ''),
(615, 7, '填写了 2014-09-23 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;消化资料', '2014-09-23 10:39:09', 65, 1, ''),
(616, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-24 01:38:31', 65, 1, ''),
(617, 10, '创建了任务', '2014-09-24 02:12:49', 153, 1, ''),
(618, 9, '填写了 2014-09-17 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<p>\r\n	湖北项目区域比较分析工作思路编写提交\r\n</p>', '2014-09-24 02:41:50', 97, 1, ''),
(619, 9, '填写了 2014-09-18 日志，任务状态为：进行中20%，耗时：4小时&nbsp;&nbsp;<p>\r\n	上午参加了东城区团委羽毛球比赛活动，下午湖北物流园区上报项目添加\r\n</p>', '2014-09-24 02:42:09', 97, 1, ''),
(620, 9, '填写了 2014-09-18 日志，任务状态为：进行中40%，耗时：8小时&nbsp;&nbsp;<p align="left">\r\n	湖北物流园区上报项目添加\r\n</p>', '2014-09-24 02:44:17', 145, 1, ''),
(621, 9, '填写了 2014-09-19 日志，任务状态为：完成100%，耗时：0小时&nbsp;&nbsp;<p>\r\n	完成湖北物流园区上报项目添加\r\n</p>', '2014-09-24 02:44:42', 145, 1, ''),
(622, 9, '修改了 2014-09-19 日志，任务状态为：完成100%，耗时：8小时&nbsp;&nbsp;<p>\r\n	完成湖北物流园区上报项目添加\r\n</p>', '2014-09-24 02:44:52', 145, 1, ''),
(623, 9, '修改了 2014-09-17 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<p>\r\n	湖北项目-区域比较分析工作思路填充内容、提交\r\n</p>', '2014-09-24 02:48:29', 97, 1, ''),
(624, 9, '填写了 2014-09-16 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;湖北项目 针对区域比较部分，参考阅读武汉及其他项目', '2014-09-24 02:50:35', 97, 1, ''),
(625, 9, '填写了 2014-09-23 日志，任务状态为：未开始，耗时：8小时&nbsp;&nbsp;<p>\r\n	transcad点线面建模研究，与地方联系确定收集底图\r\n</p>', '2014-09-24 02:56:08', 97, 1, ''),
(626, 9, '修改了 2014-09-23 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<p>\r\n	transcad点线面建模研究，与地方联系确定收集底图\r\n</p>', '2014-09-24 02:56:19', 97, 1, ''),
(627, 9, '填写了 2014-09-22 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;', '2014-09-24 02:59:42', 97, 1, ''),
(628, 9, '修改了 2014-09-22 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;<p>\r\n	<span>形势与需求分析工作大纲编写-社会经济趋势预测与分析</span>\r\n</p>', '2014-09-24 03:02:56', 97, 1, ''),
(629, 9, '创建了任务', '2014-09-24 03:39:10', 154, 1, ''),
(630, 41, '填写了 2014-09-24 日志，任务状态为：计划，耗时：4小时&nbsp;&nbsp;', '2014-09-24 05:49:30', 154, 1, ''),
(631, 3, '创建了任务', '2014-09-25 00:26:18', 155, 1, ''),
(632, 3, '填写了 2014-09-23 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;铁道部经规院中期评审会', '2014-09-25 00:26:46', 155, 1, ''),
(633, 3, '填写了 2014-09-22 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;联系开会事宜', '2014-09-25 00:27:02', 155, 1, ''),
(634, 3, '创建了任务', '2014-09-25 00:29:24', 156, 1, ''),
(635, 3, '填写了 2014-09-23 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;对接任务，整理资料', '2014-09-25 00:29:58', 156, 1, ''),
(636, 3, '填写了 2014-09-24 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;修改报告', '2014-09-25 00:31:11', 22, 1, ''),
(637, 3, '填写了 2014-09-24 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;<p>\r\n	修改工可及资金申请报告格式，准备打印；\r\n</p>\r\n<p>\r\n	编制西站物流节能材料。\r\n</p>', '2014-09-25 00:32:25', 75, 1, ''),
(638, 3, '填写了 2014-09-23 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;根据二审要求修改报告', '2014-09-25 00:33:25', 10, 1, ''),
(639, 3, '修改了 2014-09-23 日志，任务状态为：进行中，耗时：3.0小时&nbsp;&nbsp;根据二审要求修改报告、提交三审', '2014-09-25 00:33:35', 10, 1, ''),
(640, 3, '填写了 2014-09-23 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;对接项目进度及批复存在问题', '2014-09-25 00:34:41', 75, 1, ''),
(641, 3, '填写了 2014-09-22 日志，任务状态为：进行中，耗时：2.5小时&nbsp;&nbsp;大纲及内容调整', '2014-09-25 00:35:32', 76, 1, ''),
(642, 3, '填写了 2014-09-24 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;需求分析，流向图编制', '2014-09-25 00:37:00', 148, 1, ''),
(643, 3, '填写了 2014-09-23 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;湖北省物流通道空间拓扑图绘制', '2014-09-25 00:37:28', 148, 1, ''),
(644, 41, '填写了 2014-09-25 日志，任务状态为：进行中，耗时：6.5小时&nbsp;&nbsp;将公路铁路图配准。', '2014-09-25 01:40:18', 154, 1, ''),
(645, 7, '填写了 2014-09-24 日志，任务状态为：完成100%，耗时：6.5小时&nbsp;&nbsp;按照于司长的要求进行了部分内容的修改，下午参加部长专题会', '2014-09-25 05:56:22', 137, 1, ''),
(646, 7, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-25 05:56:34', 66, 1, ''),
(647, 7, '创建了任务', '2014-09-25 06:07:12', 157, 1, ''),
(648, 7, '填写了 2014-09-24 日志，任务状态为：完成100%，耗时：6小时&nbsp;&nbsp;加班6小时，完成李院长发言的ppt', '2014-09-25 06:07:38', 157, 1, ''),
(649, 7, '创建了任务', '2014-09-25 06:09:06', 158, 1, ''),
(650, 7, '填写了 2014-09-25 日志，任务状态为：完成100%，耗时：4小时&nbsp;&nbsp;陪同参会，完成！', '2014-09-25 06:09:23', 158, 1, ''),
(651, 4, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-25 06:16:31', 21, 1, ''),
(652, 4, '创建了任务', '2014-09-25 06:18:24', 159, 1, ''),
(653, 4, '创建了任务', '2014-09-25 06:20:23', 160, 1, ''),
(654, 4, '编辑了任务', '2014-09-25 06:21:28', 56, 1, ''),
(655, 4, '编辑了任务', '2014-09-25 06:22:05', 60, 1, ''),
(656, 4, '编辑了任务', '2014-09-25 06:22:50', 59, 1, ''),
(657, 4, '创建了任务', '2014-09-25 06:46:18', 161, 1, ''),
(658, 4, '填写了 2014-09-19 日志，任务状态为：完成100%，耗时：7.5小时&nbsp;&nbsp;参加会议，并领取分工任务', '2014-09-25 06:48:51', 159, 1, ''),
(659, 4, '填写了 2014-09-20 日志，任务状态为：进行中80%，耗时：4.5小时&nbsp;&nbsp;根据陈总的意见完善PPT', '2014-09-25 06:49:52', 161, 1, ''),
(660, 4, '填写了 2014-09-20 日志，任务状态为：进行中80%，耗时：4.5小时&nbsp;&nbsp;根据陈总的意见，进一步修改补充相关素材', '2014-09-25 06:50:51', 59, 1, ''),
(661, 4, '填写了 2014-09-17 日志，任务状态为：进行中60%，耗时：4小时&nbsp;&nbsp;接受甲方的附件，进行添加', '2014-09-25 06:51:32', 60, 1, ''),
(662, 4, '填写了 2014-09-17 日志，任务状态为：进行中60%，耗时：4小时&nbsp;&nbsp;对甲方发来的附件进行审查，核对，并提出相关后续补充的要求', '2014-09-25 06:52:16', 56, 1, ''),
(663, 4, '填写了 2014-09-21 日志，任务状态为：完成100%，耗时：4.5小时&nbsp;&nbsp;完成第一轮修改，添加了动画效果', '2014-09-25 06:53:32', 59, 1, ''),
(664, 4, '填写了 2014-09-22 日志，任务状态为：进行中80%，耗时：4.5小时&nbsp;&nbsp;项目组内部汇报演示，陈总和赵主任提出进一步的修改意见', '2014-09-25 06:54:20', 59, 1, ''),
(665, 4, '填写了 2014-09-24 日志，任务状态为：进行中80%，耗时：4.5小时&nbsp;&nbsp;根据最新的意见进行修改和完善', '2014-09-25 06:55:09', 59, 1, ''),
(666, 4, '填写了 2014-09-25 日志，任务状态为：完成100%，耗时：5小时&nbsp;&nbsp;进一步的修改完善，形成定稿！同步对报告进行了更新', '2014-09-25 06:55:42', 59, 1, ''),
(667, 4, '修改了 2014-09-21 日志，任务状态为：进行中60%，耗时：4.5小时&nbsp;&nbsp;完成第一轮修改，添加了动画效果', '2014-09-25 06:55:54', 59, 1, ''),
(668, 4, '填写了 2014-09-26 日志，任务状态为：完成100%，耗时：9.5小时&nbsp;&nbsp;完成甲方意见的征求，带上录音笔，记得录音', '2014-09-25 06:56:28', 56, 1, ''),
(669, 4, '填写了 2014-09-25 日志，任务状态为：进行中80%，耗时：4小时&nbsp;&nbsp;争取形成初步框架，提交给陆主任和陈总', '2014-09-25 06:57:01', 60, 1, ''),
(670, 4, '填写了 2014-09-22 日志，任务状态为：完成100%，耗时：2小时&nbsp;&nbsp;完成提交给刘所', '2014-09-25 07:07:38', 160, 1, ''),
(671, 4, '填写了 2014-09-23 日志，任务状态为：进行中60%，耗时：4小时&nbsp;&nbsp;完成相关素材', '2014-09-25 07:09:16', 60, 1, ''),
(672, 41, '创建了任务', '2014-09-26 01:31:10', 162, 1, ''),
(673, 41, '填写了 2014-09-26 日志，任务状态为：计划，耗时：0小时&nbsp;&nbsp;编写相关案例分析', '2014-09-26 01:31:31', 162, 1, ''),
(674, 10, '审核了任务，审核结果为：&nbsp;完成验收', '2014-09-28 02:26:29', 154, 1, ''),
(675, 9, '填写了 2014-09-24 日志，任务状态为：进行中80%，耗时：7小时&nbsp;&nbsp;<p>\r\n	客、货运枢纽发展目标的指导思想和基本原则\r\n</p>', '2014-09-28 02:35:00', 46, 1, ''),
(676, 9, '填写了 2014-09-25 日志，任务状态为：完成100%，耗时：7.5小时&nbsp;&nbsp;货运枢纽的发展定位 和战略目标', '2014-09-28 02:36:05', 46, 1, ''),
(677, 9, '编辑了任务', '2014-09-28 02:38:21', 46, 1, ''),
(678, 41, '修改了 2014-09-26 日志，任务状态为：完成100%，耗时：11小时&nbsp;&nbsp;编写相关案例分析', '2014-09-30 01:49:14', 162, 1, ''),
(679, 41, '填写了 2014-09-27 日志，任务状态为：未开始，耗时：14.5小时&nbsp;&nbsp;翻译加案例编写', '2014-09-30 01:49:27', 162, 1, ''),
(680, 41, '填写了 2014-09-28 日志，任务状态为：完成100%，耗时：16.5小时&nbsp;&nbsp;翻译', '2014-09-30 01:49:44', 162, 1, ''),
(681, 41, '修改了 2014-09-28 日志，任务状态为：完成100%，耗时：14.5小时&nbsp;&nbsp;翻译', '2014-09-30 01:49:58', 162, 1, ''),
(682, 41, '修改了 2014-09-27 日志，任务状态为：完成100%，耗时：14.5小时&nbsp;&nbsp;翻译加案例编写', '2014-09-30 01:50:05', 162, 1, ''),
(683, 41, '填写了 2014-09-30 日志，任务状态为：进行中，耗时：8小时&nbsp;&nbsp;湖北省省道图编画', '2014-09-30 01:51:15', 154, 1, ''),
(684, 4, '填写了 2014-09-28 日志，任务状态为：进行中80%，耗时：6小时&nbsp;&nbsp;消化资料，修改', '2014-09-30 01:57:07', 60, 1, ''),
(685, 4, '填写了 2014-09-29 日志，任务状态为：完成100%，耗时：6小时&nbsp;&nbsp;完成初稿', '2014-09-30 01:57:33', 60, 1, ''),
(686, 4, '编辑了任务', '2014-09-30 01:58:39', 86, 1, ''),
(687, 4, '填写了 2014-09-29 日志，任务状态为：进行中40%，耗时：1小时&nbsp;&nbsp;沟通协调下一步思想，国庆要加班', '2014-09-30 01:59:16', 86, 1, ''),
(688, 4, '填写了 2014-09-26 日志，任务状态为：完成100%，耗时：17小时&nbsp;&nbsp;完成与区长及各部门的沟通，当天来回', '2014-09-30 02:01:20', 161, 1, ''),
(689, 4, '编辑了任务', '2014-09-30 02:02:01', 59, 1, ''),
(690, 4, '创建了任务', '2014-09-30 02:03:42', 163, 1, ''),
(691, 4, '编辑了任务', '2014-09-30 02:04:58', 163, 1, ''),
(692, 4, '填写了 2014-09-28 日志，任务状态为：进行中20%，耗时：1.5小时&nbsp;&nbsp;<p>\r\n	沟通，索要相关部门的意见；\r\n</p>\r\n<p>\r\n	并反馈我们的基本处理态度\r\n</p>', '2014-09-30 02:06:13', 163, 1, ''),
(693, 4, '填写了 2014-09-21 日志，任务状态为：进行中60%，耗时：1.5小时&nbsp;&nbsp;撰写相关部分', '2014-09-30 02:07:12', 57, 1, ''),
(694, 4, '填写了 2014-09-22 日志，任务状态为：完成100%，耗时：1.5小时&nbsp;&nbsp;撰写完成相关内容，提交给刘所', '2014-09-30 02:07:40', 57, 1, ''),
(695, 4, '填写了 2014-09-23 日志，任务状态为：进行中60%，耗时：4小时&nbsp;&nbsp;<p>\r\n	继续消化吸收材料\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2014-09-30 02:08:17', 86, 1, ''),
(696, 4, '填写了 2014-09-30 日志，任务状态为：进行中40%，耗时：5小时&nbsp;&nbsp;去部里领取任务和要求', '2014-09-30 02:09:05', 86, 1, ''),
(697, 7, '审核了任务，审核结果为：&nbsp;完成验收', '2014-10-09 01:58:30', 158, 1, ''),
(698, 7, '审核了任务，审核结果为：&nbsp;完成验收', '2014-10-09 01:58:42', 157, 1, ''),
(699, 7, '创建了任务', '2014-10-09 02:03:41', 164, 1, ''),
(700, 7, '填写了 2014-10-08 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;研读相关材料，并初步确定该部分的编写思路。', '2014-10-09 02:04:16', 164, 1, ''),
(701, 7, '创建了任务', '2014-10-11 01:29:56', 165, 1, ''),
(702, 7, '填写了 2014-10-09 日志，任务状态为：进行中80%，耗时：6小时&nbsp;&nbsp;压缩的初步成果已经提交', '2014-10-11 01:30:30', 165, 1, ''),
(703, 7, '填写了 2014-10-09 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;整理9月24日专题汇报会的录音内容', '2014-10-11 01:32:12', 137, 1, ''),
(704, 7, '创建了任务', '2014-10-11 01:35:33', 166, 1, ''),
(705, 7, '填写了 2014-10-10 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;', '2014-10-11 01:35:45', 166, 1, ''),
(706, 3, '填写了 2014-09-26 日志，任务状态为：进行中，耗时：2小时&nbsp;&nbsp;', '2014-10-13 00:31:33', 22, 1, ''),
(707, 3, '填写了 2014-09-25 日志，任务状态为：进行中，耗时：6小时&nbsp;&nbsp;对接报告附件（名称声明），照片，制作项目PPT', '2014-10-13 00:34:16', 75, 1, ''),
(708, 3, '创建了任务', '2014-10-13 00:36:17', 167, 1, ''),
(709, 3, '填写了 2014-09-26 日志，任务状态为：进行中，耗时：6.5小时&nbsp;&nbsp;<p>\r\n	联系水运所、朱总、车辆，确定会议时间、地点\r\n</p>\r\n<p>\r\n	至发改委参会\r\n</p>\r\n<p>\r\n	整理会议纪要发王所\r\n</p>', '2014-10-13 00:39:31', 167, 1, ''),
(710, 3, '填写了 2014-10-06 日志，任务状态为：进行中，耗时：2.5小时&nbsp;&nbsp;根据三审要求修改报告', '2014-10-13 00:43:40', 22, 1, ''),
(711, 3, '填写了 2014-10-07 日志，任务状态为：进行中，耗时：5小时&nbsp;&nbsp;<span>根据三审要求修改报告</span>', '2014-10-13 00:43:58', 22, 1, ''),
(712, 4, '创建了任务', '2014-10-13 01:00:04', 168, 1, ''),
(713, 4, '审核了任务，审核结果为：&nbsp;完成验收 ，审核意见：这一次田野参与了比较多的具体工作', '2014-10-13 01:01:06', 57, 1, ''),
(714, 4, '填写了 2014-10-08 日志，任务状态为：进行中40%，耗时：3.5小时&nbsp;&nbsp;梳理甲方的意见，拟定修改工作的方案', '2014-10-13 01:02:45', 163, 1, ''),
(715, 4, '填写了 2014-10-10 日志，任务状态为：进行中40%，耗时：3.5小时&nbsp;&nbsp;讨论并落实相关工作安排', '2014-10-13 01:03:20', 163, 1, ''),
(716, 7, '填写了 2014-10-11 日志，任务状态为：进行中80%，耗时：7小时&nbsp;&nbsp;上午进行了部分ppt的修改，2小时，下午继续在18楼改稿子', '2014-10-13 01:03:23', 166, 1, ''),
(717, 4, '填写了 2014-10-11 日志，任务状态为：进行中60%，耗时：3小时&nbsp;&nbsp;与田野商讨交通衔接部分的修改方案，并将修改方案发给甲方，征求意见', '2014-10-13 01:04:30', 163, 1, ''),
(718, 4, '创建了任务', '2014-10-13 01:14:51', 169, 1, ''),
(719, 4, '创建了任务', '2014-10-13 01:37:44', 170, 1, ''),
(720, 4, '填写了 2014-10-08 日志，任务状态为：进行中20%，耗时：3.5小时&nbsp;&nbsp;', '2014-10-13 01:38:36', 170, 1, ''),
(721, 4, '填写了 2014-10-09 日志，任务状态为：进行中40%，耗时：6小时&nbsp;&nbsp;消化相关资料', '2014-10-13 01:39:51', 170, 1, ''),
(722, 4, '填写了 2014-10-10 日志，任务状态为：进行中40%，耗时：2.5小时&nbsp;&nbsp;', '2014-10-13 01:40:04', 170, 1, ''),
(723, 4, '创建了任务', '2014-10-13 03:26:23', 171, 1, ''),
(724, 7, '填写了 2014-10-13 日志，任务状态为：进行中80%，耗时：3.5小时&nbsp;&nbsp;ppt修改~', '2014-10-13 06:26:54', 166, 1, ''),
(725, 23, '创建了任务', '2015-01-05 05:09:57', 172, 1, ''),
(726, 23, '创建了任务', '2015-01-05 05:16:23', 173, 1, ''),
(727, 23, '审核了任务，审核结果为：&nbsp;完成验收', '2015-01-05 05:22:23', 172, 1, ''),
(728, 23, '审核了任务，审核结果为：&nbsp;完成验收', '2015-01-05 05:22:54', 173, 1, ''),
(729, 7, '创建了任务', '2015-01-06 00:41:47', 174, 1, ''),
(730, 7, '填写了 2015-01-05 日志，任务状态为：进行中80%，耗时：3小时&nbsp;&nbsp;', '2015-01-06 00:42:37', 174, 1, ''),
(731, 3, '编辑了任务', '2015-01-06 00:51:23', 76, 1, ''),
(732, 3, '创建了任务', '2015-01-06 03:27:54', 175, 1, ''),
(733, 3, '填写了 2015-01-05 日志，任务状态为：完成100%，耗时：1.5小时&nbsp;&nbsp;', '2015-01-06 03:28:12', 175, 1, ''),
(734, 3, '填写了 2015-01-04 日志，任务状态为：进行中40%，耗时：1小时&nbsp;&nbsp;', '2015-01-06 03:28:20', 175, 1, ''),
(735, 15, '填写了 2015-01-01 日志，任务状态为：完成100%，耗时：0小时&nbsp;&nbsp;', '2015-01-08 00:33:23', 121, 1, ''),
(736, 8, '审核了任务，审核结果为：&nbsp;完成验收', '2015-01-08 00:37:08', 133, 1, ''),
(737, 8, '审核了任务，审核结果为：&nbsp;完成验收', '2015-01-08 00:37:47', 162, 1, ''),
(738, 8, '审核了任务，审核结果为：&nbsp;完成验收', '2015-01-08 00:37:59', 14, 1, ''),
(739, 13, '创建了任务', '2015-01-08 00:49:55', 176, 1, ''),
(740, 13, '创建了任务', '2015-01-08 00:51:06', 177, 1, ''),
(741, 13, '创建了任务', '2015-01-08 00:53:43', 178, 1, ''),
(742, 30, '创建了任务', '2015-01-08 01:41:45', 179, 1, ''),
(743, 23, '创建了任务', '2015-01-09 00:43:57', 180, 1, ''),
(744, 30, '编辑了任务', '2015-01-28 07:02:13', 179, 1, ''),
(745, 30, '创建了任务', '2015-01-28 07:05:20', 181, 1, ''),
(746, 30, '创建了任务', '2015-01-28 07:08:30', 182, 1, ''),
(747, 30, '创建了任务', '2015-01-28 07:09:26', 183, 1, ''),
(748, 3, '创建了任务', '2015-02-05 09:51:00', 184, 1, ''),
(749, 3, '创建了任务', '2015-02-05 09:51:52', 185, 1, ''),
(750, 3, '填写了 2015-02-05 日志，任务状态为：完成100%，耗时：3小时&nbsp;&nbsp;', '2015-02-05 09:52:11', 184, 1, ''),
(751, 3, '创建了任务', '2015-02-05 09:55:58', 186, 1, ''),
(752, 15, '创建了任务', '2015-02-09 02:25:50', 187, 1, ''),
(753, 15, '创建了任务', '2015-02-09 02:26:34', 188, 1, ''),
(754, 15, '创建了任务', '2015-02-09 02:27:19', 189, 1, ''),
(755, 15, '创建了任务', '2015-02-09 02:29:43', 190, 1, ''),
(756, 15, '填写了 2015-02-09 日志，任务状态为：进行中，耗时：3小时&nbsp;&nbsp;', '2015-02-09 02:30:34', 190, 1, ''),
(757, 3, '创建了任务', '2015-03-04 09:57:41', 191, 1, ''),
(758, 3, '填写了 2015-03-04 日志，任务状态为：进行中，耗时：2.5小时&nbsp;&nbsp;物流通道三重大及铁路信息讨论，通道衔接三重大初稿', '2015-03-04 10:02:11', 191, 1, ''),
(759, 3, '创建了任务', '2015-03-04 10:04:18', 192, 1, ''),
(760, 3, '填写了 2015-03-03 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;至水规处修改材料', '2015-03-04 10:04:46', 192, 1, ''),
(761, 3, '编辑了任务', '2015-03-04 10:05:38', 76, 1, ''),
(762, 3, '填写了 2015-03-03 日志，任务状态为：进行中，耗时：1.5小时&nbsp;&nbsp;与方总讨论修改方案', '2015-03-04 10:06:21', 76, 1, ''),
(763, 3, '编辑了任务', '2015-03-04 10:07:09', 22, 1, ''),
(764, 3, '填写了 2015-03-03 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;修改报告', '2015-03-04 10:07:52', 22, 1, ''),
(765, 3, '填写了 2015-03-04 日志，任务状态为：进行中，耗时：4小时&nbsp;&nbsp;修改报告', '2015-03-04 10:08:09', 22, 1, ''),
(766, 3, '填写了 2015-03-02 日志，任务状态为：进行中，耗时：1小时&nbsp;&nbsp;修改报告', '2015-03-04 10:08:29', 22, 1, ''),
(767, 3, '填写了 2015-03-02 日志，任务状态为：进行中，耗时：5.5小时&nbsp;&nbsp;物流大通道数据分析，编制说明', '2015-03-04 10:09:01', 191, 1, ''),
(768, 3, '填写了 2015-03-04 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;核实2014年铁路相关数据', '2015-03-04 10:09:48', 192, 1, ''),
(769, 3, '修改了 2015-03-02 日志，任务状态为：进行中，耗时：5.5小时&nbsp;&nbsp;物流大通道数据分析，编制说明，准备中财办大通道材料', '2015-03-04 10:10:59', 191, 1, ''),
(770, 3, '创建了任务', '2015-03-04 10:13:50', 193, 1, ''),
(771, 3, '填写了 2015-03-03 日志，任务状态为：进行中，耗时：0.5小时&nbsp;&nbsp;铁路数据需求校核', '2015-03-04 10:14:18', 193, 1, ''),
(772, 3, '修改了 2015-03-04 日志，任务状态为：进行中，耗时：4.5小时&nbsp;&nbsp;修改报告', '2015-03-04 10:14:40', 22, 1, ''),
(773, 3, '修改了 2015-03-02 日志，任务状态为：进行中，耗时：6.5小时&nbsp;&nbsp;物流大通道数据分析，编制说明，准备中财办大通道材料', '2015-03-04 10:17:21', 191, 1, ''),
(774, 3, '修改了 2015-03-02 日志，任务状态为：进行中，耗时：6.5小时&nbsp;&nbsp;物流大通道数据分析，编制说明，准备中财办大通道材料，上下午各一次讨论会', '2015-03-04 10:18:00', 191, 1, ''),
(775, 18, '创建了任务', '2015-03-13 06:50:03', 194, 1, ''),
(776, 18, '创建了任务', '2015-03-13 06:51:41', 195, 1, ''),
(777, 3, '填写了 2015-03-23 日志，任务状态为：进行中，耗时：10小时&nbsp;&nbsp;物流大通道阈值分析，至综规司修改调研函（10：30-20：30）', '2015-03-25 00:26:03', 191, 1, ''),
(778, 3, '填写了 2015-03-24 日志，任务状态为：进行中，耗时：8.5小时&nbsp;&nbsp;集装箱流量流向分析，大通道阈值与结构集中讨论', '2015-03-25 00:26:55', 191, 1, ''),
(779, 18, '填写了 2015-04-02 日志，任务状态为：未开始，耗时：3.5小时&nbsp;&nbsp;完成开题评审', '2015-04-03 02:42:58', 194, 1, ''),
(780, 18, '填写了 2015-04-01 日志，任务状态为：进行中80%，耗时：0小时&nbsp;&nbsp;完成报告初稿', '2015-04-03 02:43:58', 195, 1, ''),
(781, 18, '修改了 2015-04-02 日志，任务状态为：进行中20%，耗时：3.5小时&nbsp;&nbsp;完成开题评审', '2015-04-03 02:44:44', 194, 1, ''),
(782, 1, '创建了任务', '2015-09-30 02:59:38', 196, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tk_manhour`
--

DROP TABLE IF EXISTS `tk_manhour`;
CREATE TABLE IF NOT EXISTS `tk_manhour` (
  `MHID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `manhour` text,
  `mh_year` text,
  `mh_mouth` text,
  `mh_backup1` text,
  `mh_backup2` text,
  PRIMARY KEY (`MHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_menu`
--

DROP TABLE IF EXISTS `tk_menu`;
CREATE TABLE IF NOT EXISTS `tk_menu` (
  `meid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_menu_title_cn` text,
  `tk_menu_title_en` text,
  `tk_menu_text_cn` text,
  `tk_menu_text_en` text,
  `tk_menu_sort` text,
  `tk_menu_status` text,
  `tk_menu_backup1` text,
  `tk_menu_backup2` text,
  PRIMARY KEY (`meid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_message`
--

DROP TABLE IF EXISTS `tk_message`;
CREATE TABLE IF NOT EXISTS `tk_message` (
  `meid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_mess_touser` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_mess_fromuser` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_mess_title` text CHARACTER SET utf8 NOT NULL,
  `tk_mess_text` text CHARACTER SET utf8,
  `tk_mess_status` tinyint(2) NOT NULL DEFAULT '1',
  `tk_mess_type` tinyint(2) NOT NULL DEFAULT '0',
  `tk_mess_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`meid`),
  KEY `tk_mess_touser` (`tk_mess_touser`),
  KEY `tk_mess_fromuser` (`tk_mess_fromuser`)
) ENGINE=InnoDB AUTO_INCREMENT=628 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tk_message`
--

INSERT INTO `tk_message` (`meid`, `tk_mess_touser`, `tk_mess_fromuser`, `tk_mess_title`, `tk_mess_text`, `tk_mess_status`, `tk_mess_type`, `tk_mess_time`) VALUES
(1, 3, 1, '指派给您一个新任务: <a href=''default_task_edit.php?editID=3&pagetab=mtask''>需求分析</a>', NULL, 1, 0, '2014-07-31 05:26:45'),
(2, 3, 1, '指派给您一个新任务: <a href=''default_task_edit.php?editID=4&pagetab=mtask''>布局方案</a>', NULL, 1, 0, '2014-07-31 05:27:40'),
(3, 3, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=5&pagetab=mtask''>需求分析</a>', NULL, 1, 0, '2014-07-31 05:36:10'),
(4, 7, 1, '指派给您一个新任务: <a href=''default_task_edit.php?editID=7&pagetab=mtask''>调研</a>', NULL, 1, 0, '2014-08-02 13:12:41'),
(6, 3, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=10&pagetab=mtask''>石河子项目一期资金申请报告</a>', NULL, 1, 0, '2014-08-13 04:30:44'),
(8, 9, 3, '指派给您一个新任务: <a href=''default_task_edit.php?editID=12&pagetab=mtask''>交通流线、投资估算与评价</a>', NULL, 1, 0, '2014-08-13 06:17:41'),
(9, 3, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=15&pagetab=mtask''>需求分析</a>', NULL, 1, 0, '2014-08-13 06:34:07'),
(12, 3, 4, '指派给您一个新任务: <a href=''default_task_edit.php?editID=21&pagetab=mtask''>汇报PPT的准备</a>', NULL, 1, 0, '2014-08-13 07:55:08'),
(20, 11, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=24&pagetab=ftask#log''>神华集团调研跟进</a>', NULL, 1, 0, '2014-08-18 07:38:52'),
(24, 3, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=12&pagetab=ftask#log''>交通流线、投资估算与评价</a>', NULL, 1, 0, '2014-08-19 03:08:03'),
(25, 3, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=12&pagetab=ftask#log''>交通流线、投资估算与评价</a>', NULL, 1, 0, '2014-08-19 03:08:35'),
(26, 3, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=12&pagetab=ftask#log''>交通流线、投资估算与评价</a>', NULL, 1, 0, '2014-08-19 03:08:48'),
(27, 3, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=12&pagetab=ftask#log''>交通流线、投资估算与评价</a>', NULL, 1, 0, '2014-08-19 03:11:08'),
(38, 11, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=24&pagetab=ftask#log''>神华集团调研跟进</a>', NULL, 1, 0, '2014-08-26 05:39:44'),
(40, 3, 2, '审核了您的任务: <a href=''default_task_edit.php?editID=31&pagetab=mtask''>回复提案</a>', NULL, 1, 0, '2014-08-27 02:27:50'),
(41, 11, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=24&pagetab=ftask#log''>神华集团调研跟进</a>', NULL, 1, 0, '2014-08-28 06:34:38'),
(42, 7, 4, '指派给您一个新任务: <a href=''default_task_edit.php?editID=63&pagetab=mtask''>行业典型技术机构认知座谈会</a>', NULL, 1, 0, '2014-08-29 03:24:32'),
(46, 4, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=63&pagetab=ftask#log''>行业典型技术机构认知座谈会</a>', NULL, 1, 0, '2014-09-01 02:33:06'),
(47, 6, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=55&pagetab=ftask#log''>申请书提交</a>', NULL, 1, 0, '2014-09-01 02:59:23'),
(48, 6, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=55&pagetab=ftask#log''>申请书提交</a>', NULL, 1, 0, '2014-09-01 02:59:31'),
(53, 6, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=58&pagetab=ftask#log''>所内工作机制的建立</a>', NULL, 1, 0, '2014-09-01 08:20:25'),
(54, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-01 08:21:45'),
(57, 11, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=24&pagetab=ftask#log''>神华集团调研跟进</a>', NULL, 1, 0, '2014-09-02 06:46:51'),
(58, 11, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=24&pagetab=ftask#log''>神华集团调研跟进</a>', NULL, 1, 0, '2014-09-02 06:47:16'),
(61, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=69&pagetab=ftask#log''>工作大纲内部讨论会</a>', NULL, 1, 0, '2014-09-02 10:04:07'),
(63, 3, 11, '审核了您的任务: <a href=''default_task_edit.php?editID=24&pagetab=mtask''>神华集团调研跟进</a>', NULL, 1, 0, '2014-09-04 08:07:04'),
(71, 11, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=76&pagetab=ftask#log''>铁路及轨道交通专题报告编制</a>', NULL, 1, 0, '2014-09-05 01:39:56'),
(73, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-05 02:20:00'),
(74, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-05 02:31:28'),
(75, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-05 05:22:57'),
(76, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-05 05:23:23'),
(77, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-05 05:24:31'),
(78, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-05 06:57:28'),
(79, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-09 00:44:35'),
(88, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-10 11:56:28'),
(89, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-10 11:56:46'),
(92, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-10 12:06:55'),
(93, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-10 12:07:07'),
(94, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-10 12:07:52'),
(95, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-10 12:08:01'),
(96, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-10 12:08:10'),
(97, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-10 12:08:27'),
(98, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-10 12:08:33'),
(100, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-10 12:15:45'),
(117, 4, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=93&pagetab=mtask''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:50:04'),
(120, 9, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=93&pagetab=mtask''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:50:04'),
(121, 7, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=93&pagetab=mtask''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:50:04'),
(122, 4, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=ftask#log''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:51:56'),
(125, 9, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=ftask#log''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:51:56'),
(126, 7, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=ftask#log''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:51:56'),
(127, 4, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=ftask#log''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:52:16'),
(130, 9, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=ftask#log''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:52:16'),
(131, 7, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=ftask#log''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:52:16'),
(132, 4, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=mtask''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:52:24'),
(135, 9, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=mtask''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:52:24'),
(136, 7, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=93&pagetab=mtask''>湖北项目组成立并启动</a>', NULL, 1, 0, '2014-09-11 02:52:24'),
(137, 4, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=94&pagetab=mtask''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:54:24'),
(139, 9, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=94&pagetab=mtask''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:54:25'),
(140, 7, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=94&pagetab=mtask''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:54:25'),
(141, 6, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=94&pagetab=mtask''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:54:25'),
(142, 4, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=94&pagetab=ftask#log''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:54:57'),
(144, 9, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=94&pagetab=ftask#log''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:54:57'),
(145, 7, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=94&pagetab=ftask#log''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:54:57'),
(146, 6, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=94&pagetab=ftask#log''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:54:57'),
(147, 4, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=94&pagetab=mtask''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:55:04'),
(149, 9, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=94&pagetab=mtask''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:55:04'),
(150, 7, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=94&pagetab=mtask''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:55:04'),
(151, 6, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=94&pagetab=mtask''>向省厅汇报前内部讨论</a>', NULL, 1, 0, '2014-09-11 02:55:04'),
(152, 4, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=95&pagetab=mtask''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:57:52'),
(154, 9, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=95&pagetab=mtask''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:57:52'),
(155, 7, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=95&pagetab=mtask''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:57:52'),
(156, 4, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=95&pagetab=ftask#log''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:58:28'),
(158, 9, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=95&pagetab=ftask#log''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:58:28'),
(159, 7, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=95&pagetab=ftask#log''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:58:28'),
(160, 4, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=95&pagetab=mtask''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:58:33'),
(162, 9, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=95&pagetab=mtask''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:58:33'),
(163, 7, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=95&pagetab=mtask''>省厅汇报后内部通气会</a>', NULL, 1, 0, '2014-09-11 02:58:33'),
(164, 9, 10, '指派给您一个新任务: <a href=''default_task_edit.php?editID=97&pagetab=mtask''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-11 03:28:50'),
(165, 6, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=87&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-11 03:29:39'),
(169, 6, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=98&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 01:48:28'),
(174, 6, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 02:03:43'),
(178, 6, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 02:03:54'),
(181, 6, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=87&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 03:21:18'),
(182, 3, 14, '指派给您一个新任务: <a href=''default_task_edit.php?editID=104&pagetab=mtask''>专题一</a>', NULL, 1, 0, '2014-09-12 03:26:14'),
(187, 19, 10, '指派给您一个新任务: <a href=''default_task_edit.php?editID=106&pagetab=mtask''>财务及评价</a>', NULL, 1, 0, '2014-09-12 05:20:51'),
(192, 13, 10, '指派给您一个新任务: <a href=''default_task_edit.php?editID=109&pagetab=mtask''>总报告编制</a>', NULL, 1, 0, '2014-09-12 06:02:18'),
(193, 8, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=109&pagetab=mtask''>总报告编制</a>', NULL, 1, 0, '2014-09-12 06:02:18'),
(194, 13, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=109&pagetab=mtask''>总报告编制</a>', NULL, 1, 0, '2014-09-12 06:02:18'),
(196, 6, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=109&pagetab=mtask''>总报告编制</a>', NULL, 1, 0, '2014-09-12 06:02:18'),
(198, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:03:33'),
(199, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:03:33'),
(200, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:03:33'),
(202, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:04:25'),
(203, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:04:25'),
(204, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:04:25'),
(206, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:04:45'),
(207, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:04:45'),
(208, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:04:45'),
(210, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:05:22'),
(211, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:05:23'),
(212, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:05:23'),
(214, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:05:45'),
(215, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:05:46'),
(216, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:05:46'),
(218, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:06:19'),
(219, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:06:19'),
(220, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:06:19'),
(222, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:06:54'),
(223, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:06:54'),
(224, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:06:54'),
(226, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:07:18'),
(227, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:07:18'),
(228, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:07:18'),
(230, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:08:36'),
(231, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:08:36'),
(232, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:08:36'),
(234, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:08:56'),
(235, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:08:56'),
(236, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:08:56'),
(238, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:09:44'),
(239, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:09:44'),
(240, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:09:44'),
(242, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:02'),
(243, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:02'),
(244, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:02'),
(246, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:26'),
(247, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:26'),
(248, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:26'),
(250, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:41'),
(251, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:41'),
(252, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:41'),
(254, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:58'),
(255, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:58'),
(256, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:10:58'),
(258, 4, 31, '指派给您一个新任务: <a href=''default_task_edit.php?editID=110&pagetab=mtask''>经济社会发展趋势及需求分析</a>', NULL, 1, 0, '2014-09-12 06:11:32'),
(260, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:11:43'),
(261, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:11:43'),
(262, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:11:43'),
(264, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:12:04'),
(265, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:12:04'),
(266, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:12:05'),
(268, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:12:44'),
(269, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:12:44'),
(270, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:12:44'),
(272, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:13:01'),
(273, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:13:01'),
(274, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=ftask#log''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:13:01'),
(276, 8, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=mtask''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:13:06'),
(277, 13, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=mtask''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:13:06'),
(278, 14, 10, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=108&pagetab=mtask''>项目调研</a>', NULL, 1, 0, '2014-09-12 06:13:06'),
(280, 8, 31, '指派给您一个新任务: <a href=''default_task_edit.php?editID=111&pagetab=mtask''>物流通道及支持保障系统规划</a>', NULL, 1, 0, '2014-09-12 06:15:24'),
(284, 26, 31, '指派给您一个新任务: <a href=''default_task_edit.php?editID=113&pagetab=mtask''>附图绘制</a>', NULL, 1, 0, '2014-09-12 06:17:26'),
(286, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:24:48'),
(287, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:24:48'),
(288, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:24:48'),
(289, 6, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:24:48'),
(291, 8, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:25:02'),
(292, 13, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:25:02'),
(293, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:25:02'),
(294, 6, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=98&pagetab=ftask#log''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:25:02'),
(297, 21, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=116&pagetab=mtask''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:39:40'),
(298, 14, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=116&pagetab=mtask''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:39:40'),
(299, 15, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=116&pagetab=mtask''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:39:40'),
(300, 15, 10, '指派给您一个新任务: <a href=''default_task_edit.php?editID=117&pagetab=mtask''>需求分析</a>', NULL, 1, 0, '2014-09-12 06:40:56'),
(301, 21, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=117&pagetab=mtask''>需求分析</a>', NULL, 1, 0, '2014-09-12 06:40:56'),
(302, 14, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=117&pagetab=mtask''>需求分析</a>', NULL, 1, 0, '2014-09-12 06:40:56'),
(303, 15, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=117&pagetab=mtask''>需求分析</a>', NULL, 1, 0, '2014-09-12 06:40:56'),
(305, 21, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=116&pagetab=ftask#log''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:41:08'),
(306, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=116&pagetab=ftask#log''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:41:08'),
(307, 15, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=116&pagetab=ftask#log''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:41:08'),
(308, 14, 10, '指派给您一个新任务: <a href=''default_task_edit.php?editID=118&pagetab=mtask''>单体规划</a>', NULL, 1, 0, '2014-09-12 06:41:49'),
(309, 21, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=119&pagetab=mtask''>研究总报告编制</a>', NULL, 1, 0, '2014-09-12 06:45:43'),
(310, 14, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=119&pagetab=mtask''>研究总报告编制</a>', NULL, 1, 0, '2014-09-12 06:45:43'),
(313, 21, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=120&pagetab=mtask''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:46:51'),
(314, 14, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=120&pagetab=mtask''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:46:51'),
(315, 15, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=120&pagetab=mtask''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:46:51'),
(316, 31, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=120&pagetab=mtask''>规划编制指南</a>', NULL, 1, 0, '2014-09-12 06:46:51'),
(317, 15, 10, '指派给您一个新任务: <a href=''default_task_edit.php?editID=121&pagetab=mtask''>需求专题</a>', NULL, 1, 0, '2014-09-12 06:47:51'),
(318, 14, 10, '指派给您一个新任务: <a href=''default_task_edit.php?editID=122&pagetab=mtask''>单体规划专题</a>', NULL, 1, 0, '2014-09-12 06:48:39'),
(320, 21, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=124&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:50:25'),
(321, 14, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=124&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:50:25'),
(322, 15, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=124&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:50:25'),
(324, 31, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=124&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-12 06:50:25'),
(325, 31, 10, '指派给您一个新任务: <a href=''default_task_edit.php?editID=125&pagetab=mtask''>示范应用</a>', NULL, 1, 0, '2014-09-12 06:51:06'),
(326, 21, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=119&pagetab=ftask#log''>研究总报告编制</a>', NULL, 1, 0, '2014-09-12 06:58:02'),
(327, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=119&pagetab=ftask#log''>研究总报告编制</a>', NULL, 1, 0, '2014-09-12 06:58:02'),
(329, 31, 10, '审核了您的任务: <a href=''default_task_edit.php?editID=125&pagetab=mtask''>示范应用</a>', NULL, 1, 0, '2014-09-12 07:00:19'),
(330, 7, 10, '审核了您的任务: <a href=''default_task_edit.php?editID=70&pagetab=mtask''>综合运输经济室头脑风暴会参会</a>', NULL, 1, 0, '2014-09-12 07:02:29'),
(331, 32, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=127&pagetab=mtask''>起草战略合作协议</a>', NULL, 1, 0, '2014-09-12 07:07:42'),
(334, 41, 10, '审核了您的任务: <a href=''default_task_edit.php?editID=128&pagetab=mtask''>综合运输经济室头脑风暴会参会</a>', NULL, 1, 0, '2014-09-12 08:04:28'),
(336, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-12 09:00:54'),
(337, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-12 09:01:14'),
(338, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-12 09:01:50'),
(339, 6, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=134&pagetab=mtask''>工作大纲稿子和ppt院内部讨论</a>', NULL, 1, 0, '2014-09-12 09:04:00'),
(340, 6, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=134&pagetab=ftask#log''>工作大纲稿子和ppt院内部讨论</a>', NULL, 1, 0, '2014-09-12 09:04:15'),
(341, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-12 09:04:34'),
(342, 9, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=136&pagetab=ftask#log''>总量预测</a>', NULL, 1, 0, '2014-09-16 02:32:30'),
(346, 14, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-16 02:38:57'),
(348, 14, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-16 02:52:05'),
(351, 9, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=136&pagetab=ftask#log''>总量预测</a>', NULL, 1, 0, '2014-09-16 08:13:19'),
(352, 9, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=136&pagetab=ftask#log''>总量预测</a>', NULL, 1, 0, '2014-09-17 04:07:59'),
(353, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-17 06:40:15'),
(354, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-17 06:40:54'),
(355, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=72&pagetab=ftask#log''>重庆市综合交通运输“十三五”发展规划研究工作大纲（第四轮修改）</a>', NULL, 1, 0, '2014-09-17 06:42:17'),
(356, 6, 7, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=134&pagetab=mtask''>工作大纲稿子和ppt院内部讨论</a>', NULL, 1, 0, '2014-09-17 06:42:44'),
(357, 33, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=137&pagetab=mtask''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-17 06:47:03'),
(358, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-17 06:47:55'),
(359, 33, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-17 06:47:55'),
(360, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-17 06:48:29'),
(361, 33, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-17 06:48:29'),
(363, 6, 1, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=138&pagetab=mtask''>上海江苏片区调研</a>', NULL, 1, 0, '2014-09-18 00:38:40'),
(364, 2, 1, '指派给您一个新任务: <a href=''default_task_edit.php?editID=139&pagetab=mtask''>上海南京调研</a>', NULL, 1, 0, '2014-09-18 00:39:30'),
(365, 6, 1, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=139&pagetab=mtask''>上海南京调研</a>', NULL, 1, 0, '2014-09-18 00:39:30'),
(366, 2, 1, '指派给您一个新任务: <a href=''default_task_edit.php?editID=140&pagetab=mtask''>上海、镇江、南京实地调研</a>', NULL, 1, 0, '2014-09-18 00:41:04'),
(367, 6, 1, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=140&pagetab=mtask''>上海、镇江、南京实地调研</a>', NULL, 1, 0, '2014-09-18 00:41:04'),
(368, 2, 1, '指派给您一个新任务: <a href=''default_task_edit.php?editID=141&pagetab=mtask''>编写出差报告</a>', NULL, 1, 0, '2014-09-18 00:42:00'),
(369, 6, 1, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=141&pagetab=mtask''>编写出差报告</a>', NULL, 1, 0, '2014-09-18 00:42:00'),
(370, 2, 1, '指派给您一个新任务: <a href=''default_task_edit.php?editID=142&pagetab=mtask''>完成征求意见稿</a>', NULL, 1, 0, '2014-09-18 00:44:31'),
(372, 9, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=144&pagetab=mtask''>协助完成transcad建模</a>', NULL, 1, 0, '2014-09-18 00:53:40'),
(373, 9, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=145&pagetab=mtask''>transcad建模</a>', NULL, 1, 0, '2014-09-18 00:54:44'),
(374, 41, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=146&pagetab=mtask''>transcad建模</a>', NULL, 1, 0, '2014-09-18 00:55:27'),
(375, 14, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=147&pagetab=mtask''>项目表、分期实施、建设重点等</a>', NULL, 1, 0, '2014-09-18 00:56:35'),
(376, 3, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=148&pagetab=mtask''>需求分析修改</a>', NULL, 1, 0, '2014-09-18 00:57:11'),
(377, 6, 2, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=140&pagetab=ftask#log''>上海、镇江、南京实地调研</a>', NULL, 1, 0, '2014-09-18 01:02:04'),
(378, 6, 2, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=140&pagetab=ftask#log''>上海、镇江、南京实地调研</a>', NULL, 1, 0, '2014-09-18 01:02:12'),
(379, 6, 2, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=140&pagetab=ftask#log''>上海、镇江、南京实地调研</a>', NULL, 1, 0, '2014-09-18 01:02:21'),
(380, 21, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=151&pagetab=mtask''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:04:26'),
(381, 14, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=151&pagetab=mtask''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:04:26'),
(382, 15, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=151&pagetab=mtask''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:04:26'),
(383, 23, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=151&pagetab=mtask''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:04:26'),
(384, 2, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=151&pagetab=mtask''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:04:26'),
(385, 21, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=151&pagetab=ftask#log''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:06:09'),
(386, 14, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=151&pagetab=ftask#log''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:06:09'),
(387, 15, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=151&pagetab=ftask#log''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:06:09'),
(388, 23, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=151&pagetab=ftask#log''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:06:09'),
(389, 2, 10, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=151&pagetab=ftask#log''>验收工作</a>', NULL, 1, 0, '2014-09-18 01:06:09'),
(390, 6, 2, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=141&pagetab=ftask#log''>编写出差报告</a>', NULL, 1, 0, '2014-09-18 01:08:37'),
(391, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-18 01:42:24'),
(394, 2, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=54&pagetab=ftask#log''>答复主办提案</a>', NULL, 1, 0, '2014-09-18 02:12:37'),
(395, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-18 06:45:55'),
(396, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-18 08:53:20'),
(397, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-19 06:59:35'),
(398, 33, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-19 06:59:35'),
(399, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-19 07:45:57'),
(400, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-19 07:46:16'),
(401, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-19 07:46:24'),
(402, 8, 2, '指派给您一个新任务: <a href=''default_task_edit.php?editID=152&pagetab=mtask''>国内外经验借鉴</a>', NULL, 1, 0, '2014-09-19 08:16:57'),
(403, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-22 04:13:42'),
(404, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-22 04:14:04'),
(406, 14, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-22 06:28:15'),
(407, 10, 3, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-22 06:28:15'),
(408, 14, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-22 06:28:21'),
(409, 14, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-22 06:28:48'),
(410, 10, 3, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-22 06:28:48'),
(411, 14, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-22 06:29:57'),
(412, 10, 3, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=104&pagetab=ftask#log''>专题一</a>', NULL, 1, 0, '2014-09-22 06:29:57'),
(413, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=75&pagetab=ftask#log''>修改资金申请报告</a>', NULL, 1, 0, '2014-09-22 06:32:06'),
(414, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=75&pagetab=ftask#log''>修改资金申请报告</a>', NULL, 1, 0, '2014-09-22 06:34:26'),
(415, 2, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=146&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-22 07:00:51'),
(416, 10, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=65&pagetab=ftask#log''>通道及线网布局规划-专题</a>', NULL, 1, 0, '2014-09-22 09:08:39'),
(417, 10, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=65&pagetab=ftask#log''>通道及线网布局规划-专题</a>', NULL, 1, 0, '2014-09-22 09:08:51'),
(418, 10, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=65&pagetab=ftask#log''>通道及线网布局规划-专题</a>', NULL, 1, 0, '2014-09-22 09:09:14'),
(419, 10, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=65&pagetab=ftask#log''>通道及线网布局规划-专题</a>', NULL, 1, 0, '2014-09-22 09:09:41'),
(420, 10, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=65&pagetab=ftask#log''>通道及线网布局规划-专题</a>', NULL, 1, 0, '2014-09-22 09:09:49'),
(421, 10, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=65&pagetab=ftask#log''>通道及线网布局规划-专题</a>', NULL, 1, 0, '2014-09-22 09:10:21'),
(422, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-23 05:58:43'),
(423, 33, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-23 05:58:43'),
(424, 9, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=136&pagetab=ftask#log''>总量预测</a>', NULL, 1, 0, '2014-09-23 06:10:59'),
(425, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-23 10:38:46'),
(426, 10, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=65&pagetab=ftask#log''>通道及线网布局规划-专题</a>', NULL, 1, 0, '2014-09-23 10:39:09'),
(427, 7, 10, '审核了您的任务: <a href=''default_task_edit.php?editID=65&pagetab=mtask''>通道及线网布局规划-专题</a>', NULL, 1, 0, '2014-09-24 01:38:31'),
(428, 6, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=153&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-24 02:12:49'),
(429, 32, 10, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=153&pagetab=mtask''>项目工作管理</a>', NULL, 1, 0, '2014-09-24 02:12:50'),
(430, 10, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=97&pagetab=ftask#log''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-24 02:41:50'),
(431, 10, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=97&pagetab=ftask#log''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-24 02:42:09'),
(432, 2, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=145&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-24 02:44:17'),
(433, 2, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=145&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-24 02:44:42'),
(434, 2, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=145&pagetab=ftask#log''>transcad建模</a>', NULL, 1, 0, '2014-09-24 02:44:52'),
(435, 10, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=97&pagetab=ftask#log''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-24 02:48:29'),
(436, 10, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=97&pagetab=ftask#log''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-24 02:50:35'),
(437, 10, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=97&pagetab=ftask#log''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-24 02:56:08'),
(438, 10, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=97&pagetab=ftask#log''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-24 02:56:19'),
(439, 10, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=97&pagetab=ftask#log''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-24 02:59:43'),
(440, 10, 9, '更新了来自您的任务: <a href=''default_task_edit.php?editID=97&pagetab=ftask#log''>比较分析与需求分析及预测</a>', NULL, 1, 0, '2014-09-24 03:02:56'),
(441, 41, 9, '指派给您一个新任务: <a href=''default_task_edit.php?editID=154&pagetab=mtask''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-24 03:39:10'),
(442, 10, 9, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=154&pagetab=mtask''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-24 03:39:10'),
(443, 9, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=154&pagetab=ftask#log''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-24 05:49:30'),
(444, 10, 41, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=154&pagetab=ftask#log''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-24 05:49:31'),
(445, 2, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=155&pagetab=ftask#log''>发展形势与要求</a>', NULL, 1, 0, '2014-09-25 00:26:46'),
(446, 2, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=155&pagetab=ftask#log''>发展形势与要求</a>', NULL, 1, 0, '2014-09-25 00:27:02'),
(447, 6, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=156&pagetab=ftask#log''>论文修改</a>', NULL, 1, 0, '2014-09-25 00:29:58'),
(448, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=22&pagetab=ftask#log''>需求分析</a>', NULL, 1, 0, '2014-09-25 00:31:11'),
(449, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=75&pagetab=ftask#log''>修改资金申请报告</a>', NULL, 1, 0, '2014-09-25 00:32:25'),
(450, 2, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=10&pagetab=ftask#log''>石河子项目一期资金申请报告</a>', NULL, 1, 0, '2014-09-25 00:33:25'),
(451, 2, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=10&pagetab=ftask#log''>石河子项目一期资金申请报告</a>', NULL, 1, 0, '2014-09-25 00:33:35'),
(452, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=75&pagetab=ftask#log''>修改资金申请报告</a>', NULL, 1, 0, '2014-09-25 00:34:41'),
(453, 11, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=76&pagetab=ftask#log''>铁路及轨道交通专题报告编制</a>', NULL, 1, 0, '2014-09-25 00:35:32'),
(454, 2, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=148&pagetab=ftask#log''>需求分析修改</a>', NULL, 1, 0, '2014-09-25 00:37:00'),
(455, 2, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=148&pagetab=ftask#log''>需求分析修改</a>', NULL, 1, 0, '2014-09-25 00:37:28'),
(456, 9, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=154&pagetab=ftask#log''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-25 01:40:18'),
(457, 10, 41, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=154&pagetab=ftask#log''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-25 01:40:19'),
(458, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-25 05:56:22'),
(459, 33, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-09-25 05:56:22'),
(460, 33, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=157&pagetab=mtask''>部党组2014年第7次党组中心组学习PPT准备</a>', NULL, 1, 0, '2014-09-25 06:07:13'),
(461, 33, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=157&pagetab=ftask#log''>部党组2014年第7次党组中心组学习PPT准备</a>', NULL, 1, 0, '2014-09-25 06:07:38'),
(462, 38, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=159&pagetab=mtask''>参加企业和省厅座谈会</a>', NULL, 1, 0, '2014-09-25 06:18:25'),
(463, 22, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=159&pagetab=mtask''>参加企业和省厅座谈会</a>', NULL, 1, 0, '2014-09-25 06:18:25'),
(464, 38, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=160&pagetab=mtask''>编制完成“关于行业前期工作”的建议</a>', NULL, 1, 0, '2014-09-25 06:20:23'),
(465, 22, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=160&pagetab=mtask''>编制完成“关于行业前期工作”的建议</a>', NULL, 1, 0, '2014-09-25 06:20:23'),
(466, 20, 11, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-25 06:22:05'),
(467, 20, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=161&pagetab=mtask''>送审稿征求意见会</a>', NULL, 1, 0, '2014-09-25 06:46:18'),
(468, 38, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=159&pagetab=ftask#log''>参加企业和省厅座谈会</a>', NULL, 1, 0, '2014-09-25 06:48:51'),
(469, 22, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=159&pagetab=ftask#log''>参加企业和省厅座谈会</a>', NULL, 1, 0, '2014-09-25 06:48:51'),
(470, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=161&pagetab=ftask#log''>送审稿征求意见会</a>', NULL, 1, 0, '2014-09-25 06:49:52'),
(471, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-25 06:51:32'),
(472, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-25 06:51:32'),
(473, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-25 06:57:01'),
(474, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-25 06:57:01'),
(475, 38, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=160&pagetab=ftask#log''>编制完成“关于行业前期工作”的建议</a>', NULL, 1, 0, '2014-09-25 07:07:38'),
(476, 22, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=160&pagetab=ftask#log''>编制完成“关于行业前期工作”的建议</a>', NULL, 1, 0, '2014-09-25 07:07:38'),
(477, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-25 07:09:16'),
(478, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-25 07:09:16'),
(479, 29, 41, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=162&pagetab=mtask''>填写案例</a>', NULL, 1, 0, '2014-09-26 01:31:10'),
(480, 8, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-26 01:31:31'),
(481, 29, 41, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-26 01:31:31'),
(482, 41, 10, '审核了您的任务: <a href=''default_task_edit.php?editID=154&pagetab=mtask''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-28 02:26:29'),
(483, 8, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-30 01:49:14'),
(484, 8, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-30 01:49:27'),
(485, 29, 41, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-30 01:49:27'),
(486, 8, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-30 01:49:45'),
(487, 29, 41, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-30 01:49:45'),
(488, 8, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-30 01:49:58'),
(489, 8, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=162&pagetab=ftask#log''>填写案例</a>', NULL, 1, 0, '2014-09-30 01:50:05'),
(490, 9, 41, '更新了来自您的任务: <a href=''default_task_edit.php?editID=154&pagetab=ftask#log''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-30 01:51:15'),
(491, 10, 41, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=154&pagetab=ftask#log''>transcad 点线面建模</a>', NULL, 1, 0, '2014-09-30 01:51:15'),
(492, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-30 01:57:07'),
(493, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-30 01:57:07'),
(494, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-30 01:57:33'),
(495, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=60&pagetab=ftask#log''>水运发展思路初稿</a>', NULL, 1, 0, '2014-09-30 01:57:33'),
(496, 10, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=86&pagetab=ftask#log''>三季度政务分析报告</a>', NULL, 1, 0, '2014-09-30 01:58:39'),
(497, 10, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=86&pagetab=ftask#log''>三季度政务分析报告</a>', NULL, 1, 0, '2014-09-30 01:59:16'),
(498, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=161&pagetab=ftask#log''>送审稿征求意见会</a>', NULL, 1, 0, '2014-09-30 02:01:20'),
(499, 20, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=163&pagetab=mtask''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:03:42'),
(500, 38, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=163&pagetab=mtask''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:03:42'),
(501, 39, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=163&pagetab=mtask''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:03:42'),
(502, 3, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=163&pagetab=mtask''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:03:43'),
(503, 2, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=163&pagetab=mtask''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:03:43'),
(504, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:04:58'),
(505, 38, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:04:58'),
(506, 39, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:04:58'),
(507, 3, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:04:58'),
(508, 2, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:04:58'),
(509, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:06:13'),
(510, 38, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:06:13'),
(511, 39, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:06:13'),
(512, 3, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:06:13'),
(513, 2, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-09-30 02:06:13'),
(514, 10, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=86&pagetab=ftask#log''>三季度政务分析报告</a>', NULL, 1, 0, '2014-09-30 02:08:17'),
(515, 10, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=86&pagetab=ftask#log''>三季度政务分析报告</a>', NULL, 1, 0, '2014-09-30 02:09:05'),
(516, 33, 7, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=157&pagetab=mtask''>部党组2014年第7次党组中心组学习PPT准备</a>', NULL, 1, 0, '2014-10-09 01:58:42'),
(517, 11, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=164&pagetab=ftask#log''>宁波与计划单列市交通发展现状及规划情况对比</a>', NULL, 1, 0, '2014-10-09 02:04:16'),
(518, 4, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=165&pagetab=mtask''>简本压缩</a>', NULL, 1, 0, '2014-10-11 01:29:56'),
(519, 13, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=165&pagetab=mtask''>简本压缩</a>', NULL, 1, 0, '2014-10-11 01:29:56');
INSERT INTO `tk_message` (`meid`, `tk_mess_touser`, `tk_mess_fromuser`, `tk_mess_title`, `tk_mess_text`, `tk_mess_status`, `tk_mess_type`, `tk_mess_time`) VALUES
(520, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=165&pagetab=ftask#log''>简本压缩</a>', NULL, 1, 0, '2014-10-11 01:30:30'),
(521, 4, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=165&pagetab=ftask#log''>简本压缩</a>', NULL, 1, 0, '2014-10-11 01:30:31'),
(522, 13, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=165&pagetab=ftask#log''>简本压缩</a>', NULL, 1, 0, '2014-10-11 01:30:31'),
(523, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-10-11 01:32:12'),
(524, 33, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=137&pagetab=ftask#log''>综合交通运输体系“十三五”发展规划基本思路（初稿）汇报准备</a>', NULL, 1, 0, '2014-10-11 01:32:12'),
(525, 13, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=166&pagetab=mtask''>根据部长专题会后的意见进行修改</a>', NULL, 1, 0, '2014-10-11 01:35:33'),
(526, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=166&pagetab=ftask#log''>根据部长专题会后的意见进行修改</a>', NULL, 1, 0, '2014-10-11 01:35:45'),
(527, 13, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=166&pagetab=ftask#log''>根据部长专题会后的意见进行修改</a>', NULL, 1, 0, '2014-10-11 01:35:45'),
(528, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=22&pagetab=ftask#log''>需求分析</a>', NULL, 1, 0, '2014-10-13 00:31:33'),
(529, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=75&pagetab=ftask#log''>修改资金申请报告</a>', NULL, 1, 0, '2014-10-13 00:34:16'),
(530, 6, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=167&pagetab=ftask#log''>布置任务会</a>', NULL, 1, 0, '2014-10-13 00:39:31'),
(531, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=22&pagetab=ftask#log''>需求分析</a>', NULL, 1, 0, '2014-10-13 00:43:40'),
(532, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=22&pagetab=ftask#log''>需求分析</a>', NULL, 1, 0, '2014-10-13 00:43:58'),
(533, 3, 4, '指派给您一个新任务: <a href=''default_task_edit.php?editID=168&pagetab=mtask''>铁路部分的修改</a>', NULL, 1, 0, '2014-10-13 01:00:04'),
(534, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:02:45'),
(535, 38, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:02:46'),
(536, 39, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:02:46'),
(537, 3, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:02:46'),
(538, 2, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:02:46'),
(539, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:03:20'),
(540, 38, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:03:20'),
(541, 39, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:03:20'),
(542, 3, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:03:20'),
(543, 2, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:03:20'),
(544, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=166&pagetab=ftask#log''>根据部长专题会后的意见进行修改</a>', NULL, 1, 0, '2014-10-13 01:03:23'),
(545, 13, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=166&pagetab=ftask#log''>根据部长专题会后的意见进行修改</a>', NULL, 1, 0, '2014-10-13 01:03:23'),
(546, 20, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:04:30'),
(547, 38, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:04:30'),
(548, 39, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:04:30'),
(549, 3, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:04:30'),
(550, 2, 4, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=163&pagetab=ftask#log''>送审稿征求意见后修改</a>', NULL, 1, 0, '2014-10-13 01:04:30'),
(551, 38, 4, '指派给您一个新任务: <a href=''default_task_edit.php?editID=169&pagetab=mtask''>交通规划部分的修改</a>', NULL, 1, 0, '2014-10-13 01:14:51'),
(552, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=170&pagetab=ftask#log''>初稿修改</a>', NULL, 1, 0, '2014-10-13 01:38:36'),
(553, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=170&pagetab=ftask#log''>初稿修改</a>', NULL, 1, 0, '2014-10-13 01:39:51'),
(554, 11, 4, '更新了来自您的任务: <a href=''default_task_edit.php?editID=170&pagetab=ftask#log''>初稿修改</a>', NULL, 1, 0, '2014-10-13 01:40:04'),
(555, 9, 4, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=171&pagetab=mtask''>临时性任务-江苏十三五规划思路竞争性谈判文件制作</a>', NULL, 1, 0, '2014-10-13 03:26:23'),
(556, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=166&pagetab=ftask#log''>根据部长专题会后的意见进行修改</a>', NULL, 1, 0, '2014-10-13 06:26:54'),
(557, 13, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=166&pagetab=ftask#log''>根据部长专题会后的意见进行修改</a>', NULL, 1, 0, '2014-10-13 06:26:55'),
(558, 37, 23, '指派给您一个新任务: <a href=''default_task_edit.php?editID=172&pagetab=mtask''>工作目标任务梳理</a>', NULL, 1, 0, '2015-01-05 05:09:57'),
(559, 37, 23, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=173&pagetab=mtask''>第三季度督查分析报告编制</a>', NULL, 1, 0, '2015-01-05 05:16:23'),
(560, 37, 23, '审核了您的任务: <a href=''default_task_edit.php?editID=172&pagetab=mtask''>工作目标任务梳理</a>', NULL, 1, 0, '2015-01-05 05:22:23'),
(561, 37, 23, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=173&pagetab=mtask''>第三季度督查分析报告编制</a>', NULL, 1, 0, '2015-01-05 05:22:54'),
(562, 13, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=174&pagetab=mtask''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:41:48'),
(563, 35, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=174&pagetab=mtask''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:41:48'),
(564, 39, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=174&pagetab=mtask''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:41:48'),
(565, 15, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=174&pagetab=mtask''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:41:48'),
(566, 25, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=174&pagetab=mtask''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:41:48'),
(567, 34, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=174&pagetab=mtask''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:41:48'),
(568, 16, 7, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=174&pagetab=mtask''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:41:48'),
(569, 6, 7, '更新了来自您的任务: <a href=''default_task_edit.php?editID=174&pagetab=ftask#log''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:42:38'),
(570, 13, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=174&pagetab=ftask#log''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:42:38'),
(571, 35, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=174&pagetab=ftask#log''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:42:38'),
(572, 39, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=174&pagetab=ftask#log''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:42:38'),
(573, 15, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=174&pagetab=ftask#log''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:42:38'),
(574, 25, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=174&pagetab=ftask#log''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:42:38'),
(575, 34, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=174&pagetab=ftask#log''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:42:38'),
(576, 16, 7, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=174&pagetab=ftask#log''>总报告初步思路</a>', NULL, 1, 0, '2015-01-06 00:42:38'),
(577, 10, 15, '更新了来自您的任务: <a href=''default_task_edit.php?editID=121&pagetab=ftask#log''>需求专题</a>', NULL, 1, 0, '2015-01-08 00:33:23'),
(578, 41, 8, '审核了您的任务: <a href=''default_task_edit.php?editID=133&pagetab=mtask''>gis分析的基础数据查找</a>', NULL, 1, 0, '2015-01-08 00:37:08'),
(579, 41, 8, '审核了您的任务: <a href=''default_task_edit.php?editID=162&pagetab=mtask''>填写案例</a>', NULL, 1, 0, '2015-01-08 00:37:47'),
(580, 29, 8, '审核了抄送给您的任务: <a href=''default_task_edit.php?editID=162&pagetab=mtask''>填写案例</a>', NULL, 1, 0, '2015-01-08 00:37:47'),
(581, 3, 8, '审核了您的任务: <a href=''default_task_edit.php?editID=14&pagetab=mtask''>需求分析</a>', NULL, 1, 0, '2015-01-08 00:38:00'),
(582, 2, 23, '指派给您一个新任务: <a href=''default_task_edit.php?editID=180&pagetab=mtask''>业务应用开发</a>', NULL, 1, 0, '2015-01-09 00:43:57'),
(583, 37, 23, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=180&pagetab=mtask''>业务应用开发</a>', NULL, 1, 0, '2015-01-09 00:43:57'),
(584, 38, 23, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=180&pagetab=mtask''>业务应用开发</a>', NULL, 1, 0, '2015-01-09 00:43:58'),
(585, 37, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=181&pagetab=mtask''>征求意见稿编制</a>', NULL, 1, 0, '2015-01-28 07:05:20'),
(586, 35, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=181&pagetab=mtask''>征求意见稿编制</a>', NULL, 1, 0, '2015-01-28 07:05:20'),
(587, 38, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=181&pagetab=mtask''>征求意见稿编制</a>', NULL, 1, 0, '2015-01-28 07:05:20'),
(588, 13, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=182&pagetab=mtask''>制定工作大纲</a>', NULL, 1, 0, '2015-01-28 07:08:30'),
(589, 35, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=182&pagetab=mtask''>制定工作大纲</a>', NULL, 1, 0, '2015-01-28 07:08:30'),
(590, 38, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=182&pagetab=mtask''>制定工作大纲</a>', NULL, 1, 0, '2015-01-28 07:08:30'),
(591, 15, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=182&pagetab=mtask''>制定工作大纲</a>', NULL, 1, 0, '2015-01-28 07:08:30'),
(592, 13, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=183&pagetab=mtask''>制定调研计划（提纲）</a>', NULL, 1, 0, '2015-01-28 07:09:26'),
(593, 35, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=183&pagetab=mtask''>制定调研计划（提纲）</a>', NULL, 1, 0, '2015-01-28 07:09:26'),
(594, 38, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=183&pagetab=mtask''>制定调研计划（提纲）</a>', NULL, 1, 0, '2015-01-28 07:09:26'),
(595, 15, 30, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=183&pagetab=mtask''>制定调研计划（提纲）</a>', NULL, 1, 0, '2015-01-28 07:09:26'),
(596, 6, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=184&pagetab=ftask#log''>十三五时期推进长江经济带发展的主要任务</a>', NULL, 1, 0, '2015-02-05 09:52:11'),
(597, 38, 15, '指派给您一个新任务: <a href=''default_task_edit.php?editID=187&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:25:50'),
(598, 39, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=187&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:25:50'),
(599, 34, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=187&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:25:50'),
(600, 39, 15, '指派给您一个新任务: <a href=''default_task_edit.php?editID=188&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:26:34'),
(601, 38, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=188&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:26:34'),
(602, 34, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=188&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:26:34'),
(603, 34, 15, '指派给您一个新任务: <a href=''default_task_edit.php?editID=189&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:27:19'),
(604, 38, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=189&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:27:19'),
(605, 39, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=189&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:27:19'),
(606, 38, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=190&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:29:43'),
(607, 39, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=190&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:29:43'),
(608, 34, 15, '抄送给您一个新任务: <a href=''default_task_edit.php?editID=190&pagetab=mtask''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:29:43'),
(609, 38, 15, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=190&pagetab=ftask#log''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:30:34'),
(610, 39, 15, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=190&pagetab=ftask#log''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:30:34'),
(611, 34, 15, '更新了抄送给您的任务: <a href=''default_task_edit.php?editID=190&pagetab=ftask#log''>中间成果</a>', NULL, 1, 0, '2015-02-09 02:30:34'),
(612, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=191&pagetab=ftask#log''>物流大通道GIS建模与特征提取</a>', NULL, 1, 0, '2015-03-04 10:02:11'),
(613, 6, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=192&pagetab=ftask#log''>中财办-推进长江经济带发展的主要任务</a>', NULL, 1, 0, '2015-03-04 10:04:46'),
(614, 11, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=76&pagetab=ftask#log''>铁路及轨道交通专题报告编制</a>', NULL, 1, 0, '2015-03-04 10:06:21'),
(615, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=22&pagetab=ftask#log''>需求分析</a>', NULL, 1, 0, '2015-03-04 10:07:52'),
(616, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=22&pagetab=ftask#log''>需求分析</a>', NULL, 1, 0, '2015-03-04 10:08:09'),
(617, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=22&pagetab=ftask#log''>需求分析</a>', NULL, 1, 0, '2015-03-04 10:08:29'),
(618, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=191&pagetab=ftask#log''>物流大通道GIS建模与特征提取</a>', NULL, 1, 0, '2015-03-04 10:09:01'),
(619, 6, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=192&pagetab=ftask#log''>中财办-推进长江经济带发展的主要任务</a>', NULL, 1, 0, '2015-03-04 10:09:48'),
(620, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=191&pagetab=ftask#log''>物流大通道GIS建模与特征提取</a>', NULL, 1, 0, '2015-03-04 10:10:59'),
(621, 36, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=193&pagetab=ftask#log''>铁路相关数据需求</a>', NULL, 1, 0, '2015-03-04 10:14:18'),
(622, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=22&pagetab=ftask#log''>需求分析</a>', NULL, 1, 0, '2015-03-04 10:14:40'),
(623, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=191&pagetab=ftask#log''>物流大通道GIS建模与特征提取</a>', NULL, 1, 0, '2015-03-04 10:17:21'),
(624, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=191&pagetab=ftask#log''>物流大通道GIS建模与特征提取</a>', NULL, 1, 0, '2015-03-04 10:18:00'),
(625, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=191&pagetab=ftask#log''>物流大通道GIS建模与特征提取</a>', NULL, 1, 0, '2015-03-25 00:26:03'),
(626, 10, 3, '更新了来自您的任务: <a href=''default_task_edit.php?editID=191&pagetab=ftask#log''>物流大通道GIS建模与特征提取</a>', NULL, 1, 0, '2015-03-25 00:26:55'),
(627, 33, 1, '指派给您一个新任务: <a href=''default_task_edit.php?editID=196&pagetab=mtask''>任务 11111</a>', NULL, 1, 0, '2015-09-30 02:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `tk_mul`
--

DROP TABLE IF EXISTS `tk_mul`;
CREATE TABLE IF NOT EXISTS `tk_mul` (
  `muid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_mul_title` text,
  `tk_mul_zh_cn` text,
  `tk_mul_en_us` text,
  `tk_mul_other` text,
  `tk_mul_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tk_mul_backup1` text,
  `tk_mul_backup2` text,
  PRIMARY KEY (`muid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_project`
--

DROP TABLE IF EXISTS `tk_project`;
CREATE TABLE IF NOT EXISTS `tk_project` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` varchar(80) NOT NULL,
  `project_code` varchar(60) NOT NULL,
  `project_text` text NOT NULL,
  `project_type` int(11) DEFAULT NULL,
  `project_from` varchar(60) NOT NULL,
  `project_from_user` varchar(60) NOT NULL,
  `project_from_contact` text NOT NULL,
  `project_start` date NOT NULL DEFAULT '0000-00-00',
  `project_end` date NOT NULL DEFAULT '0000-00-00',
  `project_to_dept` varchar(60) NOT NULL,
  `project_to_user` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `project_status` smallint(4) NOT NULL DEFAULT '0',
  `project_remark` varchar(60) NOT NULL,
  `project_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `project_importance` varchar(10) NOT NULL,
  `project_source` varchar(60) NOT NULL,
  `project_month_eval` int(4) NOT NULL,
  `project_dean` varchar(10) NOT NULL,
  `project_manager` varchar(30) NOT NULL,
  `project_chief_engineer` varchar(6) NOT NULL,
  `project_Director` varchar(6) NOT NULL,
  `project_Division_engineer` varchar(6) NOT NULL,
  `project_member` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_project`
--

INSERT INTO `tk_project` (`id`, `project_name`, `project_code`, `project_text`, `project_type`, `project_from`, `project_from_user`, `project_from_contact`, `project_start`, `project_end`, `project_to_dept`, `project_to_user`, `project_status`, `project_remark`, `project_lastupdate`, `project_importance`, `project_source`, `project_month_eval`, `project_dean`, `project_manager`, `project_chief_engineer`, `project_Director`, `project_Division_engineer`, `project_member`) VALUES
(85, '交通发展研究', '', '', 22, '', '', '', '2015-12-03', '2015-12-10', '', 46, 2, '', '2015-12-03 01:43:12', '一般', '交通厅', 1, '45', '46', '46', '45', '46', '46'),
(86, '交通战略研究', '', '', 23, '', '', '', '2015-12-03', '2015-12-10', '', 46, 2, '', '2015-12-03 01:43:47', '一般', '交通局', 1, '45', '46', '46,45', '46', '46,45', '45,46');

-- --------------------------------------------------------

--
-- Table structure for table `tk_project_sub`
--

DROP TABLE IF EXISTS `tk_project_sub`;
CREATE TABLE IF NOT EXISTS `tk_project_sub` (
  `id` bigint(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `project_pid` text,
  `project_name` text,
  `project_code` text,
  `project_text` text,
  `project_type` text,
  `project_from` text,
  `project_from_user` text,
  `project_from_contact` text,
  `project_start` text,
  `project_end` text,
  `project_to_dept` text,
  `project_to_user` text,
  `project_status` longtext,
  `project_remark` text,
  `project_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `project_sub_backup1` text,
  `project_sub_backup2` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_project_sub`
--

INSERT INTO `tk_project_sub` (`id`, `project_pid`, `project_name`, `project_code`, `project_text`, `project_type`, `project_from`, `project_from_user`, `project_from_contact`, `project_start`, `project_end`, `project_to_dept`, `project_to_user`, `project_status`, `project_remark`, `project_lastupdate`, `project_sub_backup1`, `project_sub_backup2`) VALUES
(000045, '00033', '其他', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, '2010-02-28 12:15:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tk_project_type`
--

DROP TABLE IF EXISTS `tk_project_type`;
CREATE TABLE IF NOT EXISTS `tk_project_type` (
  `ptid` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `project_type_name` varchar(60) DEFAULT NULL,
  `tk_project_typerank` varchar(60) NOT NULL,
  `project_type_backup1` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_project_type`
--

INSERT INTO `tk_project_type` (`ptid`, `project_type_name`, `tk_project_typerank`, `project_type_backup1`) VALUES
(22, '指令性', '', 0),
(23, '合同性', '', 1),
(24, '临时性', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tk_status`
--

DROP TABLE IF EXISTS `tk_status`;
CREATE TABLE IF NOT EXISTS `tk_status` (
  `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_status` varchar(60) NOT NULL,
  `task_status_display` varchar(255) NOT NULL,
  `task_status_backup1` bigint(20) NOT NULL DEFAULT '0',
  `task_status_backup2` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_status`
--

INSERT INTO `tk_status` (`id`, `task_status`, `task_status_display`, `task_status_backup1`, `task_status_backup2`) VALUES
(2, '未开始', '<div style=''background-color: #996699; width:100%; text-align:center;''>未开始</div>', 1, 0),
(4, '计划', '<div style=''background-color: #996699; width:100%; text-align:center;''>计划</div>', 2, 0),
(5, '进行中', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中</div>', 3, 0),
(6, '进行中20%', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中20%</div>', 4, 0),
(7, '进行中40%', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中40%</div>', 5, 0),
(8, '进行中60%', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中60%</div>', 6, 0),
(9, '进行中80%', '<div style=''background-color: #9F0; width:100%; text-align:center;''>进行中80%</div>', 7, 0),
(14, '完成100%', '<div style=''background-color: #090; width:100%; text-align:center;''>完成100%</div>', 8, 0),
(22, '中断', '<div style=''background-color: red; width:100%; text-align:center;''>中断</div>', 9, 0),
(23, '推迟', '<div style=''background-color: #FC0; width:100%; text-align:center;''>推迟</div>', 10, 0),
(24, '请假', '<div style=''background-color: #FFFF00; width:100%; text-align:center;''>请假</div>', 11, 0),
(25, '完成验收', '<div style=''background-color: #336699; width:100%; text-align:center;''>完成验收</div>', 12, 1),
(26, '驳回', '<div style=''background-color: red; width:100%; text-align:center;''>驳回</div>\r\n', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tk_status_project`
--

DROP TABLE IF EXISTS `tk_status_project`;
CREATE TABLE IF NOT EXISTS `tk_status_project` (
  `psid` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_status` varchar(60) NOT NULL,
  `task_status_display` varchar(255) NOT NULL,
  `task_status_pbackup1` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`psid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_status_project`
--

INSERT INTO `tk_status_project` (`psid`, `task_status`, `task_status_display`, `task_status_pbackup1`) VALUES
(2, '项目争取中', '<div style=''background-color: #996699; width:100%; text-align:center;''>项目争取中</div>', 1),
(4, '调研阶段', '<div style=''background-color: #9F0; width:100%; text-align:center;''>调研阶段</div>', 2),
(5, '中间成果阶段', '<div style=''background-color: #9F0; width:100%; text-align:center;''>中间成果阶段</div>', 3),
(6, '征求意见稿阶段', '<div style=''background-color: #9F0; width:100%; text-align:center;''>征求意见稿阶段</div>', 5),
(7, '送审稿阶段', '<div style=''background-color: #9F0; width:100%; text-align:center;''>送审稿阶段</div>', 6),
(8, '其他阶段', '<div style=''background-color: #090; width:100%; text-align:center;''>其他阶段</div>', 7),
(9, '项目已结束', '<div style=''background-color: #ccc; width:100%; text-align:center;''>项目已结束</div>', 10),
(14, '项目中断', '<div style=''background-color: red; width:100%; text-align:center;''>项目中断</div>', 9),
(22, '推迟', '<div style=''background-color: #FC0; width:100%; text-align:center;''>推迟</div>', 8),
(23, '非项目', '<div style=''background-color: #996699; width:100%; text-align:center;''>非项目</div>', 11),
(24, '初稿', '<div style=''background-color: #9F0; width:100%; text-align:center;''>初稿阶段</div>', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tk_task`
--

DROP TABLE IF EXISTS `tk_task`;
CREATE TABLE IF NOT EXISTS `tk_task` (
  `TID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `csa_from_dept` mediumint(6) NOT NULL DEFAULT '0',
  `csa_from_user` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `csa_to_dept` mediumint(6) NOT NULL DEFAULT '0',
  `csa_to_user` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `csa_year` smallint(5) NOT NULL DEFAULT '0',
  `csa_month` tinyint(3) NOT NULL DEFAULT '0',
  `csa_project` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `csa_project_sub` mediumint(7) NOT NULL,
  `csa_type` smallint(4) NOT NULL DEFAULT '0',
  `csa_text` varchar(80) NOT NULL,
  `csa_priority` tinyint(3) NOT NULL,
  `csa_temp` tinyint(3) NOT NULL,
  `csa_plan_st` date NOT NULL DEFAULT '0000-00-00',
  `csa_plan_et` date NOT NULL DEFAULT '0000-00-00',
  `csa_plan_hour` float(20,1) NOT NULL DEFAULT '0.0',
  `csa_remark1` text NOT NULL,
  `csa_remark2` smallint(4) NOT NULL DEFAULT '0',
  `csa_remark3` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `csa_remark4` bigint(20) NOT NULL DEFAULT '-1',
  `csa_remark5` varchar(300) NOT NULL DEFAULT '>>-1',
  `csa_remark6` bigint(20) NOT NULL DEFAULT '-1',
  `csa_remark7` varchar(60) NOT NULL,
  `csa_remark8` text,
  `test01` text,
  `test02` varchar(100) NOT NULL,
  `test03` varchar(60) NOT NULL,
  `test04` varchar(60) NOT NULL,
  `csa_create_user` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `csa_last_user` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `csa_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TID`),
  KEY `touser_st_et` (`csa_to_user`,`csa_plan_st`,`csa_plan_et`),
  KEY `fruser` (`csa_from_user`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_task_byday`
--

DROP TABLE IF EXISTS `tk_task_byday`;
CREATE TABLE IF NOT EXISTS `tk_task_byday` (
  `tbid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `csa_tb_year` varchar(20) NOT NULL,
  `csa_tb_status` smallint(4) NOT NULL DEFAULT '0',
  `csa_tb_manhour` float(20,1) NOT NULL DEFAULT '0.0',
  `csa_tb_text` text NOT NULL,
  `csa_tb_comment` smallint(5) NOT NULL DEFAULT '0',
  `csa_tb_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `csa_tb_backup1` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `csa_tb_backup2` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `csa_tb_backup3` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `csa_tb_backup4` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tbid`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_task_byday`
--

INSERT INTO `tk_task_byday` (`tbid`, `csa_tb_year`, `csa_tb_status`, `csa_tb_manhour`, `csa_tb_text`, `csa_tb_comment`, `csa_tb_lastupdate`, `csa_tb_backup1`, `csa_tb_backup2`, `csa_tb_backup3`, `csa_tb_backup4`) VALUES
(1, '20140728', 5, 0.0, '', 0, '2014-07-31 05:29:50', 2, 2, 1, 20),
(2, '20140729', 5, 1.5, '', 0, '2014-07-31 05:30:08', 2, 2, 1, 20),
(3, '20140730', 5, 2.5, '', 0, '2014-07-31 05:30:36', 2, 2, 1, 20),
(4, '20140731', 5, 5.0, '<p>\r\n	主要干了神马事\r\n</p>\r\n<p>\r\n	完成了什么\r\n</p>', 0, '2014-07-31 05:31:12', 2, 2, 1, 20),
(5, '20140731', 5, 2.0, '', 0, '2014-08-02 13:18:00', 6, 2, 2, 20),
(6, '20140731', 5, 20.0, '', 0, '2014-08-02 13:18:32', 1, 2, 1, 1),
(7, '20140813', 14, 3.0, '', 0, '2014-08-22 02:18:34', 16, 2, 8, 3),
(8, '20140814', 5, 5.0, '', 0, '2014-08-14 09:52:28', 8, 2, 4, 20),
(10, '20140815', 14, 6.0, '进入修改阶段', 0, '2014-08-18 00:58:15', 15, 3, 4, 3),
(11, '20140815', 7, 3.5, '<p>\r\n	调整结构，学习浙江材料修改开发和运营模式\r\n</p>', 0, '2014-08-18 01:14:58', 23, 3, 16, 3),
(12, '20140807', 5, 1.5, '构建基本网（手绘）', 0, '2014-08-18 01:19:09', 26, 3, 18, 3),
(13, '20140807', 5, 1.5, '构建基本网（手绘）', 0, '2014-08-18 01:19:39', 26, 3, 18, 3),
(14, '20140809', 5, 2.0, 'VBA学习', 0, '2014-08-18 01:22:24', 26, 3, 18, 3),
(15, '20140818', 5, 0.5, '<p>\r\n	办公厅、运输管理部对接，待运输管理部领导反馈意见。有问题转往环境管理部的可能。\r\n</p>', 0, '2014-08-18 07:38:52', 24, 3, 17, 2),
(16, '20140818', 5, 1.0, '<p>\r\n	准备西站上报函。\r\n</p>\r\n<p>\r\n	协调项目组进度。\r\n</p>', 0, '2014-08-19 00:02:26', 13, 3, 5, 3),
(17, '20140818', 14, 4.0, '', 0, '2014-08-18 09:51:56', 28, 2, 1, 12),
(18, '20140818', 9, 6.5, '<p>\r\n	发展模式、运营模式、盈利模式\r\n</p>', 0, '2014-08-19 00:01:22', 23, 3, 16, 3),
(19, '20140819', 14, 2.0, '<p>\r\n	补充内容、文整\r\n</p>', 0, '2014-08-19 02:33:15', 23, 3, 16, 3),
(20, '20140818', 7, 4.0, '<p>\r\n	各功能区工可研读，找相应投资估算\r\n</p>', 0, '2014-08-19 03:08:48', 12, 9, 5, 3),
(22, '20140819', 7, 1.0, '西站各部分内容协调，编写重点指引', 0, '2014-08-19 05:37:17', 13, 3, 5, 3),
(23, '20140819', 9, 6.0, '收集材料，整理思路', 0, '2014-08-20 00:26:16', 25, 3, 15, 1),
(24, '20140820', 9, 5.5, '<p>\r\n	阅读资料\r\n</p>\r\n<p>\r\n	编写申请报告\r\n</p>', 0, '2014-08-21 09:30:59', 25, 3, 15, 1),
(25, '20140820', 7, 2.5, '<p>\r\n	1、对接西站财务审计报告/主要财务报表；\r\n</p>\r\n<p>\r\n	2、协调分工，内容培训\r\n</p>', 0, '2014-08-21 09:29:05', 13, 3, 5, 3),
(26, '20140820', 5, 12.0, '', 0, '2014-08-21 05:00:01', 29, 2, 4, 3),
(27, '20140820', 14, 1.5, '讨论方案，修改', 0, '2014-08-21 09:28:02', 14, 3, 4, 3),
(28, '20140821', 14, 1.5, '提交初稿', 0, '2014-08-21 09:29:57', 25, 3, 15, 1),
(29, '20140821', 8, 5.0, '<p>\r\n	总论修改、必要性修改、总平面修改\r\n</p>\r\n<p>\r\n	协助相关部分开展\r\n</p>', 0, '2014-08-21 09:33:54', 13, 3, 5, 3),
(30, '20140821', 5, 12.0, '', 0, '2014-08-22 01:24:13', 29, 2, 4, 3),
(31, '20140822', 14, 0.5, '', 0, '2014-08-22 02:17:40', 30, 2, 20, 1),
(32, '20140825', 5, 12.0, '', 0, '2014-08-25 00:25:14', 44, 2, 21, 3),
(33, '20140826', 14, 5.0, '', 0, '2014-08-25 00:29:05', 44, 2, 21, 3),
(34, '20140822', 5, 14.0, '', 0, '2014-08-25 00:26:34', 29, 2, 4, 3),
(35, '20140824', 5, 4.0, '', 0, '2014-08-25 00:26:50', 29, 2, 4, 3),
(36, '20140823', 14, 10.5, '', 0, '2014-08-25 05:17:01', 31, 3, 21, 3),
(37, '20140822', 6, 1.5, '', 0, '2014-08-25 05:17:12', 31, 3, 21, 3),
(38, '20140822', 9, 5.0, '', 0, '2014-08-25 05:18:09', 13, 3, 5, 3),
(39, '20140824', 9, 10.5, '工可及资金申请', 0, '2014-08-25 05:19:32', 13, 3, 5, 3),
(40, '20140825', 14, 3.0, '<p>\r\n	资金申请初稿，打印；\r\n</p>\r\n<p>\r\n	工可初稿形成开始修改\r\n</p>', 0, '2014-08-25 05:20:20', 13, 3, 5, 3),
(41, '20140819', 5, 2.0, '研读调研提纲，提供相关部分调研资料名单', 0, '2014-08-25 08:43:45', 46, 9, 26, 3),
(42, '20140825', 5, 5.0, '研读调研总结、编写提纲。参加编写提纲讨论会', 0, '2014-08-25 08:43:53', 46, 9, 26, 3),
(43, '20140825', 6, 3.0, '<p>\r\n	&nbsp;\r\n</p>', 0, '2014-08-26 05:38:56', 45, 3, 5, 3),
(44, '20140826', 5, 0.5, '<p>\r\n	联系环保部，初步敲定时间，对接资料\r\n</p>', 0, '2014-08-26 05:39:44', 24, 3, 17, 2),
(45, '20140826', 5, 1.5, '<p>\r\n	向甲方反馈工作情况\r\n</p>', 0, '2014-08-26 05:40:50', 27, 3, 19, 1),
(46, '20140826', 5, 1.0, '<p>\r\n	对接方案变化（张主任）\r\n</p>\r\n<p>\r\n	申报项目表（阎）\r\n</p>', 0, '2014-08-26 05:41:52', 45, 3, 5, 3),
(47, '20140826', 14, 1.5, '修改完善', 0, '2014-08-26 07:11:50', 25, 3, 15, 1),
(48, '20140825', 14, 15.0, '', 0, '2014-08-27 02:25:17', 29, 2, 4, 3),
(49, '20140826', 5, 4.0, '', 0, '2014-08-27 02:25:54', 8, 2, 4, 20),
(50, '20140827', 9, 6.0, '<p>\r\n	完成面上修改稿提交二三审\r\n</p>', 0, '2014-08-28 01:14:02', 45, 3, 5, 3),
(51, '20140827', 5, 0.5, '确定调研时间为下周上午九点', 0, '2014-08-28 06:34:38', 24, 3, 17, 2),
(52, '20140829', 8, 6.0, '', 0, '2014-08-29 03:28:09', 64, 2, 21, 3),
(53, '20140830', 14, 1.0, '', 0, '2014-08-30 15:33:20', 62, 4, 21, 15),
(54, '20140830', 14, 3.5, '', 0, '2014-08-30 15:33:52', 51, 4, 21, 20),
(55, '20140901', 4, 0.0, '<p>\r\n	上周计划与两位委员陈宇毅和刘晨进行商定，但是由于均有会，时间上有些问题，周二之前完成商议，按计划周五进行！\r\n</p>', 0, '2014-09-01 02:33:06', 63, 7, 31, 20),
(56, '20140828', 5, 4.5, '工可修改，工作流线设计、相关标准更新', 0, '2014-09-01 03:01:22', 45, 3, 5, 3),
(57, '20140829', 14, 1.0, '修改申请书，检查，出版，签章，请鹏程带给顾主任', 0, '2014-09-01 02:59:31', 55, 3, 15, 3),
(58, '20140829', 5, 4.5, '修改报告，添加规划选址理论内容', 0, '2014-09-01 03:00:54', 45, 3, 5, 3),
(59, '20140829', 5, 1.5, '<p>\r\n	答复提案与建议\r\n</p>', 0, '2014-09-01 03:02:47', 54, 3, 21, 3),
(60, '20140830', 14, 3.0, '<p>\r\n	答复提案与建议\r\n</p>', 0, '2014-09-01 03:02:58', 54, 3, 21, 3),
(61, '20140901', 14, 5.0, '<p>\r\n	<a href="project_view.php?recordID=30">长江经济带湖北省综合交通运输体系规划</a><a href="default_task_edit.php?pagetab=alltask&amp;editID=65">通道及线网布局规划思路</a>\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>', 0, '2014-09-01 05:41:50', 65, 7, 30, 20),
(62, '20140901', 14, 5.0, '', 0, '2014-09-01 08:14:58', 61, 4, 30, 20),
(63, '20140901', 14, 1.0, '与刘所进行了沟通，烦请所里与水运所进行了沟通', 0, '2014-09-01 08:20:25', 58, 4, 14, 8),
(64, '20140901', 8, 3.0, '', 0, '2014-09-01 08:21:45', 60, 4, 27, 3),
(65, '20140901', 6, 2.0, '', 0, '2014-09-01 08:22:08', 56, 4, 10, 20),
(66, '20140901', 14, 2.0, '重庆综合交通运输体系“十三五”发展规划工作大纲第三轮修改', 0, '2014-09-01 08:22:59', 66, 7, 32, 20),
(67, '20140901', 14, 0.5, '“十三五”综合运输战略重点及对策研究中间成果咨询专家意见汇总', 0, '2014-09-01 08:25:48', 67, 7, 33, 12),
(68, '20140901', 5, 1.0, '<p>\r\n	整理相关附件\r\n</p>', 0, '2014-09-02 06:49:03', 10, 3, 4, 20),
(69, '20140901', 14, 6.0, '<p>\r\n	完成修改第一稿，包括资金申请修改\r\n</p>\r\n<p>\r\n	对接签章材料\r\n</p>', 0, '2014-09-02 06:45:51', 45, 3, 5, 3),
(70, '20140901', 5, 0.5, '准备调研材料', 0, '2014-09-02 06:46:51', 24, 3, 17, 2),
(71, '20140902', 14, 3.5, '<p>\r\n	神华集团环保部调研\r\n</p>', 0, '2014-09-02 06:47:16', 24, 3, 17, 2),
(72, '20140902', 5, 3.0, '<p>\r\n	对接照片、土地证、财务报表、签章等需求\r\n</p>\r\n<p>\r\n	资金申请报告文字部分\r\n</p>', 0, '2014-09-05 01:08:48', 10, 3, 4, 20),
(73, '20140902', 14, 1.0, '重庆市综合交通运输“十三五”发展规划研究工作大纲内部讨论会', 0, '2014-09-02 10:04:06', 69, 7, 32, 10),
(74, '20140902', 6, 3.0, '', 0, '2014-09-02 10:13:14', 71, 7, 30, 3),
(75, '20140903', 14, 3.0, '', 0, '2014-09-03 08:52:14', 73, 7, 30, 10),
(76, '20140903', 6, 2.0, '', 0, '2014-09-03 08:52:44', 71, 7, 30, 3),
(77, '20140904', 14, 4.0, '', 0, '2014-09-04 05:42:53', 74, 7, 37, 10),
(78, '20140903', 8, 3.0, '资金申请，对接资料，完善文本', 0, '2014-09-05 01:09:15', 10, 3, 4, 20),
(79, '20140904', 14, 3.0, '完成报告编制初稿，文整工作，提交二审', 0, '2014-09-05 01:10:23', 10, 3, 4, 20),
(80, '20140902', 5, 1.5, '<br />', 0, '2014-09-05 01:20:10', 75, 3, 5, 3),
(82, '20140904', 8, 3.5, '根据甲方意见修改报告，完成更名报告的修改（包括工可报告）', 0, '2014-09-05 01:37:43', 75, 3, 5, 3),
(83, '20140903', 5, 4.5, '修改大纲编写及项目讨论会', 0, '2014-09-05 01:39:56', 76, 3, 17, 3),
(84, '20140902', 14, 3.0, '<br />', 0, '2014-09-05 01:41:44', 77, 3, 36, 9),
(85, '20140904', 8, 7.0, '其中加班3小时。', 0, '2014-09-05 02:31:28', 72, 7, 32, 20),
(86, '20140903', 6, 3.0, '可以放素材', 0, '2014-09-05 05:21:06', 21, 4, 11, 20),
(87, '20140904', 7, 2.0, '继续放素材', 0, '2014-09-05 05:22:00', 21, 4, 11, 20),
(88, '20140902', 8, 3.5, '继续梳理材料', 0, '2014-09-05 05:22:57', 60, 4, 27, 3),
(89, '20140903', 8, 2.5, '材料的梳理', 0, '2014-09-05 05:23:23', 60, 4, 27, 3),
(90, '20140905', 9, 6.0, '材料梳理基本完成', 0, '2014-09-05 05:24:31', 60, 4, 27, 3),
(91, '20140904', 6, 3.0, '初步梳理了头绪', 0, '2014-09-05 05:26:18', 56, 4, 10, 20),
(92, '20140905', 8, 4.5, '<p>\r\n	文字工作告一段落，等重庆交委补充工作小组和专家小组名单！\r\n</p>\r\n<p>\r\n	后续开展ppt的更新和修改工作\r\n</p>', 0, '2014-09-05 06:57:28', 72, 7, 32, 20),
(93, '20140908', 8, 5.0, '更改PPT及相关内容~', 0, '2014-09-10 12:08:33', 72, 7, 32, 20),
(94, '20140905', 9, 5.0, '完成资金申请报告的对应修改，与甲方协调相关批复和照片事宜', 0, '2014-09-10 07:47:34', 75, 3, 5, 3),
(95, '20140909', 9, 1.0, '与无锡市发改委，甲方对接批复时间内容，待市发改委与各部门沟通后出具批复', 0, '2014-09-10 07:48:32', 75, 3, 5, 3),
(96, '20140909', 8, 4.5, '整理美国中西部地区地形变化区域城镇发展史，暂定盐湖城盐湖城、丹佛、夏延具备借鉴的条件。但存在矿业城市影响的可能。', 0, '2014-09-10 08:01:12', 27, 3, 19, 1),
(97, '20140910', 9, 3.5, '学习菲尼克斯经验，认为相对于政策型、矿产型，铁路型和牛镇更接近于米兰镇条件。更新大纲基本完成，准备细化编写大纲梳理观点', 0, '2014-09-10 08:03:00', 27, 3, 19, 1),
(98, '20140910', 8, 1.5, '根据新的控规，做相关的更新', 0, '2014-09-10 11:54:10', 56, 4, 10, 20),
(99, '20140909', 8, 2.0, '根据陈总的意见进行修改', 0, '2014-09-10 11:55:17', 21, 4, 11, 20),
(100, '20140910', 9, 2.0, '添加更新内容', 0, '2014-09-10 11:55:38', 21, 4, 11, 20),
(101, '20140910', 9, 1.0, '根据最新反馈的意见，进行适当的补充', 0, '2014-09-10 11:56:46', 60, 4, 27, 3),
(102, '20140910', 6, 2.5, '<p>\r\n	1、对区域比较分析拟定初步工作思路，抓交给刘影\r\n</p>\r\n<p>\r\n	2、排定大体的工作时间表\r\n</p>\r\n<p>\r\n	3、初步思考大纲的细化\r\n</p>', 0, '2014-09-10 12:00:14', 61, 4, 30, 20),
(103, '20140910', 7, 2.5, '添加国际形势的判断以及外贸、煤炭和钢铁今年以来的月度变动情况', 0, '2014-09-10 12:01:29', 38, 4, 22, 3),
(104, '20140911', 14, 1.5, '补充完成后，提交给胡总', 0, '2014-09-11 02:25:33', 38, 4, 22, 3),
(105, '20140911', 7, 4.0, '<p>\r\n	进一步细化初稿，提交给李伟主任；\r\n</p>\r\n<p>\r\n	提炼出调研需求\r\n</p>', 0, '2014-09-10 12:13:29', 61, 4, 30, 20),
(106, '20140911', 9, 3.0, '大体完成，并做到心里有数', 0, '2014-09-10 12:06:20', 21, 4, 11, 20),
(107, '20140910', 9, 7.0, '稿子和ppt的修改，其中晚上加班2.5小时', 0, '2014-09-10 12:07:07', 72, 7, 32, 20),
(108, '20140909', 9, 7.0, '稿子和ppt的修改', 0, '2014-09-10 12:15:45', 72, 7, 32, 20),
(109, '20140910', 14, 1.5, '李伟主任就汇报的情况和省厅的意见等向项目组成员进行宣贯', 0, '2014-09-10 12:19:27', 73, 7, 30, 10),
(110, '20140909', 6, 3.5, '中间进行思路的讨论，并沟通', 0, '2014-09-10 12:20:16', 86, 4, 42, 20),
(111, '20140908', 8, 4.0, '初步拟定内容', 0, '2014-09-10 12:20:59', 21, 4, 11, 20),
(112, '20140715', 5, 5.0, '开始消化湖北规划有关资料', 0, '2014-09-11 02:15:13', 89, 10, 30, 3),
(113, '20140718', 5, 7.0, '消化湖北规划资料', 0, '2014-09-11 02:15:55', 89, 10, 30, 3),
(114, '20140722', 5, 4.0, '消化湖北项目资料', 0, '2014-09-11 02:17:32', 89, 10, 30, 3),
(115, '20140725', 5, 4.0, '修改完善工作大纲', 0, '2014-09-11 02:17:55', 89, 10, 30, 3),
(116, '20140728', 5, 6.0, '湖北工作大纲', 0, '2014-09-11 02:18:21', 89, 10, 30, 3),
(117, '20140729', 5, 6.0, '湖北工作大纲', 0, '2014-09-11 02:18:43', 89, 10, 30, 3),
(118, '20140730', 14, 9.0, '湖北工作大纲', 0, '2014-09-11 02:19:50', 89, 10, 30, 3),
(119, '20140805', 5, 9.0, '初步思路文本编制', 0, '2014-09-11 02:21:37', 90, 10, 30, 3),
(120, '20140806', 5, 6.0, '<span>初步思路文本编制</span>', 0, '2014-09-11 02:21:54', 90, 10, 30, 3),
(121, '20140807', 5, 10.0, '<span>初步思路文本编制</span>', 0, '2014-09-11 02:26:18', 90, 10, 30, 3),
(122, '20140808', 5, 8.0, '<span>初步思路文本编制</span>', 0, '2014-09-11 02:32:58', 90, 10, 30, 3),
(123, '20140811', 5, 8.0, '<span>初步思路文本编制</span>', 0, '2014-09-11 02:35:45', 90, 10, 30, 3),
(124, '20140813', 5, 5.0, '<span>初步思路文本编制</span>', 0, '2014-09-11 02:36:06', 90, 10, 30, 3),
(125, '20140814', 5, 5.0, '<span>初步思路文本编制</span>', 0, '2014-09-11 02:36:29', 90, 10, 30, 3),
(126, '20140815', 5, 8.0, '<span>初步思路文本编制</span>', 0, '2014-09-11 02:36:39', 90, 10, 30, 3),
(127, '20140820', 5, 4.0, '<span>陈总对初步思路文本编制提出指导修改意见</span>', 0, '2014-09-11 02:37:55', 90, 10, 30, 3),
(128, '20140828', 5, 7.0, '<span>初步思路文本编制修改</span>', 0, '2014-09-11 02:37:36', 90, 10, 30, 3),
(129, '20140829', 5, 6.0, '<span>初步思路文本编制修改完善</span>', 0, '2014-09-11 02:38:09', 90, 10, 30, 3),
(130, '20140903', 5, 5.0, '<span>初步思路文本编制修改完善</span>', 0, '2014-09-11 02:38:34', 90, 10, 30, 3),
(131, '20140820', 5, 3.0, 'PPT制作', 0, '2014-09-11 02:41:04', 91, 10, 30, 12),
(132, '20140822', 5, 6.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', 0, '2014-09-11 02:41:39', 91, 10, 30, 12),
(133, '20140826', 5, 8.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', 0, '2014-09-11 02:42:04', 91, 10, 30, 12),
(134, '20140827', 5, 8.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', 0, '2014-09-11 02:42:12', 91, 10, 30, 12),
(135, '20140902', 5, 10.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', 0, '2014-09-11 02:42:46', 91, 10, 30, 12),
(136, '20140903', 5, 10.5, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT制作</span>', 0, '2014-09-11 02:43:07', 91, 10, 30, 12),
(137, '20140904', 14, 5.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">PPT汇报前修改、完善</span>', 0, '2014-09-11 02:43:37', 91, 10, 30, 12),
(138, '20140812', 14, 2.0, '项目启动会', 0, '2014-09-11 02:52:16', 93, 10, 30, 10),
(139, '20140903', 14, 4.0, '项目组全体参与讨论汇报PPT的完善方案', 0, '2014-09-11 02:54:57', 94, 10, 30, 10),
(140, '20140910', 14, 2.5, '内部通气布置会', 0, '2014-09-11 02:58:28', 95, 10, 30, 10),
(141, '20140904', 14, 6.0, '下去启程赴武汉', 0, '2014-09-11 03:02:07', 96, 10, 30, 12),
(142, '20140905', 14, 9.5, '<p>\r\n	上午汇报\r\n</p>\r\n<p>\r\n	中午课题组受到湖北一把手厅长接见、共进午餐\r\n</p>\r\n<p>\r\n	下午返京\r\n</p>', 0, '2014-09-11 03:02:55', 96, 10, 30, 12),
(143, '20130904', 5, 10.0, '准备竞争性谈判文件', 0, '2014-09-12 02:00:32', 100, 10, 40, 3),
(144, '20130905', 5, 10.0, '竞争性谈判文件报告编制', 0, '2014-09-12 02:01:16', 100, 10, 40, 3),
(145, '20130906', 5, 10.0, '<span>竞争性谈判文件报告编制</span>', 0, '2014-09-12 02:01:26', 100, 10, 40, 3),
(146, '20130907', 5, 12.0, '<span>竞争性谈判文件报告编制</span>', 0, '2014-09-12 02:01:42', 100, 10, 40, 3),
(147, '20130927', 5, 9.0, '竞争性谈判PPT', 0, '2014-09-12 05:29:47', 100, 10, 40, 3),
(148, '20131002', 5, 9.0, '消化江苏资料；准备竞争性谈判', 0, '2014-09-12 05:30:31', 100, 10, 40, 3),
(149, '20131005', 5, 6.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；准备竞争性谈判PPT</span>', 0, '2014-09-12 05:31:11', 100, 10, 40, 3),
(150, '20131006', 5, 6.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；准备竞争性谈判PPT</span>', 0, '2014-09-12 05:31:27', 100, 10, 40, 3),
(151, '20131007', 5, 9.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；准备竞争性谈判PPT</span>', 0, '2014-09-12 05:31:54', 100, 10, 40, 3),
(153, '20131010', 5, 7.0, '<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；修改竞争性谈判PPT</span>', 0, '2014-09-12 05:32:34', 100, 10, 40, 3),
(154, '20131011', 14, 9.0, '<p>\r\n	<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">消化江苏资料；修改竞争性谈判PPT</span>\r\n</p>\r\n<p>\r\n	<span style="color:#333333;font-family:Arial;line-height:17px;background-color:#FFFFFF;">下午进行竞争性谈判汇报（5家中获胜）</span>\r\n</p>', 0, '2014-09-12 05:33:26', 100, 10, 40, 3),
(155, '20131104', 5, 3.0, '消化准备工作大纲编制', 0, '2014-09-12 05:40:37', 107, 10, 40, 1),
(156, '20131105', 5, 3.0, '拟定大纲', 0, '2014-09-12 05:40:56', 107, 10, 40, 1),
(157, '20131114', 5, 4.0, '利用赴江苏项目代部审查，进行工作大纲编制交流', 0, '2014-09-12 05:41:44', 107, 10, 40, 1),
(158, '20131212', 5, 5.0, '拟定江苏工作大纲中的调研方案（结合江苏省院和我方课题组考虑）', 0, '2014-09-12 05:42:58', 107, 10, 40, 1),
(159, '20131214', 5, 5.0, '加班修改江苏工作大纲和工作分工', 0, '2014-09-12 05:44:57', 107, 10, 40, 1),
(160, '20131219', 5, 5.0, '修改完并向主管老总提交工作大纲', 0, '2014-09-12 05:45:28', 107, 10, 40, 1),
(161, '20140109', 5, 8.5, '修改江苏工作大纲', 0, '2014-09-12 05:46:33', 107, 10, 40, 1),
(162, '20140110', 5, 8.0, '工作大纲PPT', 0, '2014-09-12 05:55:06', 107, 10, 40, 1),
(163, '20140114', 14, 4.5, '江苏工作大纲汇报', 0, '2014-09-12 05:55:27', 107, 10, 40, 1),
(164, '20140305', 5, 5.5, '赴南京进行调研方案座谈', 0, '2014-09-12 06:03:33', 108, 10, 40, 2),
(165, '20140411', 5, 4.5, '江苏调研方案讨论修改', 0, '2014-09-12 06:04:25', 108, 10, 40, 2),
(166, '20140418', 5, 2.0, '完善江苏调研方案', 0, '2014-09-12 06:04:45', 108, 10, 40, 2),
(167, '20140506', 5, 6.5, '江苏调研方案讨论、修改、完善', 0, '2014-09-12 06:05:22', 108, 10, 40, 2),
(168, '20140507', 5, 3.0, '修改江苏调研方案', 0, '2014-09-12 06:05:45', 108, 10, 40, 2),
(169, '20140512', 5, 4.0, '协调江苏外业调研时间、组织、人员等', 0, '2014-09-12 06:06:18', 108, 10, 40, 2),
(170, '20140514', 5, 3.5, '准备调研前与江苏省院方交流座谈材料', 0, '2014-09-12 06:06:54', 108, 10, 40, 2),
(171, '20140515', 5, 6.5, '所内江苏调研动员和交流', 0, '2014-09-12 06:08:11', 108, 10, 40, 2),
(172, '20140516', 5, 1.5, '修改省厅下发调研函', 0, '2014-09-12 06:08:36', 108, 10, 40, 2),
(173, '20140518', 5, 5.0, '下午启程赴南京', 0, '2014-09-12 06:08:56', 108, 10, 40, 2),
(174, '20140519', 5, 8.5, '<p>\r\n	分组调研\r\n</p>\r\n<p>\r\n	——江北组赴淮安，开始苏北地区调研\r\n</p>\r\n<p>\r\n	——江南组赴苏州，开展苏南地区调研\r\n</p>', 0, '2014-09-12 06:09:44', 108, 10, 40, 2),
(175, '20140520', 5, 8.5, '苏州、无锡', 0, '2014-09-12 06:10:02', 108, 10, 40, 2),
(176, '20140521', 5, 9.5, '上午无锡江阴、下午高新区', 0, '2014-09-12 06:10:26', 108, 10, 40, 2),
(177, '20140522', 5, 8.5, '常州调研', 0, '2014-09-12 06:10:41', 108, 10, 40, 2),
(178, '20140523', 5, 9.0, '南京调研', 0, '2014-09-12 06:10:58', 108, 10, 40, 2),
(179, '20140524', 5, 8.5, '与苏北组汇合；下午到晚上与省院碰撞观点，整理汇报材料', 0, '2014-09-12 06:11:43', 108, 10, 40, 2),
(180, '20140525', 5, 9.0, '整理准备调研汇报', 0, '2014-09-12 06:12:04', 108, 10, 40, 2),
(181, '20140526', 14, 8.5, '<p>\r\n	上午向江苏省厅汇报调研情况；\r\n</p>\r\n<p>\r\n	下午与省发改、经信、商贸等部门座谈\r\n</p>', 0, '2014-09-12 06:12:44', 108, 10, 40, 2),
(182, '20140527', 14, 5.5, '上午启程返京', 0, '2014-09-12 06:13:00', 108, 10, 40, 2),
(183, '20140606', 5, 2.5, '<p>\r\n	拟定研究方案，细化分工，包括：\r\n</p>\r\n<p>\r\n	GIS、省院分工、外贸数据分析等\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 0, '2014-09-12 06:17:02', 112, 10, 40, 3),
(184, '20140708', 5, 4.5, '针对各专题研究人员成果开展小规模讨论', 0, '2014-09-12 06:17:51', 112, 10, 40, 3),
(185, '20140715', 7, 5.5, '讨论推进江苏GIS分析', 0, '2014-09-12 06:18:23', 112, 10, 40, 3),
(186, '20140717', 5, 8.5, '<p>\r\n	1. 整理江苏项目思路、形势和现状\r\n</p>\r\n<p>\r\n	2. 江苏项目阶段性成果讨论（全体项目组）\r\n</p>', 0, '2014-09-12 06:19:36', 112, 10, 40, 3),
(187, '20140721', 5, 4.5, '整理项目现状、问题、目标定位等', 0, '2014-09-12 06:20:21', 112, 10, 40, 3),
(188, '20140722', 5, 4.5, '撰写项目现状部分', 0, '2014-09-12 06:20:44', 112, 10, 40, 3),
(189, '20140723', 5, 4.5, '撰写项目现状部分', 0, '2014-09-12 06:21:04', 112, 10, 40, 3),
(190, '20140724', 5, 6.5, '撰写项目分级分类部分内容', 0, '2014-09-12 06:21:25', 112, 10, 40, 3),
(191, '20140731', 5, 8.5, '<p>\r\n	上午商议江苏物流枢纽项目汇报\r\n</p>\r\n<p>\r\n	下午启程赴南京\r\n</p>', 0, '2014-09-12 06:22:04', 112, 10, 40, 3),
(192, '20140801', 14, 8.5, '<p>\r\n	1. 上午参与江苏十三五规划研讨；\r\n</p>\r\n<p>\r\n	2. 下午进行江苏综合交通物流枢纽中间成果汇报\r\n</p>', 0, '2014-09-12 06:23:11', 112, 10, 40, 3),
(193, '20140912', 5, 8.0, '完成了示范应用专题报告', 0, '2014-09-12 07:15:08', 125, 31, 47, 20),
(194, '20140911', 9, 10.0, '下午修改ppt4小时，晚上加班修改ppt6小时，其中实习生曾维樵协助参与工作3小时', 0, '2014-09-12 09:04:34', 72, 7, 32, 20),
(195, '20140912', 9, 9.0, '全天修改ppt', 0, '2014-09-12 09:01:14', 72, 7, 32, 20),
(196, '20140911', 14, 2.5, '', 0, '2014-09-12 09:04:15', 134, 7, 32, 10),
(197, '20140911', 5, 0.5, '准备专家评审会会议材料', 0, '2014-09-16 02:31:55', 135, 3, 22, 3),
(198, '20140916', 4, 3.5, '<p>\r\n	参考之前的项目报告，确定方法以及基本数据。\r\n</p>\r\n<p>\r\n	下午主要是用弹性系数法预测客运量，未完成。\r\n</p>\r\n<p>\r\n	然后做国内外经验借鉴的资料查询\r\n</p>', 0, '2014-09-16 08:13:19', 136, 41, 30, 3),
(199, '20140912', 5, 5.0, '交通部开项目讨论会，会务，会议记录', 0, '2014-09-16 02:32:55', 135, 3, 22, 3),
(200, '20140913', 5, 9.0, '1309,封闭修改报告', 0, '2014-09-16 02:33:33', 135, 3, 22, 3),
(201, '20140914', 5, 10.0, '1401封闭修改报告', 0, '2014-09-16 02:33:52', 135, 3, 22, 3),
(202, '20140915', 5, 11.0, '18楼会议室集中封闭、讨论', 0, '2014-09-16 02:35:04', 135, 3, 22, 3),
(203, '20140916', 9, 1.0, '修改润色提交金所、王所', 0, '2014-09-16 02:35:29', 135, 3, 22, 3),
(204, '20140915', 5, 1.0, '修改目标市场思路与技术路线', 0, '2014-09-16 02:36:49', 22, 3, 6, 20),
(205, '20140912', 5, 2.0, '修改需求结构及技术路线', 0, '2014-09-16 02:37:23', 22, 3, 6, 20),
(206, '20140911', 5, 4.0, '修改报告结构、修改案例', 0, '2014-09-16 02:38:57', 104, 3, 43, 20),
(207, '20140910', 5, 3.0, '', 0, '2014-09-16 02:52:05', 104, 3, 43, 20),
(208, '20140911', 5, 2.0, '', 0, '2014-09-16 02:52:30', 22, 3, 6, 20),
(209, '20140916', 5, 3.5, '消化资料；准备编写提纲的编制', 0, '2014-09-16 07:37:19', 92, 10, 30, 20),
(210, '20140917', 6, 4.5, '今天一直在编制赵主任给的任务，就是在transCAD上进行点点，以及查询国外物流经验借鉴的材料', 0, '2014-09-17 04:07:59', 136, 41, 30, 3),
(211, '20140913', 9, 6.0, '加班修改ppt，完成初稿并提交给王所', 0, '2014-09-17 06:40:15', 72, 7, 32, 20),
(212, '20140914', 14, 3.0, '王所指导修改ppt，并于下午乘坐飞机前往重庆。', 0, '2014-09-17 06:40:54', 72, 7, 32, 20),
(213, '20140915', 14, 4.0, '工作大纲会，李院长、关院长、石总、王所及我参加，重庆交委滕主任、陈主任，汪主任及相关处室，渝勘院等领导参会，下午乘机返回', 0, '2014-09-17 06:42:17', 72, 7, 32, 20),
(214, '20140916', 8, 12.0, '全天修改ppt，晚上加班5小时进行ppt的修改。', 0, '2014-09-17 06:47:55', 137, 7, 22, 1),
(215, '20140917', 9, 3.5, '向翁部长汇报，并将根据其修改意见进行修改完善。', 0, '2014-09-17 06:48:29', 137, 7, 22, 1),
(216, '20140901', 5, 6.0, '', 0, '2014-09-18 00:58:24', 19, 2, 6, 20),
(217, '20140917', 5, 3.5, '根据部西部办形式审查要求，完善相关报告、补充核实有关财务、应用证明等材料', 0, '2014-09-18 00:58:28', 149, 10, 47, 3),
(218, '20140905', 5, 6.0, '', 0, '2014-09-18 00:58:37', 19, 2, 6, 20),
(219, '20140906', 5, 6.0, '', 0, '2014-09-18 00:58:52', 19, 2, 6, 20),
(220, '20140915', 5, 6.0, '', 0, '2014-09-18 00:59:10', 20, 2, 6, 20),
(221, '20140916', 5, 6.0, '', 0, '2014-09-18 00:59:17', 20, 2, 6, 20),
(222, '20140909', 5, 9.0, '', 0, '2014-09-18 01:02:04', 140, 2, 20, 2),
(223, '20140910', 5, 9.0, '', 0, '2014-09-18 01:02:12', 140, 2, 20, 2),
(224, '20140911', 14, 9.0, '', 0, '2014-09-18 01:09:01', 140, 2, 20, 2),
(225, '20140917', 5, 3.0, '根据形式审查要求，完善报告排版；审核补充有关分包方财务报告、应用证明等内容；', 0, '2014-09-18 01:06:09', 151, 10, 47, 1),
(226, '20140912', 14, 6.0, '', 0, '2014-09-18 01:08:37', 141, 2, 20, 3),
(227, '20140918', 14, 4.5, '已完成上报项目的添加，现在正在进行产业园区的点的添加。', 0, '2014-09-22 04:13:42', 146, 41, 9, 3),
(228, '20140917', 5, 4.5, '<p>\r\n	参与交通运输部汇报\r\n</p>\r\n<p>\r\n	会后谈论修改方案\r\n</p>', 0, '2014-09-18 02:08:49', 135, 3, 22, 3),
(229, '20140916', 5, 5.0, '修改方案', 0, '2014-09-18 02:09:25', 22, 3, 6, 20),
(230, '20140917', 5, 4.0, '修改方案，统稿', 0, '2014-09-18 02:09:43', 22, 3, 6, 20),
(231, '20140916', 14, 1.0, '针对国家铁路局意见修改提案建议的回复', 0, '2014-09-18 02:12:37', 54, 3, 21, 3),
(232, '20140919', 14, 1.0, '根据王所的反馈意见进行了部分PPT的修改', 0, '2014-09-19 06:59:35', 137, 7, 22, 1),
(233, '20140919', 14, 5.0, '<p>\r\n	上午完成昨天的产业园区的任务。\r\n</p>\r\n<p>\r\n	下午对湖北经济带项目中的总量预测用回归分析法做了一下。\r\n</p>', 0, '2014-09-19 07:46:24', 146, 41, 9, 3),
(234, '20140922', 14, 2.0, '修改建模地图，完成。', 0, '2014-09-22 07:00:51', 146, 41, 9, 3),
(235, '20140918', 5, 4.0, '综合运输指标体系初稿并提交', 0, '2014-09-22 06:26:30', 135, 3, 22, 3),
(236, '20140919', 5, 4.0, '根据王所反馈意见，修改指标体系指标及报告', 0, '2014-09-22 06:26:06', 135, 3, 22, 3),
(237, '20140918', 5, 1.0, '与王总讨论修改方法', 0, '2014-09-22 06:27:15', 22, 3, 6, 20),
(238, '20140918', 5, 3.5, '结合反馈意见修改报告结构', 0, '2014-09-22 06:28:21', 104, 3, 43, 20),
(239, '20140919', 5, 3.0, '修改案例、文整', 0, '2014-09-22 06:28:48', 104, 3, 43, 20),
(240, '20140922', 5, 2.0, '结合李可意见修改报告、提交二审', 0, '2014-09-22 06:29:57', 104, 3, 43, 20),
(241, '20140922', 5, 1.0, '结合部关于各省资金生情报告评审的要求与无锡市运管处、西站物流沟通评审、批复时间，现场情况', 0, '2014-09-22 06:32:06', 75, 3, 5, 3),
(242, '20140919', 5, 0.5, '东莞保税物流中心大纲、项目简介', 0, '2014-09-22 06:34:26', 75, 3, 5, 3),
(243, '20140922', 5, 6.0, '消化资料，并向李主任提交通道及现网布局规划的时间进度表', 0, '2014-09-22 09:10:21', 65, 7, 30, 20),
(244, '20140920', 5, 2.0, '消化资料', 0, '2014-09-22 09:08:51', 65, 7, 30, 20),
(245, '20140919', 5, 4.5, '消化资料', 0, '2014-09-22 09:09:41', 65, 7, 30, 20),
(246, '20140918', 5, 4.0, '消化资料', 0, '2014-09-22 09:09:49', 65, 7, 30, 20),
(247, '20140923', 14, 5.5, '根据于司长的要求进行修改，根据王所的要求进行了现有规划大纲与十二五的区别的梳理并修改ppt', 0, '2014-09-23 10:38:46', 137, 7, 22, 1),
(248, '20140923', 7, 5.5, 'transCAD建模 确定底图以及底图配准 坐标变换等工作准备。', 0, '2014-09-23 06:10:58', 136, 41, 30, 3),
(249, '20140923', 5, 1.5, '消化资料', 0, '2014-09-23 10:39:09', 65, 7, 30, 20),
(250, '20140917', 5, 8.0, '<p>\r\n	湖北项目-区域比较分析工作思路填充内容、提交\r\n</p>', 0, '2014-09-24 02:48:29', 97, 9, 30, 20),
(252, '20140918', 7, 8.0, '<p align="left">\r\n	湖北物流园区上报项目添加\r\n</p>', 0, '2014-09-24 02:44:17', 145, 9, 9, 3),
(253, '20140919', 14, 8.0, '<p>\r\n	完成湖北物流园区上报项目添加\r\n</p>', 0, '2014-09-24 02:44:52', 145, 9, 9, 3),
(254, '20140916', 5, 8.0, '湖北项目 针对区域比较部分，参考阅读武汉及其他项目', 0, '2014-09-24 02:50:35', 97, 9, 30, 20),
(255, '20140923', 5, 8.0, '<p>\r\n	transcad点线面建模研究，与地方联系确定收集底图\r\n</p>', 0, '2014-09-24 02:56:19', 97, 9, 30, 20),
(256, '20140922', 5, 8.0, '<p>\r\n	<span>形势与需求分析工作大纲编写-社会经济趋势预测与分析</span>\r\n</p>', 0, '2014-09-24 03:02:55', 97, 9, 30, 20),
(257, '20140924', 4, 4.0, '', 0, '2014-09-24 05:49:30', 154, 41, 30, 20),
(258, '20140923', 5, 4.5, '铁道部经规院中期评审会', 0, '2014-09-25 00:26:46', 155, 3, 50, 20),
(259, '20140922', 5, 0.5, '联系开会事宜', 0, '2014-09-25 00:27:02', 155, 3, 50, 20),
(260, '20140923', 5, 1.0, '对接任务，整理资料', 0, '2014-09-25 00:29:58', 156, 3, 15, 3),
(261, '20140924', 5, 1.0, '修改报告', 0, '2014-09-25 00:31:11', 22, 3, 6, 20),
(262, '20140924', 5, 5.0, '<p>\r\n	修改工可及资金申请报告格式，准备打印；\r\n</p>\r\n<p>\r\n	编制西站物流节能材料。\r\n</p>', 0, '2014-09-25 00:32:25', 75, 3, 5, 3),
(263, '20140923', 5, 3.0, '根据二审要求修改报告、提交三审', 0, '2014-09-25 00:33:35', 10, 3, 4, 20),
(264, '20140923', 5, 1.0, '对接项目进度及批复存在问题', 0, '2014-09-25 00:34:41', 75, 3, 5, 3),
(265, '20140922', 5, 2.5, '大纲及内容调整', 0, '2014-09-25 00:35:32', 76, 3, 17, 3),
(266, '20140924', 5, 2.0, '需求分析，流向图编制', 0, '2014-09-25 00:37:00', 148, 3, 9, 3),
(267, '20140923', 5, 1.0, '湖北省物流通道空间拓扑图绘制', 0, '2014-09-25 00:37:28', 148, 3, 9, 3),
(268, '20140925', 5, 6.5, '将公路铁路图配准。', 0, '2014-09-25 01:40:18', 154, 41, 30, 20),
(269, '20140924', 14, 6.5, '按照于司长的要求进行了部分内容的修改，下午参加部长专题会', 0, '2014-09-25 05:56:22', 137, 7, 22, 1),
(270, '20140924', 14, 6.0, '加班6小时，完成李院长发言的ppt', 0, '2014-09-25 06:07:38', 157, 7, 52, 15),
(271, '20140925', 14, 4.0, '陪同参会，完成！', 0, '2014-09-25 06:09:23', 158, 7, 52, 7),
(272, '20140919', 14, 7.5, '参加会议，并领取分工任务', 0, '2014-09-25 06:48:51', 159, 4, 14, 12),
(274, '20140920', 9, 4.5, '根据陈总的意见，进一步修改补充相关素材', 0, '2014-09-25 06:50:50', 59, 4, 11, 20),
(275, '20140917', 8, 4.0, '接受甲方的附件，进行添加', 0, '2014-09-25 06:51:32', 60, 4, 27, 3),
(276, '20140917', 8, 4.0, '对甲方发来的附件进行审查，核对，并提出相关后续补充的要求', 0, '2014-09-25 06:52:16', 56, 4, 10, 20),
(277, '20140921', 8, 4.5, '完成第一轮修改，添加了动画效果', 0, '2014-09-25 06:55:54', 59, 4, 11, 20),
(278, '20140922', 9, 4.5, '项目组内部汇报演示，陈总和赵主任提出进一步的修改意见', 0, '2014-09-25 06:54:19', 59, 4, 11, 20),
(279, '20140924', 9, 4.5, '根据最新的意见进行修改和完善', 0, '2014-09-25 06:55:09', 59, 4, 11, 20),
(280, '20140925', 14, 5.0, '进一步的修改完善，形成定稿！同步对报告进行了更新', 0, '2014-09-25 06:55:42', 59, 4, 11, 20),
(282, '20140925', 9, 4.0, '争取形成初步框架，提交给陆主任和陈总', 0, '2014-09-25 06:57:00', 60, 4, 27, 3),
(283, '20140922', 14, 2.0, '完成提交给刘所', 0, '2014-09-25 07:07:38', 160, 4, 14, 3),
(284, '20140923', 8, 4.0, '完成相关素材', 0, '2014-09-25 07:09:16', 60, 4, 27, 3),
(285, '20140926', 14, 11.0, '编写相关案例分析', 0, '2014-09-30 01:49:14', 162, 41, 8, 3),
(286, '20140924', 9, 7.0, '<p>\r\n	客、货运枢纽发展目标的指导思想和基本原则\r\n</p>', 0, '2014-09-28 02:35:00', 46, 9, 26, 3),
(287, '20140925', 14, 7.5, '货运枢纽的发展定位 和战略目标', 0, '2014-09-28 02:36:05', 46, 9, 26, 3),
(288, '20140927', 14, 14.5, '翻译加案例编写', 0, '2014-09-30 01:50:05', 162, 41, 8, 3),
(289, '20140928', 14, 14.5, '翻译', 0, '2014-09-30 01:49:58', 162, 41, 8, 3),
(290, '20140930', 5, 8.0, '湖北省省道图编画', 0, '2014-09-30 01:51:15', 154, 41, 30, 20),
(291, '20140928', 9, 6.0, '消化资料，修改', 0, '2014-09-30 01:57:07', 60, 4, 27, 3),
(292, '20140929', 14, 6.0, '完成初稿', 0, '2014-09-30 01:57:33', 60, 4, 27, 3),
(293, '20140929', 7, 1.0, '沟通协调下一步思想，国庆要加班', 0, '2014-09-30 01:59:16', 86, 4, 42, 20),
(294, '20140926', 14, 17.0, '完成与区长及各部门的沟通，当天来回', 0, '2014-09-30 02:01:20', 161, 4, 11, 12),
(295, '20140928', 6, 1.5, '<p>\r\n	沟通，索要相关部门的意见；\r\n</p>\r\n<p>\r\n	并反馈我们的基本处理态度\r\n</p>', 0, '2014-09-30 02:06:12', 163, 4, 11, 3),
(296, '20140921', 8, 1.5, '撰写相关部分', 0, '2014-09-30 02:07:12', 57, 4, 14, 20),
(297, '20140922', 14, 1.5, '撰写完成相关内容，提交给刘所', 0, '2014-09-30 02:07:40', 57, 4, 14, 20),
(298, '20140923', 8, 4.0, '<p>\r\n	继续消化吸收材料\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 0, '2014-09-30 02:08:17', 86, 4, 42, 20),
(299, '20140930', 7, 5.0, '去部里领取任务和要求', 0, '2014-09-30 02:09:04', 86, 4, 42, 20),
(300, '20141008', 5, 4.0, '研读相关材料，并初步确定该部分的编写思路。', 0, '2014-10-09 02:04:16', 164, 7, 27, 3),
(301, '20141009', 9, 6.0, '压缩的初步成果已经提交', 0, '2014-10-11 01:30:30', 165, 7, 33, 3),
(302, '20141009', 14, 3.0, '整理9月24日专题汇报会的录音内容', 0, '2014-10-11 01:32:12', 137, 7, 22, 1),
(303, '20141010', 5, 6.0, '', 0, '2014-10-11 01:35:45', 166, 7, 22, 3),
(304, '20140926', 5, 2.0, '', 0, '2014-10-13 00:31:33', 22, 3, 6, 20),
(305, '20140925', 5, 6.0, '对接报告附件（名称声明），照片，制作项目PPT', 0, '2014-10-13 00:34:16', 75, 3, 5, 3),
(306, '20140926', 5, 6.5, '<p>\r\n	联系水运所、朱总、车辆，确定会议时间、地点\r\n</p>\r\n<p>\r\n	至发改委参会\r\n</p>\r\n<p>\r\n	整理会议纪要发王所\r\n</p>', 0, '2014-10-13 00:39:30', 167, 3, 53, 12),
(307, '20141006', 5, 2.5, '根据三审要求修改报告', 0, '2014-10-13 00:43:40', 22, 3, 6, 20),
(308, '20141007', 5, 5.0, '<span>根据三审要求修改报告</span>', 0, '2014-10-13 00:43:58', 22, 3, 6, 20),
(309, '20141008', 7, 3.5, '梳理甲方的意见，拟定修改工作的方案', 0, '2014-10-13 01:02:45', 163, 4, 11, 3),
(310, '20141010', 7, 3.5, '讨论并落实相关工作安排', 0, '2014-10-13 01:03:20', 163, 4, 11, 3),
(311, '20141011', 9, 7.0, '上午进行了部分ppt的修改，2小时，下午继续在18楼改稿子', 0, '2014-10-13 01:03:23', 166, 7, 22, 3),
(312, '20141011', 8, 3.0, '与田野商讨交通衔接部分的修改方案，并将修改方案发给甲方，征求意见', 0, '2014-10-13 01:04:30', 163, 4, 11, 3),
(313, '20141008', 6, 3.5, '', 0, '2014-10-13 01:38:36', 170, 4, 27, 3),
(314, '20141009', 7, 6.0, '消化相关资料', 0, '2014-10-13 01:39:51', 170, 4, 27, 3),
(315, '20141010', 7, 2.5, '', 0, '2014-10-13 01:40:04', 170, 4, 27, 3),
(316, '20141013', 9, 3.5, 'ppt修改~', 0, '2014-10-13 06:26:54', 166, 7, 22, 3),
(317, '20150105', 9, 3.0, '', 0, '2015-01-06 00:42:37', 174, 7, 32, 3),
(318, '20150105', 14, 1.5, '', 0, '2015-01-06 03:28:12', 175, 3, 53, 12),
(319, '20150104', 7, 1.0, '', 0, '2015-01-06 03:28:20', 175, 3, 53, 12),
(320, '20150101', 14, 0.0, '', 0, '2015-01-08 00:33:23', 121, 15, 47, 20),
(321, '20150205', 14, 3.0, '', 0, '2015-02-05 09:52:11', 184, 3, 53, 10),
(322, '20150209', 5, 3.0, '', 0, '2015-02-09 02:30:34', 190, 15, 61, 3),
(323, '20150304', 5, 2.5, '物流通道三重大及铁路信息讨论，通道衔接三重大初稿', 0, '2015-03-04 10:02:10', 191, 3, 18, 3),
(324, '20150303', 5, 4.0, '至水规处修改材料', 0, '2015-03-04 10:04:46', 192, 3, 53, 3),
(325, '20150303', 5, 1.5, '与方总讨论修改方案', 0, '2015-03-04 10:06:21', 76, 3, 17, 3),
(326, '20150303', 5, 4.0, '修改报告', 0, '2015-03-04 10:07:52', 22, 3, 6, 20),
(327, '20150304', 5, 4.5, '修改报告', 0, '2015-03-04 10:14:40', 22, 3, 6, 20),
(328, '20150302', 5, 1.0, '修改报告', 0, '2015-03-04 10:08:29', 22, 3, 6, 20),
(329, '20150302', 5, 6.5, '物流大通道数据分析，编制说明，准备中财办大通道材料，上下午各一次讨论会', 0, '2015-03-04 10:18:00', 191, 3, 18, 3),
(330, '20150304', 5, 0.5, '核实2014年铁路相关数据', 0, '2015-03-04 10:09:48', 192, 3, 53, 3),
(331, '20150303', 5, 0.5, '铁路数据需求校核', 0, '2015-03-04 10:14:18', 193, 3, 77, 3),
(332, '20150323', 5, 10.0, '物流大通道阈值分析，至综规司修改调研函（10：30-20：30）', 0, '2015-03-25 00:26:03', 191, 3, 18, 3),
(333, '20150324', 5, 8.5, '集装箱流量流向分析，大通道阈值与结构集中讨论', 0, '2015-03-25 00:26:55', 191, 3, 18, 3),
(334, '20150402', 6, 3.5, '完成开题评审', 0, '2015-04-03 02:44:44', 194, 18, 81, 3),
(335, '20150401', 9, 0.0, '完成报告初稿', 0, '2015-04-03 02:43:58', 195, 18, 80, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tk_task_tpye`
--

DROP TABLE IF EXISTS `tk_task_tpye`;
CREATE TABLE IF NOT EXISTS `tk_task_tpye` (
  `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_tpye` varchar(60) NOT NULL,
  `tk_task_typerank` varchar(60) NOT NULL,
  `task_tpye_backup1` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_task_tpye`
--

INSERT INTO `tk_task_tpye` (`id`, `task_tpye`, `tk_task_typerank`, `task_tpye_backup1`) VALUES
(1, '项目管理', '', 1),
(2, '实地调研', '', 2),
(3, '编写报告', '', 3),
(7, '院会议', '', 4),
(8, '所会议', '', 5),
(9, '室会议', '', 6),
(10, '项目组讨论会', '', 7),
(12, '其他会议', '', 8),
(14, '请假', '', 9),
(15, '加班', '', 10),
(16, '项目二审', '', 11),
(20, '子项目', '', 0),
(21, '项目三审', '', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tk_team`
--

DROP TABLE IF EXISTS `tk_team`;
CREATE TABLE IF NOT EXISTS `tk_team` (
  `pid` bigint(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `tk_team_title` text,
  `tk_team_title_en` varchar(200) DEFAULT NULL,
  `tk_team_backup1` text,
  `tk_team_backup2` text,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tk_user`
--

DROP TABLE IF EXISTS `tk_user`;
CREATE TABLE IF NOT EXISTS `tk_user` (
  `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tk_user_login` varchar(60) NOT NULL DEFAULT '',
  `tk_user_pass` varchar(64) NOT NULL DEFAULT '',
  `tk_user_token` varchar(60) NOT NULL DEFAULT '0',
  `tk_display_name` varchar(50) NOT NULL DEFAULT '',
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `tk_user_status` varchar(60) NOT NULL DEFAULT '',
  `tk_user_registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tk_user_remark` text NOT NULL,
  `tk_user_rank` tinyint(2) NOT NULL DEFAULT '0',
  `tk_user_contact` varchar(50) NOT NULL DEFAULT '',
  `tk_user_email` varchar(100) NOT NULL DEFAULT '',
  `tk_user_message` bigint(20) NOT NULL DEFAULT '0',
  `tk_user_lastuse` text,
  `tk_user_backup1` varchar(60) NOT NULL,
  `tk_pinyin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tk_user`
--

INSERT INTO `tk_user` (`uid`, `tk_user_login`, `tk_user_pass`, `tk_user_token`, `tk_display_name`, `pid`, `tk_user_status`, `tk_user_registered`, `tk_user_remark`, `tk_user_rank`, `tk_user_contact`, `tk_user_email`, `tk_user_message`, `tk_user_lastuse`, `tk_user_backup1`, `tk_pinyin`) VALUES
(45, 'test1', '1d8f25e6c3468411f4a907da915a2e73', '0', '张三', 0, '', '2015-12-03 01:41:15', '', 4, '12345678', '', 0, NULL, '', NULL),
(46, 'lisi', '4201873950eb751e7647c28a775ecad6', '0', '李四', 0, '', '2015-12-03 01:42:24', '', 3, '', '', 0, NULL, '', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
