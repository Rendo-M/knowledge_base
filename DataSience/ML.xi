Аналитик/Дата Сайтист .
  - вручную обрабатывает информацию, выдвигает гипотезы и 
  подтверждает или опровергает их анализируя данные.
  - работает с big data пытается выявить скрытые закономерности в 
  данных, используя математические модели.

Машинное обучение - .
    множество математических, статистических  и вычислительных методов 
    для разработки алгоритмов.
    полученные алгоритмы способны решить задачу не прямым способом, а 
    на основе поиска закономерностей в разнообразных входных данных.

    Например .
        Стоимость дома зависит от площади, расположения, состояния и 
        еще очень большого количества параметров, проанализировать 
        которые в ручную иногда практически невозможно.

Типы машинного обучения: .
    С учителем .
    - есть правильные ответы и мы показываем их 
    алгоритму в момент обучения.    
    Без учителя .
    - правильных ответов нет, есть только характеристики(приме с домом)
    и задача алгоритма разделить дома на группы (элит, эконом)


`Регрессия`-  уменьшение размеронсти и выявление закономерностей,     
— предсказание |переменной| по известным данным. 
На выходе выдается какое-то числою (стоимость дома, ожидаемы доход,
ожидаемое количество новых пользователей, средний чек)

`Классификация` - подразумевает наличие заранее заданных классов
(категорий) и модель пытается спрогнозировать этот класс.
(яблоки\апельсины, мужчины\женщины, кошки\собаки)



`Корреляционный анализ` - выявление зависимости одних переменных от других
`Дисперсионный анализ данных`
`Вероятностно-статистические методы`

ML methods: .
`Линейная регрессия`
[https://habr.com/ru/company/ods/blog/323890/] 
`Деревья решений`
`KNN: к-ближайших соседей`
[https://habr.com/ru/company/ods/blog/322534/]
`Метод опорных векторов (SVM)`
`Беггинг и случайный лес(Random forest)`
[https://habr.com/ru/company/ods/blog/324402/]
`Бустинг, градиентный бустинг, AdNoost`
[https://neurohive.io/ru/osnovy-data-science/gradientyj-busting/]
[https://alexanderdyakonov.files.wordpress.com/2017/06/book_boosting_pdf.pdf]
`Нейронные сети`

0 Проверка адекватности данных .
Нельзя пользоваться данными, которые будут недоступны при
предсказании (prediction). Например налог при предсказании цены.

1. Работа с пропусками .
 функция из пандас
  fillna() заполнять пропуски можно 
  |модой| - самым часто встречающимся значением
  [https://towardsdatascience.com/6-different-ways-to-compensate-for-missing-values-data-imputation-with-examples-6022d9ca0779]

2. Работа с категориальными данными .
 - признаки, стостоящие из текста называются|категориальными|
 Один из способов - |label encouder| - каждому текстовому значению 
 ставится в соответствие какое то число. 
 [https://towardsdatascience.com/categorical-encoding-using-label-encoding-and-one-hot-encoder-911ef77fb5bd]

3. Разделить датасет на 2 части - .
    таргеты, Y - то что прогнозируем
    фичи, Х - на основании чего прогнозируем
    20% оставляем на валидацию. Чтобы проверить качество модели.

4. Обучение модели .
   


Задачи ML .
  # Классификация .
  # Кластеризация .
  # Идентификация .
  # Извлечение знаний .
  # Генеративное моделирование .

Применения ML .
  # Машинное зрение (CV) .
  # Распознавание речи .
  # Обработка естественного языка .
  # Предсказательная аналитика .
  # Системы поддержки принятия решений .

АБ тестирование .
2 группы, каждой из которых показывают разные версии напрмер сайта,
и последующее сравнение их действий.
Подбор групп важен.
Базовая гипотеза - что нет разницы. 

Визуализация .
  * Столбчатая диаграмма .
  * Линейная диаграмма .
  * Гистограмма с несколькими осями .
    некоторая смесь линейно и столбчатой диаграмм.
  * Гистограмма .
    Нет расстояний между столбцами, смена мест столбцов 
    ведет к наружению логики.  
  * Круговые диаграммы .
    Удобны для представления частей чего-то целого
  * Пузырьковая диаграмма .
    Визуализация распределения и взаимодействий
  * Стрим-график (график потока) .
    Удобны для обнаружения общих тенденций и паттернов 
    за длительный период по широкому ряду категорий. 
  * Географические диаграммы (Map charts) .
    Для визуализации м анализа геграфической информации   
  
Метрики и дашборды .
  `Метрика` - качественный или количественный показатель,
  который отражает ту или иную характеристику
  (уровень успешности продукта).
  Метрика - просто число, чтобы от нее была польза, ее надо 
  анализировать в динамике + что было с другими показателями 
  и в чем причина.
  `Дашборд` - документ с лаконично представленными статистическими
  данными, отчетами, чаще всего с элементами инфографики.
  Хороший дашборд позволяет удобно отслеживать метрики.


  ########

 |ДАННЫЕ + ПРИЗНАКИ + АЛГОРИТМ|    
