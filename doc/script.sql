alter table t_center_out add column remoteAllocate int(11) DEFAULT 0
--2015/6/6 ��Ʒ�������Ӽ����ֶ�
alter table T_CENTER_ZJRCPRODUCT add column motivationMoney double DEFAULT '0'
alter table T_CENTER_ZJRCBASE add column motivationMoney double DEFAULT '0'

--2015/7 �ⲿƷ������
insert into t_center_oamenuitem values('0124','�ⲿƷ������','../product/importProductVsBank.jsp','01',1,'0112',24,'�ⲿƷ������')

--2015/8/15 �²�Ʒ����ȥ����Ʒ������������
delete from t_center_oamenuitem where menuitemname ='�²�Ʒ-��Ʒ��������' and id='1021'

--2015/8/16 �����������Ų�Ʒ����
insert into t_center_oamenuitem values(9035,'�������²�Ʒ����','../sailImport/batchUpdateZJRCProduct.jsp',90,1,9030,99,'�������²�Ʒ����')

--2015/8/27 �������·�Ʊת��
insert into t_center_oamenuitem values(1492,'��Ʊת��','../invoiceins/batchTransferInvoiceins.jsp',14,1,1402,99,'��Ʊת��')

--2015/9/18 �������ݴ����ѯ-������Ԥռ����
insert into t_center_oamenuitem values(9036,'����Ԥռ���','../sailImport/batchProcessSplitOut.jsp',90,1,9003,99,'����Ԥռ���')

--2015/9/29 ���ŵ������ӿͻ�������λ
alter table t_center_out_import add column customerName varchar(200) DEFAULT ''

--2015/10/17 ���-��������
insert into t_center_oamenuitem values(1518,'���-��Ʒ����','../sail/out.do?method=preForAddBuyExchange&flag=1',15,1,1501,14,'��Ʒ����')

