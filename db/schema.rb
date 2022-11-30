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

ActiveRecord::Schema[7.0].define(version: 2022_11_30_154146) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "abbrev"
    t.index ["slug"], name: "index_books_on_slug", unique: true
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "number"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_chapters_on_book_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "song_lines", force: :cascade do |t|
    t.string "value"
    t.bigint "song_part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_part_id"], name: "index_song_lines_on_song_part_id"
  end

  create_table "song_parts", force: :cascade do |t|
    t.string "name"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_song_parts_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_songs_on_slug", unique: true
  end

  create_table "verse_reference_verses", force: :cascade do |t|
    t.bigint "verse_id"
    t.bigint "reference_verse_id"
    t.index ["reference_verse_id"], name: "index_verse_reference_verses_on_reference_verse_id"
    t.index ["verse_id"], name: "index_verse_reference_verses_on_verse_id"
  end

  create_table "verses", force: :cascade do |t|
    t.bigint "chapter_id"
    t.integer "number"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference_name"
    t.index ["chapter_id"], name: "index_verses_on_chapter_id"
  end

end
