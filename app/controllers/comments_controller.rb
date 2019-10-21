class CommentsController < ApplicationController
  before_action :move_to_root,only: [:create]

  #コメントの非同期投稿
  def create
    @area = Area.find(params[:area_id])
    @comment = current_user.comments.new(area_id: params[:area_id],text: params[:text])
    if @comment.save
      respond_to do |format|
        format.json
        format.html{redirect_to area_path(@area)}
      end
    else
      render "area/show"
    end
  end

  private

  def comments_params
    params.permit(:text).merge(area_id: params[:id])
  end
end
