alter table t_center_out add column remoteAllocate int(11) DEFAULT 0
--2015/6/6 ��Ʒ�������Ӽ����ֶ�
alter table T_CENTER_ZJRCPRODUCT add column motivationMoney double DEFAULT '0'
alter table T_CENTER_ZJRCBASE add column motivationMoney double DEFAULT '0'

--2015/8/15 �²�Ʒ����ȥ����Ʒ������������
delete from t_center_oamenuitem where menuitemname ='�²�Ʒ-��Ʒ��������' and id='1021'

--2015/8/16 �����������Ų�Ʒ����
insert into t_center_oamenuitem values(9035,'�������²�Ʒ����','../sailImport/batchUpdateZJRCProduct.jsp',90,1,9030,99,'�������²�Ʒ����')
