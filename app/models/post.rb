class Post < ApplicationRecord
  has_many :post_fishes
  has_many :fish ,through: :post_fishes
  belongs_to :hour
  belongs_to :user
  belongs_to :prefecture
  belongs_to :city
  validates :size, presence: true
  validates :how, presence: true
  validates :many, presence: true
  mount_uploader :image, PostsUploader
end
