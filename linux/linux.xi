Основныне каталоги Линукс: .
    / .
    Корневой каталог, содержащий всю файловую иерархию.
    /bin .
    Основные утилиты, необходимые как в однопользовательском режиме, так и при обычной работе всем пользователям (например: cat, ls, cp).
    /boot .
    Загрузочные файлы (в том числе файлы загрузчика, ядро, initrd, System.map). Часто выносится на отдельный раздел.
    /dev .
    Основные файлы устройств (например, /dev/null, /dev/zero).
    /etc .
    Общесистемные конфигурационные файлы (имя происходит от лат. et cetera).
    /home .
    Содержит домашние каталоги пользователей, которые в свою очередь содержат персональные настройки и данные пользователя. Часто размещается на отдельном разделе.
    /lib .
    Основные библиотеки, необходимые для работы программ из /bin и /sbin.
    /media .
    Точки монтирования для сменных носителей.
    /mnt .
    Содержит временно монтируемые файловые системы.
    /opt .
    Дополнительное программное обеспечение.
    /proc .
    Виртуальная файловая система, представляющая состояние ядра операционной системы и запущенных процессов в виде файлов.
    /root .
    Домашний каталог пользователя root.
    /run .
    Информация о системе с момента её загрузки, в том числе данные, необходимые для работы демонов (pid-файлы, UNIX-сокеты и т.д.)
    /sbin .
    Основные системные программы для администрирования и настройки системы, например, init, iptables, ifconfig.
    /srv .
    Данные для сервисов, предоставляемых системой (например, www или ftp).
    /sys .
    Содержит информацию об устройствах, драйверах, а также некоторых свойствах ядра.
    /tmp .
    Временные файлы (см. также /var/tmp).
    /usr .
    Вторичная иерархия для данных пользователя. Содержит большинство пользовательских приложений и утилит,
    используемых в многопользовательском режиме. Может быть смонтирована по сети только для чтения и быть общей для нескольких машин.
    /usr/bin .
    Дополнительные программы для всех пользователей, не являющиеся необходимыми в однопользовательском режиме.
    /usr/lib .
    Библиотеки для программ, находящихся в /usr/bin и /usr/sbin.
    /usr/local .
    Третичная иерархия для данных, специфичных для данного хоста. Обычно содержит такие подкаталоги, как bin, lib, share.
    /usr/sbin .
    Дополнительные системные программы (такие как демоны различных сетевых сервисов).
    /var .
    Изменяемые файлы, такие как файлы регистрации, временные почтовые файлы, файлы спулеров.
    /var/lib .
    Информация о состоянии. Постоянные данные, изменяемые программами в процессе работы (например, базы данных, метаданные пакетного менеджера и др.).
    /var/log .
    Различные файлы журналов (логи).
    *   Важно заметить, что при установке ПО размещается сразу в нескольких каталогах:
        исполняемые файлы в /bin, настройки в /etc/ и т.д. Поэтому важно использовать
        пакетные менеджеры для управлением ПО в Linux.
    *   файлы начинающиеся на `.`- скрытые         

