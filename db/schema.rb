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

ActiveRecord::Schema[7.0].define(version: 2023_10_14_103423) do
  create_table "valute_courses", force: :cascade do |t|
    t.integer "valute_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "RUB", null: false
    t.index ["valute_id", "date"], name: "index_valute_courses_on_valute_id_and_date"
  end

  create_table "valutes", force: :cascade do |t|
    t.string "char_code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["char_code"], name: "index_valutes_on_char_code", unique: true
  end

  add_foreign_key "valute_courses", "valutes"
end
