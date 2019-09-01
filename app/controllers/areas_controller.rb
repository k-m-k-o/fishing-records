class AreasController < ApplicationController
  before_action :move_to_root,only: [:new,:create,:edit,:update]
  def find_areas
    @areas = Area.where('name LIKE(?) AND prefecture_id LIKE(?) AND city_id LIKE(?)', "%#{params[:name]}%","#{params[:prefecture_id]}","#{params[:city_id]}")
    respond_to do |format|
      format.html
      format.json
    end
  end
    
  def search_areas
    pref = params[:prefecture_id]
    city = params[:city_id]
    area = params[:area_name]
    if pref.length != 0 && city.length == 0 &&area.length == 0
      @areas = Area.where(prefecture_id: pref)
    elsif pref.length != 0 && city.length == 0 &&area.length != 0
      @areas = Area.where("name LIKE(?) AND prefecture_id","%#{area}%",pref)
    elsif city.length != 0 && area.length == 0
      @areas = Area.where(prefecture_id: pref,city_id: city)
    elsif city.length != 0 && area.length != 0
      @areas = Area.where("name LIKE(?) AND prefecture_id LIKE(?) AND city_id LIKE(?)","%#{area}%","#{pref}","#{city}")
    elsif pref.length == 0 && area.length != 0
      @areas = Area.where("name LIKE(?)","%#{area}%")
    else
      @areas = Area.limit(100)
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def area_cities
    if request.xhr?
      @cities = City.where(prefecture_id: params[:prefecture_id])
      @city_choices = @cities.map{|city| [city.name, city.id]}
      render partial: 'input_cities', locals: {city_choices: @city_choices}
    end
  end

  def new
    @new_area = Area.new
  end

  def create
    @new_area = Area.new(area_params)
    if @new_area.save
      redirect_to areas_path
    else
      render "areas/new"
    end
  end

  def edit

  end

  def update

  end

  def index
  end

  def show
    @area = Area.find(params[:id])
    @comments = @area.comments.order("created_at DESC")
    @area_posts = @area.posts.order("created_at DESC")
  end

  private

  def area_params
    params.require(:area).permit(:name,:prefecture_id,:city_id,:car,:toilet)
  end
end
