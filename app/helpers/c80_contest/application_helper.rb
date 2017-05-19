module C80Contest
  module ApplicationHelper

    # такое тоже бывает, после того, как создал PagesController
    def root_url
      '/'
    end

    def render_bid_form(bid)
      # noinspection RubyResolve
      if settings.is_active
        render :partial => 'c80_contest/shared/bid_form',
               :locals => {
                   bid: bid,
                   settings: settings
               }
      else
        render :plain => ''
      end
    end

    def render_ok_message
      # noinspection RubyResolve
      if settings.is_active
        render :partial => 'c80_contest/shared/ok_message',
               :locals => {
                   ok_text: settings.ok_text,
                   ok_text_title: settings.ok_text_title
               }
      else
        render :plain => ''
      end
    end

    def render_banner_button
      # noinspection RubyResolve
      if settings.is_active
        render :partial => 'c80_contest/shared/banner_button',
               :locals => {
                   img_url: settings.button_photo.url
               }
      else
        render :plain => ''
      end
    end

    private

    def settings
      @settings ||= Setting.first
    end

  end
end
