/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : wallet

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 04/03/2023 21:19:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet`;
CREATE TABLE `tb_wallet` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `card_id` int(20) NOT NULL COMMENT '银行卡号',
  `money` decimal(20,2) NOT NULL COMMENT '余额',
  `pay_password` char(255) NOT NULL COMMENT '支付密码',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `identity_card` char(255) NOT NULL COMMENT '身份证号',
  `salt` char(255) NOT NULL COMMENT '加盐',
  `version` varchar(255) NOT NULL COMMENT '版本号',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_wallet
-- ----------------------------
BEGIN;
INSERT INTO `tb_wallet` VALUES (1, 123456789, 308.88, 'df10ef8509dc176d733d59549e7dbfaf', '张三', '440803000000000001', 'abc', '42');
COMMIT;

-- ----------------------------
-- Table structure for tb_wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_log`;
CREATE TABLE `tb_wallet_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志b',
  `record_sn` char(255) NOT NULL COMMENT '交易流水号id\n',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `change_money` decimal(20,2) NOT NULL COMMENT '变动金额',
  `money` decimal(20,2) NOT NULL COMMENT '变动后金额',
  `create_time` varchar(255) NOT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_wallet_log
-- ----------------------------
BEGIN;
INSERT INTO `tb_wallet_log` VALUES (7, 'aed180cd-e954-4503-8e17-b6002d72193d', 1, 10.00, 78.88, '23-3-4 下午4:34', '购买某某商品消费10');
INSERT INTO `tb_wallet_log` VALUES (8, 'a32a04f6-253a-490a-83f3-abb4faafe851', 1, 10.00, 88.88, '23-3-4 下午5:22', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (9, '8376cd6c-3139-4a64-9182-e6821d445d43', 1, 10.00, 78.88, '23-3-4 下午5:45', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (10, '510811d8-da05-4f8e-9e9b-8798af61260d', 1, 10.00, 68.88, '23-3-4 下午5:57', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (11, '53f04184-415c-4ca1-9ac8-71c54972ce72', 1, 10.00, 58.88, '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (12, '55ccd474-cd72-4754-b7b6-9f447165186a', 1, 10.00, 48.88, '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (13, '77cdb8b0-3697-4b05-b9ea-b3443ab2e85e', 1, 10.00, 38.88, '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (14, '712a6b0c-cffc-48d8-af01-515cefafdc9e', 1, 10.00, 28.88, '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (15, 'c4f60f92-27c7-42a0-afd8-33c2d7c56999', 1, 10.00, 18.88, '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (16, '33713fb7-0e2f-47ee-8583-4dfa317748cd', 1, 10.00, 8.88, '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (17, 'e19cac11-4d74-42d7-96eb-b92820083b2d', 1, 10.00, 18.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (18, 'b96a836d-5c8c-4094-9f82-66f45f2173f7', 1, 10.00, 28.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (19, 'd9a30658-c307-4901-b79f-2c7ef20440e7', 1, 10.00, 38.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (20, 'f593c193-9361-447f-bec8-bb584ed31250', 1, 10.00, 48.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (21, '7e7b326c-b963-4e22-8029-f45b0e477e95', 1, 10.00, 58.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (22, '384c6927-92b2-4016-9a97-d1bf48876a03', 1, 10.00, 68.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (23, '9e67acac-d65a-451d-ae3b-0196a7f50353', 1, 10.00, 78.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (24, '4bca0e43-7ca2-4e99-a93b-7214a143f0ef', 1, 10.00, 88.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (25, '9b03ac41-74f3-41c0-a8eb-c4daba1d2be7', 1, 10.00, 98.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (26, '0db489c5-9e93-439e-aa0b-49340a4ab7ba', 1, 10.00, 108.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (27, '13065d19-3a33-4c9b-8fda-2d871044e4c4', 1, 10.00, 118.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (28, '778a249d-2958-45cb-9241-ba5de7c5abc2', 1, 10.00, 128.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (29, '54c7d1e7-6a97-4ad7-b747-ed306b1831a0', 1, 10.00, 138.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (30, '89ec527a-1b32-47bf-ac9a-0af2b145a066', 1, 10.00, 148.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (31, 'c5ddf57c-fcee-4277-a2b6-43058c33fc0f', 1, 10.00, 158.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (32, 'cff0e29f-63e7-4dd4-b64c-b27f270a00c9', 1, 10.00, 168.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (33, 'ef09ce6f-ee9b-4351-a566-9a5ceca46cb2', 1, 10.00, 178.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (34, '9573f888-f2c0-410f-91e0-3c11adb1e29e', 1, 10.00, 188.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (35, '8f740a29-3fee-454b-b3f6-6c62305b6d10', 1, 10.00, 198.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (36, 'b2b30ea9-0b1e-4a41-b3d0-21e2e3cb5cf7', 1, 10.00, 208.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (37, '7d0c53e1-4ca4-47b2-9327-a86f71682a1e', 1, 10.00, 218.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (38, '88ce6254-ebc1-4996-a97d-655d4ffe1bd1', 1, 10.00, 228.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (39, '5a1616b4-d30d-48d1-8ad1-997aeaa25084', 1, 10.00, 238.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (40, 'e19ce57e-6276-46c3-a7d6-a4076f5f59e8', 1, 10.00, 248.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (41, 'b0e366ac-6490-4094-b1f6-ba06eb6d3711', 1, 10.00, 258.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (42, '6068f29a-c57f-423c-9173-caa43b194c37', 1, 10.00, 268.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (43, '543f7b59-7654-4fac-a607-92d1ad02b6c4', 1, 10.00, 278.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (44, '6d83fc02-4ce5-4f03-b335-f86e6a60e7fb', 1, 10.00, 288.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (45, '42ddb809-e84d-4808-9c3c-a07a57c2cc9b', 1, 10.00, 298.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (46, 'c40e5202-110f-4eb0-92d8-83d701d12c4e', 1, 10.00, 308.88, '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_log` VALUES (47, 'c34c747b-7e8a-459c-a09e-f83ab019f93d', 1, 10.00, 298.88, '23-3-4 下午9:18', '购买某某商品消费');
INSERT INTO `tb_wallet_log` VALUES (48, '5de74c82-b6ae-43a5-9d2f-773e269f9f56', 1, 10.00, 308.88, '23-3-4 下午9:18', '退款某某商品');
COMMIT;

