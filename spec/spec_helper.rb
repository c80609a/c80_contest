
ENV['RAILS_ENV'] ||= 'test'

# require 'capybara/rspec'

# require 'combustion'
# Combustion.path = 'spec/dummy'
# Combustion.initialize! :all

require 'bundler/setup'
require 'shoulda/matchers'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'
require File.expand_path('../dummy/config/environment.rb', __FILE__) # конфликтует с combustion
require 'rspec/rails'
# require 'capybara/rails'
require 'c80_contest'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
# noinspection RubyResolve
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # 20170510:
  # после того, как подключил 'carrierwave/orm/activerecord',
  # после тестов выводилось сообщение:
  #
  # DEPRECATION WARNING: Currently, Active Record suppresses errors
  # raised within `after_rollback`/`after_commit` callbacks
  # and only print them to the logs. In the next version, these
  # errors will no longer be suppressed. Instead, the errors will
  # propagate normally just like in other Active Record callbacks.
  # You can opt into the new behavior and remove this warning by setting:
  #
  # config.active_record.raise_in_transactional_callbacks = true
  #
  # по-этому добавил эту строку
  ActiveRecord::Base.raise_in_transactional_callbacks = true

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # 20170511: Пытаемся избавиться от DEPRECATED message при тестировании
  # контроллеров с помощью `use_route`.
  # Последовал совету: https://github.com/rspec/rspec-rails/issues/1226#issue-49397488
  # Но тогда возникает ошибка:
  #
  #     `example` is not available from within an example
  #      (e.g. an `it` block) or from constructs that run in the
  #      scope of an example (e.g. `before`, `let`, etc). It is
  #      only available on an example group (e.g. a `describe`
  #      or `context` block).
  #
  # config.before(:each) do
  #   if example.metadata[:type] == :controller
  #     example.routes { C80Contest::Engine.routes }
  #   end
  # end

end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
