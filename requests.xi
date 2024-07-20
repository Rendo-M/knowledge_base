Библиотека requests .
  Бибилиотека для работы с сайтами через запросы.

  .get(url, params=params) .
    создает запрос к сайту. Вовращает объект-результат этого запроса.
    особенность гет запроса - вся информация передается в самом запросе
    url - адрес сайта
    params -  словарь параметров гет запроса
  .post()  .

  .status_code .
    статус ответа браузера
  .headers .
    служебная информация о формате и способе работы от сайта
  .content .
    строка содержащая тело ответа (сама страница) в виде байт строки
  .text .
    строка содержащая тело ответа (сама страница) в виде байт строки
  .json() .


Пример работы с`API`ВК:

| ACCESS_TOKEN = 'vk1.a.O_8W9YzM1zdjHK_83JxEkfVPwiwRvFvda-9Mn3y7cA-VwXhs87c_eAwxMeZcx6axMTIj7wzR0VYpUUhHu8f6pIBbdDlZMrJsXp8Yrv6dAQ0o70aY2sf8jKvDXLZKptjBjX-NzkYzfcBKQIPdC-yascSdSUOHW15YiyveCbuj9UP3D6_UemnOZ0dJeNwA4r5q'
| METHOD_NAME = 'groups.search'
| URL = f'https://api.vk.com/method/{METHOD_NAME}'
| params = {
|     "access_token": ACCESS_TOKEN,
|     "q": "косметика",
|     "country_id": 1,
|     "city_id": 73,
|     "sort": 6,
|     "count": 100,
|     "v": 5.131
| }
| res = requests.get(URL, params=params).json()