use MCTEST1

--Задание 2. К базе данных «Музыкальная коллекция» из
--практического задания модуля «Работа с таблицами и пред-
--ставлениями в MS SQL Server» создайте следующие триггеры:

--1. Триггер не позволяющий добавить уже существующий
-- в коллекции альбом.
alter trigger Check_unique_name
on Disc
for insert, update 
as
begin
	declare @a varchar(100)
	select @a = Name from inserted
	if (select count(d.Name) from Disc d, inserted i where d.Name = i.Name)>1
	begin
		print('Такой диск уже существует')
		rollback transaction 
	end
	else
		print('Данные в таблицу Disc успешно добавлены')
end

select * 
from Disc

insert into Disc
values (22,'Mr.M', 6, '1968-09-07', 5, 9)
 --------------------------------------------- работает 07-09-2023 14:56

--2. Триггер не позволяющий удалять диски группы The Beatles.
create trigger Dell_The_Beatles
on Disc
for deleted
as
begin
	declare @a varchar(100)
	select @a = Name from deleted
	if (select (d.Name) from Disc d, deleted i where d.Name = i.Name) like 'The Beatles'
	begin
		print('Диски группы The Beatles невозможно удалить')
		rollback transaction 
	end
	else
		print('Диски успешно удалены')
end
---------------------------------------------- не работает 15:35
--3. При удалении диска триггер переносит информацию об
--удаленном диске в таблицу «Архив».

--  Создаем таблицу  Dell_Disk
create table Dell_Disk(
	id int identity (1,1) not null primary key,
	Name_d nvarchar(100) not null check(Name_d<>'') unique,
	Singers_d int not null,
	DatePublic_d date not null,
	Style_d int not null,
	Publisher_d int not null,
	)
-- Пишем триггер на удаление
CREATE TRIGGER Disk_DELETE
ON Dell_Disk d 
AFTER DELETE
AS
INSERT INTO Dell_Disk (id)
SELECT id, name_d, Si
FROM Disc
---------------------------------------------- 

--4. Триггер не позволяющий добавлять в коллекцию диски --- работает 16:29
--музыкального стиля «Dark Power Pop».

alter trigger Check_Disk_Styles_Dark_Power_Pop
on Disc
for insert, update 
as
begin
	declare @a varchar(100)
	select @a = style from inserted
	if (select count(d.Name) from Disc d, inserted i where d.style = i.style)=1
	begin
		print('Не возможно добавить диск со стилем рок')
		rollback transaction 
	end
	else
		print('Добавлен диск со стилем рок')
end

select * 
from Disc

insert into Disc
values (22,'Сектор газа', 6, '1968-09-07', 2, 9)
-------------------------------------------------------