require_relative '../spec_helper'

RSpec.describe C80Contest::SiteController, :type => :controller do
  context do
    it do
      # get '/c80/index'
      # post :give_me_bid_form
      expect(response.status).to eq(200)
    end
  end
end