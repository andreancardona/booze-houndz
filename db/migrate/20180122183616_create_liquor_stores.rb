class CreateLiquorStores < ActiveRecord::Migration[5.1]
  def change
    create_table :liquor_stores do |t|
      t.integer :neighborhood_id
      t.string :name
      t.string :image
      t.string :latitude_coordinate
      t.string :longitude_coordinate
      t.string :price
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :display_address
      t.string :display_phone

      t.timestamps
    end
  end
end
