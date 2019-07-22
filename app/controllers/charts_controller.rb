class ChartsController < ApplicationController
  def index
    @chart_update_master = ChartUpdateMaster.first
    @level = 18
    @charts = Chart.where(level: @level).order(puc_count: :desc)
  end
end
