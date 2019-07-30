class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string  :musicname,  null: false,  comment: '楽曲名'
      t.string  :artistname, null:false,   comment: '作曲者'
      t.integer :updated_version,          comment: '初出バージョン'

      t.timestamps
    end
  end
end
