alter table t_center_out add column remoteAllocate int(11) DEFAULT 0
--2015/6/6 ��Ʒ�������Ӽ����ֶ�
alter table T_CENTER_ZJRCPRODUCT add column motivationMoney double DEFAULT '0'
alter table T_CENTER_ZJRCBASE add column motivationMoney double DEFAULT '0'

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
