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

ActiveRecord::Schema.define(version: 2019_07_31_012834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "chart_update_masters", force: :cascade do |t|
    t.date "update_date", comment: "譜面更新バッチ実行日"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charts", force: :cascade do |t|
    t.string "musicname", comment: "楽曲名"
    t.string "artistname", comment: "アーティスト名"
    t.integer "difficult", comment: "難易度"
    t.integer "level", comment: "レベル"
    t.integer "puc_count", comment: "PUC人数s"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "music_id", comment: "楽曲ID"
  end

  create_table "musics", force: :cascade do |t|
    t.string "musicname", null: false, comment: "楽曲名"
    t.string "artistname", null: false, comment: "作曲者"
    t.integer "updated_version", comment: "初出バージョン"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "digest_hash", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
