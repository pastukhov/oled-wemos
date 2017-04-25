# oled-wemos

Станция для отображения на экране раазличной информации с помощью протокола MQTT




## Аппаратные компоненты
* [(WEMOS D1 mini)](https://www.wemos.cc/product/d1-mini.html)
* [(WEMOS OLED Shield)](https://www.wemos.cc/product/oled-shield.html)
* Мелкие запчасти
* Структор http://amperka.ru/collection/structor

## Програмные компоненты

Устройство умеет отображать время и погоду. Подключается по протоколу MQTT и ожидает получить JSON c текстом для отображения
```
{  
   "time":{  
      "text":"16:29:35",
      "x":0,
      "y":11,
      "font":"font_unifont_0_8"
   },
   "temperature":{  
      "text":"10.9 C",
      "x":0,
      "y":29,
      "font":"font_unifont_0_8"
   },
   "forecast":{  
      "text":"9.9 11.9 C",
      "x":0,
      "y":47,
      "font":"font_unifont_0_8"
   },
   "drawGird":false
}
```
