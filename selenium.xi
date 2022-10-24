Библиотека Селениум предназначена для тестирования и парсинга вебсайтов 
и прочей автоматизации работы в браузере.
Библиотека работает с браузером, позволяет вводить и получать данные со страницы и тд.
Для работы требуется скачать драйвера браузера, версия драйвера должна совпадать с верией браузера.
Драйвер Хром:
https://chromedriver.storage.googleapis.com/index.html

| from selenium import webdriver

нужно создать объект драйвера, командой
webdriver.Chrome() .
    в которую передать полный путь до драйвера.
Используем конструкцию 
| driver = webdriver.Chrome(path)
| try: 
|     (запросы)
| except Exception as ex:
|     print(ex)
| finally:
|     driver.close()
|     driver.quite()

.get(url) .
    открывает сайт по адресу url
.close() .
    закрывает браузер
.quite() .
    вызоывается после закрытия браузера
.refresh() .
    обновляет страницу браузера
.get_screenshot_as_file(self, filename) .
.save_screenshot(self, filename) .
    создает и сохраняет скриншот. filename - имя файла