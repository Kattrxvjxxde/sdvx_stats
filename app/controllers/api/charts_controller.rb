class Api::ChartsController < ApplicationController
  # 作成
  def create
    chart = Chart.new(chart_params)
  end

  private

  def chart_params
    params.require(:chart).permit(:musicname)
  end
end
