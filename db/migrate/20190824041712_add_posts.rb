class AddPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :how ,null: false
      t.references :prefecture ,foreign_key: true
      t.references :city ,foreign_key: true
      t.references :area ,foreign_key: true
      t.references :time_zone ,foreign_key: true
      t.references :user ,foreign_key: true
      t.references :fishes ,foreign_key: true
      t.timestamps
    end
  end
end
