.__dict__ .
    is A dictionary or other mapping object used to store an object's (writable) attributes.
    Проще говоря у каждого объекта в python есть атрибут с именем `__dict__`и в нем содержатся все 
    атрибуты определенные для этого объекта.

Методы зачастую используется, когда имя атрибута заранее неизвестно и содержится в переменной: .
  setattr(obj, name, value) .
      Добавляет объекту указанный атрибут .
        `obj` - object Объект, который следует дополнить атрибутом.
        `name` - str Строка с именем атрибута. Можно указывать как имя нового, так и существующего атрибута.
        `value` - Произвольное значение атрибута.
  getattr(obj, name[, default]) .
      Возвращает значение атрибута объекта .
        `default` - Значение по умолчанию, которое будет возвращено, если объект не располагает 
        указанным атрибутом. Если не задано, и атрибут отсутствует, возбуждается исключение AttributeError.
  hasattr(obj, name) -> bool .
      Возвращает флаг, указывающий на то, содержит ли объект указанный атрибут .
  delattr(obj, name) .
      Удаляет из объекта указанный атрибут .

super([type[, obj_or_type]]) .
    Используется для доступа к базовым реализациям наследуемых методов, перекрытых в классе-наследнике.
     `type` - Тип, от которого следует начать поиск объекта-посредника.
     `obj_or_type` -  объект, к которому надо привязаться.
     аргументы нужны для вызова вне класса, или для явного указания класса 
     с которого нужно начать поиск методов

