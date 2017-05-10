
ENV['RAILS_ENV'] ||= 'test'

require 'bundler/setup'
require 'shoulda/matchers'
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
