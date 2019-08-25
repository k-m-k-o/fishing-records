class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hours do |t|
      t.string :hour ,null: false,unique: true
      t.timestamps
    end

    create_table :fish do |t|
      t.string :name ,null: false
      t.timestamps
    end

    create_table :prefectures do |t|
      t.string :name ,null: false
      t.timestamps
    end

  end
end
