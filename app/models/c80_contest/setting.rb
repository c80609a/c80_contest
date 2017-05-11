module C80Contest
  class Setting < ActiveRecord::Base

    validates :form_title,
              :presence => true,
              :length => { :in => 5..125 }

    validates :form_label_name,
              :presence => true,
              :length => { :in => 3..49 }

    validates :form_label_phone,
              :presence => true,
              :length => { :in => 3..80 }

    validates :form_label_photo,
              :presence => true,
              :length => { :in => 3..80 }

    validates :form_label_button_send,
              :presence => true,
              :length => { :in => 3..15 }

    validates :form_label_button_sending,
              :presence => true,
              :length => { :in => 3..20 }

    validates :ok_text,
              :presence => true,
              :length => { :in => 2..125 }

    validates :ok_text_title,
              :presence => true,
              :length => { :in => 2..125 }

    validates :admin_label_menu,
              :presence => true,
              :length => { :in => 2..20 }

    validates :rules,
              # :presence => true,
              :length => { :in => 0..1000 }

    validates :message_letter_subj,
              :presence => true,
              :length => { :in => 10..125 }

    validates :message_text,
              :presence => true,
              :length => { :in => 20..499 }

  end
end