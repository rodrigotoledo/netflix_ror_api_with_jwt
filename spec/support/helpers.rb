# frozen_string_literal: true

require 'factory_bot_rails'
require 'simplecov'
require 'shoulda/matchers'
require 'rspec/json_expectations'

SimpleCov.start 'rails' do
  add_filter 'vendor'
  add_filter 'storage'
  add_filter 'app/channels'
  add_filter 'app/helpers'
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/mailers/application_mailer.rb'
  add_filter 'app/models/application_record.rb'
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

module SessionHelpers
  def sign_in_with(user, password = PASSWORD_FOR_USER)
    post signin_path, params: { email: user.email, password: password }
  end

  def sign_in_api_with(user, password = PASSWORD_FOR_USER)
    post api_signin_path, params: { email: user.email, password: password }
    JSON.parse(response.body)
  end

  def logout
    delete logout_path
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include SessionHelpers, type: :request
  config.before(:suite) do
    PASSWORD_FOR_USER = 'password123'
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  %i[controller view request].each do |_type|
    config.include ::Rails::Controller::Testing::TestProcess, type: _type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: _type
    config.include ::Rails::Controller::Testing::Integration, type: _type
  end
end
