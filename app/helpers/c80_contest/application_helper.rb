module C80Contest
  module ApplicationHelper

    def render_bid_form(bid)

      settings = Setting.first

      render :partial => 'c80_contest/shared/bid_form',
             :locals => {
                 bid: bid,
                 settings: settings
             }

    end

    def render_ok_message
      settings = Setting.first
      render :partial => 'c80_contest/shared/ok_message',
             :locals => {
                 ok_text: settings.ok_text,
                 ok_text_title: settings.ok_text_title
             }
    end

  end
end
