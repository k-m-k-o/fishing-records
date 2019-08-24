class Addoption < ActiveRecord::Migration[5.2]
  def change
    add_index :prefectures , :name, unique: true
    add_index :fish ,:name ,unique: true
    add_index :users , :nickname ,unique: true
  end
end
