# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem "rack-cors", "2.0.1"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]
  # To help fixture creation [https://github.com/thoughtbot/factory_bot_rails]
  gem "factory_bot_rails", "6.4.2"
  # Provides RSpec-compatible one-liners to test common Rails functionality [https://github.com/thoughtbot/shoulda-matchers]
  gem "shoulda-matchers", "5.3.0"
end

group :development do
  # To ensure code consistency [https://docs.rubocop.org]
  gem "rubocop", "1.58.0"
  gem "rubocop-performance", "1.19.1"
  gem "rubocop-rails", "2.22.2"
  gem "rubocop-rspec", "2.25.0"
end

group :test do
  # Framework library to test our code [https://github.com/rspec/rspec-rails/]
  gem "rspec-rails", "6.1.0"
end
