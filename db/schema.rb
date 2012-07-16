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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120708135713) do

  create_table "attachments", :force => true do |t|
    t.integer  "project_id"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cattype"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "classifications", :force => true do |t|
    t.integer  "classificable_id"
    t.string   "classificable_type"
    t.integer  "category_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "classifications", ["category_id"], :name => "index_classifications_on_category_id"
  add_index "classifications", ["classificable_id"], :name => "index_classifications_on_classificable_id"
  add_index "classifications", ["classificable_type"], :name => "index_classifications_on_classificable_type"

  create_table "components", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ctype"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "developments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "developments", ["project_id"], :name => "index_developments_on_project_id"
  add_index "developments", ["user_id"], :name => "index_developments_on_user_id"

  create_table "managements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "managements", ["project_id"], :name => "index_managements_on_project_id"
  add_index "managements", ["user_id"], :name => "index_managements_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "estimated_duration"
    t.string   "real_duration"
    t.string   "client_name"
    t.string   "github_address"
    t.string   "production_address"
    t.string   "staging_address"
    t.string   "production_account"
    t.string   "production_password"
    t.string   "staging_account"
    t.string   "staging_password"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "",        :null => false
    t.string   "email",                  :default => "",        :null => false
    t.string   "encrypted_password",     :default => "",        :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                   :default => "visitor"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "utilisations", :force => true do |t|
    t.integer  "component_id"
    t.integer  "project_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "utilisations", ["component_id"], :name => "index_utilisations_on_component_id"
  add_index "utilisations", ["project_id"], :name => "index_utilisations_on_project_id"

end
