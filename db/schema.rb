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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110603064043) do

  create_table "accounts", :force => true do |t|
    t.integer  "account_number"
    t.string   "bank_number"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id"

  create_table "transfers", :force => true do |t|
    t.integer  "account_id"
    t.integer  "booking_account"
    t.date     "booking_date"
    t.date     "value_date"
    t.string   "booking_text"
    t.string   "reason_for_payment"
    t.string   "recipient"
    t.integer  "recipient_account"
    t.string   "recipient_bank_number"
    t.decimal  "value"
    t.string   "currency"
    t.string   "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transfers", ["account_id"], :name => "index_transfers_on_account_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
