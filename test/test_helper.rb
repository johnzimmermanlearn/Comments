ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class AcceptanceTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Devise::Test::IntegrationHelpers

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
