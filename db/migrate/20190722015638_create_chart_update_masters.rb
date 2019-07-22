class CreateChartUpdateMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :chart_update_masters do |t|
      t.date :update_date, comment: '譜面更新バッチ実行日'

      t.timestamps
    end
  end
end
