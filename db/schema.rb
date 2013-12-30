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

ActiveRecord::Schema.define(version: 20131230193540) do

  create_table "posts", force: true do |t|
    t.integer  "stream_id"
    t.string   "category"
    t.string   "title"
    t.string   "slug"
    t.string   "url"
    t.text     "body"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category"], name: "index_posts_on_category"
  add_index "posts", ["created_at"], name: "index_posts_on_created_at"
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true
  add_index "posts", ["stream_id"], name: "index_posts_on_stream_id"

  create_table "streams", force: true do |t|
    t.integer  "display_order"
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "streams", ["display_order"], name: "index_streams_on_display_order"
  add_index "streams", ["name"], name: "index_streams_on_name", unique: true
  add_index "streams", ["slug"], name: "index_streams_on_slug", unique: true

end
