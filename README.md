[![Gem Version](https://badge.fury.io/rb/c80_contest.svg)](http://badge.fury.io/rb/c80_contest)
[![Build Status](https://travis-ci.org/c080609a/c80_contest.svg?branch=master)](https://travis-ci.org/c080609a/c80_contest)

# C80Contest

Добавляет на сайт функционал для проведения конкурса типа "пришли фотографию чека - участвуй в конкурсе по розыгрышу 500 литров бензина".
Содержит:

* форму отправки: фото чека, поля для ввода имени и телефона
* страницу в ActiveAdmin
* виджет типа "слайдер-карусель" на ActiveAdmin dashboard

## Dependencies

* rails (`::Rails::Engine`)
* activeadmin
* bootstrap
* bootstrap/modal
* c80: modal forms
* remote multipart form

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
