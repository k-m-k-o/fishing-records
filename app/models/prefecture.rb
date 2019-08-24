class Prefecture < ApplicationRecord
  has_many :cities
  has_many :areas
  has_many :users
  has_many :posts
end
