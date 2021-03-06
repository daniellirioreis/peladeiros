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

ActiveRecord::Schema.define(:version => 20120130233643) do

  create_table "accounts", :force => true do |t|
    t.integer  "company_user_id"
    t.integer  "month"
    t.integer  "year"
    t.float    "price"
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "paid",            :default => false
  end

  create_table "calendar_days", :force => true do |t|
    t.integer  "calendar_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars", :force => true do |t|
    t.integer  "company_id"
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_members"
    t.float    "price_for_month"
  end

  create_table "companies_users", :force => true do |t|
    t.integer "company_id"
    t.integer "user_id"
    t.integer "type_account", :default => 0
  end

  create_table "escalations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.time     "hour_start"
    t.time     "hour_end"
    t.integer  "place"
    t.integer  "number_team"
    t.integer  "status"
    t.integer  "number_of_players_in_team"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_id"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_from_id"
    t.integer  "user_to_id"
    t.integer  "message_from_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "city"
    t.string   "name"
    t.text     "description"
    t.string   "responsable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles_roles", :id => false, :force => true do |t|
    t.integer "profile_id", :null => false
    t.integer "role_id",    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "action",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "controller"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_default_id"
    t.integer  "profile_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
