class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :url
      t.integer :merchant_id
      t.text :address
      t.text :description

      t.timestamps
    end
  end
end
