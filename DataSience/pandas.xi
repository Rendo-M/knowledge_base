# основы pandas .
`import pandas as pd`


* DataFrame и Series .

`Series` - представляет из себя объект, похожий на одномерный массив
           (питоновский список, например), но отличительной его чертой
           является наличие ассоциированных меток, т.н. индексов, вдоль
           каждого элемента из списка. Такая особенность превращает его
           в ассоциативный массив или словарь в `Python`
           Если индекс явно не задан, то pandas автоматически создаёт 
           `RangeIndex`от `0`до`N-1`, где`N`общее количество элементов. 
           Также стоит обратить, что у`Series`есть тип хранимых
`.values() .index()` - атрибуты через которые можно получить 
                      список элементов и индексы
 Индексы можно задавать явно:
| my_series2 = pd.Series([5, 6, 7, 8, 9, 10], index=['a', 'b', 'c', 'd', 'e', 'f'])
 Индекс можно поменять "на лету", присвоив  список атрибуту`index`
 объекта`Series` Cписок с индексами по длине должен совпадать с 
 количеством элементов в`Series`
 | my_series3.index = ['A', 'B', 'C', 'D']
 Можно делать выборку по нескольким индексам 
 и осуществлять групповое присваивание:
| >>> my_series2[['a', 'b', 'f']]
|  a     5
|  b     6
|  f    10
| my_series2[['a', 'b', 'f']] = 0
| a    0
| b    0
| c    7
| d    8
| e    9
| f    0
| dtype: int64
Фильтровать Series как душе заблагорассудится, а также применять 
математические операции и многое другое:
| >>> my_series2[my_series2 > 0]
| c    7
| d    8
| e    9
| dtype: int64
| >>> my_series2[my_series2 > 0] * 2
| c    14
| d    16
| e    18
| dtype: int64
У объекта`Series`и его индекса есть атрибут`name`, задающий имя объекту
и индексу соответственно:
| >>> my_series3.name = 'numbers'
| >>> my_series3.index.name = 'letters'

`DataFrame` -  является табличной структурой данных. 
              В любой таблице всегда присутствуют строки и столбцы.
              Столбцами в объекте DataFrame выступают объекты Series,
              cтроки которых являются их непосредственными элементами.

DataFrame проще всего сконструировать на примере питоновского словаря:
| >>> df = pd.DataFrame({
| ...     'country': ['Kazakhstan', 'Russia', 'Belarus', 'Ukraine'],
| ...     'population': [17.04, 143.5, 9.5, 45.5],
| ...     'square': [2724902, 17125191, 207600, 603628]
| ... })
| >>> df
|    country  population    square
| 0  Kazakhstan       17.04   2724902
| 1      Russia      143.50  17125191
| 2     Belarus        9.50    207600
| 3     Ukraine       45.50    603628
Объект DataFrame имеет 2 индекса: по строкам и по столбцам .
Если индекс по строкам явно не задан (например, колонка по 
которой нужно их строить), то`pandas`задаёт целочисленный индекс
`RangeIndex`от`0`до`N-1`, где`N`это количество строк в таблице.
| >>> df.columns
| Index([u'country', u'population', u'square'], dtype='object')
| >>> df.index
| RangeIndex(start=0, stop=4, step=1)
Индекс по строкам можно задать разными способами .
например, при формировании самого объекта DataFrame или "на лету":
| >>> df = pd.DataFrame({
| ...     'country': ['Kazakhstan', 'Russia', 'Belarus', 'Ukraine'],
| ...     'population': [17.04, 143.5, 9.5, 45.5],
| ...     'square': [2724902, 17125191, 207600, 603628]
| ... }, index=['KZ', 'RU', 'BY', 'UA'])
| >>> df
|        country  population    square
| KZ  Kazakhstan       17.04   2724902
| RU      Russia      143.50  17125191
| BY     Belarus        9.50    207600
| UA     Ukraine       45.50    603628
| >>> df.index = ['KZ', 'RU', 'BY', 'UA']
| >>> df.index.name = 'Country Code'
| >>> df
|                  country  population    square
| Country Code                                  
| KZ            Kazakhstan       17.04   2724902
| RU                Russia      143.50  17125191
| BY               Belarus        9.50    207600
| UA               Ukraine       45.50    603628
Как видно, индексу было задано имя -|Country Code|Отмечу, что объекты 
`Series`из`DataFrame`будут иметь те же индексы, что и объект`DataFrame`
Доступ к строкам по индексу возможен несколькими способами: .
|.loc| - используется для доступа по строковой метке
|.iloc|- используется для доступа по числовому значению (начиная от 0)
| >>> df.loc['KZ']
| country       Kazakhstan
| population         17.04
| square           2724902
| Name: KZ, dtype: object

