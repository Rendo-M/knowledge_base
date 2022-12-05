Типы данных .
  ссылочные .
    * массивы
    | int[] arr = new int[10]
    или
    | arr = new int[] {1, 2, 3, 4, 5}  
    многомерные:
    | int[] arr[] = new int[3][5]
    | for (int[] line : arr) {
    |   for (int item : line) {
    |     System.out.printf("%d ", item);
    |   }
    |   System.out.println();
    | }
    или
    | int[][] arr = new int[3][5]
    | for (int i = 0; i < arr.length; i++) {
    |   for (int j = 0; j < arr[i].length; j++) {
    |     System.out.printf("%d ", arr[i][j]);
    |   }
    |   System.out.println();
    | }
    
    * String
  примитивные .
    * boolean
    - логические операции &&, || ( одинарные - побитовые операции)
    * int 
    * short 
    * long
    * float при объявлении обязательно используется суффикс f
    * double
    * char - можно присваивать число, будет произведено неявное преобразование в символ
объявление переменной: .
 | <type> <identifier>;
 | <identifier> = <value>; 
  или
 | <type> <identifier> = <value>;
неявная типизация: .
  | var i = 123;
классы-обертки .
  int       - Integer .
  short     - Short .
  long      - Long .
  byte      - Byte .
  float     - Float .
  double    - Double .
  char      - Character .
  boolean   - Boolean .
содержат дополнительные методы для работы с этим типом.
Операции .
* присваивание  = 
* арифметические  *, /, +, -, ++, --
* сравнения <, >, >=, <=, ==, !=
* логические ||, &&, ^, !
* побитовые <<, >>, |, & 
Преобразования .
char  -> int -> double            
byte -> short  ->  int  -> long  -> double  
long / int  -> float
получение данных из терминала .
| import java.until.Scanner
| .....
| Sacanner iScanner = new Scanner(System.in);
| String name =  iScanner.nextLine();
| int name =  iScanner.nextInt();
| boolean flag = iScanner.hasNextDouble();
| double name =  iScanner.nextDouble();
| .....
| iScanner.close();
форматирование строк .
 | String res = String.format("%d + %d = %d \n", a, b , c)
 %d - decimal
 %x - hex
 %f - float
  %.3f - три знака после запятой
 %e - exp format
 %c - char
 %s - string

функции .
| public static <type> <name> (<args>){
| ............
| return <expression>
| }

ветвления .
| if (<условие>){
| ...........
| }
| else {
| ..........
| }

switch/case:
| switch(<expression>) {
| case <value>: <operator>;
| break;
.......
| default:
|   break
| }

циклы .
while, do while, for, for in
continue
break

файлы .
| import java.io.FileWriter;
| import java.io.IOException;
| .....
| try (FileWriter fw = new FileWriter("file.txt", [дописывать файл? - false])){
|    fw.write("line1");
|    fw.append('\n');
|    fw.append('2');
|    fw.append('\n');
|    fw.append('l 3');
|    fw.flush;
| }
| catch (IOException ex){
| System.out.println(ex.getMessage());
| }