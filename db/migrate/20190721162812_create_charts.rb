class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.string :musicname,  comment: '楽曲名'
      t.string :artistname, comment: 'アーティスト名'
      t.integer :difficult, comment: '難易度'
      t.integer :level,     comment: 'レベル'
      t.integer :puc_count, comment: 'PUC人数'

      t.timestamps
    end
  end
end
