class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :time_zones do |t|
      t.string :time_zones ,null: false
      t.timestamps
    end

    create_table :fishes do |t|
      t.string :name ,null: false
      t.timestamps
    end

    create_table :prefectures do |t|
      t.string :name ,null: false
      t.timestamps
    end
  end
end
