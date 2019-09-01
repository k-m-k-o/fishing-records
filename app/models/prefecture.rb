class Prefecture < ApplicationRecord
  has_many :cities
  has_many :users
  has_many :posts
  has_many :areas
end
