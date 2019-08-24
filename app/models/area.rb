class Area < ApplicationRecord
  belongs_to :prefecture
  belongs_to :city
  has_many :posts
end
