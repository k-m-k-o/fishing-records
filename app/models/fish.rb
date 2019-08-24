class Fish < ApplicationRecord
  has_many :posts, through :post_fishes
  has_many :post_fishes
end
