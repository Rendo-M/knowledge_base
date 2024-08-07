Методы dict .
    .keys() .
        возвращает список ключей
    .values() .
        возвращает список значений
    .items() .
        возвращает список элементов словаря состоящий из кортежных пар |(key, value)|
    .get(key[, return]) .
        возвращает значение по ключу|key|, или значение|return|, если ключ|key|отсутствует
    .update() .
        объединение словарей, при совпадении ключей сохраняется значение аргумента.
    .pop(key[, def]) .
        удаляет элемент с ключом |key| и возвращает его значение.  
    .popitem() .
        удаляет последний элемент словаря и возвращает его в виде кортежа.
    .copy() .
        возвращает копию словаря
    .setdefault(key [, default]) .
        получить значение из словаря по ключу|key|, автоматически добавляя
        элемент словаря, если он отсутствует. Если элемент отсутствует и 
        параметр|default|не передан вставляется значение|None|
    
    

Применение словарей .
    #   Подсчет числа каких-то объектов. В этом случае нужно завести словарь,
        в котором ключи — названия объектов, а значения — их количество.
        | dct[i] = dct.get(i,0)
    #   Хранение каких-либо данных, связанных с объектом. Ключи — наименования
        объектов, значения — связанные с ними данные. Например, если нужно по 
        названию месяца определить его порядковый номер, то это можно сделать 
        при помощи словаря num = `{'January': 1, 'February': 2, 'March': 3, ...}`
    #   Установка соответствия между объектами (например, “родитель—потомок”). 
        Ключ — объект, значение — соответствующий ему объект.
    #   Если нужен обычный список, где максимальное значение индекса элемента очень
        велико, но при этом используются не все возможные индексы (так называемый 
        “разреженный список”), то для экономии памяти можно использовать словарь.

    * `len()`  - количество элементов словаря
    * `x in dict` - проверка, является ли x ключом словаря dict
    * `sum()`,`min()`,`max()`- применяются к ключам словаря
    * `for key in dict` - перебор словаря по ключу
       распаковка  словаря`*`выводит значение ключей
    * `{ключ: значение for переменная in последовательность[ if условие ]}`
      - генератор словарей.
    * | dict(zip(keys, values))

    коммон питон
    https://gist.qingmuhy.com/101t/55012e46fc5746d074d7bf5de00acf2f