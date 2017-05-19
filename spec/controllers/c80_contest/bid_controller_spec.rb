# noinspection RubyResolve
require 'spec_helper'

module C80Contest
  RSpec.describe BidController, type: :controller do
    routes { C80Contest::Engine.routes }

    context 'Если библиотека выключена (Setting.is_active = false):' do
      it '#give_me_form должна вернуть plain text "none"' do
        C80Contest::Setting.first.update_column(:is_active, false)
        post :make_bid, { :format => :js }
        expect(response.status).to eq(200)
        # byebug
        expect(response.body).to eq 'none'
      end
    end

  end
end
