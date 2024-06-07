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

ActiveRecord::Schema[7.0].define(version: 2024_06_03_145224) do
  create_table "boards", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "song_id"
    t.string "username"
    t.text "post", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_boards_on_song_id"
  end

  create_table "responses", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "song_id"
    t.text "lyrics_response", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_responses_on_song_id"
  end

  create_table "songs", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "lyrics", null: false
    t.string "songer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
