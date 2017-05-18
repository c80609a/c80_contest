require_relative '../../spec_helper'

# noinspection ALL
module C80Contest
  RSpec.describe C80Contest::BidMailer, type: :mailer do

    let(:bid) do
      Bid.new({
                  id: 15,
                  title: 'Agent Mulder',
                  phone: '81203',
                  photo: 'test_photo.jpg'
              })
    end

    let(:setting) { Setting.first }

    # первые строки в тестировании mailer-ов
    # не забываем про то, что в `spec_helper.rb` есть хук-помощник
    it 'Проверяем, что письмо ушло с правильным subj, правильному адресату, от правильного отправителя' do
      m = C80Contest::BidMailer.send_letter(bid).deliver_now
      expect(m.from).to include(setting.mail_from)
      expect(m.to).to include(setting.mail_to)
      expect(m.subject).to eq setting.message_letter_subj
      expect(ActionMailer::Base.deliveries).to_not be_empty
    end

  end
end
