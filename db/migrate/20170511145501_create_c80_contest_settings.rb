class CreateC80ContestSettings < ActiveRecord::Migration
  def change
    create_table :c80_contest_settings, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :form_title
      t.string :form_label_name
      t.string :form_label_phone
      t.string :form_label_photo
      t.string :form_label_button_send
      t.string :form_label_button_sending
      t.string :ok_text
      t.string :ok_text_title
      t.string :admin_label_menu
      t.text   :rules
      t.string :message_letter_subj
      t.text :message_text
      t.timestamps
    end
  end
end
