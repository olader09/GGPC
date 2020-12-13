class Delivery < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :carts
    has_many :orders
end