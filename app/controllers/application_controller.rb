# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :phone, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:full_name, :phone, :email, :password, :current_password)
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Doctor
      doctors_path
    when User
      users_path
    end
  end

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
