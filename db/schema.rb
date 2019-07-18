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

ActiveRecord::Schema.define(version: 20190718063622) do

  create_table "article_collections", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_collections_on_article_id"
    t.index ["user_id"], name: "index_article_collections_on_user_id"
  end

  create_table "article_comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_comments_on_article_id"
    t.index ["user_id"], name: "index_article_comments_on_user_id"
  end

  create_table "article_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_likes_on_article_id"
    t.index ["user_id"], name: "index_article_likes_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "descriptions"
    t.string "cover_img"
    t.string "content", limit: 429496
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count_of_article_likes"
    t.integer "count_of_article_collections"
    t.integer "count_of_article_comments"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "nick_name"
    t.string "password"
    t.string "avatars"
    t.string "email"
    t.string "mobile"
    t.string "qq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count_of_article_likes"
    t.integer "count_of_article_collections"
    t.integer "count_of_article_comments"
  end

end
