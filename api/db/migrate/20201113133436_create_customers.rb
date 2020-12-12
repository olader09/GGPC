class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false, default: ''
      t.string :phone
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :address
      t.string :city
      t.string :region
      t.integer :zip
      t.float :sale
      t.timestamps
      t.index :name
      t.index :phone
      t.index :email
    end
  end
end