специальные файловые системы .
  /dev .
    - устройства (device)
  /proc .
    - процессы (process)
        * proc/cpuinfo процессор
        * proc/version версия ОС
  /sys .
    информация о системе
  /run .
    временные файлы состояния

    Абсолютный путь .
        начинается со `\`
    Относительный путь .
        не начинается со слеша и зависят от текущего положения
        `~` домашний каталог
        `..` - на уровень вверх (жесткая ссылка)
        `.`  ссылка на текущий каталог (можно использовать в качестве относительного пути)
    Жесткие ссылки .
    inode - дескриптор данных - ведет к каким то данным.
    имя файла - inode - данные
    в ls -l можно увидеть количество ссылок на inode   
    применение:
    * каталогизаторы
    * архивация
    на каталоги жесткие ссылки пользователь создать не может 
    создание ссылки:
    | ln [src file] [dst file]

    Символические ссылки .
    ссылается на имя файла / каталога 
    внутри файла символической ссылки по сути внутри записан путь
    создание:
    | ln -s [src file] [link name]
    |если не указать абсолютный путь, ссылка перестанет быть рабочей при ее переносе|

Установка пакетов в Ubuntu .
    Самый простой вариант установки софта в Ubuntu это пакетный менеджер`apt`
    Процесс установки пакетов максимально автоматизирован и требует лишь знания названия пакета.
    Формат команды установки пакета следующий:
    | sudo apt install {название пакета}
    Команда`sudo`запускает следующую команду в режиме суперпользователя (администратора), 
    `apt`– команда пакетного менеджера в Ubuntu,`install`– режим установки пакета. 
    Далее нам остаётся указать название пакета. Его можно найти в Интернете или в консоли. 
    После ввода команды обычно требуется ввести пароль от вашего основного пользователя (на несколько минут он кэшируется и не
    запрашивается повторно).
    Если вы обнаружили, что пакет не устанавливается, необходимо проверить связность с Интернет. 
    Если связь есть, но пакет не устанавливается необходимо запустить команду:
    | sudo apt update
    | sudo apt upgrade
    Эта команда скачает новые списки пакетов из настроенных репозиториев. После неё нужно повторить установку.
    Для примера установим пакет openssh-server:
    | sudo apt install openssh-server    
    Проверим статус ssh сервиса:
    | systemctl status ssh

Установка гостевых дополнений VirtualBox .
    Если мы используем настольный вариант Ubuntu, будет удобно установить дополнения гостевых ОС для VirtualBox. Дополнения гостевых ОС позволяют
    использовать общие папки, общий буфер обмена между гостевой и хостовой ОС, а также автоматически масштабируют разрешение экрана гостевой ОС под размер окна.
    Для этого подключаем образ диска дополнений гостевой ОС через меню “Устройства” в VirtualBox.
    
    Далее заходим в терминал Ubuntu и устанавливаем необходимые пакеты (перечисляем пакеты через пробел, чтобы установить всё сразу):
    |  sudo apt install gcc make perl
    После этого запускаем установку из файлового менеджера.
    Для применения изменений нужно перезагрузить виртуальную машину после установки дополнений.
    После установки гостевых дополнений нам становится доступными:
    * автоматическое масштабирование экрана по размеру окна;
    * общий буфер обмена (между хостовой и гостевой системами);
    * общие директории для обмена файлами.    

Сетевые режимы Мост и NAT в VirtualBox. Проброс портов .
    Для подключения к виртуальной машине по сети мы должны выбрать и настроить сетевой режим в VirtualBox.
    Наиболее удобный это`“Сетевой мост”`. В этом случае мы получаем виртуальную машину в нашей локальной сети и можем обращаться к ней как к обычному
    компьютеру. Однако,|при использовании беспроводного подключения в хостовой системе режим Сетевой мост может не работать.|Настройка сетевого моста простая –
    нужно только выбрать основной адаптер, через который хостовая система подключена к сети.
    Продемонстрируем подключение по SSH с режимом “Сетевой мост”.
    Альтернатива – режим`NAT`(Network Address Translation). В таком режиме виртуальная машина получает доступ во внешний мир без ограничений. Но
    подключиться к самой машине по сети мы можем только через механизм проброса портов.
    Для того, чтобы иметь возможность подключаться к машине по протоколу`SSH`нам нужно сделать проброс портов 
    | 8022 (хост) – 22 (гость).    

Проверить IP адрес .
    в графическом режиме: .
        Настройки - Сеть    
    терминал: .
    | ip a    
        получим список сетевых интерфейсов.        

Подключиться по SHH: .
    | ssh [user]@[host]    
    `user`- имя пользователя
    `host`- например ip адрес
    затем вводим пароль и попадаем в консоль Ubuntu
    узнать ip, установить ssh и проверить его работу - см выше.
    в случае проброса портов в режиме NAT
    | ssh -p 8022 [user]@localhost
Тип файла .
    * `-` - обычный файл
    * `d` - директория
    * `b` - блочное устройство (напр жесткий диск)
    * `c` - символьное устройство (напр консоль/клавиатура)
    * `s` - unix сокет (средство обмена между 2 программами)
    * `p` - именованый канал
    * `l` - символическая ссылка
Оболочка bash .
| [login]@[host]:[dir][user type]
    `login` имя пользователя
    `host` имя компьютера
    `dir`  текущая директроия (`~` - домашний каталог)
    `user type` 
        * обычный пользователь - `$`
        * суперпользователь - `#`

