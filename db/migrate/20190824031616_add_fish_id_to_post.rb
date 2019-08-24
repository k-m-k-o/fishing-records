class AddFishIdToPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :fishes_id
    remove_column :posts, :time_id
  end
end
