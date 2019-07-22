class ChartsController < ApplicationController
  def index
    @chart_update_master = ChartUpdateMaster.first
    @charts = Chart.where(level: 18).order(puc_count: :desc)
  end
end
