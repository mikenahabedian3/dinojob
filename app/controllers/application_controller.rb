# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Method to customize the permitted parameters for Devise's User model
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
  end

  # This method is a Devise helper that will redirect users after they sign in
  def after_sign_in_path_for(resource)
    dashboard_path
  end
end
