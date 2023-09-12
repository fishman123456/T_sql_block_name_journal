--������� 08-09-2023- ���� ������ � ����� �������.
--���������� �������� ��������� ������� � ���� ������ �������� ������� (BookShop):

--1. �������� ��� �����, ���������� ������� � ������� ������ 
--500, �� ������ 650. - ������ 08-09-2023 00:50
select *
from books b
where b.Pages >= 500 and b.Pages <= 650

--2. �������� ��� �����, � ������� ������ ����� �������� ����
--���, ���� �ǻ. - ������ 08-09-2023 00:55
select *
from books b
where b.Name like '�%' or b.Name like '�%'

--3. �������� ��� ����� ����� ���������, ���������� ���������
--���� ����� 30 �����������. -  ������ 08-09-2023 01:15
select b.Name
from books b, sales s, themes th
where th.id = b.ThemeId and s.Bookid = b.id and 
th.Name like'��������' and s.Quantity >= 30

--4. �������� ��� �����, � �������� ������� ���� ����� �Microsoft�, �� ��� ����� �Windows�.
--  ������ 08-09-2023 11:19
select*
from books b
where b.Name  like '%Microsoft%' 
and b.Name not like '%Windows%' 

--08-09-2023 01:18 - ���� �����
--6. �������� ��� �����, �������� ������� ������� �� 4 ����. --  ������ 08-09-2023 11:28

select*
from books b
where b.Name  like '% % % %' 


--7. �������� ���������� � �������� � ��������� ����:
--7.1	�������� �����, ��, ����� ��� �� ��������� ����� ���.
--7.2	��������, ��, ����� �� �����������������.
--7.3	�����, ��, ����� �� �������� �����.
--7.4	����, ��, ����� � ��������� �� 10 �� 20 ������.
--7.5	���������� ������, �� �� ����� 8 ����.
--7.6	�������� ��������, ������� ������ �����, �� �� �� ������ ���� � ������� ��� ������.

--7.1
select *
from books b
where  b.Name not like '%�%'
--7.2
select *
from themes th
where  th.Name not like '����������������'
--7.3
select *
from  authors a
where  a.Name not like '�������' and a.Surname not like '�����'
--7.4
select *
from sales s
where  s.Price between 10 and 20
--7.5
select *
from sales s
where  s.Quantity >= 8
--7.6
select *
from shops sh, countries c
where sh.CountryId =c.id and
		c.Name not like '�������' and
		c.Name not like '������'

--8. �������� ������� ���������� ������� �� ������ ��������,
--������� �� ��������� 400. -- �������� 08-09-2023 13:29
select *
from books b, themes th
where b.ThemeId = th.id

select  avg(b.Pages), th.Name
from books b, themes th
where b.ThemeId = th.id
group by th.Name
having avg(b.Pages)<=400

--9. �������� ����� ������� �� ������ ��������, �������� ������ ����� 
--� ����������� ������� ����� 400,
--� ����� �������� ���� �����������������, ������������������ � �������. 
-- �������� 08-09-2023 13:58
select *
from books b, themes th
where b.ThemeId = th.id

select  avg(b.Pages), th.Name
from books b, themes th
where b.ThemeId = th.id and th.Name in ('����������������', '�����������������', '������')
group by th.Name
having avg(b.Pages)>=400

--10. �������� ����� ���������� �������.
-- �������� 08-09-2023 14:22
select *
from books b, shops sh, sales sa
where b.id = sa.Bookid and sa.Shopid = sh.id

select  max(sa.Quantity) as profit, sh.Name
from themes th, books b, sales sa, shops sh
where sa.Shopid = sh.id
group by sh.Name
order by profit

--11. ������� �������, ������� �� ��������� �������� ������� � ������������ ��������� 
--� ������� shops. 
--���� ������� ��� ���������� � ��, �� �������� ��������� �� ������ -- �������� 08-09-2023 14:32
Create trigger Check_unique_name
on shops
for insert, update 
as
begin
	declare @a varchar(100)
	select @a = Name from inserted
	if (select count(sh.Name) from shops sh, inserted i where sh.Name = i.Name)>1
	begin
		print('����� ������� ��� ����������')
		rollback transaction 
	end
	else
		print('������ � ������� ��������� ������� ���������')
end

select * 
from shops

insert into shops
values (5,'RussiaBookShop2', 4)


--12. ������� �������� ���������, ������� ������� ����� ���������� ������.
--��� � ������� ������ ���������� � �������� ���������. -- �������� 08-09-2023 15:12
 alter procedure Books_Author_P
 @name varchar(100),
 @surname varchar(100)
as 
select a.Name, a.Surname, b.Name    
from authors a
join books b on a.id = b.AuthorId
where a.Name like @name and a.Surname like @surname
go

exec Books_Author_P '�����','������'


--13. ������� �������������, ������� ���������� ����� �������� ����������������� 
--� ���������� ����������� �������. -- �� ����� ������ ���. 09-09-2023 11:10
create view prog as



select b.*,th.*
from books b, themes th
where th.Name = '����������������' and b.ThemeId = th.id
--group by b.Name
--having max(Pages)

select * from prog 
 drop view prog

--14. ������� �������, ������� ������� ������ ���������� ������. --�������� 08-09-2023 15:26
alter function f_table (@name varchar(100))
returns table
as
return 
	(select c.Name as CName
	from  authors a 
	--join  authors a on c.id = a.id
	join countries c on a.Name like @name and c.id = a.CountryId

	group by  c.Name
	--and c.id = a.id
	)

	select * from f_table('�����')

	select * from authors a, countries c
	where c.id = a.CountryId
--�����
--����
--������ 
--�������
--���
--��
--����