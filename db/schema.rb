# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_08_06_100218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sauna_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sauna_id"], name: "index_bookmarks_on_sauna_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "sauna_visits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sauna_id", null: false
    t.integer "sauna_time"
    t.integer "water_time"
    t.integer "cooldown_time"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sauna_id"], name: "index_sauna_visits_on_sauna_id"
    t.index ["user_id"], name: "index_sauna_visits_on_user_id"
  end

  create_table "saunas", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "sauna_temperature"
    t.integer "water_temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "rolyu", default: false
    t.boolean "aufguss", default: false
    t.boolean "has_hot_spring", default: false
    t.text "description"
    t.boolean "onsen"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "saunas"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "sauna_visits", "saunas"
  add_foreign_key "sauna_visits", "users"
end
