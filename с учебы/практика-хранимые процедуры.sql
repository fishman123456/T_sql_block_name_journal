-- как делать backup database
-- 06-09-2023
select sd.name, sd.recovery_model_desc
from sys.databases sd;
 
alter database MusicCollection2211
set recovery full;
 
backup database MusicCollection2211
to disk = 'D:\DBBackup\MusicCollection2211bcp.bak';
 
exec sp_addumpdevice 'disk', 'dbbcp', 'D:\DBBackup\Acadbcp123.bak';
 
backup database Academy112233
to dbbcp;
 
exec sp_dropdevice 'dbbcp', 'delfile'
 
backup log Academy112233
to disk = 'D:\DBBackup\Acadbcp_log1.trn';
 
restore database MusicCollection2211
from disk = 'D:\DBBackup\MusicCollection2211bcp.bak'

 --   2. Хранимая процедура показывает полную информацию о всех музыкальных дисках конкретного издателя. 
 --Название издателя передаётся в качестве параметр
 use MCTEST1

 alter procedure sp_disc_p
 @namepab varchar(100)
as 
select p.Name, d.name as dname  
from Publishers p
join Disc d on d.publisher = p.id 
where p.name like @namepab
go

exec sp_disc_p '%a%'

--[0:05] Кондратенко Юрий Дмитриевич
 --   3. Хранимая процедура показывает название самого популярного стиля 
 --Популярность стиля определяется по количеству дисков в коллекции
 alter procedure sp_stil_p
as 
select s.name, count(*) 
from Styles s
join Disc d on d.publisher = s.id
group by s.name
having count(*)=2

exec sp_stil_p
--------------------------------------
create procedure sp_stil_p
as 
select s.name
from Styles s
join Disc d on d.publisher = s.id
group by s.name
having count(*) = (
select max(cnt) 
from (
select s.name, count(*) as cnt  
from Styles s
join Disc d on d.publisher = s.id
group by s.name) t
)
 
exec sp_stil_p
-------------------------------------------
--5. Хранимая процедура отображает информацию о диске конкретного стиля с 
--наибольшим количеством песен. Название стиля передаётся в качестве параметра, 
--если передано слово all, анализ идёт по всем стилям

create procedure sp_max_stil_param
as 

select st.name, count(*) as count_stil
from Sing sg
join Disc d on d.singer = sg.disc
join Styles st on st.id = sg.style
group by st.name
having count(*) = (
select max(cnt)
from(
select st.name, count(*) as cnt
from Sing sg
join Disc d on d.singer = sg.disc
join Styles st on st.id = sg.style
group by st.name
)
)
------------------------
create procedure np
@stylename varchar(100)
as
if @stylename <> 'all'
begin
    select st.name, d.Name   
    from Sing sg
    join Disc d on d.singer = sg.disc
    join Styles st on st.id = sg.style
    where st.name like @stylename
    group by st.name, d.Name
    having count(*) = (
    select max(count_stil) from 
    (
    select st.name, d.Name as diskname, count(*) as count_stil
    from Sing sg
    join Disc d on d.singer = sg.disc
    join Styles st on st.id = sg.style
    where st.name like @stylename
    group by st.name, d.Name
    ) t
    )
end
else
begin
        select st.name, d.Name   
        from Sing sg
        join Disc d on d.singer = sg.disc
        join Styles st on st.id = sg.style 
        group by st.name, d.Name
        having count(*) = (
        select max(count_stil) from 
        (
        select st.name, d.Name as diskname, count(*) as count_stil
        from Sing sg
        join Disc d on d.singer = sg.disc
        join Styles st on st.id = sg.style
        group by st.name, d.Name
        ) t
        )
    end
exec np 'all'