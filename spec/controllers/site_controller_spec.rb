require_relative '../spec_helper'

RSpec.describe C80Contest::SiteController, :type => :controller do
  routes { C80Contest::Engine.routes }

  context do
    it do
      # get '/c80/index'
      post :give_me_form, { :format => :js }
      # byebug
      # post '/give_me_bid_form'
      # post :give_me_bid_form
      expect(response.status).to eq(200)
      expect(response).to render_template('give_me_form')
    end
  end
end
