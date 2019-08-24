class AddDatabase < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name ,null: false
      t.boolean :toilet ,null: false
      t.boolean :car ,null: false
      t.references :prefecture ,foreign_key: true
      t.references :city ,foreign_key: true
      t.timestamps
    end
  end
end
