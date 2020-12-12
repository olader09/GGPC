class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.decimal :value, precision: 10, scale: 2
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
