class CreatePostFishes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_fishes do |t|
      t.references :fish ,foreign_key: true
      t.references :post ,foreign_key: true
      t.timestamps
    end
  end
end
