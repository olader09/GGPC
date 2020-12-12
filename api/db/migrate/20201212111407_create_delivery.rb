class CreateDelivery < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
