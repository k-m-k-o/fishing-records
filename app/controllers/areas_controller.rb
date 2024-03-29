class AreasController < ApplicationController
  before_action :move_to_root,only: [:new,:create,:edit,:update]
  def find_areas
    #釣果検索フォームでの検索処理
    @areas = Area.where('name LIKE(?)', "%#{params[:name]}%").where(prefecture_id: params[:prefecture_id],city_id: params[:city_id])
    respond_to do |format|
      format.html
      format.json
    end
  end
    
  def search_areas
    #釣り場検索フォームでの検索処理
    pref = params[:prefecture_id]
    city = params[:city_id]
    area = params[:area_name]
    if pref.length != 0 && city.length == 0 &&area.length == 0
      @areas = Area.where(prefecture_id: pref)
    elsif pref.length != 0 && city.length == 0 &&area.length != 0
      @areas = Area.where("name LIKE(?)","%#{area}%").where(prefecture_id: pref)
    elsif city.length != 0 && area.length == 0
      @areas = Area.where(prefecture_id: pref,city_id: city)
    elsif city.length != 0 && area.length != 0
      @areas = Area.where("name LIKE(?)","%#{area}%").where(prefecture_id: pref,city_id: city)
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
  
  # 市区町村プルダウンの非同期入れ替え処理
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
  
  # 釣り場の保存
  def create
    @new_area = Area.new(area_params)
    if @new_area.save
      redirect_to areas_path
    else
      render "areas/new"
    end
  end

  #釣り場の編集
  def edit
    @area = Area.find(params[:id])
  end
  

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      redirect_to area_path(@area)
    else
      render "areas/show"
    end

  end

  def index
  end
  
  #釣り場の詳細表示
  def show
    @area = Area.find(params[:id])
    @comments = @area.comments.order("created_at DESC")
    @comment = Comment.new
    @area_posts = @area.posts.order("created_at DESC")
  end

  private

  def area_params
    params.require(:area).permit(:name,:prefecture_id,:city_id,:car,:toilet)
  end
end
