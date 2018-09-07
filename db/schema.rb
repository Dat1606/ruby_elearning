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

ActiveRecord::Schema.define(version: 2018_08_22_100621) do

  create_table "answers", force: :cascade do |t|
    t.integer "vocabulary_id"
    t.text "content"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vocabulary_id"], name: "index_answers_on_vocabulary_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "course_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "user_lesson_id"
    t.integer "vocabulary_id"
    t.integer "answer_id"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_results_on_answer_id"
    t.index ["user_lesson_id"], name: "index_results_on_user_lesson_id"
    t.index ["vocabulary_id"], name: "index_results_on_vocabulary_id"
  end

  create_table "user_lessons", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
    t.integer "percent", default: 0
    t.boolean "status", default: false
    t.integer "point", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_user_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_user_lessons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "avatar"
    t.integer "total_point"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vocabularies", force: :cascade do |t|
    t.integer "lesson_id"
    t.string "name"
    t.integer "status", default: 0
    t.text "example"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_vocabularies_on_lesson_id"
  end

end
