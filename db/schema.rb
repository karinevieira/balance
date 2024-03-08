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

ActiveRecord::Schema[7.1].define(version: 2024_03_08_203532) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accelerometer_metrics", force: :cascade do |t|
    t.text "type"
    t.integer "time_in_min"
    t.text "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_accelerometer_metrics_on_user_id"
  end

  create_table "exercise_metrics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "name"
    t.integer "steps"
    t.integer "distance_in_m"
    t.text "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration_in_min"
    t.index ["user_id"], name: "index_exercise_metrics_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "weight", null: false
    t.integer "height_in_cm", null: false
    t.integer "workout_in_min", null: false
    t.integer "workout_days_frequency", null: false
    t.boolean "active_lifestyle", default: false, null: false
    t.text "gender"
    t.text "physical_activities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accelerometer_metrics", "users"
  add_foreign_key "exercise_metrics", "users"
  add_foreign_key "user_profiles", "users"
end
