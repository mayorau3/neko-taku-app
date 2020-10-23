# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_21_031806) do

  create_table "cats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.integer "sex", null: false
    t.integer "character", null: false
    t.text "explanation", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cats_on_user_id"
  end

  create_table "houses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "pr", null: false
    t.text "explanation"
    t.integer "cat_history", null: false
    t.integer "character", null: false
    t.integer "stay_price"
    t.integer "one_day_price"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "reservations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "start_date", null: false
    t.integer "stay_days"
    t.integer "one_day_hours"
    t.text "message", null: false
    t.bigint "user_id", null: false
    t.bigint "house_id", null: false
    t.bigint "cat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cat_id"], name: "index_reservations_on_cat_id"
    t.index ["house_id"], name: "index_reservations_on_house_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "kanji_family_name", null: false
    t.string "kanji_first_name", null: false
    t.string "zip_code", null: false
    t.integer "region_id", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2"
    t.string "phone", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cats", "users"
  add_foreign_key "houses", "users"
  add_foreign_key "reservations", "cats"
  add_foreign_key "reservations", "houses"
  add_foreign_key "reservations", "users"
end