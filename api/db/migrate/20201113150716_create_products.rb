class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.string :picture
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
