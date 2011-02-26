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

ActiveRecord::Schema.define(:version => 20110226070017) do

  create_table "pages", :force => true do |t|
    t.string   "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

end
