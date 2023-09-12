--11-09-2023
--electric-cabinet_2022 - шкаф
--siren - сирена сигнальная
--sensor - датчик
--remote_controller_2023 - шкаф 2 вариант
--push_button_post_2023 - кнопочный пост
--electric_motor - эл. двиг
--KTV - кабель троссовый выключатель
--KSL - концевой схода ленты
--Terminal_box - коробка клеммная- кнопочный пост

--- Создадим таблицу 

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
--- Создадим таблицу и скопируем в неё данные 11-09-2023 15:02 -- готово
select *
into New_B_T
from jk56

select *
from New_B_T
---
--найдем по условию Шкаф - Шкаф в таблице  New12
select *
from New_B_T nw
where nw.a2 like '%Шкаф%' and nw.a3 like '%Шкаф%'

--вставим имя блоков шкафы, потом надо хранимую процедуру написать 11-09-2023 16:36
UPDATE New_B_T 
   SET a14 = 'electric-cabinet_2022'
 WHERE a2 like '%Шкаф%' and a3 like '%Шкаф%'

 --вставим имя блоков сирена, потом надо хранимую процедуру написать 11-09-2023 17:04
 select *
from New_B_T nw
where nw.a3 like '%Пост сигнализации%' or nw.a3 like '%Предпусковая сигнализация%'

UPDATE New_B_T 
   SET a14 = 'siren'
 where a3 like '%Пост сигнализации%' or a3 like '%Предпусковая сигнализация%'

  --вставим имя блоков ктв, потом надо хранимую процедуру написать 11-09-2023 17:10
 select *
from New_B_T 
where a3 like '%Аварийный тросовый выключатель%' 

UPDATE New_B_T 
   SET a14 = 'KTV'
 where a3 like '%Аварийный тросовый выключатель%' 

  --вставим имя блоков ктв, потом надо хранимую процедуру написать 11-09-2023 17:15
 select *
from New_B_T 
where a3 like '%Клеммная коробка%' 

UPDATE New_B_T 
   SET a14 = 'Terminal_box'
where a3 like '%Клеммная коробка%' 

  --вставим имя кнопочный пост, потом надо хранимую процедуру написать 11-09-2023 17:15
 select *
from New_B_T 
where a3 like '%Пульт местного управления%' or a3 like '%Кнопочный пост%'

UPDATE New_B_T 
   SET a14 = 'push_button_post_2023'
where a3 like '%Пульт местного управления%' or a3 like '%Кнопочный пост%'

--содаем хранимую процедуру 19-09-2023 8:46
 create procedure prov_name
 @name1 varchar(100),
  @name2 varchar(100)
  --@nameblock varchar(100)
as 
select *
from New_B_T 
where a3 like @name1 or a3 like	@name2
go

exec prov_name ' ','%Шк%'

-- процедура на добавление
 create procedure add_bname
 @name1 varchar(100),
  @name2 varchar(100),
  @nameblock varchar(100)
as 
UPDATE New_B_T 
   SET a14 = @nameblock
where a3 like @name1 or a3 like @name2

exec prov_name '%уровнемер%',''
-- пользуемся процедурами