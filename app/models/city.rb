class City < ApplicationRecord
  has_many :areas
  has_many :posts
  belongs_to :prefecture
end
