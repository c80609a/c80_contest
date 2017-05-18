def valid_emails
  %w(a@b.ru asdf@b.ru qwerty@b.r qwerty.qwerty@bb.ru qwerty-qwerty@mail.com q-q@m.r 0-0@ma.ru 0.0@mail.ru)
end

def invalid_emails
  %w(qwerty 1 1234 @ qwerty@ @.ru qwerty@ru qwerty@a.)
end

def init_settings
  C80Contest::Setting.delete_all
  C80Contest::Setting.create!({
                      :form_title => 'Участвуй в конкурсе: ...',
                      :form_label_name => 'Ваше имя',
                      :form_label_phone => 'Номер телефона',
                      :form_label_photo => 'Фото чека',
                      :form_label_button_send => 'Отправить',
                      :form_label_button_sending => 'Отправляется...',
                      :ok_text => 'Ваша заявка принята',
                      :ok_text_title => 'Ваша заявка отправлена',
                      :admin_label_menu => 'Розыгрыш',
                      :admin_label_bids => 'Заявки',
                      :admin_label_settings => 'Настройки',
                      :rules => 'Акция проводится с 18 мая по 18 июня. В розыгрыше участвуют...',
                      :mail_from => 'abc@ab.ru',
                      :mail_to => 'qwerty@qwerty.ru',
                      :message_letter_subj => 'Заявка на участие',
                      :message_text => '{title},{phone},{photo_url},{photo_url},{bid_id}'
                  })
end