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

ActiveRecord::Schema.define(version: 20160615213055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_recipients", force: :cascade do |t|
    t.integer "event_id"
    t.integer "recipient_id"
    t.index ["event_id"], name: "index_event_recipients_on_event_id", using: :btree
    t.index ["recipient_id"], name: "index_event_recipients_on_recipient_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "gifts", force: :cascade do |t|
    t.string  "name"
    t.string  "url"
    t.decimal "price"
    t.integer "priority"
    t.integer "event_id"
    t.integer "recipient_id"
    t.index ["event_id"], name: "index_gifts_on_event_id", using: :btree
    t.index ["recipient_id"], name: "index_gifts_on_recipient_id", using: :btree
  end

  create_table "recipients", force: :cascade do |t|
    t.string  "name"
    t.string  "relationship"
    t.integer "user_id"
    t.index ["user_id"], name: "index_recipients_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "event_recipients", "events"
  add_foreign_key "event_recipients", "recipients"
  add_foreign_key "events", "users"
  add_foreign_key "gifts", "events"
  add_foreign_key "gifts", "recipients"
  add_foreign_key "recipients", "users"
end