--2015/10/30 ��Ʒ����
insert into t_center_oamenuitem values('0125','��Ʒת������','../sail/queryProductExchange.jsp','01',1,'0112',25,'��Ʒת������')
CREATE TABLE T_CENTER_PRODUCT_EXCHANGE (
id int(11) NOT NULL AUTO_INCREMENT,
srcProductId varchar(200) NOT NULL,
srcAmount int(11),
destProductId varchar(200) NOT NULL,
destAmount int(11),
PRIMARY KEY (id),
CONSTRAINT uc_ProductAmount UNIQUE (srcProductId,srcAmount)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

--2015/11/05 �����²�Ʒ
insert into t_center_oamenuitem values(1033,'���������²�Ʒ����','../product/importProductApply.jsp',10,1,101001,26,'���������²�Ʒ����')
alter table T_PRODUCT_APPLY add column className varchar(100) DEFAULT ''

--2015/11/16 ȡ���ɹ����Ԥȷ��
delete from t_center_oamenuitem where menuitemname ='�ɹ����Ԥȷ��'

--2015/11/21 ���²�Ʒ���������������/���۶���/ֽ������/������λ���ֱ��Ϊ ʵ����������װ������֤����������Ʒ����
alter table T_PRODUCT_APPLY add column productAmount int(11) DEFAULT -1,add column packageAmount int(11) DEFAULT -1,add column certificateAmount int(11) DEFAULT -1,add column productWeight double DEFAULT 0 
alter table T_CENTER_PRODUCT add column productAmount int(11) DEFAULT -1,add column packageAmount int(11) DEFAULT -1,add column certificateAmount int(11) DEFAULT -1,add column productWeight double DEFAULT 0 

--2015/12/1 �ɹ�������Ϣ
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

-- 2015/12/21 ���������ʼ�
alter table t_center_out_import add column nbyhNo varchar(200) default ''
alter table T_CENTER_PACKAGE add column sendMailFlagNbyh int(11) default -1

--2015/12/26 �Զ��������ͨ��
insert into t_center_oamenuitem values(1493,'�����Զ������������','../sailImport/importOutAutoApprove.jsp',14,1,1402,99,'�Զ��������ͨ��')
CREATE TABLE t_center_auto_approve (
id int(11) NOT NULL AUTO_INCREMENT,
fullId varchar(200) NOT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8

--2015/12/29 �������ͳ��
CREATE TABLE T_CENTER_BANK_BALANCE (
id int(11) NOT NULL AUTO_INCREMENT,
bankId varchar(200) NOT NULL,
statDate varchar(200) NOT NULL,
balance double DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8
insert into t_center_oamenuitem values(1654,'��������ѯ','../finance/bank.do?method=queryBankBalance&load=1',16,1,1312,99,'��������ѯ')

--2016/1/5 ��Ʒƽ̨�Ż�
alter table T_CENTER_VS_GIFT add column industryName varchar(100) default '', add column industryName2 varchar(100) default '', add column industryName3 varchar(100) default '', add column city varchar(100) default '', add column stafferName varchar(100) default ''
alter table T_CENTER_VS_GIFT add column province varchar(100) default ''

--2016/1/13 ����ͻ�
insert into t_center_oamenuitem values('0231','����ͻ�','../client/importCustomer.jsp','02',1,'0201',99,'����ͻ�')

--2016/1/18 �����������ֶ�POS�ն˺�
alter table T_CENTER_PAYMENT add column posTerminalNumber varchar(100) default ''

--2016/1/21 ��ƷB,C,D
alter table T_CENTER_VS_GIFT add column giftProductId2 varchar(100) default '', add column amount2 int(11) default 0, add column giftProductId3 varchar(100) default '', add column amount3 int(11) default 0

--2016/2/13 ��������δ����ԭ��
insert into t_center_oamenuitem values(1494,'��������δ����ԭ��','../sailImport/batchUpdateReason.jsp',14,1,1402,99,'��������δ����ԭ��')
insert into T_CENTER_ENUMDEFINE values(118, '310','����_��������δ����ԭ��','',0)
alter table t_center_out add column reason varchar(100) DEFAULT ''

--2016/2/15 ��Ʊ���̱��
alter table T_CENTER_INVOICEINS_IMPORT add column virtualInvoiceNum varchar(100) default ''
alter table T_CENTER_INVOICEINS_IMPORT add column productId varchar(100) default '',add column productName varchar(100) default '',add column amount int(11) default 0, add column splitFlag int(11) default 0
insert into t_center_oamenuitem values(9037,'�������뿪Ʊ����','../invoiceins/importInvoiceinsApply.jsp',90,1,9031,99,'�������뿪Ʊ����')

--2016/2/29 stored function ��ȡ���۵�����
drop function get_out_type
CREATE FUNCTION get_out_type(out_type int, type2 int) returns varchar(100)
  DETERMINISTIC
BEGIN
  DECLARE result varchar(100);
  /*���۵�*/
  if type2 = 0 then
    if out_type = 0 then
       set result = '���۳���';
    elseif out_type = 1 then
       set result = '��������';
    elseif out_type = 2 then
       set result = '����';
    elseif out_type = 3 then
       set result = 'ί�д���';
    elseif out_type = 4 then
       set result = '����';  
    elseif out_type = 5 then
       set result = '�ͻ��̻�'; 
    elseif out_type = 6 then
       set result = 'Ѳչ����'; 
    elseif out_type = 7 then
       set result = '��������';     
    END if;
  /*���ⵥ*/
  elseif type2 = 1 then
    if out_type = 0 then
       set result = '�ɹ����';
    elseif out_type = 1 then
       set result = '����';
    elseif out_type = 2 then
       set result = '����';
    elseif out_type = 3 then
       set result = 'ϵͳ����';
    elseif out_type = 4 then
       set result = '�����˿�';  
    elseif out_type = 5 then
       set result = '�����˿�'; 
    elseif out_type = 6 then
       set result = '�ɹ��˻�'; 
    elseif out_type = 7 then
       set result = '��Ʒ�˻�';  
    elseif out_type = 8 then
       set result = '��Ʒ����';  
    elseif out_type = 99 then
       set result = '�������'; 
    elseif out_type = 25 then
       set result = '��������'; 
    elseif out_type = 98 then
       set result = 'ί���˻�';    
    END if;
  END if;
  return (result);
END 

--2016/3/10 �������²�Ʒ��
insert into t_center_oamenuitem values(9038,'�����������۵�Ʒ��','../sailImport/batchUpdateProductName.jsp',90,1,9031,99,'�����������۵�Ʒ��')

--2016/3/16 �����������ռ������
insert into t_center_oamenuitem values(1495,'�����������ռ������','../tcp/batchUpdateIbMoney.jsp',14,1,1402,99,'�����������ռ������')


--2016/3/18 ������ֵ˰��Ʊ17
insert into T_CENTER_INVOICE values('90000000000000000034','��ֵ˰ר�÷�Ʊ17%',0,1,1,17,'��ֵ˰ר�÷�Ʊ17%')
insert into T_CENTER_VS_DUTYINV values('16',4, '90000000000000000034')
alter table T_CENTER_INVOICEINS_IMPORT add column zzsInfo varchar(200) default '';
alter table T_CENTER_INVOICEINS add column zzsInfo varchar(200) default '';

--2016/3/19 �˿�ʱ������λ��ݵ���
alter table t_center_out add column transportNo varchar(100) default ''

--2016/3/20 �ջ��Ǽ����̱��
alter table T_CENTER_OUTBACK add column note varchar(1024) default '',add column handoverReason varchar(100) default ''
insert into t_center_oamenuitem values(1519,'�������','../sail/queryOutBack.jsp?mode=4',15,1,1501,12,'�������')
insert into t_center_oamenuitem values(1520,'����ȷ��','../sail/queryOutBack.jsp?mode=5',15,1,1501,13,'�������')
update t_center_oamenuitem set indexPos = indexPos+2 where id in ('1516','1517','1518')
