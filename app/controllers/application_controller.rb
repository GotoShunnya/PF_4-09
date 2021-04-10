class ApplicationController < ActionController::Base
  before_action :configuer_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resources)
    posts_path(resources)
  end

  protected

  def configuer_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :phone_number, :email])
  end
end
