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

ActiveRecord::Schema[7.1].define(version: 2025_05_14_212029) do
  create_table "accomodation_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "accomodation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomodation_id"], name: "index_accomodation_users_on_accomodation_id"
    t.index ["user_id", "accomodation_id"], name: "index_accomodation_users_on_user_id_and_accomodation_id", unique: true
    t.index ["user_id"], name: "index_accomodation_users_on_user_id"
  end

  create_table "accomodations", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.string "name"
    t.string "location"
    t.datetime "check_in"
    t.datetime "check_out"
    t.decimal "cost", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_accomodations_on_trip_id"
  end

  create_table "event_users", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.string "rsvp", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "user_id"], name: "index_event_users_on_event_id_and_user_id", unique: true
    t.index ["event_id"], name: "index_event_users_on_event_id"
    t.index ["user_id"], name: "index_event_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "location"
    t.string "type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_users", force: :cascade do |t|
    t.integer "expense_id", null: false
    t.integer "user_id", null: false
    t.decimal "share"
    t.boolean "paid"
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id", "user_id"], name: "index_expense_users_on_expense_id_and_user_id", unique: true
    t.index ["expense_id"], name: "index_expense_users_on_expense_id"
    t.index ["user_id"], name: "index_expense_users_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "paid_by_user_id", null: false
    t.integer "expenseable_id", null: false
    t.text "description"
    t.decimal "amount"
    t.date "due_date"
    t.string "currency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expenseable_id"], name: "index_expenses_on_expenseable_id"
    t.index ["paid_by_user_id"], name: "index_expenses_on_paid_by_user_id"
    t.index ["trip_id", "paid_by_user_id"], name: "index_expenses_on_trip_id_and_paid_by_user_id", unique: true
    t.index ["trip_id"], name: "index_expenses_on_trip_id"
  end

  create_table "transportation_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "transportation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transportation_id"], name: "index_transportation_users_on_transportation_id"
    t.index ["user_id", "transportation_id"], name: "index_transportation_users_on_user_id_and_transportation_id", unique: true
    t.index ["user_id"], name: "index_transportation_users_on_user_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.integer "trips_id", null: false
    t.string "mode", null: false
    t.string "origin"
    t.string "destination"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal "cost", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trips_id"], name: "index_transportations_on_trips_id"
  end

  create_table "trip_accomodations", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "accomodation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomodation_id"], name: "index_trip_accomodations_on_accomodation_id"
    t.index ["trip_id", "accomodation_id"], name: "index_trip_accomodations_on_trip_id_and_accomodation_id", unique: true
    t.index ["trip_id"], name: "index_trip_accomodations_on_trip_id"
  end

  create_table "trip_events", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_trip_events_on_event_id"
    t.index ["trip_id", "event_id"], name: "index_trip_events_on_trip_id_and_event_id", unique: true
    t.index ["trip_id"], name: "index_trip_events_on_trip_id"
  end

  create_table "trip_transportations", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "transportation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transportation_id"], name: "index_trip_transportations_on_transportation_id"
    t.index ["trip_id", "transportation_id"], name: "index_trip_transportations_on_trip_id_and_transportation_id", unique: true
    t.index ["trip_id"], name: "index_trip_transportations_on_trip_id"
  end

  create_table "trip_users", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "user_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id", "user_id"], name: "index_trip_users_on_trip_id_and_user_id", unique: true
    t.index ["trip_id"], name: "index_trip_users_on_trip_id"
    t.index ["user_id"], name: "index_trip_users_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accomodation_users", "accomodations"
  add_foreign_key "accomodation_users", "users"
  add_foreign_key "accomodations", "trips"
  add_foreign_key "event_users", "events"
  add_foreign_key "event_users", "users"
  add_foreign_key "expense_users", "expenses"
  add_foreign_key "expense_users", "users"
  add_foreign_key "expenses", "expenseables"
  add_foreign_key "expenses", "paid_by_users"
  add_foreign_key "expenses", "trips"
  add_foreign_key "transportation_users", "transportations"
  add_foreign_key "transportation_users", "users"
  add_foreign_key "transportations", "trips", column: "trips_id"
  add_foreign_key "trip_accomodations", "accomodations"
  add_foreign_key "trip_accomodations", "trips"
  add_foreign_key "trip_events", "events"
  add_foreign_key "trip_events", "trips"
  add_foreign_key "trip_transportations", "transportations"
  add_foreign_key "trip_transportations", "trips"
  add_foreign_key "trip_users", "trips"
  add_foreign_key "trip_users", "users"
end
