require_relative '../spec_helper'

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
  end

end