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

ActiveRecord::Schema[7.1].define(version: 2025_05_14_182921) do
  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "transportation_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "transportation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transportation_id"], name: "index_transportation_users_on_transportation_id"
    t.index ["user_id"], name: "index_transportation_users_on_user_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.string "mode"
    t.string "origin"
    t.string "destination"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_transportations_on_expense_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "location"
    t.string "description"
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.integer "transportation_id", null: false
    t.integer "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_trips_on_event_id"
    t.index ["expense_id"], name: "index_trips_on_expense_id"
    t.index ["transportation_id"], name: "index_trips_on_transportation_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "transportation_users", "transportations"
  add_foreign_key "transportation_users", "users"
  add_foreign_key "transportations", "expenses"
  add_foreign_key "trips", "events"
  add_foreign_key "trips", "expenses"
  add_foreign_key "trips", "transportations"
  add_foreign_key "trips", "users"
end
