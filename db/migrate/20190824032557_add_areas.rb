class AddAreas < ActiveRecord::Migration[5.2]
  def change
    add_reference :areas, :prefecture ,foreign_key: true
    add_reference :areas,:city ,foreign_key: true
  end
end
