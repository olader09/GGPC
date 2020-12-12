class CreateOrdersProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_products do |t|
      t.belongs_to :order
      t.belongs_to :product
      t.integer :quantity, default: 0
    end
  end
end
