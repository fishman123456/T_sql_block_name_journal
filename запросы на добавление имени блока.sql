--11-09-2023
--electric-cabinet_2022 - ����
--siren - ������ ����������
--sensor - ������
--remote_controller_2023 - ���� 2 �������
--push_button_post_2023 - ��������� ����
--electric_motor - ��. ����
--KTV - ������ ��������� �����������
--KSL - �������� ����� �����
--Terminal_box - ������� ��������- ��������� ����

--- �������� ������� 

create table New1 (
id int null,
b1 nvarchar(255) null,
b2 nvarchar(255) null,
b3 nvarchar(255) null,
b4 nvarchar(255) null,
b5 nvarchar(255) null,
b6 nvarchar(255) null,
b7 nvarchar(255) null,
b8 nvarchar(255) null,
b9 nvarchar(255) null,
b10 nvarchar(255) null,
b11 nvarchar(255) null,
b12 nvarchar(255) null,
b13 nvarchar(255) null,
b14 nvarchar(255) null,
b15 nvarchar(255) null,
b16 nvarchar(255) null,
b17 nvarchar(255) null,
b18 nvarchar(255) null,
)
--- �������� ������� � ��������� � �� ������ 11-09-2023 15:02 -- ������
select *
into New_B_T
from jk56

select *
from New_B_T
---
--������ �� ������� ���� - ���� � �������  New12
select *
from New_B_T nw
where nw.a2 like '%����%' and nw.a3 like '%����%'

--������� ��� ������ �����, ����� ���� �������� ��������� �������� 11-09-2023 16:36
UPDATE New_B_T 
   SET a14 = 'electric-cabinet_2022'
 WHERE a2 like '%����%' and a3 like '%����%'

 --������� ��� ������ ������, ����� ���� �������� ��������� �������� 11-09-2023 17:04
 select *
from New_B_T nw
where nw.a3 like '%���� ������������%' or nw.a3 like '%������������ ������������%'

UPDATE New_B_T 
   SET a14 = 'siren'
 where a3 like '%���� ������������%' or a3 like '%������������ ������������%'

  --������� ��� ������ ���, ����� ���� �������� ��������� �������� 11-09-2023 17:10
 select *
from New_B_T 
where a3 like '%��������� �������� �����������%' 

UPDATE New_B_T 
   SET a14 = 'KTV'
 where a3 like '%��������� �������� �����������%' 

  --������� ��� ������ ���, ����� ���� �������� ��������� �������� 11-09-2023 17:15
 select *
from New_B_T 
where a3 like '%�������� �������%' 

UPDATE New_B_T 
   SET a14 = 'Terminal_box'
where a3 like '%�������� �������%' 

  --������� ��� ��������� ����, ����� ���� �������� ��������� �������� 11-09-2023 17:15
 select *
from New_B_T 
where a3 like '%����� �������� ����������%' or a3 like '%��������� ����%'

UPDATE New_B_T 
   SET a14 = 'push_button_post_2023'
where a3 like '%����� �������� ����������%' or a3 like '%��������� ����%'

--������ �������� ��������� 19-09-2023 8:46
 create procedure prov_name
 @name1 varchar(100),
  @name2 varchar(100)
  --@nameblock varchar(100)
as 
select *
from New_B_T 
where a3 like @name1 or a3 like	@name2
go

exec prov_name ' ','%��%'

-- ��������� �� ����������
 create procedure add_bname
 @name1 varchar(100),
  @name2 varchar(100),
  @nameblock varchar(100)
as 
UPDATE New_B_T 
   SET a14 = @nameblock
where a3 like @name1 or a3 like @name2

exec prov_name '%���������%',''
-- ���������� �����������