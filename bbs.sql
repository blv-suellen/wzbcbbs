/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-14 20:54:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) DEFAULT NULL,
  `admin_pw` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_faculty` varchar(255) DEFAULT NULL,
  `adminpicture_url` varchar(255) DEFAULT NULL,
  `admin_posts` int(11) DEFAULT NULL,
  `admin_level` int(11) DEFAULT NULL,
  `fan` int(11) DEFAULT NULL,
  `issuperadmin` int(11) DEFAULT NULL,
  `plate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'root', 'root', '男', '我是管理员！', '12756437@163.com', '信息工程学院', 'http://localhost:8080/wzbcbbs/userUpload/images/20161122/1479792029438015947.png', '2', '0', '0', '0', null);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `rootid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cont` text,
  `pdate` datetime DEFAULT NULL,
  `isleaf` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `plate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '0', '1', '蚂蚁大战大象', '蚂蚁大战大象', '2016-12-07 11:14:17', '1', '1', '1');
INSERT INTO `article` VALUES ('2', '1', '1', '大象被打趴下了', '大象被打趴下了', '2016-12-07 11:14:18', '1', '10', '1');
INSERT INTO `article` VALUES ('3', '2', '1', '蚂蚁也不好过', '蚂蚁也不好过', '2016-12-07 11:14:19', '0', '1', '1');
INSERT INTO `article` VALUES ('4', '2', '1', '瞎说', '瞎说', '2016-12-07 11:14:20', '1', '10', '1');
INSERT INTO `article` VALUES ('6', '1', '1', '怎么可能', '怎么可能', '2016-12-07 11:14:22', '1', '1', '1');
INSERT INTO `article` VALUES ('7', '6', '1', '怎么没有可能', '怎么没有可能', '2016-12-07 11:14:23', '0', '1', '1');
INSERT INTO `article` VALUES ('8', '6', '1', '可能性是很大的', '可能性是很大的', '2016-12-07 11:14:24', '0', '1', '1');
INSERT INTO `article` VALUES ('9', '2', '1', '大象进医院了', '大象进医院了', '2016-12-07 11:14:25', '1', '1', '1');
INSERT INTO `article` VALUES ('10', '9', '1', '护士是蚂蚁', '护士是蚂蚁', '2016-12-07 11:14:26', '1', '1', '1');
INSERT INTO `article` VALUES ('11', '0', '11', 'new1', '是范德萨发', '2016-12-07 13:46:23', '1', '1', '2');
INSERT INTO `article` VALUES ('13', '0', '13', 'afdasdfgas', '<p>asdasfagfsdg</p>', '2016-12-07 13:46:40', '0', '1', '3');
INSERT INTO `article` VALUES ('14', '0', '14', 'asdasfagsd', '<p>adgsfgdfhd</p>', '2016-12-07 13:46:45', '0', '1', '4');
INSERT INTO `article` VALUES ('15', '0', '15', 'jkl;k,hjm,', '<p>hgkjlhgjkghjkghjk</p>', '2016-12-07 13:46:49', '0', '1', '5');
INSERT INTO `article` VALUES ('16', '0', '16', 'gvbnmufujh', '<p>khj,hgi,,fjgmfuymfdghjfhgj</p>', '2016-12-07 13:46:56', '0', '1', '6');
INSERT INTO `article` VALUES ('17', '0', '17', 'ghfjgfhjfghj', '<p>ghjgfhjgdfhk,fghkhj</p>', '2016-12-07 13:47:02', '0', '1', '7');
INSERT INTO `article` VALUES ('18', '0', '18', 'gfhjfghjgj', '<p>fghmgfhjfgkfghmf</p>', '2016-12-07 13:47:07', '0', '1', '8');
INSERT INTO `article` VALUES ('19', '0', '19', 'gfhjgfhjf', '<p>hjgmfbbmfghkjgdhj</p>', '2016-12-07 13:47:12', '1', '1', '1');
INSERT INTO `article` VALUES ('94', '1', '1', '123', '<p>123</p>', '2017-01-02 16:14:25', '0', '1', '1');
INSERT INTO `article` VALUES ('95', '1', '1', '111', '<p>111</p>', '2017-01-02 16:18:19', '0', '1', '1');
INSERT INTO `article` VALUES ('96', '1', '1', '111', '<p>111</p>', '2017-01-02 16:20:27', '0', '1', '1');
INSERT INTO `article` VALUES ('98', '1', '1', '123', '<p>123</p>', '2017-01-02 16:33:14', '1', '1', '1');
INSERT INTO `article` VALUES ('99', '0', '99', '123', '<p>123</p>', '2017-01-03 20:36:24', '1', '1', '10');
INSERT INTO `article` VALUES ('100', '99', '99', '123', '<p>123</p>', '2017-01-03 21:18:15', '0', '1', '1');
INSERT INTO `article` VALUES ('101', '4', '1', '111', '<p>111</p>', '2017-01-04 10:55:59', '0', '1', '1');
INSERT INTO `article` VALUES ('102', '11', '11', '111', '<p>111</p>', '2017-01-04 10:57:30', '0', '1', '1');
INSERT INTO `article` VALUES ('103', '11', '11', '123', '<p>123</p>', '2017-01-04 10:58:34', '0', '1', '1');
INSERT INTO `article` VALUES ('104', '11', '11', '123', '<p>123</p>', '2017-01-04 11:00:05', '0', '1', '1');
INSERT INTO `article` VALUES ('105', '11', '11', '123456', '<p>123456</p>', '2017-01-04 11:11:10', '0', '1', '1');
INSERT INTO `article` VALUES ('106', '98', '1', '111', '<p>111</p>', '2017-01-04 16:14:31', '0', '1', '1');
INSERT INTO `article` VALUES ('107', '0', '107', '我来试试新头像', '<p>头像</p>', '2017-01-05 19:04:53', '0', '5', '11');
INSERT INTO `article` VALUES ('108', '0', '108', '123', '12312312', '2017-01-06 16:11:28', '0', '5', '12');
INSERT INTO `article` VALUES ('109', '0', '109', '123', '1231', '2017-01-06 16:12:19', '0', '5', '13');
INSERT INTO `article` VALUES ('110', '0', '110', '123', '123123', '2017-01-06 16:12:33', '0', '5', '14');
INSERT INTO `article` VALUES ('111', '0', '111', '12312', '12312', '2017-01-06 16:13:04', '0', '5', '15');
INSERT INTO `article` VALUES ('112', '0', '112', '实践活动', '123', '2017-01-06 16:13:37', '0', '5', '16');
INSERT INTO `article` VALUES ('113', '0', '113', '见客户给', '1231', '2017-01-06 16:13:40', '0', '5', '17');
INSERT INTO `article` VALUES ('114', '0', '114', '的', '123123', '2017-01-06 16:14:00', '0', '5', '18');
INSERT INTO `article` VALUES ('115', '1', '1', '', '<p><img src=\"http://localhost:8080/wzbcbbs/userUpload/images/20170106/1483690764425049693.jpg\" title=\"1483690764425049693.jpg\" alt=\"v2-87c7f902eb33f0df1e618328e500127a_b.jpg\"/>什么？怎么可能？</p>', '2017-01-06 16:19:35', '0', '5', '1');
INSERT INTO `article` VALUES ('116', '0', '116', '没什么好说的，那就祝你新年大吉吧', '<p><img src=\"http://localhost:8080/wzbcbbs/userUpload/images/20170106/1483691009020028037.jpg\" title=\"1483691009020028037.jpg\" alt=\"p62353815.jpg\" width=\"369\" height=\"356\"/></p>', '2017-01-06 16:23:40', '1', '5', '1');
INSERT INTO `article` VALUES ('117', '116', '116', '', '<p><img src=\"http://localhost:8080/wzbcbbs/userUpload/images/20170106/1483691077319018241.jpg\" title=\"1483691077319018241.jpg\" alt=\"p62356157.jpg\" width=\"376\" height=\"380\"/></p>', '2017-01-06 16:24:46', '0', '1', '1');
INSERT INTO `article` VALUES ('118', '116', '116', '', '<p><img src=\"http://localhost:8080/wzbcbbs/userUpload/images/20170106/1483691319073009486.jpg\" title=\"1483691319073009486.jpg\" alt=\"p62355094.jpg\" width=\"371\" height=\"354\"/></p>', '2017-01-06 16:28:47', '0', '2', '1');
INSERT INTO `article` VALUES ('119', '19', '19', '', '<p>111</p>', '2017-01-06 16:30:27', '0', '5', '1');
INSERT INTO `article` VALUES ('120', '0', '120', ' 阿萨德', '<p>新用户发帖</p>', '2017-01-06 17:26:20', '0', '14', '1');
INSERT INTO `article` VALUES ('121', '0', '121', '再来一贴', '<p>阿萨德阿萨德</p>', '2017-01-06 17:35:31', '1', '14', '1');
INSERT INTO `article` VALUES ('122', '121', '121', '', '<p>回复一下自己！</p>', '2017-01-06 17:35:42', '0', '14', '1');
INSERT INTO `article` VALUES ('123', '0', '123', '阿萨德', '<p>阿萨德水电费<img src=\"http://localhost:8080/wzbcbbs/userUpload/images/20170107/1483759468729047000.jpg\" title=\"1483759468729047000.jpg\" alt=\"demo.jpg\"/></p>', '2017-01-07 11:24:31', '0', '14', '2');

-- ----------------------------
-- Table structure for plate
-- ----------------------------
DROP TABLE IF EXISTS `plate`;
CREATE TABLE `plate` (
  `plate_id` int(11) NOT NULL AUTO_INCREMENT,
  `plate_name` varchar(100) DEFAULT NULL,
  `superadmin_id` int(11) DEFAULT NULL,
  `motto_one` varchar(100) DEFAULT NULL,
  `motto_two` varchar(100) DEFAULT NULL,
  `motto_three` varchar(100) DEFAULT NULL,
  `pdate` timestamp NULL DEFAULT NULL,
  `plate_picture` varchar(255) DEFAULT NULL,
  `plate_cont` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`plate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plate
