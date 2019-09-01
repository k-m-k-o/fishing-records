class UsersController < ApplicationController
  before_action :move_to_root
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
  end
end
