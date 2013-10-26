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

ActiveRecord::Schema.define(version: 20131025210522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_searches", id: false, force: true do |t|
    t.integer "category_id", null: false
    t.integer "search_id",   null: false
  end

  add_index "categories_searches", ["category_id", "search_id"], name: "index_categories_searches_on_category_id_and_search_id", using: :btree
  add_index "categories_searches", ["search_id", "category_id"], name: "index_categories_searches_on_search_id_and_category_id", using: :btree

  create_table "cl_locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cl_locations_searches", id: false, force: true do |t|
    t.integer "cl_location_id", null: false
    t.integer "search_id",      null: false
  end

  add_index "cl_locations_searches", ["cl_location_id", "search_id"], name: "index_cl_locations_searches_on_cl_location_id_and_search_id", using: :btree
  add_index "cl_locations_searches", ["search_id", "cl_location_id"], name: "index_cl_locations_searches_on_search_id_and_cl_location_id", using: :btree

  create_table "search_results", force: true do |t|
    t.integer  "pid"
    t.string   "date"
    t.string   "href"
    t.string   "text"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "search_results", ["href"], name: "index_search_results_on_href", using: :btree
  add_index "search_results", ["pid"], name: "index_search_results_on_pid", unique: true, using: :btree
  add_index "search_results", ["search_id"], name: "index_search_results_on_search_id", using: :btree

  create_table "searches", force: true do |t|
    t.string   "terms"
    t.integer  "min_price"
    t.integer  "max_price"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "searches", ["category_id"], name: "index_searches_on_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
