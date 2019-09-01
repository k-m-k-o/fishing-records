class AddAreasTable < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.references :prefecture ,foreign_key: true
      t.references :city ,foreign_key: true
      t.boolean :toilet
      t.boolean :car
      t.timestamps
    end
  end
end
