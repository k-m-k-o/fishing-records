class City < ApplicationRecord
  has_many :posts
  has_many :areas
  belongs_to :prefecture
end