-- ----------------------------
-- Table structure for tb_wallet_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_record`;
CREATE TABLE `tb_wallet_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易记录表id',
  `record_sn` varchar(255) NOT NULL COMMENT '流水号',
  `wallet_type` tinyint(2) NOT NULL COMMENT '0充值，1消费，3提现',
  `money` decimal(20,2) NOT NULL COMMENT '交易金额',
  `pay_status` int(255) NOT NULL COMMENT '支付状态',
  `pay_time` varchar(255) NOT NULL COMMENT '支付时间',
  `fetch_status` varchar(255) NOT NULL COMMENT '收款状态',
  `fetch_time` varchar(255) NOT NULL COMMENT '收款时间',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_wallet_record
-- ----------------------------
BEGIN;
INSERT INTO `tb_wallet_record` VALUES (1, 'aed180cd-e954-4503-8e17-b6002d72193d', 1, 10.00, 1, '23-3-4 下午4:34', '1', '23-3-4 下午4:34', '购买某某商品消费10');
INSERT INTO `tb_wallet_record` VALUES (2, 'a32a04f6-253a-490a-83f3-abb4faafe851', 1, 10.00, 1, '23-3-4 下午5:22', '1', '23-3-4 下午5:22', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (3, '8376cd6c-3139-4a64-9182-e6821d445d43', 1, 10.00, 1, '23-3-4 下午5:45', '1', '23-3-4 下午5:45', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (4, '510811d8-da05-4f8e-9e9b-8798af61260d', 1, 10.00, 1, '23-3-4 下午5:57', '1', '23-3-4 下午5:57', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (5, '53f04184-415c-4ca1-9ac8-71c54972ce72', 1, 10.00, 1, '23-3-4 下午8:23', '1', '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (6, '55ccd474-cd72-4754-b7b6-9f447165186a', 1, 10.00, 1, '23-3-4 下午8:23', '1', '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (7, '77cdb8b0-3697-4b05-b9ea-b3443ab2e85e', 1, 10.00, 1, '23-3-4 下午8:23', '1', '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (8, '712a6b0c-cffc-48d8-af01-515cefafdc9e', 1, 10.00, 1, '23-3-4 下午8:23', '1', '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (9, 'c4f60f92-27c7-42a0-afd8-33c2d7c56999', 1, 10.00, 1, '23-3-4 下午8:23', '1', '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (10, '33713fb7-0e2f-47ee-8583-4dfa317748cd', 1, 10.00, 1, '23-3-4 下午8:23', '1', '23-3-4 下午8:23', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (11, 'e19cac11-4d74-42d7-96eb-b92820083b2d', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (12, 'b96a836d-5c8c-4094-9f82-66f45f2173f7', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (13, 'd9a30658-c307-4901-b79f-2c7ef20440e7', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (14, 'f593c193-9361-447f-bec8-bb584ed31250', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (15, '7e7b326c-b963-4e22-8029-f45b0e477e95', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (16, '384c6927-92b2-4016-9a97-d1bf48876a03', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (17, '9e67acac-d65a-451d-ae3b-0196a7f50353', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (18, '4bca0e43-7ca2-4e99-a93b-7214a143f0ef', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (19, '9b03ac41-74f3-41c0-a8eb-c4daba1d2be7', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (20, '0db489c5-9e93-439e-aa0b-49340a4ab7ba', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (21, '13065d19-3a33-4c9b-8fda-2d871044e4c4', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (22, '778a249d-2958-45cb-9241-ba5de7c5abc2', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (23, '54c7d1e7-6a97-4ad7-b747-ed306b1831a0', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (24, '89ec527a-1b32-47bf-ac9a-0af2b145a066', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (25, 'c5ddf57c-fcee-4277-a2b6-43058c33fc0f', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (26, 'cff0e29f-63e7-4dd4-b64c-b27f270a00c9', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (27, 'ef09ce6f-ee9b-4351-a566-9a5ceca46cb2', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (28, '9573f888-f2c0-410f-91e0-3c11adb1e29e', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (29, '8f740a29-3fee-454b-b3f6-6c62305b6d10', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (30, 'b2b30ea9-0b1e-4a41-b3d0-21e2e3cb5cf7', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (31, '7d0c53e1-4ca4-47b2-9327-a86f71682a1e', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (32, '88ce6254-ebc1-4996-a97d-655d4ffe1bd1', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (33, '5a1616b4-d30d-48d1-8ad1-997aeaa25084', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (34, 'e19ce57e-6276-46c3-a7d6-a4076f5f59e8', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (35, 'b0e366ac-6490-4094-b1f6-ba06eb6d3711', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (36, '6068f29a-c57f-423c-9173-caa43b194c37', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (37, '543f7b59-7654-4fac-a607-92d1ad02b6c4', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (38, '6d83fc02-4ce5-4f03-b335-f86e6a60e7fb', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (39, '42ddb809-e84d-4808-9c3c-a07a57c2cc9b', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (40, 'c40e5202-110f-4eb0-92d8-83d701d12c4e', 1, 10.00, 1, '23-3-4 下午8:25', '1', '23-3-4 下午8:25', '退款某某商品');
INSERT INTO `tb_wallet_record` VALUES (41, 'c34c747b-7e8a-459c-a09e-f83ab019f93d', 1, 10.00, 1, '23-3-4 下午9:18', '1', '23-3-4 下午9:18', '购买某某商品消费');
INSERT INTO `tb_wallet_record` VALUES (42, '5de74c82-b6ae-43a5-9d2f-773e269f9f56', 2, 10.00, 1, '23-3-4 下午9:18', '1', '23-3-4 下午9:18', '退款某某商品');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
