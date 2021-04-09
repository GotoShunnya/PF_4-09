class ApplicationController < ActionController::Base
  before_action :configuer_permitted_parameters, if: :devise_controller?


  protected
  def configuer_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :phone_number])
  end
end
