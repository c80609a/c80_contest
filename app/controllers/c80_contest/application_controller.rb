module C80Contest
  # This line will inherit from the host applications ApplicationController,
  # giving access to your authentication, current_user, etc...
  class ApplicationController < ::ApplicationController

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
