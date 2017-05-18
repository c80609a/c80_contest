module C80Contest
  class BidController < ApplicationController

    def make_bid
      m = Bid.new(mess_params)
      respond_to do |format|
        if m.save

          # noinspection RubyResolve
          format.js
          BidMailer.send_letter(m).deliver#_now
        else
          # noinspection RubyResolve
          format.js { render json: m.errors, status: :unprocessable_entity }
        end
      end
    end

    def mess_params
      # noinspection RubyResolve
      params.require(:bid).permit(:title, :phone, :photo)
    end

  end
end