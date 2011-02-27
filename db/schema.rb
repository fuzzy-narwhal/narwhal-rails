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

ActiveRecord::Schema.define(:version => 20110227020223) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_pages", :force => true do |t|
    t.integer  "category_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
