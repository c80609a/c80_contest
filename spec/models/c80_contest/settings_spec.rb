require_relative '../../spec_helper'

RSpec.describe C80Contest::Setting, :type => :model do

  context 'Проверяем наличие' do
    # noinspection RailsParamDefResolve
    it { should validate_presence_of :form_title }
    it { should validate_presence_of :form_label_name }
    it { should validate_presence_of :form_label_phone }
    it { should validate_presence_of :form_label_photo }
    it { should validate_presence_of :form_label_button_send }
    it { should validate_presence_of :form_label_button_sending }
    it { should validate_presence_of :ok_text }
    it { should validate_presence_of :ok_text_title }
    it { should validate_presence_of :admin_label_menu }
    # it { should validate_presence_of :rules }
    it { should validate_presence_of :message_letter_subj }
    it { should validate_presence_of :message_text }
    it { should validate_presence_of :admin_label_settings }
    it { should validate_presence_of :admin_label_bids }
    it { should validate_presence_of :mail_to }
    it { should validate_presence_of :mail_from }
  end
  
  context 'Проверяем длину' do
    it { should validate_length_of :form_title }
    it { should validate_length_of :form_label_name }
    it { should validate_length_of :form_label_phone }
    it { should validate_length_of :form_label_photo }
    it { should validate_length_of :form_label_button_send }
    it { should validate_length_of :form_label_button_sending }
    it { should validate_length_of :ok_text }
    it { should validate_length_of :ok_text_title }
    it { should validate_length_of :admin_label_menu }
    it { should validate_length_of :rules }
    it { should validate_length_of :message_letter_subj }
    it { should validate_length_of :message_text }
    it { should validate_length_of :admin_label_settings }
    it { should validate_length_of :admin_label_bids }
    it { should validate_length_of :mail_to }
    it { should validate_length_of :mail_from }
  end

  context 'Проверяем форматы:' do
    it 'Проверяем допустимые значения для #mail_to и #mail_from' do
      valid_emails.each do |e|
        should allow_value(e).for(:mail_to)
      end
    end
    it 'Проверяем недопустимые значения для #mail_to и #mail_from' do
      invalid_emails.each do |e|
        should_not allow_value(e).for(:mail_to)
      end
    end
  end

end