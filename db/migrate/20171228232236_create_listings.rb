class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.integer :zip_code
      t.boolean :crypto
      t.integer :phone_number

      t.timestamps
    end
  end
end
