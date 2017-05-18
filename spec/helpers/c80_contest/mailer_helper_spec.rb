require_relative '../../spec_helper'

module C80Contest
  RSpec.describe C80Contest::MailerHelper, type: :helper do

    before(:each) do

      @bid = Bid.new({
                         id: 15,
                         title: 'Agent Mulder',
                         phone: '81203'
                     })

      # т.к. по факту я не хочу ничего нигде сохранять,
      # то я лабаю дубль и "скармливаю" его с @bid
      p = double('photo', {:url => 'test.jpg'})
      allow(@bid).to receive(:photo).and_return(p)
      # puts "@bid.photo.url = #{@bid.photo.url}"
    end

    it '#format_message должен правильно отформатировать строку' do
      expect(helper.format_message(@bid)).to eq 'Agent Mulder,81203,test.jpg,test.jpg,15'
    end

  end
end
