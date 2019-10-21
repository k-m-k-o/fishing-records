class FishController < ApplicationController
  #魚の非同期検索
  def search_fish
    @fishes = Fish.where('name LIKE(?)', "#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
  def find_fish
    @fishes = Fish.where('name LIKE(?)', "#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
end
