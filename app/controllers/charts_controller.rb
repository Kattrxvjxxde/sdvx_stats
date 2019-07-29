class ChartsController < ApplicationController
  PER_PAGE = 100

  def puc_count
    # 譜面更新日
    @chart_update_date = ChartUpdateMaster.first.update_date

    # ransack検索クエリ
    @q = Chart.ransack(params[:q])
    # ransackソートクエリ
    @s = params[:q][:s] if params[:q].present?
    # ransack検索クエリ情報
    @q_conditions = @q.conditions.each_with_object({}) do |condition, hash|
      hash[condition.a.first.attr_name] = condition.value
    end
    @q_conditions['level'] = 'ALL' unless @q_conditions.key?('level')
    @q_conditions['difficult'] = Chart.difficult.values unless @q_conditions.key?('difficult')

    # 譜面データ
    @charts = @q.result(distinct: true)
                .page(params[:page])
                .per(PER_PAGE)
    @charts = @charts.order(id: :desc) unless @s.present?

    # PC/SPでページネーションの出力ページ数を変更 PC:5, SP: 2
    @window_size = browser.device.mobile? ? 2 : 5
  end
end
