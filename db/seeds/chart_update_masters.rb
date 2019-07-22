pp '譜面更新日マスタ 作成'

if ChartUpdateMaster.find_by(id: 1)
  pp '既に存在しているためスキップ'
else
  pp ChartUpdateMaster.create!(id: 1, update_date: Date.new(2018, 1, 18))
end
