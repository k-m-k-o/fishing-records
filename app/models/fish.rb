class Fish < ApplicationRecord
  has_many :post_fishes
  has_many :posts, through: :post_fishes
end
