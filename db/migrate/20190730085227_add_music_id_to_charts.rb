class AddMusicIdToCharts < ActiveRecord::Migration[5.2]
  def change
    add_column :charts, :music_id, :integer, comment: '楽曲ID', after: :artistname
  end
end
