class ChartUpdate
  require 'csv'
  CHART_INFO_CSV_DIR_PATH = Rails.root.join('datas/chart_info')

  def exec
    pp '譜面情報取り込み 開始'

    target_filename = Dir.entries(CHART_INFO_CSV_DIR_PATH).grep(/\d{8}/).max
    count = 0

    ActiveRecord::Base.transaction do
      CSV.foreach(CHART_INFO_CSV_DIR_PATH.join(target_filename), headers: true) do |row|
        if (target = Chart.find_by(musicname: row['musicname'], difficult: row['difficult'])).present?
          target.update!(puc_count: row['puc_count'])
        else
          Chart.create!(
            musicname: row['musicname'],
            artistname: row['artistname'],
            difficult: row['difficult'],
            level: row['level'],
            puc_count: row['puc_count']
          )
        end

        count += 1
        pp "#{count}件完了" if (count % 100).zero?
      end

      ChartUpdateMaster.find(1).update!(
        update_date: Date.strptime(target_filename.match(/\d{8}/).to_s, '%Y%m%d')
      )
    end

    pp '譜面情報取り込み 終了'
  end
end

ChartUpdate.new.exec
