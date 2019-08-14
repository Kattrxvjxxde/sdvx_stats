# -*- coding: utf-8 -*-
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 30

# ホットデプロイをするか？
preload_app true # 更新時ダウンタイム無し

app_path = '/var/rails/sdvx_stats/current'
working_directory "#{app_path}"

# nginxと連携するための設定
# リクエストを受け取る ポート番号を指定
listen '/var/rails/sdvx_stats/shared/tmp/sockets/unicorn.sock'
# PIDの管理ディレクトリ
pid '/var/rails/sdvx_stats/shared/tmp/pids/unicorn.pid'

stdout_path "#{app_path}/log/unicorn.log"
stderr_path "#{app_path}/log/unicorn.log"

# ログの出力パス
stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

# フォーク前に行うことを定義
before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

# フォーク後に行うことを定義
after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
