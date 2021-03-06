alter table t_center_out add column remoteAllocate int(11) DEFAULT 0
--2015/6/6 产品配置增加激励字段
alter table T_CENTER_ZJRCPRODUCT add column motivationMoney double DEFAULT '0'
alter table T_CENTER_ZJRCBASE add column motivationMoney double DEFAULT '0'

--2015/7 外部品名配置
insert into t_center_oamenuitem values('0124','外部品名配置','../product/importProductVsBank.jsp','01',1,'0112',24,'外部品名配置')

--2015/8/15 新产品申请去掉产品管理部审批环节
delete from t_center_oamenuitem where menuitemname ='新产品-产品管理部审批' and id='1021'

--2015/8/16 批量更新中信产品配置
insert into t_center_oamenuitem values(9035,'批量更新产品配置','../sailImport/batchUpdateZJRCProduct.jsp',90,1,9030,99,'批量更新产品配置')

--2015/8/27 批量更新发票转移
insert into t_center_oamenuitem values(1492,'发票转移','../invoiceins/batchTransferInvoiceins.jsp',14,1,1402,99,'发票转移')

--2015/9/18 中信数据处理查询-〉批量预占功能
insert into t_center_oamenuitem values(9036,'批量预占库存','../sailImport/batchProcessSplitOut.jsp',90,1,9003,99,'批量预占库存')

--2015/9/29 中信导入增加客户姓名栏位
alter table t_center_out_import add column customerName varchar(200) DEFAULT ''

--2015/10/17 入库-换货功能
insert into t_center_oamenuitem values(1518,'入库-商品调换','../sail/out.do?method=preForAddBuyExchange&flag=1',15,1,1501,14,'商品调换')

