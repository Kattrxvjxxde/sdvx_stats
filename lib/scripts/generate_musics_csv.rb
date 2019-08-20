class GenerateMusicsCsv
  require 'csv'

  def exec
    pp '楽曲データCSV作成 開始'

    CSV.open(musics_csv_output_path, 'w') do |csv|
      Music.pluck(:musicname).each do |musicname|
        csv << [musicname]
      end
    end

    pp '楽曲データCSV作成 終了'
  end

  private

  def musics_csv_output_path
    Rails.root.join "datas/musics_csv/musics_csv_#{Time.now.strftime('%Y%m%d')}.csv"
  end
end

GenerateMusicsCsv.new.exec
