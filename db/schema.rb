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

ActiveRecord::Schema[7.0].define(version: 2023_04_13_202930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_bookings", force: :cascade do |t|
    t.decimal "band_id"
    t.decimal "venue_id"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "country"
    t.string "city"
    t.string "state"
    t.string "website"
    t.string "facebook"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_contracts", force: :cascade do |t|
    t.decimal "band_id"
    t.decimal "venue_id"
    t.float "price"
    t.string "date"
    t.string "time"
    t.string "duration"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_histories", force: :cascade do |t|
    t.string "band_name"
    t.string "venue_name"
    t.float "price"
    t.string "date"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venue_bookings", force: :cascade do |t|
    t.decimal "venue_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.float "price"
    t.decimal "capacity"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "description"
    t.string "email"
    t.string "facebook"
    t.string "name"
    t.string "phone"
    t.string "state"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
