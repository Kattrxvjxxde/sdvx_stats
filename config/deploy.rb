# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "sdvx_stats"
set :repo_url, "https://5fcb3193c6f7b64157984c410a157b91d353bcae:@github.com/Kattrxvjxxde/sdvx_stats.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/rails/sdvx_stats"

set :user, 'ec2-user'
set :group, 'wheel'

set :rbenv_type, :user  # rbenvをシステムにインストールした or ユーザーローカルにインストールした
set :rbenv_ruby, '2.6.3' # サーバで利用するrubyのバージョンを指定
set :rbenv_path, '/home/ec2-user/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
set :linked_files, %w{ config/database.yml config/credentials.yml.enc config/master.key }

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
set :linked_dirs,  %w{ bin log tmp/pids tmp/sockets tmp/cache vender/bundle }

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3
set :deploy_via, :remote_cache

set :log_level, :debug
set :pty, true

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
 desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :mkdir, '-p', release_path.join('tmp')
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'upload important files'
  task :upload do
    on roles(:app) do |host|
      execute :sudo, :mkdir, '-p', "#{shared_path}/config"
      execute :sudo, :chown, '-R', "#{fetch(:user)}:#{fetch(:group)}", deploy_to
      upload!('config/database.yml', "#{shared_path}/config/database.yml")
      upload!('config/credentials.yml.enc', "#{shared_path}/config/credentials.yml.enc")
      upload!('config/master.key', "#{shared_path}/config/master.key")
    end
  end

  after :restart, :clear_cache do
   on roles(:web), in: :groups, limit: 3, wait: 10 do
    within release_path do
      execute :rm, '-rf', release_path.join('tmp/cache')
    end
   end
  end

  before :started,   'deploy:upload'
  after  :finishing, 'deploy:cleanup'

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end