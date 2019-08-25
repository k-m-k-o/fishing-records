class Post < ApplicationRecord
  has_many :fish ,through: :post_fishes
  has_many :pictures
  has_many :post_fishes
  belongs_to :hour
  belongs_to :user
  belongs_to :area
  belongs_to :prefecture
  belongs_to :city
end
