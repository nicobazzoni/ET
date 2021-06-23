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

ActiveRecord::Schema.define(version: 2021_06_23_005147) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "alien_planets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "planet_id"
    t.integer "alien_id"
    t.integer "species_id"
    t.index ["alien_id"], name: "index_alien_planets_on_alien_id"
    t.index ["planet_id"], name: "index_alien_planets_on_planet_id"
    t.index ["species_id"], name: "index_alien_planets_on_species_id"
  end

  create_table "aliens", force: :cascade do |t|
    t.integer "threat_level"
    t.boolean "psychic"
    t.string "origin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "spaceship_id"
    t.integer "species_id"
    t.index ["spaceship_id"], name: "index_aliens_on_spaceship_id"
    t.index ["species_id"], name: "index_aliens_on_species_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "species_id"
    t.index ["species_id"], name: "index_planets_on_species_id"
  end

  create_table "spaceships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "alien_id"
    t.decimal "speed"
    t.index ["alien_id"], name: "index_spaceships_on_alien_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "planet_id"
    t.integer "power_level"
    t.index ["planet_id"], name: "index_species_on_planet_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "alien_planets", "aliens"
  add_foreign_key "alien_planets", "planets"
  add_foreign_key "alien_planets", "species"
  add_foreign_key "aliens", "spaceships"
  add_foreign_key "aliens", "species"
  add_foreign_key "planets", "species"
  add_foreign_key "spaceships", "aliens"
  add_foreign_key "species", "planets"
end
