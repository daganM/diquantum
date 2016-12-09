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

ActiveRecord::Schema.define(version: 20161209134301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles_notions", force: :cascade do |t|
    t.integer "notion_id"
    t.integer "article_id"
  end

  create_table "introductions", force: :cascade do |t|
    t.text     "text"
    t.integer  "notion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "introduction_id"
  end

  create_table "sortings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "notion_id"
    t.integer  "article_id"
  end

  add_foreign_key "articles_notions", "articles"
  add_foreign_key "articles_notions", "notions"
end
