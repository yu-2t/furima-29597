class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only:[:new]
  private
  
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
end
