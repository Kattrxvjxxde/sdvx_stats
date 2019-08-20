class GenerateMusicsFromCharts
  def exec
    pp '譜面データから楽曲データ作成 開始'

    ActiveRecord::Base.transaction do
      Chart.find_each do |chart|
        params = {
          musicname:  chart.musicname,
          artistname: chart.artistname
        }

        # 楽曲データがなければ作成
        if Music.find_by(params).blank?
          music = Music.create!(params)
          pp "#{music.musicname} 作成"
        end

        music_id = Music.find_by(params).id
        chart.update!(music_id: music_id)
      end
    end

    pp '譜面データから楽曲データ作成 終了'
  end
end

GenerateMusicsFromCharts.new.exec