Основные команды bash .
    * работать под суперпользователем
    | sudo su
    | exit
    * выполнить предыдущую команду с префиксом sudo
    | !!
    * сменить директорию на`dir`
    | cd [dir]
    * просмотр директории (подробно)
    | ls -al
    `-a` показать скрытые файлы
    `-l` подробный формат вывода (метаданные + имя файла)
    `-i` выводить inode 
    `--help` 
    * вывести файл в терминал \ склейка файлов \ создание
    | cat [filename]
    | cat > [filename] 
    создать файл и ввод текста в файл filename + `ctrl+D` для завершения
    | cat >> [filename]
    дозаписать в файл 
    | cat [srs file1] [srs file2] > [dest file]
    склейка 2 файлов в третий
    * показать текущий каталог (print working directory)
    | pwd
    удобно для получения полного пути
    * создать каталог
    | mkdir [dirname]
    `-p`  создать вложенную директорию вместе с недостающими родительскими 
    * копирование
    | cp [src file] [dst file]
    `-r` вместе с вложенными элементами
    * удаление
    | rm
    `-r` вложенные элементы
    `-f` force - не задавать вопросов 
    * переименование/перенос
    | mv
    * создание пустого файла
    | touch [filename]

    * помощь по команде
    | man [command]
    полная справка по команде (выход - q)

текстовый редактор консоли .
    vim .
    | sudo apt install vim
    режимы работы:
    * командный
        # навигация по файлу
        # копирование и вставка
        # удаление символов и строк
        переход в режим - `ESC`
    * редактирование
        переход в режим - `I, A, O` \ `Insert`
    * режим последней строки    
        # сохранение
        # выход
        # изменение настроек
        переход в режим - `:`
    nano .
    # help `Ctrl+G`
    # Save `Ctrl+O`
    # Exit `Ctrl+X`
    # Show string numbers `Alt+N`
    # Search `Ctrl+W`       

терминальные пейджеры .
    less .
    прокрутка `pgDown`
    поиск `/` и `?`
    справка `H`
    `Q` выход
    more .
    старая версия пейджера. нет прокрутки кроме пробела или pgDown
    
    просмотр начала или конца файла:
    | head -n 10 [filename]
    | tail -n 10 [filename]    
    `-n num` просмотр num строк
    `-f` мониторинг файла (только для`tail`) например лога

Работа с группами пользователей .
    * root
        # `UID`= 0
        # Home `/root`
        # pass не всегда
        # есть `shell`
        # неограниченные полномочия
    * user
        # `UID`> 1000
        # Home `/home/user`
        # пароль установлен
        # есть `shell`
        # Доступ в рамках домашней директории 
    * daemon
        # 1 <`UID`< 1000
        # Home любая
        # пароля нет
        # нет `shell`
        # ограниченный доступ
  user attribute .
    `UID` - user ID      
    `GID` - group ID   
    `home directory`
    login
    password
    shell
  user data .
    * etc/passwd список пользователей
    * etc/group список групп
    * etc/shadow пароли пользователей
  в shadow:
        login:pass:дата установки пароля:время действия пароля
        ! - блокировка
        * - пароль не установлен 
       `99999` - пароль не ограничен по времени
  команды управления пользователями .
    useradd .
      создание пользователя
      | sudo useradd -s /bin/bash -m -d /home/newuser newuser
        в каталоге /etc/skel лежит предустановка домашней директории для новых пользователей
    adduser .
      создание пользователя (скрипт)
      | sudo adduser newuser2
    usermod .
      изменение пользователя
      | sudo usermod -aG adm newuser
        добавляет пользователю newuser доп группу - adm
      | sudo usermod -ag www-data newuser
        меняет основную группу пользователю newuser
    userdel .
      удаление пользователя
      | userdel -r newuser
      удаляет пользователя вместе с домашним каталогом
    passwd .
      изменение пароля
      | sudo passwd newuser
    chage .
      изменение свойств пароля
      | chage newuser
      поменять мин/макс срок действия пароля, дату его изменения и тд
      деактивировать учетную запись через некоторое время
    groupadd .
      создание группы
    groupdel .
      удаление группы   
    id .
      параметры пользователя    

sudo & su .
    su - substitute user
    | su newuser
    |       do smthng
    | exit
    `sudo su` - переключиться в суперпользователя
    `/etc/sudoers` конфиг судо
    visudo .
    конфигуратор sudo
    внешне выглядит как`nano` но работает с временной версией конфига sudo
    %group ALL=(ALL:ALL) ALL

