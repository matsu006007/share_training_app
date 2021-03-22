class ApplicationController < ActionController::Base
  
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    tweets_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end

  private 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image, :comment, :target])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :image, :comment, :target])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

end
