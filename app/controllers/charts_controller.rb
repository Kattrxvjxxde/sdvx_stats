class ChartsController < ApplicationController
  PER_PAGE = 100

  def puc_count
    # 譜面更新日マスタ
    @chart_update_master = ChartUpdateMaster.first

    # ransack検索クエリ
    @q = Chart.ransack(params[:q])
    # ransackソートクエリ
    @s = params[:q][:s] if params[:q].present?

    # 譜面データ
    @charts = @q.result(distinct: true)
                .page(params[:page])
                .per(PER_PAGE)
    @charts = @charts.order(id: :desc) unless @s.present?

    # PC/SPでページネーションの出力ページ数を変更 PC:5, SP: 2
    @window_size = browser.device.mobile? ? 2 : 5
  end
end
