require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SdvxStats
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # タイムゾーン設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # 辞書設定
    config.i18n.default_locale = :ja

    # vendor配下のassetsをパスに追加
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'images')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'javascripts')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'stylesheets')
    Rails.application.config.assets.precompile += %w[*.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.gif]

    # generateコマンドで作成されるファイルの設定
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
    end
  end
end
