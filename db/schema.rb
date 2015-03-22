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

ActiveRecord::Schema.define(version: 20150322154618) do

  create_table "games", force: true do |t|
    t.integer  "user_id"
    t.string   "venue"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "sport_id"
    t.string   "notes"
    t.integer  "points"
    t.boolean  "public"
    t.integer  "playercount"
    t.string   "experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  add_index "games", ["sport_id"], name: "index_games_on_sport_id"
  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "invitations", force: true do |t|
    t.integer  "games_id"
    t.integer  "userto"
    t.integer  "userfrom"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.integer  "games_id"
    t.integer  "user1"
    t.integer  "user2"
    t.integer  "user3"
    t.integer  "user4"
    t.integer  "user5"
    t.integer  "user6"
    t.integer  "user7"
    t.integer  "user8"
    t.integer  "user9"
    t.integer  "user10"
    t.integer  "user11"
    t.integer  "user12"
    t.integer  "user13"
    t.integer  "user14"
    t.integer  "user15"
    t.integer  "user16"
    t.integer  "user17"
    t.integer  "user18"
    t.integer  "user19"
    t.integer  "user20"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["games_id"], name: "index_players_on_games_id"

  create_table "sports", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "gender"
    t.datetime "birthday"
    t.string   "fname"
    t.string   "lname"
    t.integer  "points"
    t.string   "hometown_zip"
    t.string   "image_url"
    t.string   "bio"
    t.string   "favorite_sport"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
