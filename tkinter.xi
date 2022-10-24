import tkinter .
  Tk() .
    создает главное окно
    методы главного окна: .
      .mainloop() .
        цикл главный обработки событий
      .title(text) .
        `text` - название окна  
      .geometry('SIZEXxSIZEY+DX+DY') .
        `SIZEX` - размер по Х 
        `SIZEY` - размер по У
        `DX`    - отступ по Х
        `DY`    - отступ по У
      .resizeble(flag1, flag2) .
       `flag1`   - можно ли изменять размеры окна по х 
       `flag2`   - можно ли изменять размеры окна по y
      .minsize(minX, minY) .
      .maxsize(maxX, maxY) .
      задаем макс и мин размеры окна
      .iconfoto(flag, photo) .
      `flag` - использовать ли значение по умолчанию
      `photo` объект|tkinter PhotoImage|  
      .config() .
        меняем свойства окна - фоновый цвет`bg=`, основной цвет`fg=` и тд  
      .grid_columnconfigure(number, minsize=x) .
        задаем макс размер столбца number
      .bind(type, func) .
        привязка обработчика событий
        `type` тип события - 
            |'<Key>'| - обработчик клавиатуры
         `func` - функция обработчик события
         в нее передается объект `Event`     
  
  Label(win, text=text) .
  виджет создающий текст в окне
    атрибуты Label .
      text=text .
        текст метки 
      font=('Arial',size,'bold') .
        параметры шрифта в кортеже - имя, размер, стиль 
      bg='red' .
        цвет фона
      fg='blue' .
        цвет текста
      padx=pixel .
        отступ текста по х в пикселях
      pady=pixel .
        отступ текста по у в пикселях
      width=size .
        размер по ширине в символах
      height=size .
        размер по высоте в симвоалх
      anchor='n' .
        n s w e center - привязка текста верх/низ/лево/право/центр(по умолчанию) (и сочетания)
      relief= .
        тип границы (tk.RAISED, )
      bd=width .
        ширина границы элемента
      justify= .
          выравнивание многострочного текста (tk.CENTER, tk.RIGHT, tk.LEFT) 

  Button() .
  виджет кнопки.
    атрибуты Label .
      text=text .
        текст кнопки
      command = func .
        ссылка на функцию вызываемую при нажатии кнопки   
      font=('Arial',size,'bold') .
        параметры шрифта в кортеже - имя, размер, стиль 
      bg='red' .
        цвет фона
      fg='blue' .
        цвет текста
      activebackground='blue' .
        цвет нажатой кнопки
      state=tk.DISABLED .
        tk.NORMAL - состояние кнопки     
      padx=pixel .
        отступ текста по х в пикселях
      pady=pixel .
        отступ текста по у в пикселях
      width=size .
        размер по ширине в символах
      height=size .
        размер по высоте в симвоалх
      anchor='n' .
        n s w e center - привязка текста верх/низ/лево/право/центр(по умолчанию) (и сочетания)
      relief= .
        тип границы (tk.RAISED, )
      bd=width .
        ширина границы элемента
      justify= .
          выравнивание многострочного текста (tk.CENTER, tk.RIGHT, tk.LEFT) 

  .Grid() .
  метод для размещения виджетов на окне.
  располагает виджеты в виде таблицы  
    атрибуты Grid .
      row=number .
      column=number .
        номера колонок и рядов 
      columnspan=number .
        сколько колонок занимает виджет
      stick ='we' .
        we - растянуть виджет по ширине
        ns - по высоте
        n,w,s,e прижать виджет к одной из сторон
      rowspan=number .
        сколько строк занимает виджет     
  
  Entry()  .
    виджет ввода текста
    атрибуты Entry .
      show='*' .
        маскировка ввода 

    методы Entry .
      .get() .
        получить содержимое поля ввода entry
      .delete(first, last) .
        удаляет введенный текст с first(обязательный символ, с 0) до last(не включая) символа
        tk.END - включить последний
      .insert(pos, text) .
        вставить text в поле ввода начиная с позиции pos

  Checkbuttion() .
    чекбокс виджет
    аттрибуты checkbuttion .
      indication=state .
        `state` тип флажка 0 - в виде кнопки
      textvariable=var .
        связать чекбокс с переменной`var` (`tk.IntVar(), tk.StringVar()`)
      onvalue=state1 .
        `state1`значение помещаемое в переменную`var`при установленном флаге
        `state2`значение помещаемое в переменную`var`при снятом флаге
    методы .
      .select() .
      .deselect() .
      .togle() .
        вкл/выкл/сменить состояние
      .get()  