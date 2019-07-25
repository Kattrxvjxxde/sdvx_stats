class ChartsController < ApplicationController
  PER_PAGE = 100

  def puc_count
    @chart_update_master = ChartUpdateMaster.first

    # TODO: ストロングパラメータ実装
    @q = Chart.ransack(params[:q])
    @s = params[:q][:s] if params[:q].present?
    @charts = @q.result(distinct: true)
                .page(params[:page])
                .per(PER_PAGE)
    @charts = @charts.order(id: :desc) unless @s.present?
  end
end
