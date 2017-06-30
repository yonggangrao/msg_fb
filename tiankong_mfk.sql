-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 03 月 04 日 21:58
-- 服务器版本: 10.0.8-MariaDB-1~precise
-- PHP 版本: 5.4.9-4ubuntu1~precise1~ppa1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `tiankong_mfk`
--

-- --------------------------------------------------------

--
-- 表的结构 `bill`
--

CREATE TABLE IF NOT EXISTS `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `cost` float NOT NULL,
  `price` float NOT NULL,
  `count` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `bill`
--

INSERT INTO `bill` (`id`, `name`, `cost`, `price`, `count`, `pro_id`) VALUES
(3, '[', 0, 0, 0, 20),
(4, '一', 18.9, 0.9, 21, 15),
(10, '一', 2.1, 2.1, 1, 18),
(11, '二', 3.8, 1.9, 2, 18),
(14, '达到', 3.6, 1.2, 3, 26),
(15, '第三', 7.6, 1.9, 4, 26),
(16, '丁字', 0.2, 0.1, 2, 35),
(17, '你好', 35.2, 1.1, 32, 33),
(18, '不好', 0.1, 0.1, 1, 33),
(19, '萨', 6.4, 0.2, 32, 32),
(20, '1', 3.6, 0.9, 4, 31),
(21, '2', 0.6, 0.2, 3, 31),
(22, '3', 4, 0.2, 20, 31),
(23, '4', 0.1, 0.1, 1, 31),
(24, '色', 3.6, 1.8, 2, 30),
(25, '萨', 18, 4.5, 4, 34),
(26, '萨', 9.6, 3.2, 3, 29),
(27, '钉子', 2, 0.5, 4, 39),
(28, '锤子', 10, 10, 1, 39),
(29, '钉子', 9, 0.9, 10, 40);

-- --------------------------------------------------------

--
-- 表的结构 `block`
--

CREATE TABLE IF NOT EXISTS `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `block`
--

INSERT INTO `block` (`id`, `name`) VALUES
(5, '教育学部'),
(6, '马列学部'),
(7, '化学学院'),
(8, '物理学院'),
(9, '城市与环境科学学院'),
(10, '外国语学院'),
(11, '音乐学院'),
(12, '国际关系学院'),
(13, '体育学院'),
(14, '历史文化学院'),
(15, '文学院'),
(16, '图书馆'),
(17, '田径馆'),
(18, '校医院'),
(19, '幼儿园'),
(20, '一舍A/B'),
(21, '二舍'),
(22, '三舍A/B '),
(23, '四舍'),
(24, '五舍'),
(25, '综合办公楼'),
(26, '逸夫教学楼'),
(27, '逸夫科技馆'),
(28, '综合教学楼'),
(29, '校园公区环境'),
(30, '六舍'),
(31, '七舍'),
(32, '八舍'),
(33, '九舍'),
(35, 'test');

-- --------------------------------------------------------

--
-- 表的结构 `depart`
--

