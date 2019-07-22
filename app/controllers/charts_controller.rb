class ChartsController < ApplicationController
  PER_PAGE = 100.freeze

  def puc_count
    @chart_update_master = ChartUpdateMaster.first

    @q = Chart.ransack(params[:q])
    @charts = @q.result(distinct: true)
                .order(puc_count: :desc)
                .order(id: :asc)
                .page(params[:page])
                .per(PER_PAGE)
  end
end
