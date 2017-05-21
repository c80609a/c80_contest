source 'https://rubygems.org'

# Specify your gem's dependencies in c80_contest.gemspec
gemspec

group :development, :test do

  # You need these
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-zeus'
  gem 'guard-bundler'

  gem 'factory_girl_rails'

  # You don't need these, but I use them
  gem 'rb-fsevent'
  gem 'ffaker'
  gem 'pry'

end

group :development do
  # You don't need these, but I use them
  gem 'better_errors'
  gem 'awesome_print'
  gem 'brakeman'
end

group :test do
  # You don't need these, but I use them
  gem 'vcr'
  gem 'webmock'
  gem 'capybara'
  gem 'simplecov', require: false
end
