use MCTEST1

--������� 2. � ���� ������ ������������ ���������� ��
--������������� ������� ������ ������� � ��������� � ����-
--����������� � MS SQL Server� �������� ��������� ��������:

--1. ������� �� ����������� �������� ��� ������������
-- � ��������� ������.
alter trigger Check_unique_name
on Disc
for insert, update 
as
begin
	declare @a varchar(100)
	select @a = Name from inserted
	if (select count(d.Name) from Disc d, inserted i where d.Name = i.Name)>1
	begin
		print('����� ���� ��� ����������')
		rollback transaction 
	end
	else
		print('������ � ������� Disc ������� ���������')
end

select * 
from Disc

insert into Disc
values (22,'Mr.M', 6, '1968-09-07', 5, 9)
 --------------------------------------------- �������� 07-09-2023 14:56

--2. ������� �� ����������� ������� ����� ������ The Beatles.
create trigger Dell_The_Beatles
on Disc
for deleted
as
begin
	declare @a varchar(100)
	select @a = Name from deleted
	if (select (d.Name) from Disc d, deleted i where d.Name = i.Name) like 'The Beatles'
	begin
		print('����� ������ The Beatles ���������� �������')
		rollback transaction 
	end
	else
		print('����� ������� �������')
end
---------------------------------------------- �� �������� 15:35
--3. ��� �������� ����� ������� ��������� ���������� ��
--��������� ����� � ������� ������.

--  ������� �������  Dell_Disk
create table Dell_Disk(
	id int identity (1,1) not null primary key,
	Name_d nvarchar(100) not null check(Name_d<>'') unique,
	Singers_d int not null,
	DatePublic_d date not null,
	Style_d int not null,
	Publisher_d int not null,
	)
-- ����� ������� �� ��������
CREATE TRIGGER Disk_DELETE
ON Dell_Disk d 
AFTER DELETE
AS
INSERT INTO Dell_Disk (id)
SELECT id, name_d, Si
FROM Disc
---------------------------------------------- 

--4. ������� �� ����������� ��������� � ��������� ����� --- �������� 16:29
--������������ ����� �Dark Power Pop�.

alter trigger Check_Disk_Styles_Dark_Power_Pop
on Disc
for insert, update 
as
begin
	declare @a varchar(100)
	select @a = style from inserted
	if (select count(d.Name) from Disc d, inserted i where d.style = i.style)=1
	begin
		print('�� �������� �������� ���� �� ������ ���')
		rollback transaction 
	end
	else
		print('�������� ���� �� ������ ���')
end

select * 
from Disc

insert into Disc
values (22,'������ ����', 6, '1968-09-07', 2, 9)
-------------------------------------------------------