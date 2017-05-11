module C80Contest
  class SiteController < ApplicationController

    def give_me_form
      @bid = Bid.new
    end

    # def index
    #
    # end

  end
end