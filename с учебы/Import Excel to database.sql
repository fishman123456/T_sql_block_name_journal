--https://learn.microsoft.com/ru-ru/sql/relational-databases/import-export/import-data-from-excel-to-sql?view=sql-server-ver16
-- Распределенные запросы
-- Импортируйте данные напрямую из файлов Excel в SQL Server с помощью функции Transact-SQL OPENROWSET или OPENDATASOURCE. 
-- Такая операция называется распределенный запрос.

 --Важно!

-- В базе данных SQL Azure невозможно импортировать данные непосредственно из Excel. 
-- Сначала необходимо экспортировать данные в текстовый файл (CSV).

-- Перед выполнением распределенного запроса необходимо включить параметр ad hoc distributed queries в конфигурации сервера, 
-- как показано в примере ниже. 
-- Дополнительные сведения см. в статье ad hoc distributed queries Server Configuration Option 
-- (Параметр конфигурации сервера "ad hoc distributed queries").
sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
sp_configure 'ad hoc distributed queries', 1;
RECONFIGURE;
GO
 -- В приведенном ниже примере кода данные импортируются из листа Excel Sheet1 в новую таблицу базы данных с помощью OPENROWSET.
-- SQL

-- Копировать
create database ImportFromExcel_Flotacia
USE ImportFromExcel_Flotacia;
GO
SELECT * INTO ImportFromExcel_Flotacia
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0; Database="F:\Проекты\Чегдомын Флотация и пр\SQL для сравнения данных новый старый журнал .xls"', [old_journal]);
GO

SELECT * INTO ImportFromExcel_Flotacia
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0; Database="F:\Проекты\Чегдомын Флотация и пр\SQL для сравнения данных новый старый журнал .xls"', [new_journal$]);
GO

-- Ниже приведен тот же пример с OPENDATASOURCE.
-- SQL
--Копировать

USE ImportFromExcel_Flotacia;
GO
SELECT * INTO ImportFromExcel_Flotacia
FROM OPENDATASOURCE('Microsoft.ACE.OLEDB.16.0', --Microsoft.ACE.OLEDB.12.0
    'Data Source=F:\Проекты\Чегдомын Флотация и пр\SQL для сравнения данных новый старый журнал .xls Extended Properties=Excel 16.0')...[new_journal$];
GO
-- Чтобы добавить импортированные данные в существующую таблицу, а не создавать новую, 
-- используйте синтаксис INSERT INTO ... SELECT ... FROM ... 
-- вместо синтаксиса SELECT ... INTO ... FROM ... из предыдущих примеров.
-- Для обращения к данным Excel без импорта используйте стандартный синтаксис SELECT ... FROM ....
EXEC sp_enum_oledb_providers;


USE ImportFromExcel_Flotacia;
-- запрос на совпадение
SELECT  DISTINCT * Маркировка_кабеля,
FROM old_journal ,new_journal
WHERE  Обозначение_кабеля_провода = '1091-II-Д2-К14.2' or Маркировка_кабеля = '1091-II-Д2-К14.2'
-- '1091-II-Д2-К14.2'
-- INNER JOIN

USE ImportFromExcel_Flotacia;
-- запрос на совпадение
SELECT  *
from new_journal  left join old_journal
-- left join old_journal
on   old_journal.Обозначение_кабеля_провода = '1091-II-Д2-К14.2' 
--new_journal.Маркировка_кабеля = '309-VI-K1 ' and
--and old_journal.Обозначение_кабеля_провода ='one'
--where  Обозначение_кабеля_провода =  Маркировка_кабеля 
-- '1091-II-Д2-К14.2'
-- INNER JOIN
INSERT old_journal VALUES ('one','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16')
INSERT new_journal VALUES ('one','2','3','4','5','6','7','8','9','10','11','12','13','14')

USE ImportFromExcel_Flotacia;
SELECT  Distinct*
from new_journal2,  new_journal2
-- left join old_journal
where   new_journal2.Маркировка_кабеля = '1091-II-ШУС-ФМ-S1' --and new_journal2.Маркировка_кабеля = '1126-II-S2'
or new_journal2.Маркировка_кабеля = '1091-II-ШУС-ФМ-S2'
or new_journal2.Маркировка_кабеля = '1091-II-ШУС-ФМ-S3'
or new_journal2.Маркировка_кабеля = '1091-II-ШУС-ФМ-S4'
or new_journal2.Маркировка_кабеля = '1091-II-ШУС-ФМ-S5'
or new_journal2.Маркировка_кабеля = '1091-II-ШУС-ФМ-S6'