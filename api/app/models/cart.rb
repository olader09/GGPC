class Cart < ApplicationRecord
    belongs_to :customer
    belongs_to :delivery, optional: true
    has_many :carts_products
    has_many :products, through: :carts_products
end
