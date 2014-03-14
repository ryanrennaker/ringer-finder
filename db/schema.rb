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

ActiveRecord::Schema.define(version: 20140314001201) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "image_url"
    t.string   "name"
    t.integer  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "reviews", force: true do |t|
    t.integer  "item_id"
    t.string   "title"
    t.text     "body"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "ringer_sports", force: true do |t|
    t.integer  "ringer_id"
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ringers", force: true do |t|
    t.integer  "user_id"
    t.string   "first"
    t.string   "last"
    t.boolean  "is_male"
    t.integer  "comp_level"
    t.string   "city"
    t.string   "state"
    t.string   "img_url"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "password"
    t.boolean  "has_ringer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
