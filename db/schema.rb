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

ActiveRecord::Schema.define(version: 2019_11_02_122824) do

  create_table "blands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "type_name_id"
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_name_id"], name: "index_blands_on_type_name_id"
    t.index ["user_id"], name: "index_blands_on_user_id"
  end

  create_table "dividends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "bland_id"
    t.decimal "money", precision: 10
    t.string "month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bland_id"], name: "index_dividends_on_bland_id"
  end

  create_table "stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "bland_id"
    t.integer "number"
    t.decimal "money", precision: 10
    t.integer "buying_and_selling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bland_id"], name: "index_stocks_on_bland_id"
  end

  create_table "type_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blands", "type_names"
  add_foreign_key "blands", "users"
  add_foreign_key "dividends", "blands"
  add_foreign_key "stocks", "blands"
end
