class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_prefecture
   
  def get_prefecture
    @prefectures = Prefecture.all
    @pref_choices = @prefectures.map{|pref| [pref.name, pref.id,data: {cities_path:  prefecture_cities_path(pref)}]} 
  end  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:prefecture_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile,:nickname])
  end
  
end
