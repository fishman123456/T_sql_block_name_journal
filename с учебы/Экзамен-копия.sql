--Экзамен 08-09-2023- База данных в папке Экзамен.
--Необходимо написать следующие запросы к базе данных «Книжный магазин» (BookShop):

--1. Показать все книги, количество страниц в которых больше 
--500, но меньше 650. - готово 08-09-2023 00:50
select *
from books b
where b.Pages >= 500 and b.Pages <= 650

--2. Показать все книги, в которых первая буква названия либо
--«А», либо «З». - готово 08-09-2023 00:55
select *
from books b
where b.Name like 'А%' or b.Name like 'З%'

--3. Показать все книги жанра «Детектив», количество проданных
--книг более 30 экземпляров. -  готово 08-09-2023 01:15
select b.Name
from books b, sales s, themes th
where th.id = b.ThemeId and s.Bookid = b.id and 
th.Name like'Детектив' and s.Quantity >= 30

--4. Показать все книги, в названии которых есть слово «Microsoft», но нет слова «Windows».
--  готово 08-09-2023 11:19
select*
from books b
where b.Name  like '%Microsoft%' 
and b.Name not like '%Windows%' 

--08-09-2023 01:18 - всем спать
--6. Показать все книги, название которых состоит из 4 слов. --  готово 08-09-2023 11:28

select*
from books b
where b.Name  like '% % % %' 


--7. Показать информацию о продажах в следующем виде:
--7.1	Название книги, но, чтобы оно не содержало букву «А».
--7.2	Тематика, но, чтобы не «Программирование».
--7.3	Автор, но, чтобы не «Герберт Шилдт».
--7.4	Цена, но, чтобы в диапазоне от 10 до 20 гривен.
--7.5	Количество продаж, но не менее 8 книг.
--7.6	Название магазина, который продал книгу, но он не должен быть в Украине или России.

--7.1
select *
from books b
where  b.Name not like '%А%'
--7.2
select *
from themes th
where  th.Name not like 'Программирование'
--7.3
select *
from  authors a
where  a.Name not like 'Герберт' and a.Surname not like 'Шилдт'
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
		c.Name not like 'Украина' and
		c.Name not like 'Россия'

--8. Показать среднее количество страниц по каждой тематике,
--которое не превышает 400. -- работает 08-09-2023 13:29
select *
from books b, themes th
where b.ThemeId = th.id

select  avg(b.Pages), th.Name
from books b, themes th
where b.ThemeId = th.id
group by th.Name
having avg(b.Pages)<=400

--9. Показать сумму страниц по каждой тематике, учитывая только книги 
--с количеством страниц более 400,
--и чтобы тематики были «Программирование», «Администрирование» и «Дизайн». 
-- работает 08-09-2023 13:58
select *
from books b, themes th
where b.ThemeId = th.id

select  avg(b.Pages), th.Name
from books b, themes th
where b.ThemeId = th.id and th.Name in ('Программирование', 'Администрирование', 'Дизайн')
group by th.Name
having avg(b.Pages)>=400

--10. Показать самый прибыльный магазин.
-- работает 08-09-2023 14:22
select *
from books b, shops sh, sales sa
where b.id = sa.Bookid and sa.Shopid = sh.id

select  max(sa.Quantity) as profit, sh.Name
from themes th, books b, sales sa, shops sh
where sa.Shopid = sh.id
group by sh.Name
order by profit

--11. Создать триггер, который не позволяет вставить магазин с существующим названием 
--в таблицу shops. 
--Если магазин уже существует в бд, то выводить сообщение об ошибке -- работает 08-09-2023 14:32
Create trigger Check_unique_name
on shops
for insert, update 
as
begin
	declare @a varchar(100)
	select @a = Name from inserted
	if (select count(sh.Name) from shops sh, inserted i where sh.Name = i.Name)>1
	begin
		print('Такой магазин уже существует')
		rollback transaction 
	end
	else
		print('Данные в таблицу магазинов успешно добавлены')
end

select * 
from shops

insert into shops
values (5,'RussiaBookShop2', 4)


--12. Создать хранимую процедуру, которая выводит книги выбранного автора.
--Имя и фамилия автора передается в качестве параметра. -- работает 08-09-2023 15:12
 alter procedure Books_Author_P
 @name varchar(100),
 @surname varchar(100)
as 
select a.Name, a.Surname, b.Name    
from authors a
join books b on a.id = b.AuthorId
where a.Name like @name and a.Surname like @surname
go

exec Books_Author_P 'Агата','Кристи'


--13. Создать представление, которое показывает книгу тематики «Программирование» 
--с наибольшим количеством страниц. -- не пойму дальше как. 09-09-2023 11:10
create view prog as



select b.*,th.*
from books b, themes th
where th.Name = 'Программирование' and b.ThemeId = th.id
--group by b.Name
--having max(Pages)

select * from prog 
 drop view prog

--14. Создать функцию, которая выводит страну выбранного автора. --работает 08-09-2023 15:26
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

	select * from f_table('Агата')

	select * from authors a, countries c
	where c.id = a.CountryId
--Агата
--Карл
--Михаил 
--Герберт
--Лев
--Эд
--Энди