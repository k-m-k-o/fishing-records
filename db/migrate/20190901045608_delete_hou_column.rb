class DeleteHouColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :how
    remove_column :posts, :many
    remove_column :posts, :size
  end
end
