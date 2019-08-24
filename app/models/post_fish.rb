class PostFish < ApplicationRecord
  belongs_to :fish
  belongs_to :post
end
