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

ActiveRecord::Schema.define(version: 20160303091121) do

  create_table "activties", force: :cascade do |t|
    t.string   "action",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "activties", ["user_id", "created_at"], name: "index_activties_on_user_id_and_created_at", using: :btree
  add_index "activties", ["user_id"], name: "index_activties_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "cat_name",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["cat_name"], name: "index_categories_on_cat_name", using: :btree

  create_table "lesson_word_answers", force: :cascade do |t|
    t.integer  "lesson_id",      limit: 4
    t.integer  "word_id",        limit: 4
    t.integer  "word_answer_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "lesson_word_answers", ["lesson_id", "word_answer_id"], name: "index_lesson_word_answers_on_lesson_id_and_word_answer_id", using: :btree
  add_index "lesson_word_answers", ["lesson_id", "word_id"], name: "index_lesson_word_answers_on_lesson_id_and_word_id", using: :btree
  add_index "lesson_word_answers", ["lesson_id"], name: "index_lesson_word_answers_on_lesson_id", using: :btree
  add_index "lesson_word_answers", ["word_answer_id"], name: "index_lesson_word_answers_on_word_answer_id", using: :btree
  add_index "lesson_word_answers", ["word_id"], name: "index_lesson_word_answers_on_word_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "correct_item",  limit: 4
    t.integer  "total_item",    limit: 4
    t.datetime "finished_date"
    t.integer  "user_id",       limit: 4
    t.integer  "category_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "lessons", ["category_id"], name: "index_lessons_on_category_id", using: :btree
  add_index "lessons", ["user_id", "category_id"], name: "index_lessons_on_user_id_and_category_id", using: :btree
  add_index "lessons", ["user_id"], name: "index_lessons_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "admin"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree

  create_table "word_answers", force: :cascade do |t|
    t.string   "label",      limit: 255
    t.boolean  "correct"
    t.integer  "word_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "word_answers", ["word_id", "label", "correct"], name: "index_word_answers_on_word_id_and_label_and_correct", unique: true, using: :btree
  add_index "word_answers", ["word_id", "label"], name: "index_word_answers_on_word_id_and_label", using: :btree
  add_index "word_answers", ["word_id"], name: "index_word_answers_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "word",        limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "words", ["category_id", "word"], name: "index_words_on_category_id_and_word", unique: true, using: :btree
  add_index "words", ["category_id"], name: "index_words_on_category_id", using: :btree
  add_index "words", ["word"], name: "index_words_on_word", using: :btree

  add_foreign_key "activties", "users"
  add_foreign_key "lesson_word_answers", "lessons"
  add_foreign_key "lesson_word_answers", "word_answers"
  add_foreign_key "lesson_word_answers", "words"
  add_foreign_key "lessons", "categories"
  add_foreign_key "lessons", "users"
  add_foreign_key "word_answers", "words"
  add_foreign_key "words", "categories"
end