| >>> df.iloc[0]
| country       Kazakhstan
| population         17.04
| square           2724902
| Name: KZ, dtype: object
Можно делать выборку по индексу и интересующим колонкам .
| >>> df.loc[['KZ', 'RU'], 'population']
| Country Code
| KZ     17.04
| RU    143.50
| Name: population, dtype: float64
Как можно заметить,`.loc`в квадратных скобках принимает 2 аргумента:
интересующий индекс, в том числе поддерживается слайсинг и колонки.
>>> df.loc['KZ':'BY', :]
                 country  population    square
Country Code                                  
KZ            Kazakhstan       17.04   2724902
RU                Russia      143.50  17125191
BY               Belarus        9.50    207600
Фильтровать DataFrame с помощью т.н. булевых массивов:
| >>> df[df.population > 10][['country', 'square']]
|                  country    square
| Country Code                      
| KZ            Kazakhstan   2724902
| RU                Russia  17125191
| UA               Ukraine    603628
Кстати, к столбцам можно обращаться, используя атрибут или
нотацию словарей`Python`, т.е.`df.population`и`df['population']`
это одно и то же.
Сбросить индексы можно вот так:
| >>> df.reset_index()
|   Country Code     country  population    square
| 0           KZ  Kazakhstan       17.04   2724902
| 1           RU      Russia      143.50  17125191
| 2           BY     Belarus        9.50    207600
| 3           UA     Ukraine       45.50    603628
`pandas`при операциях над`DataFrame`, возвращает новый объект`DataFrame`
Добавим новый столбец, в котором население (в миллионах) поделим на 
площадь страны, получив тем самым плотность:
| df['density'] = df['population'] / df['square'] * 1000000
Не нравится новый столбец? Не проблема, удалим его:
| df.drop(['density'], axis='columns')
или даже так:
| del df['density']
Переименовывать столбцы нужно через метод`rename`
| df = df.rename(columns={'Country Code': 'country_code'})
перед тем как переименовать столбец Country Code, убедитесь, 
что с него сброшен индекс, иначе не будет никакого эффекта


* Чтение и запись данных .
    pandas поддерживает все самые популярные форматы хранения данных: .
    `csv excel sql буфер обмена html`и многое другое 
`.read_exel(<path>)` чтение из  
`.to_exel(<path>)` и запись в файл
`.read_clipboard()`
`.read_json()`
`.read_html()`
`.read_sql()` выполнить SQL запрос и на основе ответа от базы данных
              сформировать необходимый DataFrame. 
`data = pd.read_csv(<path>)`
  помещает в data табличный объект DataFrame из csv файла <path> .
`data[lst]` - отображает только столбцы с именами из списка lst.
              если нужен только 1 столбец, вместо списка достаточно
              передать строку. В первом случае возвращается объект
              |DataFrame| во втором - |Series|
              объект |Dataframe| состоит из одного или нескольких
              объектов |Series| которые соеденены друг с другом 
              единым индексом|ID|
              |delimetr| - разделитель (`sep`)
              |index_col| задать столбцы, которые будут индексами
              |skip_rows| - список столбцов, которые следует пропустить
              |header=None| - не читать заголовок
              |parse_dates=['date']| - парсит колонку `date`как дату и время. 

`.to_csv(<path>)` записывает объект в csv файл.              
                  Параметры:
                  |header=None| не записывать заголовок
                  |index=None| не записывать индексом
                  `shift+tab`в ноутбуке - показывает параметры  


