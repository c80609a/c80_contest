module C80Contest
  class PagesController < ::ApplicationController

    # noinspection RubyResolve
    before_filter :check_is_active

    def rules_page
      @rules = Setting.first.rules
    end

    private

    def check_is_active
      # noinspection RubyResolve
      unless Setting.first.is_active
        render :plain => 'none'
      end
    end

  end
end