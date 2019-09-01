class Area < ApplicationRecord
  has_many :posts
  belongs_to :prefecture
  belongs_to :city
  validates :name , presence: true
  validates :name ,uniqueness: {scope: [:prefecture_id,:city_id]}
  has_many :comments
end
