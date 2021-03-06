# rake db:seed:c80_contest_fill_settings

C80Contest::Setting.delete_all
C80Contest::Setting.create!({
                                   :form_title => 'Участвуй в конкурсе: пришли чек и выиграй 500 литров бензина!',
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
                                   :rules => 'Акция проводится с 18 мая по 18 июня. В розыгрыше участвуют чеки на покупки, совершённые в цетре "7авто".',
                                   :message_letter_subj => 'Заявка на участие',
                                   :mail_from => 'robot@mail.ru',
                                   :mail_to => 'admin@mail.ru',
                                   :is_active => true,
                                   :message_text => ' • Имя: {title}<br>' +
                                       ' • Номер телефона: {phone}<br>' +
                                       ' • Фото чека: <br>' +
                                       ' <img src="http://google.com/{photo_url}" /><br>' +
                                       ' --------------------------------------<br>' +
                                       " Просмотреть заявку: <a href='http://google.com/admin/bids/{bid_id}'>http://google.com/admin/bids/{bid_id}</a><br>"
                               })