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

ActiveRecord::Schema.define(version: 2018_04_11_015048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "definition"
    t.text "performance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.text "complexity"
    t.text "detail"
  end

  create_table "introductions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "about"
    t.text "how"
    t.decimal "singleton"
    t.index ["singleton"], name: "index_introductions_on_singleton", unique: true
  end

  create_table "runs", force: :cascade do |t|
    t.string "title", null: false
    t.string "env"
    t.string "tags", array: true
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.datetime "datetime", null: false
    t.string "category"
    t.string "sub_category"
    t.decimal "order"
    t.index ["category", "sub_category", "title"], name: "runs_index01", unique: true
  end

  create_table "test", id: false, force: :cascade do |t|
    t.json "j"
  end

end
