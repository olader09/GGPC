# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Delivery.create(name: "Самовывоз", price: 0)
Delivery.create(name: "Доставка почтой России", price: 500)

Product.create(name: "Монитор", price: 3200)