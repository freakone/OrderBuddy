# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150820110932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.integer  "user_id"
  end

  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "restauration"
    t.string   "phone"
    t.boolean  "ordered"
    t.boolean  "delivered"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "name"
    t.string   "oauth_token"
    t.string   "oauth_expires"
    t.integer  "uid",           limit: 8
    t.string   "image"
  end

end
