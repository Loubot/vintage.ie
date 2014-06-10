class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.text :description
      t.string :name
      t.float :size

      t.timestamps
    end
  end
end
