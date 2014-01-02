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

ActiveRecord::Schema.define(version: 20140102154117) do

  create_table "classification", id: false, force: true do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
  end

  add_index "classification", ["genre_id"], name: "genre_id", using: :btree

  create_table "comment", id: false, force: true do |t|
    t.integer   "user_id",  null: false
    t.integer   "movie_id", null: false
    t.timestamp "time",     null: false
    t.text      "content"
  end

  add_index "comment", ["movie_id"], name: "movie_id", using: :btree

  create_table "contribution", id: false, force: true do |t|
    t.integer "movie_id",                  null: false
    t.integer "participant_id",            null: false
    t.boolean "is_actor"
    t.boolean "is_writer"
    t.boolean "is_director"
    t.boolean "is_composer"
    t.string  "roleName",       limit: 50
  end

  add_index "contribution", ["participant_id"], name: "participant_id", using: :btree

  create_table "genre", primary_key: "genre_id", force: true do |t|
    t.string  "name",     limit: 100, null: false
    t.integer "ParentID"
  end

  add_index "genre", ["ParentID"], name: "ParentID", using: :btree

  create_table "genrelookup", primary_key: "new_genre_id", force: true do |t|
    t.integer "10_genre_id"
    t.integer "12_genre_id"
    t.integer "13_genre_id"
  end

  create_table "loan", primary_key: "loa_id", force: true do |t|
    t.timestamp "borrow_date",     null: false
    t.datetime  "sup_return_date", null: false
    t.datetime  "return_date"
    t.integer   "wis_id"
    t.integer   "med_id"
  end

  add_index "loan", ["med_id"], name: "med_id", using: :btree
  add_index "loan", ["wis_id"], name: "wis_id", using: :btree

  create_table "medium", primary_key: "med_id", force: true do |t|
    t.string  "med_type",      limit: 5, null: false
    t.integer "movie_id"
    t.integer "medium_set_id"
  end

  add_index "medium", ["movie_id"], name: "movie_id", using: :btree

  create_table "mediumlookup", primary_key: "new_medium_id", force: true do |t|
    t.integer "12_medium_id"
  end

  create_table "movie", primary_key: "movie_id", force: true do |t|
    t.string  "title",          limit: 128,                          null: false
    t.integer "release_day"
    t.integer "release_month"
    t.integer "release_year"
    t.integer "duration",       limit: 2
    t.decimal "budget",                     precision: 15, scale: 2
    t.decimal "revenue",                    precision: 15, scale: 2
    t.text    "description"
    t.integer "ageRestriction"
  end

  create_table "movie_participant", primary_key: "participant_id", force: true do |t|
    t.string "name",       limit: 128, null: false
    t.string "birthplace", limit: 128
    t.date   "birthdate"
  end

  create_table "movielookup", primary_key: "new_movie_id", force: true do |t|
    t.integer "10_movie_id"
    t.integer "12_movie_id"
    t.integer "13_movie_id"
  end

  create_table "movieparticipantlookup", primary_key: "new_movieparticipant_id", force: true do |t|
    t.integer "10_movieparticipant_id"
    t.integer "12_movieparticipant_id"
    t.integer "13_movieparticipant_id"
  end

  create_table "rating", id: false, force: true do |t|
    t.integer   "movie_id",    null: false
    t.integer   "user_id",     null: false
    t.integer   "ratingValue"
    t.timestamp "time",        null: false
  end

  add_index "rating", ["user_id"], name: "user_id", using: :btree

  create_table "recension", force: true do |t|
    t.integer "movie_id",   null: false
    t.integer "website_id", null: false
    t.date    "time",       null: false
    t.text    "content"
  end

  add_index "recension", ["website_id"], name: "website_id", using: :btree

  create_table "user", primary_key: "user_id", force: true do |t|
    t.string "user_name",  limit: 128
    t.string "first_name", limit: 128
    t.string "last_name",  limit: 128
    t.string "gender",     limit: 6
    t.date   "dob"
    t.string "email",      limit: 250
    t.string "phone",      limit: 20
    t.string "address",    limit: 300
  end

  create_table "userlookup", primary_key: "new_user_id", force: true do |t|
    t.integer "10_user_id"
    t.integer "12_user_id"
    t.integer "13_user_id"
  end

  create_table "website", primary_key: "website_id", force: true do |t|
    t.string "name", limit: 45
    t.string "url",  limit: 45
  end

  create_table "websitelookup", primary_key: "new_website_id", force: true do |t|
    t.integer "10_website_id"
  end

  create_table "wishlist", primary_key: "wis_id", force: true do |t|
    t.timestamp "wis_date", null: false
    t.integer   "user_id"
    t.integer   "movie_id"
  end

  add_index "wishlist", ["movie_id"], name: "movie_id", using: :btree
  add_index "wishlist", ["user_id"], name: "user_id", using: :btree

  create_table "wishlistlookup", primary_key: "new_wishlist_id", force: true do |t|
    t.integer "12_wishlist_id"
  end

end