--2015/10/30 商品换货
insert into t_center_oamenuitem values('0125','商品转换配置','../sail/queryProductExchange.jsp','01',1,'0112',25,'商品转换配置')
CREATE TABLE T_CENTER_PRODUCT_EXCHANGE (
id int(11) NOT NULL AUTO_INCREMENT,
srcProductId varchar(200) NOT NULL,
srcAmount int(11),
destProductId varchar(200) NOT NULL,
destAmount int(11),
PRIMARY KEY (id),
CONSTRAINT uc_ProductAmount UNIQUE (srcProductId,srcAmount)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

--2015/11/05 导入新产品
insert into t_center_oamenuitem values(1033,'批量导入新产品申请','../product/importProductApply.jsp',10,1,101001,26,'批量导入新产品申请')
alter table T_PRODUCT_APPLY add column className varchar(100) DEFAULT ''

--2015/11/16 取消采购入库预确认
delete from t_center_oamenuitem where menuitemname ='采购入库预确认'

--2015/11/21 把新产品申请里的销售周期/销售对象/纸币类型/外型栏位，分别改为 实物数量、包装数量、证书数量、产品克重
alter table T_PRODUCT_APPLY add column productAmount int(11) DEFAULT -1,add column packageAmount int(11) DEFAULT -1,add column certificateAmount int(11) DEFAULT -1,add column productWeight double DEFAULT 0 
alter table T_CENTER_PRODUCT add column productAmount int(11) DEFAULT -1,add column packageAmount int(11) DEFAULT -1,add column certificateAmount int(11) DEFAULT -1,add column productWeight double DEFAULT 0 

--2015/12/1 采购到货信息
CREATE TABLE `T_CENTER_STOCKITEMARRIAL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` varchar(40) DEFAULT NULL,
  `productId` varchar(40) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `totalWarehouseNum` int(11) DEFAULT NULL,
  `refOutId` varchar(40) DEFAULT NULL,
  `hasRef` int(11) DEFAULT '0',
  `stafferId` varchar(40) DEFAULT NULL,
  `providerId` varchar(40) DEFAULT NULL,
  `showId` varchar(40) DEFAULT NULL,
  `depotpartId` varchar(40) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `fechProduct` int(11) DEFAULT '0',
  `pay` int(11) DEFAULT '0',
  `price` double DEFAULT NULL,
  `prePrice` double DEFAULT NULL,
  `sailPrice` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `nearlyPayDate` varchar(40) DEFAULT NULL,
  `logTime` varchar(40) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `productNum` int(11) DEFAULT '0',
  `netAskId` varchar(40) DEFAULT NULL,
  `priceAskProviderId` varchar(40) DEFAULT NULL,
  `dutyId` varchar(40) DEFAULT NULL,
  `invoiceType` varchar(40) DEFAULT NULL,
  `mtype` int(11) DEFAULT '0',
  `extraStatus` int(11) DEFAULT '0',
  `deliveryDate` varchar(200) NOT NULL,
  `arrivalDate` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116910 DEFAULT CHARSET=utf8;

alter table T_CENTER_STOCKITEM add column totalWarehouseNum int(11) default 0

alter table T_CENTER_STOCKITEM modify refOutId varchar(200)

alter table T_CENTER_STOCKITEM add column deliveryDate varchar(200) default '', add column arrivalDate varchar(200) default ''

alter table T_CENTER_PACKAGE_ITEM modify productId varchar(200)

-- 2015/12/21 宁波银行邮件
alter table t_center_out_import add column nbyhNo varchar(200) default ''
alter table T_CENTER_PACKAGE add column sendMailFlagNbyh int(11) default -1

--2015/12/26 自动库管审批通过
insert into t_center_oamenuitem values(1493,'导入自动库管审批订单','../sailImport/importOutAutoApprove.jsp',14,1,1402,99,'自动库管审批通过')
CREATE TABLE t_center_auto_approve (
id int(11) NOT NULL AUTO_INCREMENT,
fullId varchar(200) NOT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

--2015/12/29 银行余额统计
CREATE TABLE T_CENTER_BANK_BALANCE (
id int(11) NOT NULL AUTO_INCREMENT,
bankId varchar(200) NOT NULL,
statDate varchar(200) NOT NULL,
balance double DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8
insert into t_center_oamenuitem values(1654,'银行余额查询','../finance/bank.do?method=queryBankBalance&load=1',16,1,1312,99,'银行余额查询')

--2016/1/5 赠品平台优化
alter table T_CENTER_VS_GIFT add column industryName varchar(100) default '', add column industryName2 varchar(100) default '', add column industryName3 varchar(100) default '', add column city varchar(100) default '', add column stafferName varchar(100) default ''
alter table T_CENTER_VS_GIFT add column province varchar(100) default ''

--2016/1/13 导入客户
insert into t_center_oamenuitem values('0231','导入客户','../client/importCustomer.jsp','02',1,'0201',99,'导入客户')

--2016/1/18 导入汇款新增字段POS终端号
alter table T_CENTER_PAYMENT add column posTerminalNumber varchar(100) default ''

--2016/1/21 赠品B,C,D
alter table T_CENTER_VS_GIFT add column giftProductId2 varchar(100) default '', add column amount2 int(11) default 0, add column giftProductId3 varchar(100) default '', add column amount3 int(11) default 0

--2016/2/13 批量更新未审批原因
insert into t_center_oamenuitem values(1494,'批量更新未审批原因','../sailImport/batchUpdateReason.jsp',14,1,1402,99,'批量更新未审批原因')
insert into T_CENTER_ENUMDEFINE values(118, '310','销售_批量更新未审批原因','',0)
alter table t_center_out add column reason varchar(100) DEFAULT ''

--2016/2/15 发票流程变更
alter table T_CENTER_INVOICEINS_IMPORT add column virtualInvoiceNum varchar(100) default ''
alter table T_CENTER_INVOICEINS_IMPORT add column productId varchar(100) default '',add column productName varchar(100) default '',add column amount int(11) default 0, add column splitFlag int(11) default 0
insert into t_center_oamenuitem values(9037,'批量导入开票申请','../invoiceins/importInvoiceinsApply.jsp',90,1,9031,99,'批量导入开票申请')

--2016/2/29 stored function 获取销售单类型
drop function get_out_type
CREATE FUNCTION get_out_type(out_type int, type2 int) returns varchar(100)
  DETERMINISTIC
BEGIN
  DECLARE result varchar(100);
  /*销售单*/
  if type2 = 0 then
    if out_type = 0 then
       set result = '销售出库';
    elseif out_type = 1 then
       set result = '个人领样';
    elseif out_type = 2 then
       set result = '零售';
    elseif out_type = 3 then
       set result = '委托代销';
    elseif out_type = 4 then
       set result = '赠送';  
    elseif out_type = 5 then
       set result = '客户铺货'; 
    elseif out_type = 6 then
       set result = '巡展领样'; 
    elseif out_type = 7 then
       set result = '银行领样';     
    END if;
  /*出库单*/
  elseif type2 = 1 then
    if out_type = 0 then
       set result = '采购入库';
    elseif out_type = 1 then
       set result = '调拨';
    elseif out_type = 2 then
       set result = '报废';
    elseif out_type = 3 then
       set result = '系统纠正';
    elseif out_type = 4 then
       set result = '领样退库';  
    elseif out_type = 5 then
       set result = '销售退库'; 
    elseif out_type = 6 then
       set result = '采购退货'; 
    elseif out_type = 7 then
       set result = '赠品退货';  
    elseif out_type = 8 then
       set result = '商品调换';  
    elseif out_type = 99 then
       set result = '其他入库'; 
    elseif out_type = 25 then
       set result = '调拨申请'; 
    elseif out_type = 98 then
       set result = '委托退货';    
    END if;
  END if;
  return (result);
END 

--2016/3/10 批量更新产品名
insert into t_center_oamenuitem values(9038,'批量更新销售单品名','../sailImport/batchUpdateProductName.jsp',90,1,9031,99,'批量更新销售单品名')

--2016/3/16 批量更新中收激励金额
insert into t_center_oamenuitem values(1495,'批量更新中收激励金额','../tcp/batchUpdateIbMoney.jsp',14,1,1402,99,'批量更新中收激励金额')


--2016/3/18 新增增值税发票17
insert into T_CENTER_INVOICE values('90000000000000000034','增值税专用发票17%',0,1,1,17,'增值税专用发票17%')
insert into T_CENTER_VS_DUTYINV values('16',4, '90000000000000000034')
alter table T_CENTER_INVOICEINS_IMPORT add column zzsInfo varchar(200) default '';
alter table T_CENTER_INVOICEINS add column zzsInfo varchar(200) default '';

--2016/3/19 退库时增加栏位快递单号
alter table t_center_out add column transportNo varchar(100) default ''
alter table T_CENTER_BATCHSWATCH add column transportNo varchar(100) default ''

--2016/3/20 收货登记流程变更
alter table T_CENTER_OUTBACK add column note varchar(1024) default '',add column handoverReason varchar(100) default ''
alter table T_CENTER_OUTBACK add column handoverChecker varchar(16) default '',add column handoverCheckTime varchar(100) default '', add column confirmChecker varchar(16) default '',add column confirmCheckTime varchar(100) default ''
insert into t_center_oamenuitem values(1519,'验货交接','../sail/queryOutBack.jsp?mode=4',15,1,1501,12,'验货交接')
insert into t_center_oamenuitem values(1520,'商务确认','../sail/queryOutBack.jsp?mode=5',15,1,1501,13,'验货交接')
update t_center_oamenuitem set indexPos = indexPos+2 where id in ('1516','1517','1518')

--2016/4/14 邮件下载生成销售单
create table T_CENTER_CITIC_ORDER (	
id int(11) NOT NULL AUTO_INCREMENT,
status int(11) default 0,
customerId varchar(40) NOT NULL,
customerName varchar(40) NOT NULL ,
idCard varchar(20) NOT NULL,
dealDate varchar(40),
pickupDate varchar(40),
pickupFlag int(11),
tellerId varchar(40),
pickupNode varchar(40),
pickupAddress varchar(200),
branchId varchar(40),
branchName varchar(40) NOT NULL,
secondBranch varchar(40) NOT NULL,
comunicationBranch varchar(40) NOT NULL,
comunicatonBranchName varchar(40) NOT NULL,
productId varchar(40),
productCode varchar(40) NOT NULL,
enterpriseProductCode varchar(40),
productName varchar(100) NOT NULL,
amount int(11) NOT NULL,
price double default '0' NOT NULL,
productWeight double default '0',
value double default '0' NOT NULL,
fee double default '0' NOT NULL,
arriveDate varchar(40),
orderOrShow varchar(40),
spotFlag int(40),
citicNo varchar(40) NOT NULL,
invoiceNature varchar(40) NOT NULL,
invoiceHead varchar(40) NOT NULL,
invoiceCondition varchar(40) NOT NULL,
managerId varchar(40) NOT NULL,
manager varchar(40) NOT NULL,
originator varchar(40),
provinceId varchar(40),
provinceName varchar(40),
cityId varchar(40),
city varchar(40) NOT NULL,
address varchar(40) NOT NULL,
receiver varchar(40) NOT NULL,
receiverMobile varchar(40) NOT NULL,
handPhone varchar(40),
weight double default '0',
goldPrice double default '0',
materialType varchar(40),
productType varchar(40),
pickupType varchar(40),
teller varchar(40),
logTime varchar(40),
citicOrderDate varchar(40),
enterpriseName varchar(40) NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY `INX_ALL` (`citicNo`,`productName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

create table T_CENTER_ZY_ORDER (	
id int(11) NOT NULL AUTO_INCREMENT,
status int(11) default 0,
innerCustomerId varchar(40) NOT NULL,
customerId varchar(40) NOT NULL,
customerName varchar(40) NOT NULL,
customerType varchar(20) NOT NULL,
customerGroup varchar(20) NOT NULL,
idType varchar(20) NOT NULL,
idCard varchar(20) NOT NULL,
proxyIdType varchar(20),
proxyIdCard varchar(20),
bankAccount varchar(40) NOT NULL,
channel varchar(40) NOT NULL,
originalChannel varchar(40),
terminal varchar(40),
dealDate varchar(40) NOT NULL,
dealTime varchar(40) NOT NULL,
dealCode varchar(40) NOT NULL,
dealAgent varchar(40) NOT NULL,
originalDealAgent varchar(40),
tellerId varchar(40),
sendMainframeId varchar(40) NOT NULL,
mainframeCheckDate varchar(40) NOT NULL,
mainframeTradeCode varchar(40) NOT NULL,
mainframeDate varchar(40),
mainframeId varchar(40) NOT NULL,
returnCode varchar(20) NOT NULL,
returnMessage varchar(20) NOT NULL,
tradeStatus varchar(20) NOT NULL,
acceptMethod varchar(20),
corporateAccount varchar(40) NOT NULL,
finished int(11) NOT NULL default 0,
exceptional int(11) default 0,
appointmentOfArrival int(11) default 0,
pickupNode varchar(40),
specCode varchar(40) NOT NULL,
specName varchar(40) NOT NULL,
spec double default '0',
businessType varchar(40),
associateDate varchar(40),
associateId varchar(40),
serialNumber varchar(40),
channelSerialNumber varchar(40) NOT NULL,
productId varchar(40),
productCode varchar(40) NOT NULL,
productName varchar(100) NOT NULL,
amount int(11) NOT NULL,
buyUnit int(11) NOT NULL,
price double default '0' NOT NULL,
value double default '0' NOT NULL,
fee double default '0' NOT NULL,
arriveDate varchar(40),
invoiceHead varchar(40) NOT NULL,
financialStatus varchar(40),
currency varchar(40) NOT NULL,
manager varchar(40) NOT NULL,
paymentMethod varchar(40),
remainAmount int(11) default 0,
storageCost double default '0',
discountRate double default '0',
productType varchar(40),
pickupType varchar(40),
teller varchar(40),
logTime varchar(40),
enterpriseCode varchar(40) NOT NULL,
enterpriseName varchar(40) NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY `INX_ALL` (`serialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

--2016/4/20 发货邮件给销售人员
alter table T_CENTER_PACKAGE add column sendMailFlagSails int(11) default -1

--2016/4/23 票随货发修改
CREATE TABLE `T_CENTER_TEMPCONSIGN` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `outId` varchar(1024) DEFAULT NULL,
  `insId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--2016/4/30 银行业务部层级关系导入
insert into t_center_oamenuitem values('1924','银行业务部层级关系导入','../tcp/importBankBuLevel.jsp','19',1,'0000',21,'银行业务部层级关系导入')
CREATE TABLE `T_CENTER_BANKBU_LEVEL` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `provinceManagerId` varchar(40) DEFAULT NULL,
  `provinceManager` varchar(40) DEFAULT NULL,
  `regionalManagerId` varchar(40) DEFAULT NULL,
  `regionalManager` varchar(40) DEFAULT NULL,
  `regionalDirectorId` varchar(40) DEFAULT NULL,
  `regionalDirector` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table T_CENTER_COMPOSE add column description varchar(1024) default ''

alter table T_CENTER_TEMPCONSIGN modify column outId varchar(1024);

--2016/5/17 导入客户地址信息
alter table T_CENTER_VS_CUSTADDR add column shipping int(11) DEFAULT -1,add column transport1 int(11) DEFAULT 0,add column transport2 int(11) DEFAULT 0, add column expressPay int(11) DEFAULT -1,add column transportPay int(11) DEFAULT -1
insert into t_center_oamenuitem values('0232','导入客户地址信息','../client/importCustomerAddress.jsp','02',1,'0201',99,'导入客户地址信息')

--2016/5/25 导入主产品数据
CREATE TABLE `T_CENTER_PRODUCT_IMPORT` (
  `id` varchar(40) NOT NULL,
  `bank` varchar(40) NOT NULL,
  `bankProductCode` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `code` varchar(40) NOT NULL,
  `bankProductBarcode` varchar(40) NOT NULL,
  `bankProductName` varchar(40) NOT NULL,
  `properties` varchar(100) NOT NULL,
  `weight` varchar(40) DEFAULT '',
  `material` varchar(40) DEFAULT NULL,
  `retailPrice` double DEFAULT 0,
  `costPrice` double DEFAULT 0,
  `ibMoney` double DEFAULT 0,
  `motivationMoney` double DEFAULT 0,
  `grossProfit` double DEFAULT 0,
  `buyBack` int(11) DEFAULT -1,
  `onMarketDate` varchar(40) DEFAULT '',
  `offlineDate` varchar(40) DEFAULT '',
  `branchRange` varchar(40) DEFAULT '',
  `taxRate` varchar(40) NOT NULL,
  `invoiceType` varchar(40) NOT NULL,
  `invoiceContent` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into t_center_oamenuitem values(1034,'批量导入产品主数据','../product/importProductForMailOut.jsp',10,1,101001,27,'批量导入产品主数据')

--2016/6/5 新产品申请流程
insert into t_center_oamenuitem values(1021,'新产品-财务总监审批','../product/queryProductApply.jsp?forward=1',10,1,101003,14,null)
update t_center_oamenuitem set menuitemname='新产品-战略审批' where id=1022 and menuitemname='新产品-运营中心审批'

--2016/6/5 #256
drop PROCEDURE if exists auth_user
CREATE PROCEDURE auth_user(in auth_id varchar(100))
BEGIN
   DECLARE u_id varchar(100) DEFAULT "";
   DECLARE u_name varchar(100) DEFAULT "";
   DECLARE u_roleId varchar(100) DEFAULT "";
   DECLARE no_more_rows BOOLEAN;
   DECLARE role_auth_count int(11) default -1;
   
   DEClARE user_cursor CURSOR FOR select id,name,roleId from T_CENTER_OAUSER;
   DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET no_more_rows = TRUE;
          
   OPEN user_cursor;
   the_loop: LOOP
   FETCH user_cursor INTO u_id,u_name,u_roleId;
    IF no_more_rows THEN
        CLOSE user_cursor;
        LEAVE the_loop;
    END IF;
   #SELECT u_id,u_name,u_roleId;  
   select count(id) into role_auth_count from t_center_roleauth where roleid=u_roleId and authid=auth_id;
   if role_auth_count = 0 then 
      #select 'insert t_center_roleauth', u_roleId, auth_id;
      insert into t_center_roleauth(roleid,authid) values(u_roleId,auth_id); 
   end if;
   
   #select role_auth_count;
   END LOOP the_loop; 
END 
call auth_user('1501')
