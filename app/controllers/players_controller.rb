class PlayersController < ApplicationController
  def volforce_rank
    @volforce_ranks_arr = Player.order(
      volforce: :desc,
      puc_lv_20: :desc,
      puc_lv_19: :desc,
      puc_lv_18: :desc
    ).pluck(:name, :volforce)

    @volforce_rank_pages = Kaminari.paginate_array(@volforce_ranks_arr)
                                   .page(params[:page]).per(100)

    # PC/SPでページネーションの出力ページ数を変更 PC:5, SP: 2
    @window_size = browser.device.mobile? ? 2 : 5
  end
end
