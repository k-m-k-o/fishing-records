class City < ApplicationRecord
  has_many :areas
  has_many :posts
  bolongs_to :prefecture
end
