ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'policy_assertions'
require_relative 'support/system_helpers'
require_relative 'support/integration_helpers'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include ActionView::RecordIdentifier
  include ActionView::Helpers::DateHelper
  include Support::SystemHelpers
  include Pundit

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
class ActionView::TestCase
  include Warden::Test::Helpers
  include Devise::Test::ControllerHelpers
end

class ActionDispatch::IntegrationTest
  include Support::IntegrationHelpers
end

class ActionDispatch::ApplicationSystemTestCase
end

def mailbox
  ActionMailer::Base.deliveries
end

def clear_mailbox
  ActionMailer::Base.deliveries.clear
end

def add_user_to_role(user, role)
  role.users << user
end

def admin_user
  role = create :role, name: 'administrator'
  user = create :user
  add_user_to_role user, role
  user
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end
