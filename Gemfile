source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use sqlite3 as the database for Active Record
# gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Use Redis adapter to run Action Cable in production
gem 'pg'
gem 'redis', '>= 4.0.1'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'pry'
  # Load environment variables from a .env file
  gem 'dotenv-rails'
  # Analyzes test code coverage
  gem 'simplecov', require: false
  # Ruby static code analysis tool
  gem 'rubocop', require: false
  # RuboCop extension for Rails
  gem 'rubocop-rails', require: false
  # Generates realistic fake data to populate the database during development and testing
  gem 'cpf_faker'
  gem 'faker', '~> 3.2'
  # Testing application
  gem 'rspec-rails'
  # Support for multiple build strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects)
  gem 'factory_bot_rails'
  # Guard::RSpec allows to automatically & intelligently launch specs when files are modified
  gem 'guard-rspec', require: false
  # Helps detect N+1 queries in ActiveRecord
  gem 'bullet'

  gem 'rails-controller-testing'

  gem 'bundler-audit'

  gem 'letter_opener'
end

group :development do
  # Security tool for Rails
  gem 'brakeman'
  # Automatically formats Ruby code, maintaining style consistency
  gem 'rufo'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'annotate'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'rspec-json_expectations'
  gem 'shoulda-matchers', '~> 6.0'
end

gem 'email_validator'
gem 'foreman'
gem 'friendly_id', '~> 5.4.0'
gem 'jwt'
gem 'rack-cors', '~> 2.0'
gem 'sidekiq', '~> 7.2'
gem 'tailwindcss-rails', '~> 2.1'
