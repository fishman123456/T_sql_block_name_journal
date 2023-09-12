-- 1. ���������������� �������  ���������� ��� ����� 
--��������� ����. ���� ���������� � �������� ���������

create function disk_year(@a int)
returns table
as
return(
select d.name from Disc d
	where datepart (YEAR, DatePublic) = @a
	)
	select* from disk_year(2001)

-- 3. ���������������� ������� ����������  ���������� � ����
-- ������ � ���� �������� ����������� �������� �����
-- ����� ���������� � �������� ���������
create function song_l (@words varchar(30))
returns table
as
return(
select * from Sing s
	where name like '%' + @words +'%'
	)
	select* from song_l('All')
-- 4. ���������������� ������� ���������� ���������� �������� 
-- � ������ hard rock � heavy metal

alter function count_albom()
returns table
as
return
(select count(*)  cnt
from Disc d
join Styles s on d.style = s.id 
where s.name like '����-�����' --or s.name like '���'
)

select* from count_albom()

-- 5. ���������������� ������� ���������� ���������� � ������� ������������ ����� ��������� �����������.
-- �������� ����������� ���������� � �������� ���������
Create Function line2 (@SName varchar(40))
returns table
as
    return select Singers.name , Avg(Sing.length) as '������� �����������������' 
    from sing , Singers 
    where Sing.singer = Singers.id and  Singers.name like @SName group by Singers.name

	select * from line2('%g%')

-- 6. ���������������� ������� ���������� ���������� � ����� ������ � ����� �������� �����
Create Function Line()
returns table
as
    Return 
    SELECT * FROM Sing WHERE Sing.length = (SELECT Max(Sing.length) FROM sing)
    UNION
    SELECT * FROM Sing WHERE Sing.length = (SELECT Min(Sing.length) FROM sing)


	select * from Line()
-- 2 � 7 ���� ������