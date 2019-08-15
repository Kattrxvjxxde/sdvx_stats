class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :status,   null: false, default: 0, comment: 'ステータス'
      t.string  :rival_id, null: false, comment: 'ライバルID'
      t.string  :name,     null: false, comment: 'プレイヤー名'
      t.integer :volforce, null: false, comment: 'ボルフォース'
      t.integer :puc_diff_nov, comment: 'PUC数(NOV)'
      t.integer :puc_diff_adv, comment: 'PUC数(ADV)'
      t.integer :puc_diff_exh, comment: 'PUC数(EXH)'
      t.integer :puc_diff_mxm, comment: 'PUC数(MXM)'
      t.integer :puc_diff_fx,  comment: 'PUC数(その他)'
      t.integer :puc_lv_1,  comment: 'PUC数(Lv01)'
      t.integer :puc_lv_2,  comment: 'PUC数(Lv02)'
      t.integer :puc_lv_3,  comment: 'PUC数(Lv03)'
      t.integer :puc_lv_4,  comment: 'PUC数(Lv04)'
      t.integer :puc_lv_5,  comment: 'PUC数(Lv05)'
      t.integer :puc_lv_6,  comment: 'PUC数(Lv06)'
      t.integer :puc_lv_7,  comment: 'PUC数(Lv07)'
      t.integer :puc_lv_8,  comment: 'PUC数(Lv08)'
      t.integer :puc_lv_9,  comment: 'PUC数(Lv09)'
      t.integer :puc_lv_10, comment: 'PUC数(Lv10)'
      t.integer :puc_lv_11, comment: 'PUC数(Lv11)'
      t.integer :puc_lv_12, comment: 'PUC数(Lv12)'
      t.integer :puc_lv_13, comment: 'PUC数(Lv13)'
      t.integer :puc_lv_14, comment: 'PUC数(Lv14)'
      t.integer :puc_lv_15, comment: 'PUC数(Lv15)'
      t.integer :puc_lv_16, comment: 'PUC数(Lv16)'
      t.integer :puc_lv_17, comment: 'PUC数(Lv17)'
      t.integer :puc_lv_18, comment: 'PUC数(Lv18)'
      t.integer :puc_lv_19, comment: 'PUC数(Lv19)'
      t.integer :puc_lv_20, comment: 'PUC数(Lv20)'

      t.timestamps
    end
  end
end
