class Post < ApplicationRecord
  has_many :fishes ,through :post_fishes
  has_many :pictures
  has_many :post_fishes
  has_one :time_zone
  belongs_to :user
  belongs_to :area
  belongs_to :prefecture
  belongs_to :city
end
