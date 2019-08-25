class PostsController < ApplicationController
  
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def show
    
  end  
  
  def new
    @post = Post.new
    @cities = City.all
    @city_choices = @cities.map{|city| [city.name, city.id] }
    @hours = Hour.all
    @times = @hours.map{|time| [time.hour, time.id]}
    @fish = Fish.all
    @fish_choices = @fish.map{|fish| [fish.name, fish.id]}
  end

  def cities_select
    if request.xhr?
      @cities = City.where(prefecture_id: params[:prefecture_id])
      @city_choices = @cities.map{|city| [city.name, city.id]}
      render partial: 'cities', locals: {city_choices: @city_choices}
    end
  end

  def create
    @post = Post.new(post_params)
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
    params.require(:post).permit(:title,:fish_id,:prefecture_id,:city_id,:hour_id,:image).merge(user_id: current_user.id)
  end  
end
