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

ActiveRecord::Schema.define(version: 2021_09_02_082114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blogposts", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.string "text", null: false
    t.string "status", null: false
    t.boolean "meangful", default: false
    t.decimal "avg_rating", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "region_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_blogposts_on_category_id"
    t.index ["region_id"], name: "index_blogposts_on_region_id"
    t.index ["title"], name: "index_blogposts_on_title"
    t.index ["user_id"], name: "index_blogposts_on_user_id"
  end

  create_table "blogposts_tags", id: false, force: :cascade do |t|
    t.bigint "blogpost_id", null: false
    t.bigint "tag_id", null: false
  end

  create_table "blogposts_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "blogpost_id", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "comments", force: :cascade do |t|
    t.string "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text"], name: "index_comments_on_text"
  end

  create_table "ratings", force: :cascade do |t|
    t.decimal "stars"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_regions_on_name"
  end

  create_table "rss_blogposts", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.string "text", null: false
    t.string "link", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_rss_blogposts_on_title"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname"
    t.string "email", null: false
    t.string "password", null: false
    t.decimal "role"
    t.boolean "hide_views", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["nickname"], name: "index_users_on_nickname"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blogposts", "categories"
  add_foreign_key "blogposts", "regions"
  add_foreign_key "blogposts", "users"
end
