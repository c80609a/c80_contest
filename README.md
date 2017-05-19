[![Gem Version](https://badge.fury.io/rb/c80_contest.svg)](http://badge.fury.io/rb/c80_contest)
[![Build Status](https://travis-ci.org/c080609a/c80_contest.svg?branch=master)](https://travis-ci.org/c080609a/c80_contest)

# C80Contest

Добавляет на сайт функционал для проведения конкурса типа "пришли фотографию чека - участвуй в конкурсе по розыгрышу 500 литров бензина".
Содержит:

* форму отправки: фото чека, поля для ввода имени и телефона. Форма
защищена (по мере возможности) от спама: она запрашивается только тогда,
когда пользователь кликнул по нужной кнопке - приходит в виде строки,
превращается в html (с помощью `jQuery`) и помещается на страницу.

* страницу в ActiveAdmin с настройками и таблицей заявок

Сообщения уходят на почту админу (в настройках можно указать почтовый адрес).

## Dependencies

* rails (`::Rails::Engine`)
* activeadmin (backend)
* ckeditor (backend)
* bootstrap (frontend)
* bootstrap/modal (frontend)
* c80: modal forms (frontend)
* remote multipart form (frontend)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'remotipart'
gem 'c80_modal_forms'

gem 'c80_contest'
```

And then execute:

    $ bundle

application.js:

    //= require bootstrap/modal
    //= require bootstrap/transitions
    //= require jquery.remotipart
    //= require c80_modal_forms
    
    //= require c80_contest

application.scss:

    @import 'c80_contest';

application_controller.rb:

    helper C80Contest::Engine.helpers

routes.rb:

    mount C80Contest::Engine => '/'

## Usage

### Settings

В админке появляется пункт меню 'Розыгрыш', в котором содержатся
два подпункта: собственно, заявки от посетителей сайта и настройки
модуля. Модуль можно выключить - тогда всё исчезнет с сайта, что
касается розыгрыша, и код менять при этом не нужно. Там же в настройках
можно менять другие параметры модуля.

### Helpers

* `render_banner_button` - отрисует кнопку, по которой можно кликнуть,
чтобы получить с сервера форму, которую можно заполнить.

### Прелоадер

Это то, что видно после клика по кнопке до тех пор,
пока не получен ответ от сервера (с формой, которую можно заполнить).

Кастомизируется с помощью css вида:

```css
/* этот прелоадер ложится поверх картинки-кнопки,
закрывая её всю полупрозрачным чёрным, а по-центру
этого поля расположен анимированный гиф. */

/* С помощью width/height подгоняем под конкретный размер картинки,
которую надо накрыть. */

/* т.к. js уже позиционировал див с помощью top/left - 
в css корректируем местонах. с помощью margin.
*/

div#lo {
  width: 965px;  
  height: 160px;
  background-size: 10%;
  background-color: rgba(0,0,0,0.3);
  margin-top: -65px; 
  margin-left: 60px;
}
```

# TODO

* [ ] Проверить, удаляются ли окна из html, когда их закрываем или когда они сами исчезают
* [ ] Вывести в настройки размер кнопки-картинки, использовать их в uploader-е и в css прелоадера
* [ ] Дописать тесты
* [ ] Допилить Readme
* [ ] ActiveAdmin: Settings: решить вопрос, почему не хочет обновлять данные в базе "из коробки",
пришлось лепить контроллер, и времени не хватило, не показывает ошибки валидации.