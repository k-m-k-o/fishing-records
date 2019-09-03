class AddPostsSize < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :size ,:string,null: false
    add_column :posts, :many ,:string,null: false
  end
end
