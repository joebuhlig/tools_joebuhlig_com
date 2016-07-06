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

ActiveRecord::Schema.define(version: 20160706122538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliate_payments", force: :cascade do |t|
    t.string   "affiliate_id"
    t.string   "date"
    t.integer  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "client_payments", force: :cascade do |t|
    t.text     "description"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "code"
    t.boolean  "paid"
  end

  create_table "discounts", force: :cascade do |t|
    t.decimal "flat"
    t.decimal "percentage"
    t.string  "code"
    t.text    "description"
  end

  create_table "payments", force: :cascade do |t|
    t.string "date"
    t.string "status"
  end

  create_table "tech_listings", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "source"
    t.string   "source_url"
    t.text     "description"
    t.boolean  "flagged"
    t.boolean  "submitted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tech_sites", force: :cascade do |t|
    t.boolean  "active"
    t.string   "name"
    t.string   "url"
    t.boolean  "subgroups"
    t.string   "subgroup_selector"
    t.string   "tech_selector"
    t.boolean  "found_errors"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tech_description_selector"
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "affiliate_id"
    t.string   "date"
    t.float    "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "product_name"
    t.string   "braintree_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "affiliate_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