О декорировании методов .
  @classmethod .
      - декоратор метода класса .
        (Этот метод принадлежит классу и может обращаться к его атрибутам. 
        (но не к атрибутам объекта) 
  @staticmethod .
      - декоратор статического метода .
        , не имеющего доступа ни к атрибутам класса ни к атрибутам объекта.
  property .
      property(getter=None, setter=None, deleter=None, doc=None) .
            - Метод property() обеспечивает интерфейс для атрибутов экземпляра класса, 
            принимает на вход методы get, set и delete, и возвращает объекты класса property.
      @property .
            | @property
            | def old(self):
            |    return self.__old
    
            | @old.setter
            | def old(self, old):
            |   self.__old = old    

            | @old.deleter
            | def old(self, old):
            |   del self.__old

Магические методы .
  # Создание и удаление объектов: .
    метод __init__(self) .
        вызывается сразу после создания объекта 
    метод __new__(cls) .
        ! вызывается непосредственно перед созданием объекта
        пример: .
           | def __new__(cls, *args, **kwargs):
           |    print("вызов __new__ для " + str(cls))
           |    <какая то логика>
           |    return super().__new__(cls) #возврат ссылки на создаваемый объект
        # реализация (анти)паттерна `singleton`
        # наследование от неизменяемого класса   
        методы |__init__| и |__new__| являются конструктором объекта
    метод __del__(self) .
        определяет поведение объекта в то время, когда объект попадает в сборщик мусора. 
        Это может быть полезно, для дополнительных чисток во время удаления, 
        например при работе с сокетами или файловыми объектами.

  # Контроль доступа к атрибутам: .
    __getattr__(self, name) .
        Вы можете определить поведение для случая, когда пользователь пытается обратиться к атрибуту, 
        который не существует (совсем или пока ещё). Это может быть полезным для перехвата и 
        перенаправления частых опечаток, предупреждения об использовании устаревших атрибутов 
        (вы можете всё-равно вычислить и вернуть этот атрибут, если хотите), 
        или хитро возвращать AttributeError. 
        Правда, этот метод вызывается только когда пытаются получить доступ к несуществующему атрибуту, 
        поэтому это не очень хорошее решение для инкапсуляции.
    __setattr__(self, name, value) .
        Этот метод позволяет вам определить поведение для присвоения значения атрибуту, 
        независимо от того существует атрибут или нет. То есть, вы можете определить 
        любые правила для любых изменений значения атрибутов. [#1 пример]
    __delattr__(self, name) .
        Позволяет переопределить поведение при удалении атрибута
    __getattribute__(self, name) .
        Этот метод позволяет вам определить поведение для каждого случая доступа к атрибутам

  # Контейнеры .
    Чтобы создать неизменяемый контейнер, вы должны только определить |__len__| и |__getitem__|  
    Протокол изменяемого контейнера требует того же, плюс |__setitem__| и |__delitem__|. 
    Чтобы объект можно было перебирать итерацией, нужно определить |__iter__|, 
    который возвращает итератор. Этот итератор должен соответствовать протоколу итератора, 
    который требует методов |__iter__|(возвращает самого себя) и |__next__|.
    
    * __len__(self) .
        Возвращает количество элементов в контейнере. 
        Часть протоколов для изменяемого и неизменяемого контейнеров.

    * __getitem__(self, key) .
        Определяет поведение при доступе к элементу, используя синтаксис |self[key]|. 
        Тоже относится и к протоколу изменяемых и к протоколу неизменяемых контейнеров. 
        Должен выбрасывать соответствующие исключения: |TypeError| если неправильный тип ключа 
        и |KeyError| если ключу не соответствует никакого значения.

    * __setitem__(self, key, value) .
        Определяет поведение при присваивании значения элементу, используя синтаксис |self[nkey] = value| 
        Часть протокола изменяемого контейнера. Должен выбрасывать |KeyError| и |TypeError| 
        в соответсвующих случаях.

    * __delitem__(self, key) .
        Определяет поведение при удалении элемента (то есть |del self[key]|). 
        Это часть только протокола для изменяемого контейнера. Должен выбрасывать |KeyError| и |TypeError| 
        в соответсвующих случаях.

    * __iter__(self) .
        Должен вернуть итератор для контейнера. Итераторы возвращаются в множестве ситуаций, 
        главным образом для встроенной функции |iter()| и в случае перебора элементов контейнера 
        выражением |for x in container:|. Итераторы сами по себе объекты и они тоже должны определять 
        метод |__iter__|, который возвращает |self|.

    * __reversed__(self) .
        Вызывается чтобы определить поведения для встроенной функции |reversed()|. 
        Должен вернуть обратную версию последовательности. Реализуйте метод только если класс 
        упорядоченный, как список или кортеж.

    * __contains__(self, item) .
        предназначен для проверки принадлежности элемента с помощью |in| и |not in|. 
        Когда |__contains__| не определён, Питон просто перебирает всю последовательность 
        и возвращает True если находит нужный.

    * __missing__(self, key) .
        используется при наследовании от |dict|. Определяет поведение для для каждого случая, 
        когда пытаются получить элемент по несуществующему ключу 
        Так, например, если есть словарь |d|, то |d["george"]| когда |"george"| 
        не является ключом в словаре, вызывает |d.__missing__("george"))|

  # Дескрипторы .
    Дескрипторы это такие классы, с помощью которых можно добавить свою логику к событиям доступа 
    (получение, изменение, удаление) к атрибутам других объектов. Дескрипторы не подразумевается 
    использовать сами по себе; скорее, предполагается, что ими будут владеть какие-нибудь связанные
    с ними классы. Дескрипторы могут быть полезны для построения объектно-ориентированных баз данных
    или классов, чьи атрибуты зависят друг от друга. В частности, дескрипторы полезны при представлении 
    атрибутов в нескольких системах исчисления или каких-либо вычисляемых атрибутов 
    (как расстояние от начальной точки до представленной атрибутом точки на сетке). 
    Чтобы класс стал дескриптором, он должен реализовать по крайней мере один метод из 
    |__get__|, |__set__| или |__delete__|   
    
    * __get__(self, instance, instance_class) .
        Определяет поведение при возвращении значения из дескриптора. 
        |instance| это объект, для чьего атрибута-дескриптора вызывается метод. 
        |owner| это тип (класс) объекта.

    * __set__(self, instance, value) .
        Определяет поведение при изменении значения из дескриптора. 
        |instance| это объект, для чьего атрибута-дескриптора вызывается метод. 
        |value| это значение для установки в дескриптор.

    * __delete__(self, instance) .
        Определяет поведение для удаления значения из дескриптора. 
        |instance| это объект, владеющий дескриптором.  [#2пример]
































[Примеры:]
[#1]
| def __setattr__(self, name, value):
|     self.name = value
|     # это рекурсия, так как всякий раз, когда любому атрибуту присваивается значение,
|     # вызывается  __setattr__().
|     # тоесть, на самом деле это равнозначно self.__setattr__('name', value). 
|     # Так как метод вызывает сам себя, рекурсия продолжится бесконечно, пока всё не упадёт

| def __setattr__(self, name, value):
|     self.__dict__[name] = value # присваивание в словарь переменных класса
|     # дальше определение произвольного поведения

[#2]
Теперь пример полезного использования дескрипторов: преобразование единиц измерения.

|    class Meter(object):
|       '''Дескриптор для метра.'''
|
|        def __init__(self, value=0.0):
|            self.value = float(value)
|        def __get__(self, instance, owner):
|            return self.value
|        def __set__(self, instance, value):
|            self.value = float(value)

|    class Foot(object):
|        '''Дескриптор для фута.'''
|
|        def __get__(self, instance, owner):
|            return instance.meter * 3.2808
|        def __set__(self, instance, value):
|            instance.meter = float(value) / 3.2808
|
|    class Distance(object):
|        '''Класс, описывающий расстояние, содержит два дескриптора для футов и
|        метров.'''
|        meter = Meter()
|        foot = Foot()


