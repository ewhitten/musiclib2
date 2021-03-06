# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131214092535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", using: :btree

  create_table "artists_volumes", force: true do |t|
    t.integer  "artist_id"
    t.integer  "volume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree

  create_table "tracks", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "artist_id"
    t.integer  "volume_id"
    t.integer  "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["artist_id"], name: "index_tracks_on_artist_id", using: :btree
  add_index "tracks", ["category_id"], name: "index_tracks_on_category_id", using: :btree
  add_index "tracks", ["index"], name: "index_tracks_on_index", using: :btree
  add_index "tracks", ["volume_id"], name: "index_tracks_on_volume_id", using: :btree

  create_table "volumes", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "category_id"
    t.integer  "year"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volumes", ["artist_id"], name: "index_volumes_on_artist_id", using: :btree
  add_index "volumes", ["category_id"], name: "index_volumes_on_category_id", using: :btree
  add_index "volumes", ["location"], name: "index_volumes_on_location", using: :btree

end
