Регулярные выражения: .
    * Любая строка (в которой нет символов`.^$*+?{}[]\|())`сама по себе 
      является регулярным выражением.
    * Регулярные выражения являются регистрозависимыми
    * спецсимволы`.^$*+?{}[]\|()`, которые в регулярках являются 
      управляющими конструкциями. 
      Для написания их просто как символов требуется их экранировать,
      для чего нужно поставить перед ними знак`\`     
    * Регулярные выражения используются для: 
      - проверка фрагмента текста на соответствие шаблону .
      - поиск подстрок по указанному шаблону в тексте .
      - поиск и замена регулярного выражения на заданную строку .
      - разбиение строки по найденным шаблонам .

Шаблоны, соответствующие одному символу: .
   * `.`	Один любой символ, кроме новой строки \n
   * `\d`	Любая цифра
   * `\D`	Любой символ, кроме цифры
   * `\s`	Любой пробельный символ (пробел, табуляция, конец строки и т.п.)
   * `\S`	Любой непробельный символ
   * `\w`	Любая буква (то, что может быть частью слова), а также цифры и _
   * `\W`	Любая не-буква, не-цифра и не подчёркивание	
   * `[..]`	"Символьный класс" - Один из символов в скобках, а также любой символ
           из диапазона. 
   * `\d`≈`[0-9]``\D`≈`[^0-9]``\w`≈`[0-9a-zA-Zа-яА-ЯёЁ]`,`\s`≈`[ \f\n\r\t\v]`
            Буква “ё” не включается в общий диапазон букв!
            Вообще говоря, в \d включается всё, что в юникоде помечено как «цифра», 
            а в \w — как буква. 
   * `[abc-]``[-1]`	если нужен минус, его нужно указать последним или первым		
   * `[*[(+\\\]\t]`	внутри скобок нужно экранировать только ] и \		
   * `\b`	Начало или конец слова (слева пусто или не-буква, справа буква и наоборот).
          В отличие от предыдущих соответствует позиции, а не символу
   * `\B`	Не граница слова: либо и слева, и справа буквы, либо и слева, и справа НЕ буквы	

Квантификаторы (указание количества повторений) .
    * `n}`	    Ровно`n`повторений
    * `{m,n}`	От`m`до`n`повторений включительно
    * `{m,}`{	Не менее`m`повторений
    * `{,n}`	Не более`n`повторений
    * `?`	    Ноль или одно вхождение, синоним`{0,1}`
    * `*`  	    Ноль или более, синоним`{0,}`
    * `+`	    Одно или более, синоним `{1,}`	
    * `*?``+?``??` 	По умолчанию квантификаторы жадные(мажорные) — 
      `{m,n}?`      захватывают максимально возможное число символов. 
      `{,n}?`       Добавление`?`делает их ленивыми(минорными), они 
      `{m,}?`       захватывают минимально возможное число символов

Функции .
      # re.search(pattern, string) .
      Найти в строке|string|первую строчку, подходящую под шаблон|pattern|
      # re.fullmatch(pattern, string) .
      Проверить, подходит ли строка|string|под шаблон|pattern|
      # re.split(pattern, string, maxsplit=0) .
      Аналог|str.split()|только разделение происходит по подстрокам, 
      подходящим под шаблон|pattern|
      # re.findall(pattern, string) .
      Найти в строке|string|все непересекающиеся шаблоны|pattern|
      # re.finditer(pattern, string) .
      Итератор всем непересекающимся шаблонам|pattern|в строке|string|
      (выдаются |match|-объекты);
      # re.sub(pattern, repl, string, count=0) .
      Заменить в строке|string|все непересекающиеся шаблоны|pattern| на |repl|
      Вместо строки, на которую нужно заменить вхождение, в|re.sub| и |re.subn| 
      можно передать функцию, которая будет генерировать ту самую строку. 
      В функцию передаётся|Match|объект, и теперь мы можем получать доступ к группам, 
      а также как-либо изменять и обрабатывать эти данные.
      Можно использовать как и лямбда-функции, так и обычные
      # re.subn(pattern, replace, string, count=0, flags=0) .
      выполняет ту же операцию, что и функция|sub|, но возвращает кортеж.                                            
      # re.escape(pattern) .
      экранирует специальные символы в pattern. Полезно, если нужно использовать
      полученную строку как регулярное выражение, но в ней могут содержаться 
      спецсимволы.
      re.compile(pattern, flags) .
      метод, который позволяет вручную компилировать регулярные выражения.
      |pattern| - регулярное выражение
      |flags| - флаги, пройдём позже
      Каждый раз, когда вы используете регулярное выражение в каком-либо методе,
      оно автоматически компилируется. С помощью метода|re.compile|можно вручную
      скомпилировать регулярное выражение, и уже использовать его по назначению.
      | regex = re.compile(r'[a-zA-Z]{1,}')
      | print(regex)  # re.compile('[a-zA-Z]{1,}')
      | print(regex.findall('Some words.'))  # ['Some', 'words']
      | print(regex.sub('deleted', 'Some words again.'))  # deleted deleted deleted.
      re.purge() .
      очистка кеша (обычно очищается автоматически)
      
С помощью re.compile можно:

Флаги .
    * re.ASCII /re.A / (?a) .
      По умолчанию`\w, \W, \b, \B, \d, \D, \s, \S`соответствуют все юникодные символы
      с соответствующим качеством. Например,`\d` соответствуют не только арабские цифры,
      но и вот такие: `٠١٢٣٤٥٦٧٨٩`|re.ASCII|ускоряет работу, если все соответствия 
      лежат внутри |ASCII|
    * re.IGNORECASE / re.I / (?i) .
      Не различать заглавные и маленькие буквы. Работает медленнее, но иногда удобно
    * re.MULTILINE .
      Специальные символы`^`и`$`соответствуют началу и концу каждой строки
    * re.INICODE / re.U / (?u) .
    Шаблоны \w, \W, \b, \B, \d, \D, \s и \S будут выполнять соответствие по UNICODE.
    Существует для обратной совместимости с re.ASCII, но он является излишеством, 
    так как по умолчанию Python выполняет сопоставления в UNICODE.  
    * re.LOCALE / re.L / (?l) .
    Сопоставляет \w, \W, \b, \B  без учета регистра, зависимо от текущей локали. 
    Использование этого флага не рекомендуется, так как механизм локализации очень ненадежен 
    и он работает только с 8-битными локалями.
    * re.DOTALL /re.S / (?s) .
      По умолчанию символ`\n`конца строки не подходит под точку. С этим флагом точка 
      — вообще любой символ
    * re.VERBOSE / re.X / (?x) .
    Позволяет писать более читабельные регулярные выражения, отделять части регулярного выражения 
    пробелами и переносами строк, а также писать комментарии после символа #.
    * re.DEBUG / - / - .
    Показывает отладочную информацию о скомпилированном выражении. Используется только с|re.compile()|

    Чтобы использовать флаги, достаточно их передать как именованный аргумент в нужный метод
    Если нужно использовать несколько флагов сразу - нужно сложить их или написать между ними символ`|`
    У флагов сущестуют сокращённые версии. Они позволяют сократить код в размере.
    Также флаги можно указать в самом регулярном выражении. Достаточно просто поставить встроенный флаг
    перед регулярным выражением 
    | r"(?i)....
    | re.findall('123', '123', flags=re.MULTILINE | re.IGNORECASE | re.DOTALL)  # 3 флага
    | test2 = re.findall('123', '123', flags=re.M + re.I + re.S) 


  Перечисления (операция «ИЛИ») .
    Чтобы проверить, удовлетворяет ли строка хотя бы одному из шаблонов, 
    можно воспользоваться аналогом оператора`or`, который записывается 
    с помощью символа`|`Так, некоторая строка подходит к регулярному 
    выражению`A|B`тогда и только тогда, когда она подходит хотя бы к одному 
    из регулярных выражений `A`или`B`Например, отдельные овощи в тексте можно
    искать при помощи шаблона`морковк|св[её]кл|картошк|редиск.`

Группировка: .
  Скобочные группы (группировка плюс квантификаторы) .
    `(?:)`  скобочное выражение, которое группирует регулярное выражение, но 
            не захватывает его как скобочная группа. Так и называется -
            `Non-capturing group`т.е. группа без захвата. Другими словами количество
            групп заранее не зафиксировано, в синтаксисе регулярных выражений есть 
            группировка:`(?:...)`если`REGEXP`— шаблон, то`(?:REGEXP)`— эквивалентный 
            ему шаблон. Разница только в том, что теперь к`(?:REGEXP)`можно применять
            квантификаторы, указывая, сколько именно раз должна повториться группа. 

  Скобки плюс перечисления .
    Также скобки `(?:...)` позволяют локализовать часть шаблона, внутри которого
    происходит перечисление. Например, шаблон `(?:он|тот) (?:шёл|плыл)`соответствует
    каждой из строк `«он шёл»`,`«он плыл»`,`«тот шёл»`,`«тот плыл»`, и является 
    синонимом `он шёл|он плыл|тот шёл|тот плыл`                   
  

  Именованные группы .
    `(?P<name>regex)`	Обычная скобочная группа, но вместе с номером ей 
                      будет присвоено имя`name`
    `(?P<name>regex)(?P=name)`  Скобочная группа с именем позволяет к ней обращаться
                                и искать такой                      же текст, который она захватила.  

  Look ahead/Look behind .
    `(?<=exp)REGEXP`   слева от регулярного выражения`REGEXP`должно быть выражение`exp`    
    `REGEXP(?=exp)`    справа от регулярного выражения`REGEXP`должно быть выражение`exp`
    `(?<!exp)REGEXP`   слева от регулярного выражения не должно быть выражения`exp`    
    `REGEXP(?!exp)`    справа от регулярного выражения не должно быть выражения`exp`
    
    Движок регулярных выражений в{Python}не может работать с выражениями неопределённой 
    длины в{Lookbehind}из-за технических особенностей.{Lookahed}позволяет использовать 
    внутри себя выражения неопределённой длины


    `(?#)` скобочное выражение, позволяющее написать комментарий в регулярном выражении   
    `(?(n)yes|no)`  Если у группы`n`нашлись совпадения - возвращается шаблон до`|` 
                    В противном случае возвращается шаблон после`|`   
                    ! |нихуя не ясно но очень интересно|
                     
Match-объекты .
    Если функции`re.search`,`re.fullmatch`не находят соответствие шаблону в строке, 
    то они возвращают`None`, функция`re.finditer`не выдаёт ничего. Однако если 
    соответствие найдено, то возвращается`match-объект`. Он содержит в себе кучу
    полезной информации о соответствии шаблону. Полный набор атрибутов можно
    посмотреть в документации [https://docs.python.org/3/library/re.html#match-objects]

  Методы match-объекта .
    * group(__group=0) .
        Метод group возвращает группу по её номеру или имени. 
        По умолчанию это нулевая группа, т.е. всё, что захватило регулярное выражение. 
        Получить группу можно разными способами:
          | import re
          | res = re.search(r'(?P<name>[a-z]{4})(?P=name)', 'ggwpggwp')
          | print(res['name'])       # ggwp 1)Получаем группу по имени
          | print(res.group('name')) # ggwp 2)Получаем эту же группу по имени с помощью метода group
          | print(res[1])            # ggwp 3)Получаем эту же группу по номеру
          | print(res.group(1))      # ggwp 4)Получаем эту же группу по номеру с помощью метода group
    
    * groups() .
        Метод groups возвращает кортеж со всеми группами, кроме нулевой:
          | import re
          | res = re.search(r'(?P<name>[a-z]{4})(?P=name)', 'ggwpggwp')
          | print(res.groups()) # ('ggwp',)
          | # В данном шаблоне только одна группа, в кортеже она соответственно тоже одна
    
    * groupdict() .
        Метод groupdict возвращает словарь, в котором ключи - имена групп, а значения - строки,
        которые захватила группа.
          | import re
          | res = re.search(r'(?P<name>[a-z]{4})([a-z]{4})', 'ggwpggwp')
          | print(res.groupdict()) # {'name': 'ggwp'}
          | # В словаре одна группа, хоть в шаблоне их 2
          | # Всё из-за того, что этот метод выводит только именованные группы

    * start(__group=0), end(__group=0) .
        Методы start и end возвращают индексы начала и конца совпадения группы, 
        которая была передана в метод:
          | import re
          | res = re.search(r'(?P<name>[a-z]{4})([a-z]{4})', 'ggwpggwp')
          | print(res.start('name')) # 0
          | print(res.start(1))      # 0
          | print(res.start(2))      # 4

    * span(__group=0) .
        Метод span возвращает кортеж с индексом начала и конца подстроки группы, 
        которая была передана в метод. Он работает аналогично методам 
        start, end, но возвращает пару чисел:
          | import re
          | res = re.search(r'(?P<name>[a-z]{4})([a-z]{4})', 'ggwpggwp')
          | print(res.span('name')) # (0, 4)
          | print(res.span(1))      # (0, 4)
          | print(res.span(2))      # (4, 8)



  [https://habr.com/ru/post/349860/] хорошая статья по регулярным выражениям  
    