require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LikeContentServer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.active_record.default_timezone = :local
    config.time_zone = "Beijing"

    # config.i18n.load_path += Dir[Rails.root.join("config", "locales", "*.{rb,yml}").to_s]
    # config.i18n.default_locale = "zh-CN"

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*"
        resource "/api/*", headers: :any, methods: [:get, :post, :put, :delete, :patch, :options]
      end
    end

    config.generators do |generator|
      generator.assets false
      generator.helper false
      generator.skip_routes true
      generator.test_framework false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
