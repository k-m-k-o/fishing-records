class PostsController < ApplicationController
  before_action :set_choices, only: [:index,:new,:create,:edit,:update]
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end
 
  def show
    @post = Post.find(params[:id])
  end  
  
  def new
    @post = Post.new
  end
  
  def find_posts
    fishes = []
    fishes << params[:fish_ids]
    pref = params[:prefecture_id]
    city = params[:city_id]
    fishes.flatten!
    if fishes.length == 0
      fishes = nil
    end
    if pref.length == 0 && fishes[0] != nil
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
      @posts = Post.all.order("created_at DESC")
    end
    respond_to do |format|
      format.json
      format.html
    end
  end

  def cities_select
    if request.xhr?
      @cities = City.where(prefecture_id: params[:prefecture_id])
      @city_choices = @cities.map{|city| [city.name, city.id]}
      render partial: 'cities', locals: {city_choices: @city_choices}
    end
  end

  def cities_search
    if request.xhr?
      @cities = City.where(prefecture_id: params[:prefecture_id])
      @city_choices = @cities.map{|city| [city.name, city.id]}
      render partial: 'search_cities', locals: {city_choices: @city_choices}
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render "/posts/new"
    end  
  end

  def edit 
  end

  def update
  end
  
  def destroy
  end  

  private

  def post_params
    params.require(:post).permit(:how,:title,:prefecture_id,:city_id,:hour_id,:size,:many,{fish_ids: []},:image)
  end  

  def remove_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end  

  def set_choices
    @hours = Hour.all
    @times = @hours.map{|time| [time.hour, time.id]}
    @fishes = Fish.all
    @fish_choices = @fishes.map{|fish| [fish.name, fish.id]}
  end
end
