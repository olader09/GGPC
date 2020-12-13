# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20201213125420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "login", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "customer_id"
    t.decimal "value", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 0
    t.bigint "delivery_id"
    t.index ["customer_id"], name: "index_carts_on_customer_id"
    t.index ["delivery_id"], name: "index_carts_on_delivery_id"
  end

  create_table "carts_products", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.integer "quantity", default: 1
    t.index ["cart_id"], name: "index_carts_products_on_cart_id"
    t.index ["product_id"], name: "index_carts_products_on_product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "phone"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "address"
    t.string "city"
    t.string "region"
    t.integer "zip"
    t.float "sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email"
    t.index ["name"], name: "index_customers_on_name"
    t.index ["phone"], name: "index_customers_on_phone"
  end

  create_table "deliveries", force: :cascade do |t|
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id"
    t.decimal "value", precision: 10, scale: 2
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed", default: false
    t.bigint "delivery_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["delivery_id"], name: "index_orders_on_delivery_id"
  end

  create_table "orders_products", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity", default: 1
    t.index ["order_id"], name: "index_orders_products_on_order_id"
    t.index ["product_id"], name: "index_orders_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "picture"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
