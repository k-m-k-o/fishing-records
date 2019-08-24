class AddFishUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :fish ,:url ,:string ,unique: true
  end
end
