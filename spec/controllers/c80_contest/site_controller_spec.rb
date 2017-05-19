require_relative '../../spec_helper'

RSpec.describe C80Contest::SiteController, :type => :controller do
  routes { C80Contest::Engine.routes }

    it '#give_me_form' do
      # get '/c80/index'
      post :give_me_form, { :format => :js }
      # byebug
      # post '/give_me_bid_form'
      # post :give_me_bid_form
      expect(response.status).to eq(200)
      expect(response).to render_template('give_me_form')
    end

  context 'Если библиотека выключена (Setting.is_active = false):' do
    it '#give_me_form должна вернуть plain text "none"' do
      C80Contest::Setting.first.update_column(:is_active, false)
      post :give_me_form, { :format => :js }
      expect(response.status).to eq(200)
      # byebug
      expect(response.body).to eq 'none'
    end
  end

end
