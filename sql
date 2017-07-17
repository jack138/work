/*
Navicat MySQL Data Transfer

Source Server         : huawei
Source Server Version : 50529
Source Host           : 10.10.134.170:3306
Source Database       : gdpview_uv

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2017-07-17 17:25:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_diurnal_pv
-- ----------------------------
DROP TABLE IF EXISTS `c_diurnal_pv`;
CREATE TABLE `c_diurnal_pv` (
  `d_systemId` varchar(255) NOT NULL COMMENT '日活跃',
  `d_curPageId` varchar(255) NOT NULL,
  `d_prePageId` varchar(255) NOT NULL,
  `d_number` int(11) NOT NULL,
  `d_uv_number` int(11) NOT NULL,
  `d_judge` int(11) NOT NULL,
  `d_date` date NOT NULL,
  `d_pageUrl` varchar(255) NOT NULL,
  `d_prePageUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`d_systemId`,`d_date`,`d_pageUrl`,`d_prePageUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_component_relation
-- ----------------------------
DROP TABLE IF EXISTS `m_component_relation`;
CREATE TABLE `m_component_relation` (
  `productId` varchar(32) NOT NULL COMMENT '系统ID（如：UI+，云龙）',
  `uiplusProductId` int(11) NOT NULL COMMENT '产品线ID（如：android，EMUI）',
  `componentId` varchar(255) NOT NULL COMMENT '组件ID',
  `componentver` varchar(255) NOT NULL COMMENT '组件版本',
  `componentName` varchar(255) NOT NULL COMMENT '组件名称',
  `parentComponentId` varchar(255) DEFAULT NULL COMMENT '父组件ID',
  PRIMARY KEY (`productId`,`uiplusProductId`,`componentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_gdp_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_gdp_menu`;
CREATE TABLE `m_gdp_menu` (
  `menuId` int(8) NOT NULL AUTO_INCREMENT,
  `parentMenuId` int(8) DEFAULT NULL,
  `menuName` varchar(255) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `order` int(255) NOT NULL DEFAULT '0' COMMENT '排序',
  `url` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `createBy` varchar(12) DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `lastUpdateBy` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  UNIQUE KEY `PK` (`menuId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_gdp_role
-- ----------------------------
DROP TABLE IF EXISTS `m_gdp_role`;
CREATE TABLE `m_gdp_role` (
  `roleId` varchar(32) NOT NULL,
  `name` varchar(40) NOT NULL COMMENT '角色名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createBy` varchar(12) NOT NULL COMMENT '创建人',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `lastUpdateBy` varchar(12) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表：系统管理员；大盘用户；单产品用户';

-- ----------------------------
-- Table structure for m_page_relation
-- ----------------------------
DROP TABLE IF EXISTS `m_page_relation`;
CREATE TABLE `m_page_relation` (
  `productId` varchar(32) NOT NULL,
  `curPageId` varchar(255) NOT NULL,
  `relationIndex` int(11) NOT NULL,
  `nextPageId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productId`,`curPageId`,`relationIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_page_url
-- ----------------------------
DROP TABLE IF EXISTS `m_page_url`;
CREATE TABLE `m_page_url` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `pageId` varchar(255) COLLATE utf8_bin NOT NULL,
  `index` int(11) NOT NULL DEFAULT '1',
  `pageName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `matchingUrl` varchar(1000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`productId`,`pageId`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for m_product
-- ----------------------------
DROP TABLE IF EXISTS `m_product`;
CREATE TABLE `m_product` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '产品ID，唯一主键',
  `productNm` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '产品名称',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`productId`),
  KEY `uiId` (`productId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='产品线表。\r\n体验架构（UI风格）——>产品线（版本）——>组件版本';

-- ----------------------------
-- Table structure for m_product_line
-- ----------------------------
DROP TABLE IF EXISTS `m_product_line`;
CREATE TABLE `m_product_line` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `productLineId` varchar(10) COLLATE utf8_bin NOT NULL,
  `productLineNm` varchar(32) COLLATE utf8_bin NOT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`productId`,`productLineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for m_product_nodisplay_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_product_nodisplay_menu`;
CREATE TABLE `m_product_nodisplay_menu` (
  `productId` varchar(32) NOT NULL,
  `menuId` varchar(32) NOT NULL,
  `createBy` varchar(12) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `lastUpdateBy` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`productId`,`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_properties
-- ----------------------------
DROP TABLE IF EXISTS `m_properties`;
CREATE TABLE `m_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propertyKey` varchar(32) NOT NULL COMMENT '属性key',
  `propertyValue` varchar(64) DEFAULT NULL COMMENT '属性值',
  `propertyName` varchar(64) DEFAULT NULL COMMENT '属性说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='属性配置表，存储预警阈值等信息';

-- ----------------------------
-- Table structure for m_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_role_menu`;
CREATE TABLE `m_role_menu` (
  `roleId` varchar(32) NOT NULL,
  `menuId` varchar(32) NOT NULL,
  `createBy` varchar(12) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `lastUpdateBy` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`roleId`,`menuId`),
  KEY `m_role_menu_idfk_1` (`menuId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for m_stock_category
-- ----------------------------
DROP TABLE IF EXISTS `m_stock_category`;
CREATE TABLE `m_stock_category` (
  `productId` varchar(32) NOT NULL COMMENT '产品ID',
  `productLineId` varchar(10) NOT NULL COMMENT '产品线ID',
  `categoryId` varchar(20) NOT NULL COMMENT '存量分类ID',
  `categoryNm` varchar(32) NOT NULL COMMENT '存量分类名',
  `sort` int(5) unsigned NOT NULL DEFAULT '99999' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备考',
  PRIMARY KEY (`productId`,`productLineId`,`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存量数据分类表';

-- ----------------------------
-- Table structure for m_stock_gathertime
-- ----------------------------
DROP TABLE IF EXISTS `m_stock_gathertime`;
CREATE TABLE `m_stock_gathertime` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`productId`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `account` varchar(12) NOT NULL COMMENT '用户账号',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `phonetic` varchar(32) DEFAULT '' COMMENT '拼音',
  `picturePath` varchar(60) DEFAULT NULL COMMENT '头像',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `position` int(11) DEFAULT NULL COMMENT '职位信息',
  `createTime` datetime NOT NULL,
  `createBy` varchar(12) NOT NULL COMMENT '创建人',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `lastUpdateBy` varchar(12) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`account`),
  KEY `FK_USER_POSITION` (`position`) USING BTREE,
  CONSTRAINT `m_user_ibfk_1` FOREIGN KEY (`position`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Table structure for m_user_product
-- ----------------------------
DROP TABLE IF EXISTS `m_user_product`;
CREATE TABLE `m_user_product` (
  `account` varchar(12) NOT NULL COMMENT '用户账号',
  `productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品ID',
  `createBy` varchar(12) DEFAULT NULL COMMENT '创建人',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `lastUpdateBy` varchar(12) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`account`,`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户产品表：用户可以操作哪些产品。对应所有产品用户，产品ID为‘000’';

-- ----------------------------
-- Table structure for m_user_role
-- ----------------------------
DROP TABLE IF EXISTS `m_user_role`;
CREATE TABLE `m_user_role` (
  `account` varchar(12) NOT NULL COMMENT '用户ID',
  `roleId` varchar(32) NOT NULL COMMENT '角色ID',
  `createBy` varchar(12) DEFAULT NULL COMMENT '创建人',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `lastUpdateBy` varchar(12) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`account`),
  KEY `FK_userrole_user` (`account`) USING BTREE,
  KEY `FK_userrole_role` (`roleId`) USING BTREE,
  CONSTRAINT `m_user_role_ibfk_1` FOREIGN KEY (`account`) REFERENCES `m_user` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表：一个用户只能有一种角色';

-- ----------------------------
-- Table structure for m_week_calendar
-- ----------------------------
DROP TABLE IF EXISTS `m_week_calendar`;
CREATE TABLE `m_week_calendar` (
  `year` char(4) NOT NULL COMMENT '年度',
  `weekOrder` int(2) NOT NULL COMMENT '周序号',
  `startDay` date DEFAULT NULL COMMENT '周起始日期（一）',
  `endDay` date DEFAULT NULL COMMENT '周终了日期（日）',
  `remark` varchar(255) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`year`,`weekOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='周选择列表';

-- ----------------------------
-- Table structure for v_day_dimension
-- ----------------------------
DROP TABLE IF EXISTS `v_day_dimension`;
CREATE TABLE `v_day_dimension` (
  `productId` varchar(32) NOT NULL,
  `date` date NOT NULL COMMENT '日期',
  `active` bigint(32) NOT NULL DEFAULT '0' COMMENT '日活跃',
  `addupNew` bigint(32) NOT NULL DEFAULT '0' COMMENT '日累计新增',
  `addupRegiste` bigint(32) NOT NULL DEFAULT '0' COMMENT '日累计注册',
  `onLineTime` bigint(32) NOT NULL DEFAULT '0' COMMENT '在线时长',
  `activeVsAddupNew` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '活跃vs.累计新增(活跃注册转化率)',
  `activeVsAddupRegiste` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '活跃vs.累计注册(活跃注册转化率)',
  `addupNewVsRegiste` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '累计增加vs.注册(新增注册转化率)',
  `activeDrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日环比（活跃）',
  `onLineTimeDrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日环比（在线时长）',
  `activeVsAddupNewDrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日环比（活跃vs.累计新增）',
  `activeVsAddupRegisteDrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日环比（活跃vs.累计注册）',
  `addupNewVsRegisteDrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日环比（累计增加vs.注册）',
  `activeWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（活跃）',
  `onLineTimeWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（在线时长）',
  `activeVsAddupNewWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（活跃vs.累计新增）',
  `activeVsAddupRegisteWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（活跃vs.累计注册）',
  `addupNewVsRegisteWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（累计增加vs.注册）',
  `stayUsers` bigint(32) NOT NULL DEFAULT '0' COMMENT '日留存',
  `stayUsersDrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日流存存日环比',
  `stayUsersWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日流存周环比',
  `addupNewPer` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '日新增占比(日新增除以日新增与日留存的和)',
  `stayUsersPer` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '日留存占比(日留存除以日新增与日留存之和)',
  `addNew` bigint(32) unsigned NOT NULL DEFAULT '0' COMMENT '日新增',
  `addNewDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `addNewWrr` float(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`productId`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for v_outflow_pv_detail
-- ----------------------------
DROP TABLE IF EXISTS `v_outflow_pv_detail`;
CREATE TABLE `v_outflow_pv_detail` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `prePageId` varchar(15) COLLATE utf8_bin NOT NULL,
  `prePageIndex` int(11) NOT NULL,
  `pageId` varchar(15) COLLATE utf8_bin NOT NULL,
  `pageIndex` int(11) NOT NULL,
  `pvOutFlow` int(16) NOT NULL,
  `pvOutFlowPer` float(11,4) NOT NULL,
  PRIMARY KEY (`productId`,`date`,`prePageId`,`prePageIndex`,`pageId`,`pageIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for v_page_pv
-- ----------------------------
DROP TABLE IF EXISTS `v_page_pv`;
CREATE TABLE `v_page_pv` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `pageId` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '页面数',
  `pageIndex` int(11) NOT NULL,
  `pvAll` int(16) NOT NULL DEFAULT '0',
  `pvInFlow` int(16) NOT NULL DEFAULT '0',
  `pvOutFlow` int(16) NOT NULL DEFAULT '0',
  `pvInFlowPer` float(11,2) NOT NULL DEFAULT '0.00',
  `pvAllDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pvInFlowDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pvOutFlowDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pvInFlowPerDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pvAllWrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pvInFlowWrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pvOutFlowWrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pvInFlowPerWrr` float(11,2) NOT NULL DEFAULT '0.00',
  `uvAll` int(16) NOT NULL DEFAULT '0',
  `uvInFlow` int(16) NOT NULL DEFAULT '0',
  `uvOutFlow` int(16) NOT NULL DEFAULT '0',
  `uvInFlowPer` float(11,2) NOT NULL DEFAULT '0.00',
  `uvAllDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `uvInFlowDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `uvOutFlowDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `uvInFlowPerDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `uvAllWrr` float(11,2) NOT NULL DEFAULT '0.00',
  `uvInFlowWrr` float(11,2) NOT NULL DEFAULT '0.00',
  `uvOutFlowWrr` float(11,2) NOT NULL DEFAULT '0.00',
  `uvInFlowPerWrr` float(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`productId`,`date`,`pageId`,`pageIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for v_page_transform
-- ----------------------------
DROP TABLE IF EXISTS `v_page_transform`;
CREATE TABLE `v_page_transform` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `curPageId` varchar(255) COLLATE utf8_bin NOT NULL,
  `curPageIndex` int(11) NOT NULL,
  `nextPageId` varchar(255) COLLATE utf8_bin NOT NULL,
  `nextPageIndex` int(11) NOT NULL,
  `curPagePvAll` int(11) NOT NULL DEFAULT '0',
  `nextPagePv` int(11) NOT NULL DEFAULT '0',
  `pageTransformRate` float(11,2) NOT NULL DEFAULT '0.00',
  `pageTransformRateDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pageTransformRateWrr` float(11,2) NOT NULL DEFAULT '0.00',
  `curPageUvAll` int(11) NOT NULL DEFAULT '0',
  `nextPageUv` int(11) NOT NULL DEFAULT '0',
  `pageUvTransformRate` float(11,2) NOT NULL DEFAULT '0.00',
  `pageUvTransformRateDrr` float(11,2) NOT NULL DEFAULT '0.00',
  `pageUvTransformRateWrr` float(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`productId`,`date`,`curPageId`,`curPageIndex`,`nextPageId`,`nextPageIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for v_stock_component
-- ----------------------------
DROP TABLE IF EXISTS `v_stock_component`;
CREATE TABLE `v_stock_component` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `uiplusProductId` int(11) NOT NULL,
  `componentId` varchar(255) COLLATE utf8_bin NOT NULL,
  `componentType` varchar(255) COLLATE utf8_bin NOT NULL,
  `projectCode` varchar(15) COLLATE utf8_bin NOT NULL,
  `pageCode` varchar(15) COLLATE utf8_bin NOT NULL,
  `createDate` date NOT NULL,
  `deleteDate` date DEFAULT NULL,
  PRIMARY KEY (`productId`,`uiplusProductId`,`componentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for v_stock_data
-- ----------------------------
DROP TABLE IF EXISTS `v_stock_data`;
CREATE TABLE `v_stock_data` (
  `productId` varchar(32) NOT NULL,
  `productLine` varchar(32) NOT NULL,
  `stockId` varchar(100) NOT NULL COMMENT '1:project;2:page;3:component',
  `stockName` varchar(255) NOT NULL,
  `stockCategory` varchar(32) NOT NULL,
  `stockType` varchar(32) DEFAULT NULL,
  `stockVer` varchar(32) DEFAULT NULL,
  `relationId1` varchar(255) DEFAULT NULL,
  `relationId2` varchar(255) DEFAULT NULL,
  `relationId3` varchar(255) DEFAULT NULL,
  `enabled` varchar(2) DEFAULT NULL,
  `extend1` varchar(255) DEFAULT NULL,
  `extend2` varchar(255) DEFAULT NULL,
  `extend3` varchar(255) DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `gatherTime` datetime DEFAULT NULL,
  `updateUser` varchar(32) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`productId`,`productLine`,`stockId`,`stockName`,`stockCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for v_stock_page
-- ----------------------------
DROP TABLE IF EXISTS `v_stock_page`;
CREATE TABLE `v_stock_page` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `uiplusProductId` int(11) NOT NULL,
  `pageCode` varchar(15) COLLATE utf8_bin NOT NULL,
  `projectCode` varchar(15) COLLATE utf8_bin NOT NULL,
  `createDate` date NOT NULL,
  `deleteDate` date DEFAULT NULL,
  PRIMARY KEY (`productId`,`uiplusProductId`,`pageCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for v_stock_project
-- ----------------------------
DROP TABLE IF EXISTS `v_stock_project`;
CREATE TABLE `v_stock_project` (
  `productId` varchar(32) COLLATE utf8_bin NOT NULL,
  `uiplusProductId` int(11) NOT NULL,
  `projectCode` varchar(15) COLLATE utf8_bin NOT NULL,
  `createDate` date NOT NULL,
  `deleteDate` date DEFAULT NULL,
  PRIMARY KEY (`productId`,`uiplusProductId`,`projectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for v_week_dimension
-- ----------------------------
DROP TABLE IF EXISTS `v_week_dimension`;
CREATE TABLE `v_week_dimension` (
  `productId` varchar(32) NOT NULL,
  `dateFrom` date NOT NULL COMMENT '日期',
  `active` bigint(32) NOT NULL DEFAULT '0' COMMENT '周活跃',
  `onLineTime` bigint(32) NOT NULL DEFAULT '0' COMMENT '人均在线时长',
  `addupNew` bigint(32) NOT NULL DEFAULT '0' COMMENT '周累计新增',
  `addupRegiste` bigint(32) NOT NULL DEFAULT '0' COMMENT '周累计注册',
  `avgDau` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日均DAU',
  `avgDauVsWau` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '日均DAY/WAU',
  `activeVsAddupNew` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '活跃vs.累计新增',
  `activeVsAddupRegiste` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '活跃vs.累计注册',
  `addupNewVsRegiste` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '累计新增vs.注册',
  `weekActiveDays1` bigint(32) NOT NULL DEFAULT '0',
  `weekActiveDays2` bigint(32) NOT NULL DEFAULT '0',
  `weekActiveDays3` bigint(32) NOT NULL DEFAULT '0',
  `weekActiveDays4` bigint(32) NOT NULL DEFAULT '0',
  `weekActiveDays5` bigint(32) NOT NULL DEFAULT '0',
  `weekActiveDays6` bigint(32) NOT NULL DEFAULT '0',
  `weekActiveDays7` bigint(32) NOT NULL DEFAULT '0',
  `weekActiveDaysPer1` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '1天占比(周活跃度)',
  `weekActiveDaysPer2` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '2天占比',
  `weekActiveDaysPer3` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '3天占比',
  `weekActiveDaysPer4` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '4天占比',
  `weekActiveDaysPer5` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '5天占比',
  `weekActiveDaysPer6` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '6天占比',
  `weekActiveDaysPer7` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '7天占比',
  `avgWeekActiveDays` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '平均活跃天数',
  `activeWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（活跃）',
  `avgDauWrr` float(11,2) NOT NULL,
  `avgDauVsWauWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比(日均DAU/WAU)',
  `onLineTimeWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（人均在线时长）',
  `activeVsAddupNewWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（活跃vs.累计新增）',
  `activeVsAddupRegisteWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（活跃vs.累计注册）',
  `addupNewVsRegisteWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（累计新增vs.注册）',
  `avgWeekActiveDaysWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周环比（日均活跃）(平均活跃天数周环比)',
  `lostUsers` bigint(32) NOT NULL DEFAULT '0' COMMENT '流失用户数量',
  `lostUsersWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周流失周环比',
  `lostRate` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周流失率',
  `lostRateWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周流失率周环比',
  `backUsers` bigint(32) NOT NULL DEFAULT '0' COMMENT '周回流',
  `backUsersWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周回流周环比',
  `stayUsers` bigint(32) NOT NULL DEFAULT '0' COMMENT '周留存',
  `stayUsersWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周留存周环比',
  `addupNewPer` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '周新增占比(周新增 % [周新增+周留存+周回流])',
  `stayUsersPer` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '周留存占比(周留存 % [周新增+周留存+周回流]',
  `backUsersPer` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '周回流占比(周回流 % [周新增+周留存+周回流]',
  `addNew` bigint(32) NOT NULL DEFAULT '0' COMMENT '周新增',
  `addNewWrr` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '周新增周环比',
  PRIMARY KEY (`productId`,`dateFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
