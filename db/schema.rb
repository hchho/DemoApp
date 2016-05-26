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

ActiveRecord::Schema.define(version: 20160526014857) do

  create_table "demos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.text     "content"
    t.string   "materials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "demos", ["subject_id"], name: "index_demos_on_subject_id"
  add_index "demos", ["user_id", "subject_id", "created_at"], name: "index_demos_on_user_id_and_subject_id_and_created_at"
  add_index "demos", ["user_id"], name: "index_demos_on_user_id"

  create_table "favourites", force: :cascade do |t|
    t.integer  "favourited_id"
    t.string   "favourited_type"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "favourites", ["favourited_type", "favourited_id"], name: "index_favourites_on_favourited_type_and_favourited_id"
  add_index "favourites", ["user_id"], name: "index_favourites_on_user_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

end
