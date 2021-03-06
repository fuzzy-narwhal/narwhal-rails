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

ActiveRecord::Schema.define(:version => 20110227171426) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "categories_pages", :force => true do |t|
    t.integer  "category_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_pages", ["category_id", "page_id"], :name => "index_categories_pages_on_category_id_and_page_id"
  add_index "categories_pages", ["page_id", "category_id"], :name => "index_categories_pages_on_page_id_and_category_id"

  create_table "events", :force => true do |t|
    t.integer  "event_id",        :limit => 8
    t.integer  "page_id",         :limit => 8
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.string   "privacy"
    t.datetime "updated_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "venue_street"
    t.string   "venue_city"
    t.string   "venue_state"
    t.string   "venue_country"
    t.string   "venue_latitude"
    t.string   "venue_longitude"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "events", ["page_id"], :name => "index_events_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "picture"
    t.string   "link"
    t.string   "category"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.boolean  "street_parking"
    t.boolean  "lot_parking"
    t.string   "public_transit"
    t.integer  "likes"
    t.string   "website"
    t.string   "username"
    t.string   "phone"
    t.integer  "section_id"
  end

  add_index "pages", ["section_id"], :name => "index_pages_on_section_id"

  create_table "posts", :force => true do |t|
    t.integer  "likes"
    t.string   "post_id"
    t.string   "from"
    t.string   "to"
    t.string   "message"
    t.string   "picture"
    t.string   "link_url"
    t.string   "link_name"
    t.string   "link_caption"
    t.string   "link_description"
    t.string   "movie_url"
    t.string   "icon"
    t.string   "attribution"
    t.datetime "created_time"
    t.datetime "updated_time"
    t.integer  "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.string   "typ"
  end

  add_index "posts", ["page_id"], :name => "index_posts_on_page_id"

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["name"], :name => "index_sections_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
