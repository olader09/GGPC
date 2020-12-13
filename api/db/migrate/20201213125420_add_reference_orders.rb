class AddReferenceOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :delivery, index: true
  end
end
