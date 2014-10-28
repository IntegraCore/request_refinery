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

ActiveRecord::Schema.define(version: 20141003194717) do

  create_table "request_refinery_controller_filters", force: true do |t|
    t.string   "http_method"
    t.string   "controller"
    t.string   "action_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_controller_filters_permissions", force: true do |t|
    t.integer  "controller_filter_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_customers", force: true do |t|
    t.string   "cust_id"
    t.string   "prefix"
    t.string   "folder_name"
    t.string   "error_email_recipients"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_customers_users", id: false, force: true do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_inverse_users_restrictions", id: false, force: true do |t|
    t.integer  "permission_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_permissions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_refinery_permissions", ["name"], name: "index_request_refinery_permissions_on_name", unique: true

  create_table "request_refinery_permissions_roles", id: false, force: true do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_permissions_users", id: false, force: true do |t|
    t.integer  "permission_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_restrictions_inverse_roles", id: false, force: true do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_roles", force: true do |t|
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_refinery_roles", ["group"], name: "index_request_refinery_roles_on_group", unique: true

  create_table "request_refinery_roles_users", id: false, force: true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_refinery_users", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",               default: "", null: false
    t.text     "active_directory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_refinery_users", ["email"], name: "index_request_refinery_users_on_email", unique: true
  add_index "request_refinery_users", ["reset_password_token"], name: "index_request_refinery_users_on_reset_password_token", unique: true
  add_index "request_refinery_users", ["username"], name: "index_request_refinery_users_on_username", unique: true

end
