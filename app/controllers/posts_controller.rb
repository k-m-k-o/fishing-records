class PostsController < ApplicationController
  before_action :set_choices, only: [:new,:create,:edit,:update]
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end
 
  def show
    @post = Post.find(params[:id])
  end  
  
  def new
    @post = Post.new
  end

  def cities_select
    if request.xhr?
      @cities = City.where(prefecture_id: params[:prefecture_id])
      @city_choices = @cities.map{|city| [city.name, city.id]}
      render partial: 'cities', locals: {city_choices: @city_choices}
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.image.nil?
      @post.image = "noimage.png"
    end
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
