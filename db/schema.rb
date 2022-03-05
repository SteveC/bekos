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

ActiveRecord::Schema[7.0].define(version: 2022_03_05_143648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_messages", force: :cascade do |t|
    t.bigint "thread_id", null: false
    t.bigint "user_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thread_id"], name: "index_chat_messages_on_thread_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "chat_threads", force: :cascade do |t|
    t.string "language_code"
    t.bigint "user_ids", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_code"], name: "index_chat_threads_on_language_code", unique: true
    t.index ["user_ids"], name: "index_chat_threads_on_user_ids", using: :gin
  end

  create_table "languages", primary_key: "code", id: :string, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
  end

  create_table "user_chat_statuses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "current_thread_id"
    t.string "manual_status"
    t.datetime "updated_at", precision: nil
    t.index ["current_thread_id"], name: "index_user_chat_statuses_on_current_thread_id"
    t.index ["user_id"], name: "index_user_chat_statuses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest", null: false
    t.string "language_codes", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chat_messages", "chat_threads", column: "thread_id"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "user_chat_statuses", "chat_threads", column: "current_thread_id"
  add_foreign_key "user_chat_statuses", "users"
end
