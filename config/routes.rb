Rails.application.routes.draw do
  ##### フロント #####

  # 譜面
  namespace :charts do
    get :puc_count
    post :puc_count
  end

  # プレイヤー
  namespace :players do
    get :volforce_rank
  end

  # root
  root 'charts#puc_count'

  ##### 管理画面 #####

  # 管理画面ログイン
  devise_for :admin_users,
             skip: :registration,
             path: :admin,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: {
               sessions: 'admin/sessions'
             }

  # 管理画面
  namespace  :admin do
    # root
    root 'top#index'
  end
end
