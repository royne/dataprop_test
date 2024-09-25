class CreateProperties < ActiveRecord::Migration[7.2]
  def change
    create_table :properties do |t|
      t.string :type
      t.integer :price
      t.string :currency
      t.string :commune
      t.string :address
      t.integer :area
      t.integer :bedrooms
      t.integer :bathrooms
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
