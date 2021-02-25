class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  befoer_action :configure_permitted_parameters, if: :devise_controller?

  praivate
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
