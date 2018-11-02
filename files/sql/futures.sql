/*
SQLyog Ultimate v13.0.1 (64 bit)
MySQL - 5.5.54-log : Database - falconquant
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`falconquant` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `falconquant`;

/*Table structure for table `futures_close_detail_daily` */

DROP TABLE IF EXISTS `futures_close_detail_daily`;

CREATE TABLE `futures_close_detail_daily` (
  `costomer_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `contract` varchar(20) DEFAULT NULL COMMENT '合约号',
  `trans_number` varchar(20) DEFAULT NULL COMMENT '成交序号',
  `trans_price` decimal(16,2) DEFAULT NULL COMMENT '成交价',
  `open` decimal(16,2) DEFAULT NULL COMMENT '开仓价',
  `lot` int(11) DEFAULT NULL COMMENT '交易手数',
  `last_set` decimal(16,2) DEFAULT NULL COMMENT '昨结算价',
  `close_profit_loss` decimal(16,2) DEFAULT NULL COMMENT '平仓盈亏',
  `ori_trans_number` varchar(20) DEFAULT NULL COMMENT '原成交序号',
  `act_trans_date` date DEFAULT NULL COMMENT '实际交易日期',
  PRIMARY KEY (`costomer_id`,`trade_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='平仓明细';

/*Data for the table `futures_close_detail_daily` */

/*Table structure for table `futures_custom_info` */

DROP TABLE IF EXISTS `futures_custom_info`;

CREATE TABLE `futures_custom_info` (
  `account_code` varchar(10) NOT NULL COMMENT '客户期货期权账户名称',
  `customer_name` varchar(25) DEFAULT NULL COMMENT '客户姓名',
  `futures_name` varchar(25) DEFAULT NULL COMMENT '期货公司',
  PRIMARY KEY (`account_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户基本信息';

/*Data for the table `futures_custom_info` */

/*Table structure for table `futures_customer_equity_daily` */

DROP TABLE IF EXISTS `futures_customer_equity_daily`;

CREATE TABLE `futures_customer_equity_daily` (
  `costomer_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `last_balance` decimal(16,2) DEFAULT NULL COMMENT '上日结存',
  `equity` decimal(16,2) DEFAULT NULL COMMENT '客户权益',
  `deposit_withdraw` decimal(16,2) DEFAULT NULL COMMENT '当日存取合计',
  `act_capital` decimal(16,2) DEFAULT NULL COMMENT '实有货币资金',
  `close_profit_loss` decimal(16,2) DEFAULT NULL COMMENT '平仓盈亏',
  `not_coin_offset` decimal(16,2) DEFAULT NULL COMMENT '非货币充抵金额',
  `rights_total` decimal(16,2) DEFAULT NULL COMMENT '当日总权利金',
  `coin_offset` decimal(16,2) DEFAULT NULL COMMENT '货币充抵金额',
  `fee` decimal(16,2) DEFAULT NULL COMMENT '当日手续费',
  `frozen_capital` decimal(16,2) DEFAULT NULL COMMENT '冻结资金',
  `balance` decimal(16,2) DEFAULT NULL COMMENT '当日结存',
  `margin_occupation` decimal(16,2) DEFAULT NULL COMMENT '保证金占用',
  `float_profit_loss` decimal(16,2) DEFAULT NULL COMMENT '浮动盈亏',
  `available_capital` decimal(16,2) DEFAULT NULL COMMENT '可用资金',
  `risk` decimal(16,2) DEFAULT NULL COMMENT '风险度',
  `margin_append` decimal(16,2) DEFAULT NULL COMMENT '追加保证金',
  PRIMARY KEY (`costomer_id`,`trade_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每日账户状况';

/*Data for the table `futures_customer_equity_daily` */

/*Table structure for table `futures_exchange_code` */

DROP TABLE IF EXISTS `futures_exchange_code`;

CREATE TABLE `futures_exchange_code` (
  `exchange_id` int(11) NOT NULL COMMENT '期货交易所代码',
  `exchange_title` varchar(20) DEFAULT NULL COMMENT '期货交易所',
  PRIMARY KEY (`exchange_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='码表-期货交易所';

/*Data for the table `futures_exchange_code` */

insert  into `futures_exchange_code`(`exchange_id`,`exchange_title`) values 
(1,'上海期货交易所'),
(2,'大连商品交易所'),
(3,'郑州商品交易所'),
(4,'中金所'),
(5,'能源');

/*Table structure for table `futures_other_capital_daily` */

DROP TABLE IF EXISTS `futures_other_capital_daily`;

CREATE TABLE `futures_other_capital_daily` (
  `costomer_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `exchanage_id` varchar(20) DEFAULT NULL COMMENT '交易所ID',
  `free_type` int(11) DEFAULT NULL COMMENT '交易手续费=0，结算手续费=1',
  `amount` decimal(16,2) DEFAULT NULL COMMENT '金额',
  `remartks` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`costomer_id`,`trade_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每日其他资金明细';

/*Data for the table `futures_other_capital_daily` */

/*Table structure for table `futures_position_detail_daily` */

DROP TABLE IF EXISTS `futures_position_detail_daily`;

CREATE TABLE `futures_position_detail_daily` (
  `costomer_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `contract` varchar(20) DEFAULT NULL COMMENT '合约号',
  `trans_number` varchar(20) DEFAULT NULL COMMENT '成交序号',
  `long_position` int(11) DEFAULT NULL COMMENT '买持仓',
  `buy` decimal(16,2) DEFAULT NULL COMMENT '买入价',
  `short_position` int(11) DEFAULT NULL COMMENT '卖持仓',
  `sell` decimal(16,2) DEFAULT NULL COMMENT '卖出价',
  `last_set` decimal(16,2) DEFAULT NULL COMMENT '昨结算价',
  `set` decimal(16,2) DEFAULT NULL COMMENT '今结算价',
  `close_profit_loss` decimal(16,2) DEFAULT NULL COMMENT '浮动盈亏',
  `speculate_hedge` tinyint(1) DEFAULT NULL COMMENT '投机=true，套保=false',
  `trade_code` varchar(20) DEFAULT NULL COMMENT '交易编码',
  `act_trans_date` date DEFAULT NULL COMMENT '实际交易日期',
  PRIMARY KEY (`costomer_id`,`trade_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='持仓明细';

/*Data for the table `futures_position_detail_daily` */

/*Table structure for table `futures_position_total_daily` */

DROP TABLE IF EXISTS `futures_position_total_daily`;

CREATE TABLE `futures_position_total_daily` (
  `costomer_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `long_position` int(11) DEFAULT NULL COMMENT '买持仓',
  `buy_avg` decimal(16,2) DEFAULT NULL COMMENT '买均价',
  `short_position` int(11) DEFAULT NULL COMMENT '卖持仓',
  `sell_avg` decimal(16,2) DEFAULT NULL COMMENT '卖均价',
  `last_set` decimal(16,2) DEFAULT NULL COMMENT '昨结算价',
  `set` decimal(16,2) DEFAULT NULL COMMENT '今结算价',
  `float_profit_loss` decimal(16,2) DEFAULT NULL COMMENT '平仓盈亏',
  `margin` decimal(16,2) DEFAULT NULL COMMENT '交易保证金',
  `speculate_hedge` tinyint(1) DEFAULT NULL COMMENT '投机=true，套保=false',
  PRIMARY KEY (`costomer_id`,`trade_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每日品种汇总';

/*Data for the table `futures_position_total_daily` */

/*Table structure for table `futures_trans_detail_daily` */

DROP TABLE IF EXISTS `futures_trans_detail_daily`;

CREATE TABLE `futures_trans_detail_daily` (
  `costomer_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `contract` varchar(20) DEFAULT NULL COMMENT '合约号',
  `trans_number` varchar(20) DEFAULT NULL COMMENT '成交序号',
  `trans_time` time DEFAULT NULL COMMENT '成交时间',
  `buy_sell` tinyint(1) DEFAULT NULL COMMENT '买=true,卖=false',
  `speculate_hedge` tinyint(1) DEFAULT NULL COMMENT '投机=true，套保=false',
  `price` decimal(16,2) DEFAULT NULL COMMENT '价格',
  `lot` int(11) DEFAULT NULL COMMENT '交易手数',
  `vol` decimal(16,2) DEFAULT NULL COMMENT '成交额',
  `open_close` tinyint(1) DEFAULT NULL COMMENT '开=true、平=false',
  `fee` decimal(16,2) DEFAULT NULL COMMENT '手续费',
  `close_profit_loss` decimal(16,2) DEFAULT NULL COMMENT '平仓盈亏',
  PRIMARY KEY (`costomer_id`,`trade_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='交易明细';

/*Data for the table `futures_trans_detail_daily` */

/*Table structure for table `futures_trans_total_daily` */

DROP TABLE IF EXISTS `futures_trans_total_daily`;

CREATE TABLE `futures_trans_total_daily` (
  `costomer_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `contract` varchar(20) DEFAULT NULL COMMENT '合约号',
  `buy_sell` tinyint(1) DEFAULT NULL COMMENT '买=true,卖=false',
  `speculate_hedge` tinyint(1) DEFAULT NULL COMMENT '投机=true，套保=false',
  `price` decimal(16,2) DEFAULT NULL COMMENT '成交价',
  `lot` int(11) DEFAULT NULL COMMENT '手数',
  `vol` decimal(16,2) DEFAULT NULL COMMENT '成交额',
  `open_close` tinyint(1) DEFAULT NULL COMMENT '开=true、平=false',
  `fee` decimal(16,2) DEFAULT NULL COMMENT '手续费',
  `close_profit_loss` decimal(16,2) DEFAULT NULL COMMENT '平仓盈亏',
  PRIMARY KEY (`costomer_id`,`trade_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每日品种汇总';

/*Data for the table `futures_trans_total_daily` */

/*Table structure for table `futures_varieties_code` */

DROP TABLE IF EXISTS `futures_varieties_code`;

CREATE TABLE `futures_varieties_code` (
  `variety_code` varchar(255) NOT NULL COMMENT '品种代码',
  `variety_title` varchar(255) DEFAULT NULL COMMENT '品种名称',
  `exchange_id` int(11) NOT NULL COMMENT '交易所id',
  PRIMARY KEY (`variety_code`,`exchange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `futures_varieties_code` */

insert  into `futures_varieties_code`(`variety_code`,`variety_title`,`exchange_id`) values 
('A','黄大豆',2),
('AG','白银',1),
('AL','铝',1),
('AP','苹果',3),
('AU','黄金',1),
('B','豆二',2),
('BB','胶合板',2),
('BU','沥青',1),
('C','玉米',2),
('CF','棉花',3),
('CS','玉米淀粉',2),
('CU','铜',1),
('CY','棉纱',3),
('FB','纤维板',2),
('FG','玻璃',3),
('FU','燃料油',1),
('HC','热轧卷板',1),
('I','铁矿石',2),
('IC','中证500',4),
('IF','沪深300',4),
('IH','上证50',4),
('J','焦炭',2),
('JD','鸡蛋',2),
('JM','焦煤',2),
('JR','粳稻',3),
('L','聚乙烯',2),
('LR','晚籼稻',3),
('M','豆粕',2),
('MA','甲醇',3),
('NI','镍',1),
('OI','菜籽油',3),
('P','棕榈油',2),
('PB','铅',1),
('PM','普麦',3),
('PP','聚丙烯',2),
('RB','螺纹',1),
('RI','早籼稻',3),
('RM','菜籽粕',3),
('RS','油菜籽',3),
('RU','橡胶',1),
('SC','原油',5),
('SF','硅铁',3),
('SM','锰硅',3),
('SN','锡',1),
('SR','白糖',3),
('T','国债10年期',4),
('TA','PTA',3),
('TF','国债5年期',4),
('TS','国债2年期',4),
('V','聚氯乙烯',2),
('WH','强麦',3),
('WR','线材',1),
('Y','豆油',2),
('ZC','新动力煤',3),
('ZN','锌',1);

/*Table structure for table `futures_varieties_total_daily` */

DROP TABLE IF EXISTS `futures_varieties_total_daily`;

CREATE TABLE `futures_varieties_total_daily` (
  `costomer_id` int(11) NOT NULL COMMENT '用户ID',
  `trade_date` date NOT NULL COMMENT '交易日期',
  `variety_code` char(5) DEFAULT NULL COMMENT '品种代码',
  `vol` decimal(16,2) DEFAULT NULL COMMENT '成交额',
  `fee` decimal(16,2) DEFAULT NULL COMMENT '手续费',
  `close_profit_loss` decimal(16,2) DEFAULT NULL COMMENT '平仓盈亏',
  PRIMARY KEY (`costomer_id`,`trade_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='每日品种汇总';

/*Data for the table `futures_varieties_total_daily` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
