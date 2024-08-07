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

ActiveRecord::Schema.define(version: 2021_05_30_213431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "harvested_products", force: :cascade do |t|
    t.bigint "harvest_id"
    t.bigint "product_id"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_name"
    t.index ["harvest_id"], name: "index_harvested_products_on_harvest_id"
    t.index ["product_id"], name: "index_harvested_products_on_product_id"
  end

  create_table "harvests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "offering_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offering_id"], name: "index_harvests_on_offering_id"
    t.index ["user_id"], name: "index_harvests_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offerings", force: :cascade do |t|
    t.boolean "published"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "location_id"
    t.datetime "closes_at"
    t.index ["location_id"], name: "index_offerings_on_location_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "offering_id"
    t.bigint "product_id"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_name"
    t.index ["offering_id"], name: "index_offers_on_offering_id"
    t.index ["product_id"], name: "index_offers_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "location_id"
    t.integer "items_per_harvest"
    t.boolean "active", default: true
    t.string "role", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "harvests", "offerings"
  add_foreign_key "harvests", "users"
  add_foreign_key "offerings", "locations"
  add_foreign_key "users", "locations"
end
