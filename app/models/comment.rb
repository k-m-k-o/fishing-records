class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :area
  validates :text ,presence: true
end