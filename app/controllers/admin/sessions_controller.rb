class Admin::SessionsController < Devise::SessionsController
  # レイアウト設定
  layout 'admin/application'

  # ログイン/ログアウト後の遷移先設定
  def after_sign_in_path_for(_resource)
    admin_root_path
  end

  def after_sign_out_path_for(_resource)
    admin_root_path
  end
end
