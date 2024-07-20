первая строка показывает какой интерпритатор нужен для скрипта: .
| #!/bin/bash

сделать скрипт `scripname.sh`` исполняемым     
| sudo chmod +x ~/scriptname.sh 

  
  вывод сообщения message на экран .
| echo "message"
    ключ 
    `-n` не переводить строку
  переменные: .
    | name="value"
    | x=2
    | y=3
    | sum = $x+$y
    | sum2 = $(($x+$y))
    | echo "$name = $x+$y"
    | >> value = 5
    | echo '$name = $x'
    | >> $name = $x
    | echo $sum 
    | >> 2+3
    | echo $sum2 
    | >> 5

  Переменные окружения: .
    BASH .
    полный путь до исполняемого файла оболочки bash
    BASH_VERSION .
    версия bash
    HOME .
    домашний каталог пользователя, который запустил сценарий
    HOSTNAME .
    имя ккомпьютера
    RANDOM .
    случайное число от 0 до 32767 
    OSTYPE .
    тип операционной системы
    PWD .
    текущий каталог
    PS1 .
    строка приглашения
    UID .
    ID пользователя
    USER .
    имя пользователя

  Ввод с клавиатуры: .
    | read Name
    читать в переменную Name ввод с клавиатуры

  Параметры: .
  также через знак `$` из число от `1` до `9` получаем параметры,
  | echo $1
  Если параметров больше 9:
  | echo $[10]
    пример .
  | >> calc_script.sh 1 + 2
  | echo $(($1 $2 $3)) 
  | >> 3 

  оператор if/fi .
    | if [[condition]]; then
    |   <statements>
    | fi    

    Операции сравнения: .
  `-lt`less
  `-gt`greater
  `-le`less or equal
  `-ge`greater or equal
  `-eq`equal  `==`
    []https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html

    Пример: .
  | #!/bin/bash
  | echo -n "введите возраст: "
  | read age
  | if [[$age -ge 0]] && [[$age -lt 12]]; then
  |         echo "you are child"
  |     elif [[$age -ge 12]] && [[$age -lt 18]]; then
  |         echo  "вы подросток"
  |     else [[$age -ge 18]]; then
  |         echo "вы уже взрослый"
  | fi   

  оператор case/esac .
  | case <variable> in
  |     <condition1> ) 
  |         <statements1>;;
  |     <condition2> ) 
  |         <statements2>;;
  | ...
  |     <conditionN> ) 
  |         <statementN>;;
  | *)
  | <statement for other cases>
  | esac

    Пример: .
  | #!/bin/bash
  | echo -n "введите марку телефона: "
  | read name
  | case $brand in 
  |     samsung)
  |         echo "discount 10%";;
  |     nokia)
    |         echo "discount 20%";;
  |     xiaomi)
    |         echo "discount 15%";;
  |     *)
  |          echo "скидок нет"  
  | esac

  Массивы: .
    Объявление массива: .
  | MyArray=(2 3 4 5 334 text) 
    Вывод элемента массива: .
  | echo ${MyArray[1]}
  | >> 3
    Вывод массива: .
  | echo ${MyArray[@]} 
  | >> 2 3 4 5 334 text
    вывод индексов массива: .
  | echo  ${!MyArray[@]}
  | >> 0 1 2 3 4 5 6
    вывод длины массива: .
  | echo  ${#MyArray[@]}
  | >> 7
    вывод длины элемента массива (количества символов): .
  | echo  ${#MyArray[6]}
  | >> 4
    Задание значения элемента массива: .
    | MyArray[0]=1

  цикл for .
  | for <переменная> in <список>; do
  |     <команды>;
  | done
    Альтернативный вариант цикла for .
    | for (( i = 0; i < 10; i++ )); do
    | 	echo "$i"
    | done    

    Пример: .
  | for i  in {!MyArray[@]};  do
  |      echo "${MyArray[$i]}"
  | done

  | >> 2 
  | >> 3
  | >> 4
  | >> 5
  | >> 334
  | >> text
  
  цикл while: .
  | while [ condition ]; do
  |     <statements>;
  | done

    Пример: .
|   n=1
|   while [ $n -lt 4 ]
|   	do
|   		echo "$n"
|   		n=$(( $n+1 ));
|   done

  функции .
  | имя_функции() {
  | команды;
  |  }

    пример: .
    | # Объявление функции
    | list_files() {
    | 	echo "Выводим содержимое каталога"
    | 	cd ~/.my_script
    | 	ls;
    | }
    | # Вызов функции
    | list_files

    пример(рекурсия): .
    | #!/bin/bash
    | Examlpe() {
    | 	echo "Сколько будет 2+2?"
    | 	read answer
    | 	if [[ $answer == 4 ]]; then
    | 		echo "Ответ верный."
    | 	else
    | 		echo "Ответ не верный. Попробуйте еще раз."
    | 		echo
    | 		Examlpe
    | 	fi
    | }
    | echo "Пример рекурсивной функции:"
    | Examlpe

  перенаправление ввода вывода .
  |stdin| стандартный поток ввода, дескриптор|0|  
  |stdout|  стандартный поток ввода, дескриптор|1|
  |stderr| стандартный поток ошибок, дескриптор|2|

    перенаправление потока ошибок .
    | 2>
    | <команда> 2> logfile
    пренаправление стандартного вывода .
    создать новый/перезаписать старый файл
  | >
    добавить в конец файла
  | >>
    перенаправление стандартного ввода .
  | < 
    
    Пример вывода в файл: .
    | echo "это надо в файл" >> outputfile

    Пример ввода из файла: .
    | read text < infile # читает первую строку (до перевода строки)
    
    | while read text; do
    |   echo $text
      | array[$i]=$text
      | i=$(($i+1))
    | done < infile # выведет все строки из файла

    Перенаправление всего вывода(и стандартного и ошибок) в файл: .
    | <command> > outfile 2>&1
        порядок перенаправления важен
    В некоторых ОС есть перенаправляющий оператор`&>`    
    Отправить вывод вникуда .
    | > /dev/null

    вывод одной команды на вход другой команде: .
    `конвейр команд`
    | command1 | command2 | command3
    Пример: .
    | ls /dev | grep sd[a-z][1-9]
    | # отфильтровали только смонтированные разделы
    | >> sda1
    | >> sda2
    