изменение владельца и группы владельцев .
  chown .
  изменение владельца и группы
  | chown newuser:newgroup [dir\file]
  | chown newuser
  | chown -R 
    рекурсивно
  chgrp .
  изменение группы
  | chgrp -r
  рекурсивно
  | chgroup newgroup  

права доступа .
  -rwxr-xr-- .
  * первый бит - тип файла, 
  * далее по три бита - 
    # права владельца, 
    # права группы, 
    # права всех остальных пользователей
  `r` чтение
  `w` запись
  `x` исполнение
  спецбиты .
    SUID .
    4000   
    s/S запуск файла от имени владельца
    используется например для запуска команды от имени root (например смена пароля себе, но команда пишет файл shadow)
    SGID .
    2000 
    для директроий, создание файлов с группой, назначенной для директории
    позволяет создавать файлы с группой нужной для общего доступа
    Sticky bit .
    1000
    или restricted deletion flag (t-бит) используется только с каталогами. Когда t-бит для каталога не установлен, 
    файл в данном каталоге может удалить (переименовать) любой пользователь, имеющий доступ на запись к данному каталогу. 
    Устанавливая t-бит на каталог, мы меняем это правило таким образом, что удалить (переименовать) файл может только владелец этого файла. 
    Из такого каталога пользователь может удалить только те файлы, владельцем которых он является. 
         Примером может служить каталог /tmp, в который запись открыта для всех пользователей, но нежелательно удаление 
        чужих файлов. Установка атрибута производится утилитой chmod.
    | chmod 1xxx {имя файла}
      где xxx — права на файл

  chmod .
  изменение прав доступа.
  параметры указываются либо в текстовом варианте, либо в численном в 8ричной систем счисления
  | chmod u=rwx,g=rx,o=r newfile      
  | chmod u+rwx,g+rx,o-rwx newfile
  плюс - установить права, минус - забрать.
  | chmod +rw newfile
  сразу для всех установить права      
  | chmod 664 newfile
  `-R`  рекурсивно, для папок и всего что вложено. используем с осторожностью.
  установка спецбитов:
  | chmod g+S dirname
  `g+S` SGID
  `u+S` SUID 
  
  umask .
  команда  для  проверки маски установки прав по умлочанию.(или ее установки) Вычитается из базовых прав (666 для файла или 777 для каталогов)

Установка ПО в Linux .
    Исходный код .
    * компиляция
    * интсрументы разработки
    * засорение системы
    Скомпилированные файлы .
    * нет централизованного управления
    * нет доверия
    Пакеты .
    * deb, rpm, snap
    * централизация
    * удобство
    * скорость
  Пакеты .
    - скомпилированный код + мета-информация(например зависимости) 
    Пакетный менеджер apt .
    | apt search package_name
        поиск пакета по названию и описанию   
    | apt list package_name
        поиск пакета по имени   
    | apt show package_name  
        посмотреть информацию о пакете 
    | apt install package_name   
        установить пакет
    | apt remove package_name
        удалить пакет, сохранив файлы настроек   
    | apt purge package_name   
        полностью удалить пакет вместе с настройками
    | apt upgrade package_name   
        обновить все установленные пакеты
    | apt update package_name   
        обновить информацию о пакетах в репозиториях, указанных в настройках
    | apt autoremove
        удалить ненужные зависимости    

    apt-mark .
        программа для пометки пакетов как установленных вручную/автоматически
        команды: .
        * auto 
        пометить указанные пакеты как установленные автоматически
        * manual
        пометить указанные пакеты как установленные вручную
        * hold 
        пометить пакет как зафиксированный
        * unhold
        снять метку пакета что его зафиксировали
        * showauto
        * showmanual
        * showhold
        показать пакеты с соответствующими метками

    Утилита dpkg .
        Предназначенна для ручного управления пакетами (apt работает через нее)
        Не работает с зависимостями
        Может работать с локальными пакетами
        | dpkg -l 
            * просмотр списка пакетов в системе
        | dpkg -i 
            * установить пакет или группу пакетов. Сначала надо скачать пакет.
        | dpkg -r 
            * удалить пакет или группу пакетов
        | dpkg -l 
