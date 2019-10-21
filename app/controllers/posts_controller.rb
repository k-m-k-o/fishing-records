class PostsController < ApplicationController
  before_action :move_to_root,only: [:new,:create]
  before_action :set_choices, only: [:index,:new,:create,:edit,:update]
  def index
    @posts = Post.includes(:user).order("created_at DESC").limit(100)
  end

  # 釣果の詳細表示
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @user_posts = @user.posts.order("created_at DESC").limit(5)
  end  
  
  # 釣果の新規作成
  def new
    @post = Post.new
    @area = Area.new
  end

  def create
    @area_params = area_params
    #　入力された釣り場がなかった場合create
    @area = Area.find_or_create_by(name: area_params[:name],prefecture_id: post_params[:prefecture_id],city_id: post_params[:city_id])
    @post = current_user.posts.new(post_params)
    binding.pry
    @post[:area_id] = @area.id
    
    if @post.save
      redirect_to posts_path
    else
      render "/posts/new"
    end
  end
  
  # 釣り場の非同期検索
  def find_posts
    fishes = []
    fishes << params[:fish_ids]
    pref = params[:prefecture_id]
    city = params[:city_id]
    area = Area.find_by(name: params[:area_name],prefecture_id: pref,city_id: city)
    fishes.flatten!
    if fishes.length == 0
      fishes = nil
    end
    if area.present? && fishes[0] != nil
      @find_posts = []
      fishes.each do |fish_id|
        fish = Fish.find(fish_id)
        posts = fish.posts.order("created_at DESC")
        @find_posts << posts
      end
      @find_posts.flatten!
      @find_posts.uniq!
      @posts = []
      @find_posts.each do |post|
        if post[:area_id] == area[:id]
          @posts << post
        end
      end
    elsif area.present? && fishes[0] == nil
      @posts = Post.where(area_id: area[:id]).order("created_at DESC")
    elsif pref.length == 0 && fishes[0] != nil
      @find_posts = []
      fishes.each do |fish_id|
        fish = Fish.find(fish_id)
        posts = fish.posts.order("created_at DESC")
        @find_posts << posts
      end
      @find_posts.flatten!
      @posts = @find_posts.uniq
    elsif pref.length != 0 && city.length == 0 && fishes[0] != nil
      @find_posts = []
      fishes.each do |fish_id|
        fish = Fish.find(fish_id)
        posts = fish.posts.order("created_at DESC")
        @find_posts << posts
      end
      @find_posts.flatten!
      @find_posts.uniq!
      @posts = []
      @find_posts.each do |post|
        if post[:prefecture_id].to_s == pref
            @posts << post
        end
      end
    elsif city.length != 0 && fishes[0] != nil
      @find_posts = []
      fishes.each do |fish_id|
          fish = Fish.find(fish_id)
          posts = fish.posts.order("created_at DESC")
          @find_posts << posts
      end
      @find_posts.flatten!
      @find_posts.uniq!
      @posts = []
      @find_posts.each do |post|
        if post[:city_id].to_s == city
          @posts << post
        end
      end
    elsif pref.length != 0 && city.length == 0 && fishes[0] == nil
      @posts = Post.where(prefecture_id: pref.to_i).order("created_at DESC")
    elsif city.length != 0 && fishes[0] == nil
      @posts = Post.where(city_id: city.to_i).order("created_at DESC")
    else
      @posts = Post.limit(100).order("created_at DESC")
    end
    respond_to do |format|
      format.json
      format.html
    end
  end
  
  # 市区町村プルダウンの非同期入れ替え
  def cities_select
    if request.xhr?
      @cities = City.where(prefecture_id: params[:prefecture_id])
      @city_choices = @cities.map{|city| [city.name, city.id]}
      render partial: 'cities', locals: {city_choices: @city_choices}
    end
  end

  # 市区町村プルダウンの非同期入れ替え
  def cities_search
    if request.xhr?
      @cities = City.where(prefecture_id: params[:prefecture_id])
      @city_choices = @cities.map{|city| [city.name, city.id]}
      render partial: 'search_cities', locals: {city_choices: @city_choices}
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:prefecture_id,:city_id,:hour_id,{fish_ids: []},:image)
  end  

  def area_params
    params.require(:area).permit(:name)
  end
  


  def remove_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end  
  
  # selectフォーム用の時間帯と魚のデータセット
  def set_choices
    @hours = Hour.all
    @times = @hours.map{|time| [time.hour, time.id]}
    @fishes = Fish.all
    @fish_choices = @fishes.map{|fish| [fish.name, fish.id]}
  end
end
