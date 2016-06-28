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

ActiveRecord::Schema.define(version: 20160628113541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fizz_buzzs", force: :cascade do |t|
    t.integer  "number"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_fizz_buzzs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fizz_buzz_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "users_fizz_buzzs", ["fizz_buzz_id"], name: "index_users_fizz_buzzs_on_fizz_buzz_id", using: :btree
  add_index "users_fizz_buzzs", ["user_id"], name: "index_users_fizz_buzzs_on_user_id", using: :btree

  add_foreign_key "users_fizz_buzzs", "fizz_buzzs"
  add_foreign_key "users_fizz_buzzs", "users"
end
