# noinspection RubyResolve
require 'spec_helper'

RSpec.describe C80Contest::ApplicationHelper, type: :helper do

  before(:each) do
    @bid = C80Contest::Bid.new({
                                   id: 15,
                                   title: 'Agent Mulder',
                                   phone: '81203'
                               })
    p = double('photo', {:url => 'test.jpg'})
    allow(@bid).to receive(:photo).and_return(p)
  end

  context 'Если библиотека выключена (Setting.is_active = false):' do

    before(:each) do
      C80Contest::Setting.first.update_column(:is_active, false)
    end

    it '#render_bid_form: должен вернуть :plain => ""' do
      expect(helper.render_bid_form(@bid)).to eq ''
    end

    it '#render_ok_message: должен вернуть :plain => ""' do
      expect(helper.render_ok_message).to eq ''
    end

    it '#render_banner_button: должен вернуть :plain => ""' do
      expect(helper.render_banner_button).to eq ''
    end

  end

  context 'Если библиотека ВКЛЮЧЕНА (Setting.is_active = true):' do

    before(:each) do
      # http://stackoverflow.com/a/14501129
      allow(helper).to receive(:render)

      @settings = C80Contest::Setting.first

    end

    it '#render_bid_form: должен отрисовать форму в модальном окне' do
      helper.render_bid_form(@bid)
      expected_args = {
          :partial => 'c80_contest/shared/bid_form',
          :locals => {
              :bid => @bid,
              :settings => @settings
          }
      }
      expect(helper).to have_received(:render).with(expected_args)
    end

    it '#render_ok_message: должен отрисовать модальное OK-окно' do

      helper.render_ok_message
      expected_args = {
          :partial => 'c80_contest/shared/ok_message',
          :locals => {
              :ok_text => @settings.ok_text,
              :ok_text_title => @settings.ok_text_title
          }
      }
      expect(helper).to have_received(:render).with(expected_args)
    end

    it '#render_banner_button: должен отрисовать кнопку' do
      # expect(helper.render_banner_button).to render_template('c80_contest/shared/banner_button')
      # allow(helper).to receive(:render)
      helper.render_banner_button
      expected_args = {
          :partial => 'c80_contest/shared/banner_button',
          :locals => {:img_url => nil}
      }
      expect(helper).to have_received(:render).with(expected_args)
    end

  end

end
