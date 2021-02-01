class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protect_from_forgery with: :exception

 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile_image])
  end

  private

  def production?
    Rails.env.production?
  end
  
  
end
