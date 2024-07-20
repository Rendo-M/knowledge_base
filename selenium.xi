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
    .page_source .
        исходный код страницы    
    .find_element(key, value) .
    .find_elements(key, value) .
         находит (первый/все) элементы подходящий под запрос
         `key` - критерий по которому будет производиться поиск (тег, клсаа и тд ) |import By|???
         `value` - значение критерия по которому производится поиск
Waits .
    .implicitly_wait(time) .
    ждать максимум 10 сек, подгрузки данных ???

    
Работа с selenium в googlecollab:
    | !pip install selenium
    | !apt-get update # to update ubuntu to correctly run apt install
    | !apt install chromium-chromedriver
    | !cp /usr/lib/chromium-browser/chromedriver /usr/bin
    | import sys
    | sys.path.insert(0,'/usr/lib/chromium-browser/chromedriver')
    | from selenium import webdriver
    | from selenium.webdriver.chrome.service import Service
    | from selenium.webdriver.common.by import By
    | from selenium.webdriver.common.action_chains import ActionChains
    | from selenium.webdriver.support.ui import WebDriverWait
    | from selenium.webdriver.support import expected_conditions as EC
     
     
    | service = Service(executable_path='/usr/lib/chromium-browser/chromedriver')
    | chrome_options = webdriver.ChromeOptions()
    | chrome_options.add_argument("--headless")
    | chrome_options.add_argument("--no-sandbox")
    | driver = webdriver.Chrome(service=service, options=chrome_options)
     
    | try:
    |   driver.get("https://tomsk.zoon.ru/p-doctor/")
    |   driver.implicitly_wait(10)
     
    |   actions = ActionChains(driver)
    |   actions.move_to_element(driver.find_element(By.CSS_SELECTOR, "span.js-next-page"))
    |   actions.perform()
    |   wait = WebDriverWait(driver, timeout=10)
     
    |   while True:
    |     wait.until(EC.invisibility_of_element((By.CSS_SELECTOR, "div.js-loading-box")))
    |     wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "span.js-next-page"))).click()
     
    |   # find_element
    |   # find_elements
    | except Exception as ex:
    |   print(f'Error: {ex}')
    
    | html = driver.page_source
    | driver.quit()
