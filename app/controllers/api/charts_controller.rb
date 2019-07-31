class Api::ChartsController < ApplicationController
  include ApiConcern

  REQUIRED_PARAMS = %i[musicname artistname difficult].freeze

  before_action :validate_params, only: [:create]

  # 作成と更新
  def create
    chart = Chart.find_by(chart_params.slice(*REQUIRED_PARAMS))

    if chart.blank?
      chart = Chart.create!(chart_params)
      render_success(chart, :create)
    else
      chart.update!(chart_params.slice(:puc_count))
      render_success(chart, :update)
    end
  rescue
    render_error(500)
  end

  private

  def chart_params
    params.permit(
      :musicname,
      :artistname,
      :difficult,
      :level,
      :puc_count,
    )
  end

  def validate_params
    REQUIRED_PARAMS.each do |key|
      return render_error(400) unless chart_params.has_key?(key)
    end
  end
end
