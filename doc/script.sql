alter table t_center_out add column remoteAllocate int(11) DEFAULT 0

--2015/8/15 �²�Ʒ����ȥ����Ʒ������������
delete from t_center_oamenuitem where menuitemname ='�²�Ʒ-��Ʒ��������' and id='1021'
