class AddColumnNameToDelivery < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :name, :string, null: false
    add_reference :carts, :delivery, index: true
  end
end
