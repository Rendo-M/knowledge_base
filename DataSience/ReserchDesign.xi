1. Data Mining .
  Основные задачи: .
    1. Определить цель анализа данных .
    2. Определить требования к результату исследования .
        То есть результат, который хотим получить мы и заказчик
    3. Понять, какие типы данных нам нужны .
    4. Определиться с источниками и способами их получения .
    5. Выбрать методы и инструменты анализа данных .
    6. Оценить риски и условия реализации проекта .

Data Mining .
— процесс обнаружения в данных ранее неизвестных,
нетривиальных, практически полезных и доступных
интерпретации знаний, необходимых для принятия 
решений в различных сферах человеческой деятельности    

  Полученные данные представляются в виде таблиц: .
    строки - индивиды/наблюдения .
    столбцы - переменные/признаки .
    их пересечение - значение переменных для индивида .

  Целевая(зависимая) переменная или таргет - .
    переменная, по которой мы классифицируем данные. 
    Та переменная, которую мы хотим определить.
  Независимые переменные или факторы(фичи) - .
    переменные, на основании которых мы будем определять таргет.  

  Методологии (стандарты) Data-Mining .
    - способы получения данных.
    
    Для чего нужны методологии: .
      Сохранение опыта и воспроизводимость проектов .
      Упрощение процесса планирования и управления .
      Простота включения новых членов команды .
      Уменьшение зависимости от «лидеров» .

    Популярные методологии: .
    # `CRISP-DM` 
    # `SEMMA`
    # `KDD Process`


  Методология SEMMA .
   - реализована в среде SAS Datamining solutions

   |S|ample - отбор данных, т. е. создание выборки
        * подключение к источнику данных
        * выборка из генеральной совокупности
   |E|xplore - исследование отношений в данных
        * Визуальное исследование
        * Выявление ассоциаций
        * Интерактивный статистический анализ
   |M|odify - модификация данных
        * Кластерный анализ
        * Преобразование, фильтрация, замещение
   |M|odel - моделирование взаимозависимостей
        * Нейронные сети
        * Деревья решений
        * Определенные пользователем модели
        * Регрессия
   |A|ssess - оценка полученных моделей и результатов
        * Сравнение моделей
        * Вычисления на модели

  Методолгия KDD .
    Knowledge Discovery in Databases (обнаружение знаний в БД)

      - Отбор (Selection) .
        * Понять предметную область 
        * Сформулировать цели и задачи
        * Сформировать набор данных
      - Предварительная обработка (Preprocessing) .
        * Фильтрация данных (восстанавливаем пропуски, удаляем дубликаты, аномальные значения)
        * Очистка от шума
      - Преобразование (Transformation) .
        * Сокращение количества признаков
        * Определить форму представления данных
      - Data Mining .
        * Классификация
        * Регрессия
        * Кластеризация
      - Интерпритация (Interpritation/Evaluation) .
        * Оценка и интерпритация добытых знаний 
        * Применение их к принятию решений

  Методология Crisp-DM .
    Межотраслевой стандартный процесс интеллектуального анализа данных
    Цикл часто используемых подходов.

    Этапы жизненного цикла CRISP-DM .
      1. Понимание бизнеса (business understanding) .
        *   Determine Business Objectives 
            Определение бизнес-целей
        *   Assess Situation 
            Оценка текущей ситуации
        *   Determine Data Mining Goals
            Определение целей аналитики
        *   Product Project Plan
            Подготовка плана проекта
      2. Понимание(анализ) данных (data understanding) .
        *   Collect Initial Data
            Сбор данных
        *   Describe Data
            Описаниеданных
        *   Explore Data
            Изучение данных
        *   Verify Data Quality
            Проверкакачества данных      
      3. Подготовка данных (data preparation) .
        *   Select Data 
            Выборка данных
        *   Clean Data
            Очистка данных
        *   Construct Data
            Генерация данных
        *   Integrate Data
            Интеграция данных
        *   Format Data
            Форматирование данных      
      4. Моделирование (modeling) .
        *   Select Modeling Techniques
            Выбор алгоритмов
        *   Generate Test Design
            Подготовка плана тестирования
        *   Build Model
            Обучение моделей
        *   Assess Model
            Оценка качества моделей      
      5. Оценка решения (evaluation) .
        *   Evaluate Results
            Оценка результатов
        *   Review Process
            Оценка процесса
        *   Determine Next Steps
            Определение следующих шагов      
      6. Внедрение (deployment) .
        *   Plan Deployment
            Внедрение
        *   Plan Monitoring and Maintenance
            Планирование мониторинга и поддержки
        *   Produce Final Report
            Подготовка отчета
        *   Review Project
            Ревью проекта
      # 7. Контроль .
    Crisp-DM — мягкая методология: .
      не строгий переход между этапами.
      В зависимости от результата этапа принимается решение
      на какой этап переходить дальше.     
     Преимущество - внимание к бизнес целям компании.
     В других методологиях отсутствует шаги Бизнес Анализа и Внедрения 

    Основные процессы в методологиях .
      Шаг 1. Работа с заказчиком .
        * Постановка задачи
        * Определение метода решения
        В результате получим требования к данным для решения задачи
      Шаг 2. Работа с данными .
        * Поиск данных (какие источники доступны?)
        * Формируем выборку
        * Разделяем данные на три части:
            - данные для моделирования (обучающая выборка) 80%
            - данные для настраивания параметров модели(валидационные) 10%
            - данные для проверки и оценки модели (тестовые) 10%
        * Исследование данных, выявление взаимосвязей, визуализация 
        * Предварительная обработка данных:
            - Очистка данных 
      Шаг 3. Разработка аналитического решения .
        * Анализ, валидация, визуализация


