
ENV['RAILS_ENV'] ||= 'test'

require 'bundler/setup'
require 'shoulda/matchers'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'
require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rspec/rails'
require 'c80_contest'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
# noinspection RubyResolve
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

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
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
