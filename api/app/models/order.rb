class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :delivery
    has_many :orders_products
    has_many :products, through: :orders_products

end