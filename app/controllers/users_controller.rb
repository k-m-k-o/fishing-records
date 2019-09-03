class UsersController < ApplicationController
  before_action :move_to_root
  def show
    @user = User.find(params[:id])
    @post_length = @user.posts.length
    @posts = @user.posts.order("created_at DESC")
  end
end
