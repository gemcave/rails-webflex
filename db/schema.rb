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

ActiveRecord::Schema.define(version: 2019_10_20_164824) do

  create_table "characterizations", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_characterizations_on_genre_id"
    t.index ["movie_id"], name: "index_characterizations_on_movie_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_favourites_on_movie_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.decimal "total_gross"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.date "released_on"
    t.string "cast"
    t.string "director"
    t.string "duration"
    t.string "image_file_name", default: ""
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.integer "stars"
    t.text "comment"
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
  end

  add_foreign_key "characterizations", "genres"
  add_foreign_key "characterizations", "movies"
  add_foreign_key "favourites", "movies"
  add_foreign_key "favourites", "users"
  add_foreign_key "reviews", "movies"
end
