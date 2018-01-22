class CreateLiquorStores < ActiveRecord::Migration[5.1]
  def change
    create_table :liquor_stores do |t|
      t.string :name
      t.string :image
      t.float :latitude_coordinate
      t.string :longitude_coordinate
      t.string :float
      t.string :price
      t.string :zip_code
      t.string :display_address
      t.string :display_phone

      t.timestamps
    end
  end
end
