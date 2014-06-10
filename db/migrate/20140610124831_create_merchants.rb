class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :logo
      t.string :url
      t.text :address
      t.text :email

      t.timestamps
    end
  end
end