-- ----------------------------
INSERT INTO `plate` VALUES ('1', '国际学院', '1', '国际的', '世界的', '4+1', '2016-12-30 21:36:34', 'http://localhost:8080/wzbcbbs/upload/84875.jpg', '温州商学院国际学院（原温州大学城市学院国际交流中心）成立于2011年，携手国际大学联盟，同全球近百所知名大学，如澳大利亚墨尔本大学、悉尼大学、麦考瑞大学，英国曼切斯特大学、伦敦大学、布鲁内尔大学、利兹大学，美国加州公立大学、詹姆斯曼迪逊大学、麻省大学、威斯康辛大学等架起直桥。');
INSERT INTO `plate` VALUES ('2', '会计学院', '1', '优秀', '专业', '完善', '2017-01-06 15:41:15', 'http://localhost:8080/wzbcbbs/upload/84876.jpg', '温州商学院会计学院建立了一支结构合理，专业素质良好的教师队伍。教学设施完善，拥有ERP实验室、会计手工实验室、会计综合实验室、企业仿真实验室等多个实验室和完善的多媒体教学设施。分院与温州市华明会计师事务所、东瓯会计师事务所、金算盘财务管理有限公司等13家会计师事务所和代理记账公司合作，建立了校外实习基地和企业校内工作室，为学生提供了真实的会计实训环境。');
INSERT INTO `plate` VALUES ('3', '管理学院', '1', '才干', '务实', '士魂', '2017-01-06 15:41:20', 'http://localhost:8080/wzbcbbs/upload/84877.jpg', '温州商学院管理学院的总目标是：培养具有宽阔的国际视野、既有“士”的操守、道德和理想,又要有“商”的才干与务实的管理者。秉承每一位学子都有机会圆梦的育人理念，用“爱”“和”“美”点燃每一位学子的生命之花！士魂商才是每一位学子的追求与渴望！');
INSERT INTO `plate` VALUES ('4', '信息工程学院', '1', '信息', '计算机', '科技', '2017-01-06 15:41:24', 'http://localhost:8080/wzbcbbs/upload/84886.jpg', '温州商学院创办于1985年，下设电子信息工程系、计算机应用工程系和信息管理工程系，现有“计算机科学与技术”、“网络工程”、“电子信息工程”、“电气工程及其自动化”、“信息管理与信息系统”等专业。分院拥有CEAC国家信息化培训考试中心、中国自动化系统工程师资格认证（ASEA）培训中心、中国电子商务协会中小企业推广普及化工程人才培训基地、金蝶ERP认证培训中心、阿里巴巴电子商务应用专员培训中心、百度商务班等。');
INSERT INTO `plate` VALUES ('5', '金融学院', '1', '经济', '投资', '融资', '2017-01-06 15:41:26', 'http://localhost:8080/wzbcbbs/upload/84916.jpg', '温州商学院金融学院为浙江省新型特色建设专业，有专业实验室两个，分别是“金融创新实验室”和“商业银行综合业务实验室”，可以开展证券、期货、期权、黄金、外汇投资分析和模拟交易，以及商业银行综合业务仿真实训、商业银行沙盘模拟实验等。目前，依托金融分院的专业研究机构共有三个，分别是温州融资担保研究中心，温州市社科研究重点基地民间资本与地方金融制度创新研究中心、厦门大学经济学院中国民间金融研究中心温州基地。');
INSERT INTO `plate` VALUES ('6', '外语外贸学院', '1', '外语', '经贸', ' 应用', '2017-01-06 15:41:29', 'http://localhost:8080/wzbcbbs/upload/84892.jpg', '温州商学院外语外贸学院由国际贸易分院及外语分院合并而成，意在相互融合并优势互补。学院现有2个本科专业（国际经济贸易、英语）及2个专科专业（商务英语、国际经济与贸易）。学院注重专业的有机复合，分别培养“国际经贸+英语+二外”“英语+国际经贸+二外”“国际金融与投资+英语+二外”等真正适应社会需求的复合型及应用型人才。');
INSERT INTO `plate` VALUES ('7', '继续教育学院', '1', '成长', '合作', '继续教育', '2017-01-06 15:41:32', 'http://localhost:8080/wzbcbbs/upload/84881.jpg', '温州商学院继续教育学院下设三个中心，分别为：“大学生成长中心”、“国际合作交流中心”、“继续教育发展中心”。');
INSERT INTO `plate` VALUES ('8', '艺术设计学院', '1', '艺术', '绘画', 'Design', '2017-01-06 15:41:34', 'http://localhost:8080/wzbcbbs/upload/84897.jpg', '温州商学院艺术设计分院位于温州茶山高教园区。分院开设艺术设计专业，设有环境艺术设计和数字媒体艺术设计2个专业方向。建有专业专用设计机房，摄影摄像棚，数字视、音频合成编辑室，影视、动画后期制作室，环艺材料、工艺实验样板房，写真喷绘室等基础教学部。');
INSERT INTO `plate` VALUES ('9', '学习交流', '1', '学习', '分享', '心得', '2017-01-06 15:41:37', 'http://localhost:8080/wzbcbbs/upload/84902.jpg', '来呀，我们一起学习吧！');
INSERT INTO `plate` VALUES ('10', '人文艺术', '1', '文学', '艺术', '思考', '2017-01-06 15:41:39', 'http://localhost:8080/wzbcbbs/upload/84907.jpg', '我们一起谈谈吧~');
INSERT INTO `plate` VALUES ('11', '电脑相关', '1', '电脑', '笔记本', '搞机', '2017-01-06 15:41:42', 'http://localhost:8080/wzbcbbs/upload/84908.jpg', '卡巴图吧集聚地~');
INSERT INTO `plate` VALUES ('12', '运动修身', '1', '运动', '健身', '活动', '2017-01-06 15:41:44', 'http://localhost:8080/wzbcbbs/upload/84909.jpg', '让我们的八块腹肌和人鱼线都xiu出来~');
INSERT INTO `plate` VALUES ('13', '社团群体', '1', '社团', '卡巴', '活动', '2017-01-06 15:41:47', 'http://localhost:8080/wzbcbbs/upload/84910.jpg', '快来到社团玩呀~');
INSERT INTO `plate` VALUES ('14', '组织活动', '1', '组织', '学生会', '电脑医院', '2017-01-06 15:41:50', 'http://localhost:8080/wzbcbbs/upload/84911.jpg', '近期组织相关活动通告~');
INSERT INTO `plate` VALUES ('15', '商院草坪', '1', '草坪', '畅聊', '小八卦', '2017-01-06 15:41:54', 'http://localhost:8080/wzbcbbs/upload/84912.jpg', '嘘！最近商学院好像出了点事情！');
INSERT INTO `plate` VALUES ('16', '教学下载', '1', '下载区', '文档', '学习资料', '2017-01-06 15:41:56', 'http://localhost:8080/wzbcbbs/upload/84913.jpg', '请广大同学安秩序下载！');
INSERT INTO `plate` VALUES ('17', '图书馆', '1', '图书', '新到图书', '大热图书', '2017-01-06 15:41:59', 'http://localhost:8080/wzbcbbs/upload/84914.jpg', '呦~客官，我们这里又到了一批好东西~快来看看吧~');
INSERT INTO `plate` VALUES ('18', '闲话商院', '1', '商院', '闲聊', '建议', '2017-01-06 15:42:02', 'http://localhost:8080/wzbcbbs/upload/84915.jpg', '有什么想对商院说的就来吧~');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pw` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_faculty` varchar(255) DEFAULT NULL,
  `userpicture_url` varchar(255) DEFAULT NULL,
  `user_posts` int(11) DEFAULT NULL,
  `user_level` int(11) DEFAULT NULL,
  `fan` int(11) DEFAULT NULL,
  `isadministrator` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '满城花祭、谁为谁空守旧梦', 'asd', '男', 'aaa', 'asd', 'asd', 'http://localhost:8080/wzbcbbs/images/headimage/demo.jpg', '0', '0', '0', '1');
INSERT INTO `user` VALUES ('3', '回忆丶旧时光', '111', '男', '略略略', '111', '111', 'http://localhost:8080/wzbcbbs/images/headimage/demo.jpg', '0', '0', '0', '1');
INSERT INTO `user` VALUES ('5', 'Soles', '1', '男', '111', '2', '2', 'http://localhost:8080/wzbcbbs/userHeadimg/4-15012G52133.jpg', '19', '0', '0', '1');
INSERT INTO `user` VALUES ('10', '翔爷无敌', '111111', '男', '这个人很懒，什么都没留下。', '1553856390@qq.com', '111', 'http://localhost:8080/wzbcbbs/images/headimage/demo.jpg', '0', '0', '0', '1');
INSERT INTO `user` VALUES ('11', 'Lily', '666666', '女', '这个人很懒，什么都没留下。', '1553856390@qq.con', '信息工程学院', 'http://127.0.0.1:8080/wzbcbbs/images/headimage/demo.jpg', '0', '0', '0', '1');
INSERT INTO `user` VALUES ('14', '新用户', '111111', '男', '12312323', ' addz@qq.com', 'add阿达', 'http://localhost:8080/wzbcbbs/userHeadimg/4-15012G52133.jpg', '3', '0', '0', '1');
