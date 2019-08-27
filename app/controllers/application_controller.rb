class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_prefecture
  before_action :set_current_post
  def get_prefecture
    @prefectures = Prefecture.all
    @pref_choices = @prefectures.map{|pref| [pref.name, pref.id,data: {cities_path:  prefecture_cities_path(pref)}]} 
    @cities = City.where(prefecture_id: 1)
    @city_choices = []
  end  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:prefecture_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile,:nickname])
  end

  def set_current_post
    @new_posts = Post.limit(5).order("created_at DESC")
  end  
end
