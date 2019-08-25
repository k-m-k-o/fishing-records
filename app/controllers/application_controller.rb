class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_prefecture
   
  def get_prefecture
    @prefectures = Prefecture.all
    @choice_pref = []
    @prefectures.each do |pref|
      @choice_pref << [pref.name, pref.id]
    end  
  end  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:prefecture_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile,:nickname])
  end
  
end
