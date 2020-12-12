class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.belongs_to :customer
      t.decimal :value, precision: 10, scale: 2
      t.timestamps
    end
  end
end
