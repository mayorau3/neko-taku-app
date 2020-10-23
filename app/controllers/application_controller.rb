class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :kanji_family_name, :kanji_first_name, :zip_code, :region_id, :city, :address1, :address2, :phone])
  end
end