Понимание бизнес-цели .
  Бизнес-цель (управленческая цель) - проблема исследования, от нее
  отталкиваямся при построении исследования. От того насколько точно 
  сформуливан бизнес цель зависит все дальнейшее исследование.

  Примеры: .
    * Повышение лояльности клиентов .
    * Рост прибыли .
    * Повышение вовлеченности клиентов .
    * Сокращение издержек .
    * Удержание сотрудников .
    * Определение конкурентов .
    * Прогнозирование износа или поломки оборудования .

  Что нужно узнать: .
    Какова организационная структура .
      Кто участвует со стороны заказчика(маркетинг, продажи и т.д.) .
      Кто принимает ключевые решения .
      Кто будет пользователем(терминология+фокус) .
    Определяем бизнес-цель  .
      Зачем вам нужно это исследование (неск раз спросить) .
      Для чего будут использованы результаты? .
      На основании ответов клиента формулируем бизес цель .
    Существуют ли какие-то решеия? .
      Что в них не устраивает? .

  Система постановки задач SMART .
    Критерии : .
        • конкретность .
        S — Specific .
        • измеримость .
        M — Measurable .
        • достижимость .
        A — Attainable .
        • актуальность .
        R — Relevant .
        • ограниченная во времени .
        T — Time-bound .


    `Понимание бизнеса является фундаментом дальнейшего анализа данных.`
    `От того, насколько точно вы поняли заказчика зависит`
    `ваше дальнейшее исследование.`
    `Для эффективного взаимодействия с бизнесом необходимо понять`
    `организационную структуру, бизнес-цель, существующие разработанные`
    `решения.`
    `Эффективная система постановки задач SMART: конкретность, измеримость,`
    `достижимость, актуальность, ограниченность во времени.`        
         


Определение цели анализа данных .
    • Как перейти от бизнес-цели к цели анализа данных? .
      Бизнес-цель -> Декомпозиция бизнес цели -> Цель анализа данных

    • Как сформулировать цель анализа данных? .
      Цель должна быть ясной и понятной. Должна быть воплощаемой в жизнь.
      Это тот результат, который должен быть получен.

      * что мы изучаем. (объект)
      * какие свойства/харктеристики объекта изучаются(предмет)
      * понимание где ищем
      * и зачем     
  Объект исследование - что мы изучаем, обычно явление или процесс .
  Предмет исследования - аспект проблемы, часть объекта, его характеристика .
  |Объект|можно изучать с разных сторон, выделяя разные|предметы исследования|
  |Предмет| выделяется из |объекта|, он близок к цели исследования или
  полностью с ней совпадает.
  
Требования к результату исследования .
  1. Почему в процессе разработки дизайна исследования необходимо
  утвердить требования к результату аналитического исследования?

  2. Какие типы взаимодействия с заказчиком и предоставления результата 
  можно выделить?
    Типы предоставления результата .
      # Предоставление информации(описание ситуации) .
      предоставляем полученну и проанализированную информацию, 
      а решения принимает сам заказчик.
      # Предоставление выводов и рекомендаций, основанных на результатах .
      Сбор информации, ее анализ и интерпритация  
      # Разработка алгоритма действий по реализации интерпритаций .
      Исследовательские+консалтинговые услуги
      # Реализация рекомендаций .
      Создание команды, которая участвует в упалавнеиии предприятием 
      и поможет менеджерам в реализации предложенного алгоритма. 

  3. Какие вопросы необходимо обсудить, когда договариваешься о формате
  предоставления результатов исследования?
    - Необходимы ли используемые в исследовании данные и в каком формате .
    - В каком формате предоставляется отчет, есть ли ограничения по объему .
    - Формат презентации .
     Кто будет присутствовать, надо ли ознакомить с презентацией заранее,
     ограничение по времени и т.д.
    - Нужен интерактивный отчет в формате дашборд? .
    - Порядок действий - сначала отчет, потом презентация? .

