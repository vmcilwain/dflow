module HttpAuthConcern
  extend ActiveSupport::Concern

  included do
    before_action :http_authenticate
  end

  def http_authenticate
    return unless ENV['PIPE_ENV'].present?

    authenticate_or_request_with_http_basic do |username, password|
      username == 'administrator' && password == Rails.application.credentials.http_password
    end
  end
end