Группировка и агрегирование в pandas .
Группировка данных один из самых часто используемых методов 
при анализе данных. В pandas за группировку отвечает метод: 
`.groupby()` 
Для примера используем данные о пассажирах Титаника. 
Скачать CSV файл можно тут: [https://yadi.sk/d/TfhJdE2k3EyALt]
| titanic_df = pd.read_csv('titanic.csv')

  Посчитаем выживших мужчин и женщин: .
| >>> print(titanic_df.groupby(['Sex', 'Survived'])['PassengerID'].count())
| Sex     Survived
| female  0           154
|         1           308
| male    0           709
|         1           142
| Name: PassengerID, dtype: int64
  проанализируем в разрезе класса кабины: .
| >>> print(titanic_df.groupby(['PClass', 'Survived'])['PassengerID'].count())
| PClass  Survived
| *       0             1
| 1st     0           129
|         1           193
| 2nd     0           160
|         1           119
| 3rd     0           573
|         1           138
| Name: PassengerID, dtype: int64


Сводные таблицы в pandas .
Термин "сводная таблица" хорошо известен тем, кто не по наслышке 
знаком с инструментом Microsoft Excel или любым иным, предназначенным
для обработки и анализа данных. В pandas сводные таблицы строятся
через метод 
`.pivot_table.`
задача посчитать сколько всего женщин и мужчин было в
конкретном классе корабля:
| >>> titanic_df = pd.read_csv('titanic.csv')
| >>> pvt = titanic_df.pivot_table(index=['Sex'], columns=['PClass'], values='Name', aggfunc='count')
В качестве индекса теперь у нас будет пол человека, 
колонками станут значения из PClass, 
функцией агрегирования будет count (подсчёт количества записей)
по колонке Name.
| >>> print(pvt.loc['female', ['1st', '2nd', '3rd']])
| PClass
| 1st    143.0
| 2nd    107.0
| 3rd    212.0
| Name: female, dtype: float64


Анализ временных рядов .
В pandas очень удобно анализировать временные ряды. 
В качестве показательного примера я буду использовать 
цену на акции корпорации Apple за 5 лет по дням. 
Файл с данными можно скачать тут: [https://yadi.sk/d/po_usmXT3ExwzV]
| >>> import pandas as pd
| >>> df = pd.read_csv('apple.csv', index_col='Date', parse_dates=True)
| >>> df = df.sort_index()
| >>> print(df.info())
| <class 'pandas.core.frame.DataFrame'>
| DatetimeIndex: 1258 entries, 2017-02-22 to 2012-02-23
| Data columns (total 6 columns):
| Open         1258 non-null float64
| High         1258 non-null float64
| Low          1258 non-null float64
| Close        1258 non-null float64
| Volume       1258 non-null int64
| Adj Close    1258 non-null float64
| dtypes: float64(5), int64(1)
| memory usage: 68.8 KB
формируем`DataFrame`с`DatetimeIndex` 
по колонке`Date`и сортируем новый индекс 
в правильном порядке для работы с выборками.
Если колонка имеет формат даты и времени 
отличный от|ISO8601|, то для правильного перевода
строки в нужный тип, можно использовать метод 
`pandas.to_datetime()`
Давайте теперь узнаем среднюю цену акции (mean) на закрытии (Close):
| >>> df.loc['2012-Feb', 'Close'].mean()
| 528.4820021999999
А если взять промежуток с февраля 2012 по февраль 2015 и 
посчитать среднее:
| >>> df.loc['2012-Feb':'2015-Feb', 'Close'].mean()
| 430.43968317018414
А что если нам нужно узнать среднюю цену закрытия по неделям?!
| df.resample('W')['Close'].mean()
Resampling мощный инструмент при работе с временными рядами
(time series), помогающий переформировать выборку так, 
как удобно вам. Метод resample первым аргументом принимает 
строку rule. Все доступные значения можно найти в документации.


Визуализация данных в pandas .
Для визуального анализа данных, 
`pandas`использует библиотеку`matplotlib` 
Продемонстрирую простейший способ визуализации в pandas 
на примере с акциями Apple.
Берём цену закрытия в промежутке между 2012 и 2017.

| >>> import matplotlib.pyplot as plt
| >>> new_sample_df = df.loc['2012-Feb':'2017-Feb', ['Close']]
| >>> new_sample_df.plot()
| >>> plt.show()
И видим вот такую картину: 
[https://khashtamov.com/wp-content/uploads/2017/03/apple-time-series.png]
По оси X, если не задано явно, всегда будет индекс. 
По оси Y в нашем случае цена закрытия. 
Если внимательно посмотреть, то в 2014 году цена на акцию резко упала,
это событие было связано с тем, что Apple проводила сплит 7 к 1. 
Так мало кода и уже более-менее наглядный анализ ;)









02:55 - работа с файлами (excel, json, sql, parquet) и параметрами файлов


10:00 - типы данных, ф-ии: info, astype, to_numeric, categorical


13:58 - работа с колонками и фильтрами


18:43 - исследование данных, ф-ии: loc, describe, isna, nunique, pandas_profiling (генерация полного отчёта в виде html)


22:55 - очистка данных, ф-ии: dropna, fillna