Типы данных .
  1. Какие основные требования к данным мы должны сформулировать
  в начале проекта?
    - Формат .
    - Контент .
    - Источники .
    - Временной отрезок .

  2. Что такое данные и чем они отличаются от информации?
    Набор фиксированных сведений .
    Информация - обработанные данные .

  3. Какие бывают типы данных?
    структурированные .
    таблицы, БЛ
    неструктурированные .
    разнообразный формат. 
    полуструктурированные .
    (слабострутурирированные) например JSON
    От типа данных зависят|форматы хранения, модели данных,| 
   |инструменты и технологии|
  Чем отличаются типы данных: .
    Форматы данных .
    Модели данных: предопределенные и гибкие  .
    Инструменты и технологии обработки данных .


  Большие данные: .
    - разнообразие .
    - скорость роста .
    - объем .



  Форматы данных .

    1 CSV: .
    текстовый формат, где данные в строках разделены|;| 
    `SCSV`-|;| `CSV`-|,| `TSV`-|TAB|
    плюсы - универсальность и Простота
    минус - не универсальны символ
    2 XLS: .
    файлы таблиц MS Exel -`xls`(до 2003г) или`xlsx`- с версии 2007г
    3 TXT .
    текстовые файлы. нет разделителей.
    4 JSON .
      - набор пар - ключ:значение
      - упорядоченный набор значений
      В качестве значений возможны .
        запись .
         — неупорядоченное множество пар «ключ : значение»,
          заключённое в фигурные скобки «{ }»
         — массив (одномерный) — это упорядоченное множество значений.
          Заключается в квадратные скобки «[ ]»
         — число (целое или вещественное)
         — строка — это упорядоченное множество из нуля или более
         символов юникода, заключённое в двойные кавычки

    5 XML: .
    • Расширяемый язык разметки. 
    • для хранения и передачи данных
    • XML — язык разметки, в котором существуют теги для определения
      элементов, что затрудняет его чтение
    • JSON — более читабельный текстовый формат данных

Способы получения и источники данных .
  Классификация данных по источникам: .
    • Собственные — данные, которые у нас уже есть .
    • Сторонние — данные, которые мы можем взять из других источников .
    • «Потенциальные» — необходимо организовать сбор этих данных .

  Способы получения данных: .
    • Сбор | получение первичной исходной информации .
    • Получение данных из вторичных (сторонних) источников .
      Дата-брокеры
    • Получение данных с использованием API .
    • Парсинг — автоматизированный сбор информации с сайта, .
    ее анализ, преобразование и выдача в структурированном виде .

  Популярные источники данных .
    • Социальные медиа .
    • Интернет-СМИ .
    • Всевозможные базы данных (реестр госзакупок, госстатистика) .
    • Википедия .
    • Контент сайтов .
    • Поисковые запросы (Google, Yandex, …) .
    • Собственные данные организаций .
    • Открытые данные .

  Открытые данные (англ. open data) — .
    концепция о том, что определенные данные должны быть свободно
    доступны для машиночитаемого использования и дальнейшей 
    републикации без ограничений авторского права, патентов и
    других механизмов контроля

  При использовании открытых данных пользователь обязан: .
    • использовать открытые данные только в законных целях
    • не искажать открытые данные при их использовании
    • сохранять ссылку на источник информации при использовании
      открытых данных  

  Большие пользовательские данные .
    Данные, собираемые в сети различными сервисами, устройствами,
    приложениями о поведении пользователей.

  Как найти целевую аудиторию в социальной сети? .
    Найти сообщества:
    * Составить список маркерных слов — проанализировать источники по
      интересующей теме 
    * Поиск сообществ по ключевым словам (маркерным словам)
    * В сообществах мы сможем понять контент и найти интересующую нас
      аудиторию — подписчиков сообщества
    * Далее проверка релевантности источников — убираем мусорные

Методы и инструменты анализа данных .
  Описательные статистики .
    Для количественного описания данных с помощью основных
    статистических показателей:
      • графические методы (визуализация) .
      • меры центральной тенденции .
      • меры изменчивости .

  Статистические критерии сравнения групп .
    Для сравнения значений статических показателей между двумя
    и более группами    

  Корреляционный анализ .
    Позволяет измерить взаимосвязь между признаками  

  Регрессионный анализ .
    С помощью регрессионного анализа можно построить математическую
    модель, которая может предсказать значение целевой переменной
    (таргета) на основании других переменных (факторов)  

  Классификация .
    Идея метода — разделение объектов на несколько заранее
    заданных групп по характерным признакам  

  Кластеризация .
    Пытаемся обнаружить существующие в данных группы (кластеры).
    Основная идея — каждый кластер должен состоять из схожих
    объектов, а объекты разных кластеров должны существенно отличаться

  Социально-сетевой анализ .
    Изучение социальных отношений 

Инструменты для анализа данных .
  Без использования программирования .
    • MS Excel
    • SPSS Statistics
    • Tableau
    • Yandex DataLens
    • визуальные конструкторы:
      платформа Sber Data Platform, Orange, Knime

  С использованием программирования .
    Скриптовые языки программирования: .
      • Python (широкий спектр библиотек) .
      • R (специализируется на статистической обработке данных) .