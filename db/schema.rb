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

ActiveRecord::Schema.define(version: 2021_10_19_203344) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.boolean "favorite"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manga_genres", force: :cascade do |t|
    t.integer "manga_id"
    t.integer "genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_manga_genres_on_genre_id"
    t.index ["manga_id"], name: "index_manga_genres_on_manga_id"
  end

  create_table "manga_lists", force: :cascade do |t|
    t.integer "manga_id"
    t.integer "list_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_manga_lists_on_list_id"
    t.index ["manga_id"], name: "index_manga_lists_on_manga_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.text "synopsis"
    t.float "score"
    t.string "date_start"
    t.string "date_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "written_review"
    t.integer "rating"
    t.integer "manga_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manga_id"], name: "index_reviews_on_manga_id"
  end

  add_foreign_key "manga_genres", "genres"
  add_foreign_key "manga_genres", "mangas"
  add_foreign_key "manga_lists", "lists"
  add_foreign_key "manga_lists", "mangas"
  add_foreign_key "reviews", "mangas"
end
