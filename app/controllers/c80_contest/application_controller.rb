module C80Contest
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # noinspection RubyResolve
    before_filter :check_is_active

    private

    def check_is_active
      # noinspection RubyResolve
      unless Setting.first.is_active
        render :plain => 'none'
      end
    end

  end
end
