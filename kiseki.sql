/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : kiseki

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2022-05-31 20:38:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '收货人',
  `sex` tinyint(4) NOT NULL COMMENT '性别 0 女 1 男',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址管理';

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES ('1524706742915342338', '1524704707700629506', '我修院卓', '1', '18888888888', null, null, null, null, null, null, '東京都世田谷区下北沢２丁目１０−１５本多劇場', '公司', '1', '2022-05-12 19:03:10', '2022-05-12 19:03:38', '1524704707700629506', '1524704707700629506', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `type` int(11) DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品及套餐分类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1397844263642378242', '1', '炸物', '1', '2021-05-27 09:16:58', '2021-07-15 20:25:23', '1', '1');
INSERT INTO `category` VALUES ('1397844303408574465', '1', '水产', '2', '2021-05-27 09:17:07', '2021-06-02 14:27:22', '1', '1');
INSERT INTO `category` VALUES ('1397844391040167938', '1', '烤物', '3', '2021-05-27 09:17:28', '2021-07-09 14:37:13', '1', '1');
INSERT INTO `category` VALUES ('1413341197421846529', '1', '饮品', '11', '2021-07-09 11:36:15', '2021-07-09 14:39:15', '1', '1');
INSERT INTO `category` VALUES ('1413384954989060097', '1', '主食', '12', '2021-07-09 14:30:07', '2021-07-09 14:39:19', '1', '1');
INSERT INTO `category` VALUES ('1529062277538140162', '2', '限量发售套餐', '15', '2022-05-24 19:30:30', '2022-05-24 19:30:30', '1', '1');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) COLLATE utf8_bin NOT NULL,
  `description` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 停售 1 起售',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品管理';

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('1397849739276890114', '盐烤秋刀鱼', '1397844303408574465', '1500.00', '1234567812345678', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', '将秋刀鱼放在网上用大火短时间烤熟后用盐调味。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850140982161409', '盐烤青花鱼', '1397844303408574465', '1500.00', '12142734', '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', '将秋刀鱼放在网上用大火短时间烤熟后用盐调味。', '1', '0', '2022-05-20 18:41:12', '2022-05-20 18:41:17', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850392090947585', '炸鸡块', '1397844263642378242', '2000.00', '222222222', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '将鸡的鸡翅或鸡腿的软骨部分切成块，用油炸或竜田揚げ的手法烹调。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850851245600769', '炸猪排', '1397844263642378242', '2500.00', '123412341234', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '将厚的猪里脊裹上面粉、鸡蛋、面包粉后，用食用油油炸而成的料理。', '1', '0', '2022-05-12 09:39:44', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851099502260226', '天妇罗', '1397844263642378242', '2500.00', '1234123412346', 'a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', '将鱼、贝类、蔬菜等食材包裹在以小麦粉为主的面糊中油炸而成的料理。', '1', '0', '2022-05-12 10:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851370462687234', '汉堡肉', '1397844263642378242', '2500.00', '1234123412345', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', '在肉糜和切成碎末的蔬菜中掺入面包粉并加入盐与鸡蛋用平底锅加热而成的料理。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851668262465537', '炸豆腐', '1397844263642378242', '1500.00', '23412341234', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '在豆腐上裹上面糊后炸，浇上高汤或用酱油调味而成的料。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397852391150759938', '乌冬面', '1413384954989060097', '1000.00', '2346812468', 'ef2b73f2-75d1-4d3a-beea-22da0e1421bd.jpg', '乌冬面是长条状具有一定宽度和粗细的面条。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853183287013378', '烤鸡肉串', '1397844391040167938', '300.00', '123456787654321', '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', '所谓烤鸡肉串，就是把鸡肉切成一口大小，串在竹签上直接用火烤的料理。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853709101740034', '可尔必思', '1413341197421846529', '600.00', '1234212321234', 'd2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', '一种乳酸菌饮料。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853890262118402', '可口可乐', '1413341197421846529', '400.00', '43245678', '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', '不提供百事可乐。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397854652581064706', '乌龙茶', '1413341197421846529', '500.00', '687', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', '乌龙茶是经过采摘、萎凋、摇青、炒青、揉捻、烘焙等工序后制出的品质优异的茶类。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397854865672679425', '米饭', '1413384954989060097', '200.00', '687678', '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', '水稻的种子加工后的产物。', '1', '0', '2022-05-12 09:38:43', '2022-05-12 09:41:19', '1', '1', '0');

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) NOT NULL COMMENT '菜品',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品口味关系表';

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES ('1', '1397849739276890114', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:37:27', '2021-05-27 09:37:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('2', '1397849739276890114', '口味偏好', '[\"不要酱油\",\"不要盐\",\"不要橙醋\",\"正常做\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('3', '1397850140982161409', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('4', '1397850140982161409', '口味偏好', '[\"不要青柠汁\",\"不要柚子汁\",\"不要橙醋\",\"正常做\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('5', '1397850392090947585', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('6', '1397850392090947585', '口味偏好', '[\"要鸡腿\",\"要鸡翅\",\"要鸡胸\",\"随机\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('7', '1397850851245600769', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('8', '1397850851245600769', '口味偏好', '[\"快炸\",\"慢炸\",\"正常炸\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('9', '1397851099502260226', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('10', '1397851099502260226', '口味偏好', '[\"超快炸\",\"快炸\",\"慢炸\",\"正常炸\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('11', '1397851370462687234', '辣度', '[\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('12', '1397851370462687234', '口味偏好', '[\"快炸\",\"慢炸\",\"正常炸\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('13', '1397851668262465537', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('14', '1397851668262465537', '口味偏好', '[\"不要高汤\",\"不要酱油\",\"正常做\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('15', '1397852391150759938', '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('16', '1397852391150759938', '口味偏好', '[\"讃岐乌冬\",\"香川乌冬\",\"稻庭乌冬\",\"高松乌冬\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('17', '1397853183287013378', '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('18', '1397853183287013378', '口味偏好', '[\"不要葱绿\",\"不要葱白\",\"正常做\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('19', '1397853709101740034', '温度', '[\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('22', '1397853890262118402', '温度', '[\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:52:24', '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('24', '1397854652581064706', '温度', '[\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:54:30', '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('26', '1397854865672679425', '口味偏好', '[\"魚沼米\",\"秋田米\",\"山形米\",\"新潟米\",\"东北大米\"]', '2021-05-27 09:56:11', '2021-05-27 09:56:11', '1', '1', '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工信息';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '田所浩二', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '18757217875', '1', '114514191981038600', '1', '2021-05-06 17:20:07', '2022-05-30 19:50:21', '1', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `number` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(20) NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NOT NULL COMMENT '结账时间',
  `pay_method` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `consignee` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1524706901581668353', '1524706901581668353', '4', '1524704707700629506', '1524706742915342338', '2022-05-12 19:03:48', '2022-05-12 19:03:48', '1', '78.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1524706994925903873', '1524706994925903873', '4', '1524704707700629506', '1524706742915342338', '2022-05-12 19:04:10', '2022-05-12 19:04:10', '1', '78.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1527571761197744129', '1527571761197744129', '4', '1524704707700629506', '1524706742915342338', '2022-05-20 16:47:43', '2022-05-20 16:47:43', '1', '15.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1527851687251640322', '1527851687251640322', '4', '1524704707700629506', '1524706742915342338', '2022-05-21 11:20:03', '2022-05-21 11:20:03', '1', '50.00', ' ', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1527852940031524866', '1527852940031524866', '4', '1524704707700629506', '1524706742915342338', '2022-05-21 11:25:02', '2022-05-21 11:25:02', '1', '95.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1527858945595314178', '1527858945595314178', '4', '1524704707700629506', '1524706742915342338', '2022-05-21 11:48:54', '2022-05-21 11:48:54', '1', '50.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1527859508680626177', '1527859508680626177', '4', '1524704707700629506', '1524706742915342338', '2022-05-21 11:51:08', '2022-05-21 11:51:08', '1', '50.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1528362110832914433', '1528362110832914433', '4', '1524704707700629506', '1524706742915342338', '2022-05-22 21:08:17', '2022-05-22 21:08:17', '1', '120.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1528362937458929665', '1528362937458929665', '4', '1524704707700629506', '1524706742915342338', '2022-05-22 21:11:35', '2022-05-22 21:11:35', '1', '40.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1528620444328685569', '1528620444328685569', '4', '1524704707700629506', '1524706742915342338', '2022-05-23 14:14:49', '2022-05-23 14:14:49', '1', '0.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1528683809814097921', '1528683809814097921', '4', '1524704707700629506', '1524706742915342338', '2022-05-23 18:26:36', '2022-05-23 18:26:36', '1', '20.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1528705466360520705', '1528705466360520705', '4', '1524704707700629506', '1524706742915342338', '2022-05-23 19:52:40', '2022-05-23 19:52:40', '1', '15.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1528713011208667138', '1528713011208667138', '4', '1524704707700629506', '1524706742915342338', '2022-05-23 20:22:39', '2022-05-23 20:22:39', '1', '15.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1529048036999536642', '1529048036999536642', '4', '1524704707700629506', '1524706742915342338', '2022-05-24 18:33:55', '2022-05-24 18:33:55', '1', '25.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1529082022807224321', '1529082022807224321', '4', '1524704707700629506', '1524706742915342338', '2022-05-24 20:48:58', '2022-05-24 20:48:58', '1', '20.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1531241371461804034', '1531241371461804034', '4', '1524704707700629506', '1524706742915342338', '2022-05-30 19:49:27', '2022-05-30 19:49:27', '1', '25.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1531241444463665154', '1531241444463665154', '4', '1524704707700629506', '1524706742915342338', '2022-05-30 19:49:44', '2022-05-30 19:49:44', '1', '20.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1531255574369267714', '1531255574369267714', '4', '1524704707700629506', '1524706742915342338', '2022-05-30 20:45:53', '2022-05-30 20:45:53', '1', '25.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');
INSERT INTO `orders` VALUES ('1531387054349090818', '1531387054349090818', '4', '1524704707700629506', '1524706742915342338', '2022-05-31 05:28:20', '2022-05-31 05:28:20', '1', '140.00', '', '18888888888', '東京都世田谷区下北沢２丁目１０−１５本多劇場', null, '我修院卓');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单明细表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1524706901644582913', '炸鸡块', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', '1524706901581668353', '1397849739276890114', null, '不要葱,不辣', '1', '78.00');
INSERT INTO `order_detail` VALUES ('1524706994984624130', '炸鸡块', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', '1524706994925903873', '1397849739276890114', null, '不要葱,不辣', '1', '78.00');
INSERT INTO `order_detail` VALUES ('1527571761264852993', '盐烤青花鱼', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '1527571761197744129', '1', null, '不辣,正常做', '1', '15.00');
INSERT INTO `order_detail` VALUES ('1527851687318749186', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1527851687251640322', '1397850851245600769', null, null, '2', '25.00');
INSERT INTO `order_detail` VALUES ('1527852940031524867', '乌龙茶', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', '1527852940031524866', '1397854652581064706', null, null, '19', '5.00');
INSERT INTO `order_detail` VALUES ('1527858945624674305', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1527858945595314178', '1397850851245600769', null, null, '2', '25.00');
INSERT INTO `order_detail` VALUES ('1527859508680626178', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1527859508680626177', '1397850851245600769', null, null, '2', '25.00');
INSERT INTO `order_detail` VALUES ('1528362110925189121', '炸鸡块', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '1528362110832914433', '1397850392090947585', null, null, '-6', '20.00');
INSERT INTO `order_detail` VALUES ('1528362937458929666', '炸鸡块', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '1528362937458929665', '1397850392090947585', null, null, '-2', '20.00');
INSERT INTO `order_detail` VALUES ('1528620444328685570', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1528620444328685569', '1397850851245600769', null, '不辣,慢炸', '0', '25.00');
INSERT INTO `order_detail` VALUES ('1528683809881206785', '炸鸡块', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '1528683809814097921', '1397850392090947585', null, '重辣,随机', '1', '20.00');
INSERT INTO `order_detail` VALUES ('1528705466423435265', '炸豆腐', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '1528705466360520705', '1397851668262465537', null, '微辣,正常做', '1', '15.00');
INSERT INTO `order_detail` VALUES ('1528713011271581697', '炸豆腐', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '1528713011208667138', '1397851668262465537', null, '重辣,正常做', '1', '15.00');
INSERT INTO `order_detail` VALUES ('1529048037066645505', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1529048036999536642', '1397850851245600769', null, '重辣,正常炸', '1', '25.00');
INSERT INTO `order_detail` VALUES ('1529082022870138881', '乌冬面套餐', '236ad53a-e5c2-432a-a993-762bfa8bf0a1.png', '1529082022807224321', null, '1415580119015145474', null, '2', '10.00');
INSERT INTO `order_detail` VALUES ('1531241371528912897', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1531241371461804034', '1397850851245600769', null, '中辣,正常炸', '1', '25.00');
INSERT INTO `order_detail` VALUES ('1531241444589494274', '乌冬面套餐', '236ad53a-e5c2-432a-a993-762bfa8bf0a1.png', '1531241444463665154', null, null, null, '2', '10.00');
INSERT INTO `order_detail` VALUES ('1531255574432182273', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1531255574369267714', '1397850851245600769', null, '微辣,正常炸', '1', '25.00');
INSERT INTO `order_detail` VALUES ('1531387054412005377', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1531387054349090818', '1397850851245600769', null, '中辣,正常炸', '5', '25.00');
INSERT INTO `order_detail` VALUES ('1531387054412005378', '炸豆腐', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '1531387054349090818', '1397851668262465537', null, '不辣,不要酱油', '1', '15.00');

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int(11) DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `description` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='套餐';

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES ('1415580119015145474', '1529062277538140162', '乌冬面套餐', '1000.00', '1', '', '亏本发售的套餐，一天限量10份。', '7be1c6a8-2a22-4ca5-aefa-fc71831a539b.png', '2021-07-15 15:52:55', '2022-05-31 16:28:01', '1415576781934608386', '1', '0');

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int(11) NOT NULL COMMENT '份数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建人',
  `update_user` bigint(20) NOT NULL COMMENT '修改人',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='套餐菜品关系';

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES ('1531553069716508674', '1415580119015145474', '1397862198033297410', '盐烤秋刀鱼', '1500.00', '1', '0', '2022-05-31 16:28:01', '2022-05-31 16:28:01', '1', '1', '0');
INSERT INTO `setmeal_dish` VALUES ('1531553069716508675', '1415580119015145474', '1413342036832100354', '可口可乐', '400.00', '1', '0', '2022-05-31 16:28:01', '2022-05-31 16:28:01', '1', '1', '0');
INSERT INTO `setmeal_dish` VALUES ('1531553069716508676', '1415580119015145474', '1413385247889891330', '乌冬面', '1000.00', '1', '0', '2022-05-31 16:28:01', '2022-05-31 16:28:01', '1', '1', '0');
INSERT INTO `setmeal_dish` VALUES ('1531553069716508677', '1415580119015145474', '1397854865672679425', '米饭', '200.00', '1', '0', '2022-05-31 16:28:01', '2022-05-31 16:28:01', '1', '1', '0');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车';

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES ('1531387543811784705', '乌冬面套餐', '236ad53a-e5c2-432a-a993-762bfa8bf0a1.png', '1', null, '1415580119015145474', null, '1', '10.00', '2022-05-31 05:30:17');
INSERT INTO `shopping_cart` VALUES ('1531391785956048897', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1531391046403813377', '1397850851245600769', null, '微辣,正常炸', '1', '25.00', '2022-05-31 05:47:08');
INSERT INTO `shopping_cart` VALUES ('1531393077914939394', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1531393038807248897', '1397850851245600769', null, '中辣,正常炸', '1', '25.00', '2022-05-31 05:52:16');
INSERT INTO `shopping_cart` VALUES ('1531394900784603138', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1531394877464272897', '1397850851245600769', null, '中辣,正常炸', '1', '25.00', '2022-05-31 05:59:31');
INSERT INTO `shopping_cart` VALUES ('1531398317636689922', '炸猪排', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '1531398299747983361', '1397850851245600769', null, '中辣,正常炸', '1', '25.00', '2022-05-31 06:13:06');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `status` int(11) DEFAULT '0' COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1524704707700629506', null, '18757217875', null, '', null, '1');
