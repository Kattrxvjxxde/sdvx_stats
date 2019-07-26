class Admin::BaseController < ApplicationController
  # レイアウト設定
  layout 'admin/application'

  # 管理者ログイン制御
  before_action :authenticate_admin_user!
end
