class Cart < ApplicationRecord
    belongs_to :customer
    has_many :carts_products
    has_many :products, through: :carts_products
end
