require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/given'
require 'webmock/rspec'
# require 'draper/test/rspec_integration'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # config.include Devise::TestHelpers, :type => :controller
  # config.include ControllerHelpers, :type => :controller

  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
