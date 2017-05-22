
ENV['RAILS_ENV'] = 'test'


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
# noinspection RubyResolve
require 'capybara/rspec'
# require 'capybara/rails'
require 'c80_contest'
# require 'byebug'
# noinspection RubyResolve
require 'vcr'

ActiveRecord::Migration.check_pending!
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

  # You can restrict which examples are run by declaring an inclusion filter. The
  # most common use case is to focus on a subset of examples as you're focused on
  # a particular problem.
  # noinspection RubyResolve
  # config.filter_run :focus

  # Use the run_all_when_everything_filtered configuration option to do just
  # that. This works well when paired with an inclusion filter like ":focus =>
  # true", as it will run all the examples when none match the inclusion filter.
  # noinspection RubyResolve
  # config.run_all_when_everything_filtered = true

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  # prints the 10 slowest examples
  # noinspection RubyResolve
  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

  # должно быть в rails_helper.rb
  # noinspection RubyResolve
  config.include Capybara::RSpecMatchers
  # noinspection RubyResolve
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!


  config.expect_with :rspec do |c|
    c.syntax = :expect
    # Sets if custom matcher descriptions and failure messages should include clauses from methods defined using chain.
    c.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # When the verify_partial_doubles configuration option is set, the same argument and
    # method existence checks that are performed for
    # object_double are also performed on partial doubles. You
    # should set this unless you have a good reason not to. It defaults to off
    # only for backwards compatibility.
    mocks.verify_partial_doubles = true
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

  # 20170512: добавляя этот хук здесь, решается две проблемы сразу:
  #   1. Очищается очередь deliveries перед каждым тестом, и
  #   проверка `ActionMailer::Base.deliveries.should_not be_empty`
  #   будет корректно работать в пачке тестов, которые отправляют почту.
  #
  config.before(:each) do
    ActionMailer::Base.deliveries = []
    ActionMailer::Base.perform_deliveries = true
  end

  config.after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  config.before(:each) do
      init_settings
  end

end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
