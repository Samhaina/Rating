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

ActiveRecord::Schema.define(version: 20170408202228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "rating"
    t.float    "vnovikov_rating"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "tournament_id"
    t.integer  "place"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "points"
    t.float    "player_tournament_rating"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "title"
    t.integer  "number_of_participants"
    t.date     "date_start"
    t.date     "date_end"
    t.string   "city"
    t.integer  "number_of_rounds"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "ema"
    t.float    "k_nonresidents"
    t.float    "k_sum"
    t.float    "k_fading"
    t.integer  "number_of_days"
  end

end
