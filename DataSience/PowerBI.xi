* Подключение к googledoc .
    | https://docs.google.com/spreadsheets/d/1OObWrvhvYo5_PsLNpYN3ngbgXCMqc112TBvVsPGv9iY/edit?gid=238968913#gid=238968913
    часть`edit?gid=238968913#gid=238968913`
    заменить на `export?format=xlsx`  
    | https://docs.google.com/spreadsheets/d/1OObWrvhvYo5_PsLNpYN3ngbgXCMqc112TBvVsPGv9iY/export?format=xlsx
    после этого данные будут импортированы в виде эксель документа     

    Или:
    1. Создать пустой запрос .
    2. Код запроса: .
| Excel.Workbook(
|                Web.Contents(
|                    "https://docs.google.com/spreadsheets/d/your_ID_googledoc/export?format=xlsx"), 
|                    null, true)
|                    {[Item="Name of list"]}
|                    [Data]
    Импортируем лист|Name of list| из файла с googledisk


* Посчитать столбец 'Sales' с нарастающим остатком в порядке возрастания даты в столбце 'Date' .
Cumulative Sales = CALCULATE(SUMX('Table', 'Table'[Sales]), FILTER(ALL('Table'[Date]), 'Table'[Date] <= MAX('Table'[Date])))


* Создаем таблицу-календарь .
    | Календарь = ADDCOLUMNS(
    |     CALENDAR(
    |         MINX('TableWithDates',[date]), 
    |         UTCTODAY()), 
    |     "YEAR", YEAR([Date]),
    |     "QUARTER NUM", QUARTER([Date]),
    |     "MONTH NUM", MONTH([Date]),
    |     "WEEK NUM", WEEKNUM([Date]),
    |     "WEEK DAY", WEEKDAY([Date]),
    |     "DAY", DAY([Date]),
    |     "MONTH", FORMAT([Date], "Mmmm"),
    |     "WEEK", FORMAT([Date], "dddd"),
    |     "QUATER", "Кв"&QUARTER([Date]),
    |     "YEAR MONTH", YEAR([Date]) & " " & FORMAT([Date], "Mmmm")      
    | )    
    начало - минимальная дата в таблице|'TableWithDates'|
    конец - текущая дата
* И таблицу времени .
|   let
|    Источник = List.Times(#time(0,0,0), Duration.TotalSeconds(Duration.From(#time(23,59,59)-#time(0,0,0)))+1, #duration(0,0,0,1)),
|       #"Преобразовано в таблицу" = Table.FromList(Источник, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
|       #"Переименованные столбцы" = Table.RenameColumns(#"Преобразовано в таблицу",{{"Column1", "Time"}}),
|       #"Вставлено: часы" = Table.AddColumn(#"Переименованные столбцы", "Час", each Time.Hour([Time]), Int64.Type),
|       #"Вставлено: минуты" = Table.AddColumn(#"Вставлено: часы", "Минута", each Time.Minute([Time]), Int64.Type),
|       #"Измененный тип" = Table.TransformColumnTypes(#"Вставлено: минуты",{{"Time", type time}}),
|       #"Условный столбец добавлен" = Table.AddColumn(#"Измененный тип", "Время суток", each if [Час] < 6 then "Ночь" else if [Час] < 11 then "Утро" else if [Час] < 18 then "День" else "Вечер"),
|       #"Условный столбец добавлен1" = Table.AddColumn(#"Условный столбец добавлен", "Порядок времени суток", each if [Время суток] = "Утро" then 2 else if [Время суток] = "День" then 3 else if [Время суток] = "Вечер" then 4 else if [Время суток] = "Ночь" then 1 else null),
|       #"Измененный тип1" = Table.TransformColumnTypes(#"Условный столбец добавлен1",{{"Порядок времени суток", Int64.Type}, {"Время суток", type text}})
|   in
|       #"Измененный тип1"


