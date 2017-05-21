require_relative '../../spec_helper'

RSpec.describe C80Contest::Bid, type: :model do

  context '#title' do

    context 'Должна быть выкинута ошибка, если:' do
      it 'Имя или слишком длинное или слишком короткое' do
        should validate_length_of(:title)
      end
      it 'Имя вообще не указано' do
        should validate_presence_of(:title)
      end
    end

  end

  context '#phone' do
    context 'Должна быть выкинута ошибка, если:' do

      it 'Строка с номером телефона не соответствует формату' do
        should allow_value('+79261234567').for(:phone)
        should allow_value('89261234567').for(:phone)
        should allow_value('79261234567').for(:phone)
        should allow_value('7 960 520-10-10').for(:phone)
        should allow_value('+7 926 123 45 67').for(:phone)
        should allow_value('8(926)123-45-67').for(:phone)
        should allow_value('123-45-67').for(:phone)
        should allow_value('9261234567').for(:phone)
        should allow_value('926 123 4567').for(:phone)
        should allow_value('926 123 45 67').for(:phone)
        should allow_value('79261234567').for(:phone)
        should allow_value('(495)1234567').for(:phone)
        should allow_value('(495) 123 45 67').for(:phone)
        should allow_value('89261234567').for(:phone)
        should allow_value('8-926-123-45-67').for(:phone)
        should allow_value('8 927 1234 234').for(:phone)
        should allow_value('8 927 12 12 888').for(:phone)
        should allow_value('8 927 12 555 12').for(:phone)
        should allow_value('8 927 123 8 123').for(:phone)
        should allow_value('848439 69911').for(:phone)
        should allow_value('48439 69911').for(:phone)
        should allow_value('6-99-11').for(:phone)
        should allow_value('+7 (48439) 6-99-11').for(:phone)

      end
      it 'Телефон не указан' do
        should validate_presence_of :phone
      end
    end
  end

  context '#photo' do
    context 'Должна быть выкинута ошибка, если:' do
      it 'Фото не прикреплено' do
        should validate_presence_of(:title)
      end
    end
  end

end