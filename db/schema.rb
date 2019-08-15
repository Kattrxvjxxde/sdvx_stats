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

ActiveRecord::Schema.define(version: 2019_08_15_031253) do

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

  create_table "players", force: :cascade do |t|
    t.integer "status", default: 0, null: false, comment: "ステータス"
    t.string "rival_id", null: false, comment: "ライバルID"
    t.string "name", null: false, comment: "プレイヤー名"
    t.integer "volforce", null: false, comment: "ボルフォース"
    t.integer "puc_diff_nov", comment: "PUC数(NOV)"
    t.integer "puc_diff_adv", comment: "PUC数(ADV)"
    t.integer "puc_diff_exh", comment: "PUC数(EXH)"
    t.integer "puc_diff_mxm", comment: "PUC数(MXM)"
    t.integer "puc_diff_fx", comment: "PUC数(その他)"
    t.integer "puc_lv_1", comment: "PUC数(Lv01)"
    t.integer "puc_lv_2", comment: "PUC数(Lv02)"
    t.integer "puc_lv_3", comment: "PUC数(Lv03)"
    t.integer "puc_lv_4", comment: "PUC数(Lv04)"
    t.integer "puc_lv_5", comment: "PUC数(Lv05)"
    t.integer "puc_lv_6", comment: "PUC数(Lv06)"
    t.integer "puc_lv_7", comment: "PUC数(Lv07)"
    t.integer "puc_lv_8", comment: "PUC数(Lv08)"
    t.integer "puc_lv_9", comment: "PUC数(Lv09)"
    t.integer "puc_lv_10", comment: "PUC数(Lv10)"
    t.integer "puc_lv_11", comment: "PUC数(Lv11)"
    t.integer "puc_lv_12", comment: "PUC数(Lv12)"
    t.integer "puc_lv_13", comment: "PUC数(Lv13)"
    t.integer "puc_lv_14", comment: "PUC数(Lv14)"
    t.integer "puc_lv_15", comment: "PUC数(Lv15)"
    t.integer "puc_lv_16", comment: "PUC数(Lv16)"
    t.integer "puc_lv_17", comment: "PUC数(Lv17)"
    t.integer "puc_lv_18", comment: "PUC数(Lv18)"
    t.integer "puc_lv_19", comment: "PUC数(Lv19)"
    t.integer "puc_lv_20", comment: "PUC数(Lv20)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "digest_hash", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
