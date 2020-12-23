class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  # include Pundit
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def error_message
    "There were errors!"
  end
  
  def success_message(object, status=:created)
    "#{object.class.name.titleize} was successfully #{status.to_s}"
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
