require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PF
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = "Asia/Tokyo" #日本時間に設定
    config.i18n.default_locale = :ja #エラーメッセージ日本語化
    #.ymlにカラムやdeviseの日本語の定義をすれば、日本語で表示される。今回は実装しない。(githubなどにソースコードあり。)

  end
end
