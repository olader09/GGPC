class CreateCartsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts_products do |t|
      t.belongs_to :cart
      t.belongs_to :product
      t.integer :quantity, default: 0
    end
  end
end