CREATE TABLE IF NOT EXISTS `depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sendToCenter` tinyint(4) DEFAULT '0',
  `center` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_depart_user1_idx` (`center`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `depart`
--

INSERT INTO `depart` (`id`, `name`, `sendToCenter`, `center`) VALUES
(1, '学生宿舍', 1, 12),
(2, '学院及直属单位', 0, 13),
(3, '公用楼', 0, 14),
(4, '校园公区环境', 0, 15);

-- --------------------------------------------------------

--
-- 表的结构 `map_block_depart`
--

CREATE TABLE IF NOT EXISTS `map_block_depart` (
  `block_id` int(11) NOT NULL,
  `depart_id` int(11) NOT NULL,
  PRIMARY KEY (`block_id`,`depart_id`),
  KEY `fk_map_block_depart_block1_idx` (`block_id`),
  KEY `fk_map_block_depart_depart1_idx` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `map_block_depart`
--

INSERT INTO `map_block_depart` (`block_id`, `depart_id`) VALUES
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 4),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(35, 1);

-- --------------------------------------------------------

--
-- 表的结构 `problem`
--

CREATE TABLE IF NOT EXISTS `problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '问题标题',
  `content` longtext NOT NULL COMMENT '问题描述',
  `phone` varchar(11) NOT NULL COMMENT '提问题者的电话',
  `block_id` int(11) NOT NULL,
  `depart_id` int(11) NOT NULL,
  `starContent` longtext COMMENT '评价内容',
  `star` int(11) DEFAULT NULL COMMENT '问题评价等级',
  `state` int(11) NOT NULL COMMENT '1 ask -> wait to  check\n2 ac  -> wait to accept\n3 fix  -> fixxing\n4 finish ->wait to evaluate\n5  evaluate -> over\n6 not pass the check',
  `reason` longtext COMMENT '问题原因',
  `result` longtext COMMENT '维修结果',
  `totalCharge` varchar(255) DEFAULT NULL COMMENT '总共花费',
  `total_time` varchar(255) DEFAULT NULL COMMENT '总用时\n从提问题到问题解决。',
  `realName` varchar(45) NOT NULL,
  `fixProple` varchar(45) DEFAULT NULL COMMENT '维修人',
  `fixProplePhone` varchar(11) DEFAULT NULL COMMENT '维修人电话',
  `twentyFourHour` int(11) NOT NULL DEFAULT '0' COMMENT '是否进行过24小时提醒，提醒一次后不再提醒',
  PRIMARY KEY (`id`),
  KEY `fk_pro_user_idx` (`user_id`),
  KEY `fk_problem_depart1_idx` (`depart_id`),
  KEY `fk_problem_block1_idx` (`block_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `problem`
--

INSERT INTO `problem` (`id`, `user_id`, `title`, `content`, `phone`, `block_id`, `depart_id`, `starContent`, `star`, `state`, `reason`, `result`, `totalCharge`, `total_time`, `realName`, `fixProple`, `fixProplePhone`, `twentyFourHour`) VALUES
(1, 2, 'test01', 'test01', '13944097701', 25, 3, NULL, NULL, 6, NULL, NULL, NULL, NULL, 'test', NULL, NULL, 0),
(2, 2, 'test02', 'test02', '13944097701', 26, 3, '服务态度很好', 5, 5, NULL, '修好', '5.4', '10519950', 'test', '', '12345678901', 0),
(3, 2, '第一卷 魔鬼训练营 第二章 失败者的惩罚', '1. 熟悉 ubuntu 系统。\n\n一般用 Ubuntu 的用户是刚从 windows 下过来的，用着可能各种不爽，但是请不要着急，慢慢会感觉爽的。\n\n2. 选择一个好的源，更新系统。\n\n你可能不知到什么是源，不过没关系。\n请更新源。不会的可以 google.\n\n3.视频软件\n	mplayer\n	\n4.音乐播放器\n	audacious\n\n5.BT下载\n	deluge\n	', '13944097701', 21, 1, NULL, NULL, 6, NULL, NULL, NULL, NULL, 'test', NULL, NULL, 0),
(4, 6, '管理员也要提问题', '管理员也要提问题', '13944097701', 20, 1, '服务态度很好', 5, 5, NULL, '修好', '0', '182558', 'test', '袁小康', NULL, 0),
(6, 7, '111', '&lt;script&gt;alert(&quot;hello&quot;);&lt;script&gt;\n&aelig;', '13944097701', 20, 1, NULL, NULL, 6, NULL, NULL, NULL, NULL, 'test', NULL, NULL, 0),
(8, 7, 'htmlspecialchars测试一下', 'htmlspecialchars测试一下 &lt;script&gt;alert(&quot;hello&quot;);&lt;script&gt;', '13944097701', 24, 1, '服务态度很好', 5, 5, NULL, '修好', '0', '2733', 'test', 'sa', NULL, 0),
(9, 7, '真实姓名测试', '$name', '13944097701', 20, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(10, 6, '桌子坏了哦', '桌子坏了哦桌子坏了哦桌子坏了哦', '15948300521', 22, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, '高健', NULL, NULL, 1),
(11, 6, '提交问题记录了吗', '提交问题记录了吗', '13944097701', 23, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(12, 6, '第二次', '第二次', '13944097701', 25, 3, NULL, NULL, 2, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(13, 6, '第二次', '第二次', '13944097701', 25, 3, NULL, NULL, 2, NULL, NULL, NULL, NULL, '第二次', NULL, NULL, 1),
(14, 6, '第二次', '第二次', '13944097701', 25, 3, NULL, NULL, 2, NULL, NULL, NULL, NULL, '第二次', NULL, NULL, 1),
(15, 6, '第二次', '第二次', '13944097701', 25, 3, '服务态度很好', 5, 5, NULL, '修好', '79.7', '2156930', '第二次', '', '12345678901', 0),
(16, 6, '$phone', '$phone', '13944097701', 8, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(17, 6, '$phone', '$phone', '13944097701', 8, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(18, 6, '$phone', '$phone', '13944097701', 8, 2, '服务态度很好', 5, 5, NULL, '修好', '5.9', '2158680', '袁小康', '', '12345678901', 0),
(19, 6, '$phone', '$phone', '13944097701', 8, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(20, 6, '提交问题', '提交问题', '13944097701', 6, 2, '服务态度很好', 5, 5, NULL, '修好', '7.9', '2155543', '袁小康', '', '12345678901', 0),
(21, 6, '提交问题', '提交问题', '13944097701', 6, 2, '修好', 4, 5, NULL, '修好', '0', '199', '袁小康', '袁小康', NULL, 0),
(22, 6, '$phone_num', '$phone_num', '13944097701', 22, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(23, 9, '一样不好', 'sasa', '13944097701', 26, 3, '服务态度很好', 5, 5, NULL, '修好', '8.4', '2143748', '袁小康', '', '12345678901', 0),
(24, 4, 'ddee', 'dddddd', '15948300521', 20, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'eeeee', NULL, NULL, 1),
(25, 4, 'ddee', 'dddddd', '15948300521', 20, 1, NULL, NULL, 3, NULL, NULL, NULL, NULL, 'eeeee', NULL, NULL, 1),
(26, 4, 'ddee', 'ddddddddd', '15948300521', 20, 1, '服务态度很好', 5, 5, NULL, '修好', '11.2', '2100375', 'eeeee', '', '12345678901', 0),
(27, 6, 'fghsfgh', 'sdfgsdfgsdfgs', '15948300521', 21, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'shs', NULL, NULL, 1),
(28, 6, 'fghsfgh', 'sdfgsdfgsdfgs', '15948300521', 21, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'shs', NULL, NULL, 1),
(29, 6, 'fghsfgh', 'sdfgsdfgsdfgs', '15948300521', 21, 1, '服务态度很好', 5, 5, '你好', '修好', '9.6', '2091121', 'shs', '张三', '09876787654', 0),
(30, 6, 'fghsfgh', 'sdfgsdfgsdfgs', '15948300521', 21, 1, '服务态度很好', 5, 5, NULL, '修好', '3.6', '2090720', 'shs', '看哦看哦', '09876543456', 0),
(31, 6, 'fghsfgh', 'sdfgsdfgsdfgs', '15948300521', 21, 1, '服务态度很好', 5, 5, NULL, '修好', '8.3', '2090456', 'shs', '到达', '12345678909', 0),
(32, 6, 'fghsfgh', 'sdfgsdfgsdfgs', '15948300521', 21, 1, '很好', 4, 5, NULL, '修好', '6.4', '2090403', 'shs', '里斯', '09876543212', 0),
(33, 6, 'fghsfgh', 'sdfgsdfgsdfgs', '15948300521', 21, 1, '服务态度很好', 5, 5, NULL, '修好', '35.3', '2090298', 'shs', '张三', '12345678901', 0),
(34, 6, 'zdsfgdf', 'zxcvzxcvzx', '15948300521', 23, 1, '服务态度很好', 5, 5, NULL, '修好', '18', '2090741', 'sdfg', '飒飒', '09090909876', 0),
(35, 6, 'zdsfgdf', 'zxcvzxcvzx', '15948300521', 23, 1, '服务态度很好', 5, 5, NULL, '修好', '0.2', '2088004', 'sdfg', '', '12345678901', 0),
(36, 9, 'test', 'test', '13944097701', 8, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(37, 6, 'test', 'test', '13944097701', 22, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(38, 6, 't01', 't01', '13944097701', 22, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(39, 9, '大型网站技术架构：核心原理与案例分析', 'dddd', '13944097701', 6, 2, '修好', 5, 5, '桌子坏了', '修好', '12', '1447', '袁小康', '甲', '12345678901', 0),
(40, 9, 't2', 't2', '18744047712', 25, 3, '服务态度很好', 5, 5, '搜索', '修好', '9', '966', '袁小康', '乙', '09876543212', 0),
(41, 9, 'test01', 'test01', '18744047569', 26, 3, NULL, NULL, 3, NULL, NULL, NULL, NULL, '袁小康', NULL, NULL, 1),
(42, 9, 'grsgrdg', 'xczxc', '15948300521', 27, 3, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'wetgert', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `problem_time`
--

CREATE TABLE IF NOT EXISTS `problem_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_problem_time_problem1_idx` (`pro_id`),
  KEY `fk_problem_time_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=128 ;

--
-- 转存表中的数据 `problem_time`
--

INSERT INTO `problem_time` (`id`, `pro_id`, `user_id`, `time`, `state`) VALUES
(1, 1, 2, 1371563340, 1),
(2, 2, 2, 1371563356, 1),
(3, 3, 2, 1373717191, 1),
(4, 4, 6, 1373766565, 1),
(5, 4, 6, 1373882427, 2),
(6, 2, 6, 1373883119, 2),
(7, 3, 6, 1373884679, 6),
(8, 4, 7, 1373936836, 3),
(10, 6, 7, 1373941296, 1),
(12, 8, 7, 1373941674, 1),
(13, 8, 6, 1373941710, 2),
(14, 6, 6, 1373941721, 6),
(17, 1, 6, 1373941743, 6),
(18, 9, 7, 1373942589, 1),
(19, 8, 7, 1373942690, 3),
(20, 8, 7, 1373944407, 4),
(21, 4, 7, 1373949123, 4),
(22, 4, 6, 1373949646, 5),
(23, 10, 6, 1374056331, 1),
(24, 10, 4, 1374056331, 2),
(25, 9, 6, 1374056439, 2),
(26, 11, 6, 1379901306, 1),
(27, 11, 4, 1379901306, 2),
(28, 12, 6, 1379902093, 1),
(29, 2, 7, 1379902282, 3),
(30, 13, 6, 1379929352, 1),
(31, 14, 6, 1379929366, 1),
(32, 15, 6, 1379929564, 1),
(33, 16, 6, 1379929961, 1),
(34, 17, 6, 1379929965, 1),
(35, 18, 6, 1379930041, 1),
(36, 19, 6, 1379930066, 1),
(37, 20, 6, 1379930109, 1),
(38, 21, 6, 1379930119, 1),
(39, 22, 6, 1379930222, 1),
(40, 22, 4, 1379930222, 2),
(41, 21, 6, 1379930245, 2),
(42, 21, 7, 1379930285, 3),
(43, 21, 7, 1379930318, 4),
(44, 21, 6, 1379930407, 5),
(45, 23, 9, 1379939887, 1),
(46, 24, 4, 1379988666, 1),
(47, 24, 4, 1379988666, 2),
(48, 25, 4, 1379988671, 1),
(49, 25, 4, 1379988671, 2),
(50, 26, 4, 1379988674, 1),
(51, 26, 4, 1379988674, 2),
(52, 26, 4, 1379988739, 3),
(53, 27, 6, 1380001114, 1),
(54, 27, 4, 1380001114, 2),
(55, 28, 6, 1380001119, 1),
(56, 28, 4, 1380001119, 2),
(57, 29, 6, 1380001124, 1),
(58, 29, 4, 1380001124, 2),
(59, 30, 6, 1380001125, 1),
(60, 30, 4, 1380001125, 2),
(61, 31, 6, 1380001125, 1),
(62, 31, 4, 1380001125, 2),
(63, 32, 6, 1380001125, 1),
(64, 32, 4, 1380001125, 2),
(65, 33, 6, 1380001125, 1),
(66, 33, 4, 1380001125, 2),
(67, 34, 6, 1380001152, 1),
(68, 34, 4, 1380001152, 2),
(69, 35, 6, 1380001154, 1),
(70, 35, 4, 1380001154, 2),
(71, 23, 6, 1380417975, 2),
(72, 2, 7, 1382083306, 4),
(73, 23, 7, 1382083591, 3),
(74, 23, 7, 1382083635, 4),
(75, 20, 6, 1382083797, 2),
(76, 15, 6, 1382083804, 2),
(77, 18, 6, 1382083810, 2),
(78, 20, 7, 1382083839, 3),
(79, 20, 7, 1382085652, 4),
(80, 15, 7, 1382085768, 3),
(81, 15, 7, 1382086494, 4),
(82, 18, 7, 1382086926, 3),
(83, 18, 7, 1382088721, 4),
(84, 26, 7, 1382089049, 4),
(85, 35, 7, 1382089122, 3),
(86, 35, 7, 1382089158, 4),
(87, 34, 7, 1382089521, 3),
(88, 33, 7, 1382091095, 3),
(89, 32, 7, 1382091190, 3),
(90, 31, 7, 1382091237, 3),
(91, 30, 7, 1382091281, 3),
(92, 33, 7, 1382091423, 4),
(93, 32, 7, 1382091528, 4),
(94, 31, 7, 1382091581, 4),
(95, 30, 7, 1382091845, 4),
(96, 34, 7, 1382091893, 4),
(97, 29, 7, 1382092218, 3),
(98, 29, 7, 1382092245, 4),
(99, 32, 6, 1382153190, 5),
(100, 25, 7, 1382154158, 3),
(101, 36, 9, 1382579823, 1),
(102, 37, 6, 1382580102, 1),
(103, 37, 7, 1382580102, 2),
(104, 36, 6, 1382580270, 2),
(105, 19, 6, 1382580384, 2),
(106, 17, 6, 1382581378, 2),
(107, 38, 6, 1382581434, 1),
(108, 38, 7, 1382581434, 2),
(109, 14, 6, 1382582262, 2),
(110, 13, 6, 1382582354, 2),
(111, 39, 9, 1382582455, 1),
(112, 39, 6, 1382582561, 2),
(113, 12, 6, 1382582826, 2),
(114, 16, 6, 1382583128, 2),
(115, 40, 9, 1382583231, 1),
(116, 40, 6, 1382583746, 2),
(117, 39, 7, 1382583828, 3),
(118, 39, 7, 1382583902, 4),
(119, 39, 9, 1382584070, 5),
(120, 40, 7, 1382584159, 3),
(121, 40, 7, 1382584197, 4),
(122, 41, 9, 1382585814, 1),
(123, 41, 6, 1382585934, 2),
(124, 41, 7, 1382586260, 3),
(125, 22, 7, 1382586623, 3),
(126, 9, 7, 1382586930, 3),
(127, 42, 9, 1382587251, 1);

-- --------------------------------------------------------

--
-- 表的结构 `smg_catch`
--

CREATE TABLE IF NOT EXISTS `smg_catch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `smg_catch`
--

INSERT INTO `smg_catch` (`id`, `phone`, `content`) VALUES
(1, '13944097701', '老师您好，id 号为 36 的问题已经超过24小时未得到解决。'),
(2, '13944097701', '老师您好，id 号为 37 的问题已经超过24小时未得到解决。'),
(3, '13944097701', '老师您好，id 号为 38 的问题已经超过24小时未得到解决。'),
(4, '18744047712', '你好，由于你未在24小时内做出评价，系统已自动评价)。'),
(5, '13944097701', '老师您好，id 号为 41 的问题已经超过24小时未得到解决。'),
(6, '13944097701', '老师您好，id 号为 42 的问题已经超过24小时未得到解决。');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `lev` int(11) NOT NULL COMMENT ' 1 user\\n 2 fixCenter\\n 3 admin\\n',
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `email`, `lev`, `phone`) VALUES
(2, 'i@tiankonguse.com', 1, NULL),
(3, '514357238@qq.com', 1, NULL),
(4, 'gaoj169@nenu.edu.cn', 2, '15948300521'),
(5, '804345178@qq.com', 1, NULL),
(6, 'admin@tiankonguse.com', 3, '13944097701'),
(7, 'fix@tiankonguse.com', 2, '18744047712'),
(9, 'test@tiankonguse.com', 1, NULL),
(10, 'test1@tiankonguse.com', 1, NULL),
(11, 'fixed@tiankonguse.com', 1, '13944097701'),
(12, 'fix1@tiankonguse.com', 2, '18744047712'),
(13, 'fix2@tiankonguse.com', 2, '18744047712'),
(14, 'fix3@tiankonguse.com', 2, '18744047712'),
(15, 'fix4@tiankonguse.com', 2, '18744047712');

--
-- 限制导出的表
--

--
-- 限制表 `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_bill_problem1` FOREIGN KEY (`id`) REFERENCES `problem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `depart`
--
ALTER TABLE `depart`
  ADD CONSTRAINT `fk_depart_user1` FOREIGN KEY (`center`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `map_block_depart`
--
ALTER TABLE `map_block_depart`
  ADD CONSTRAINT `fk_map_block_depart_block1` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_map_block_depart_depart1` FOREIGN KEY (`depart_id`) REFERENCES `depart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `problem`
--
ALTER TABLE `problem`
  ADD CONSTRAINT `fk_problem_block1` FOREIGN KEY (`block_id`) REFERENCES `block` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_problem_depart1` FOREIGN KEY (`depart_id`) REFERENCES `depart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pro_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `problem_time`
--
ALTER TABLE `problem_time`
  ADD CONSTRAINT `fk_problem_time_problem1` FOREIGN KEY (`pro_id`) REFERENCES `problem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_problem_time_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
