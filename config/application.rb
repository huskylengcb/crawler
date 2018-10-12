require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CrawlerDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.exceptions_app = self.routes

    config.eager_load_paths += %W(#{config.root}/lib #{config.root}/app/uploaders #{config.root}/app/policies)

    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'

    config.i18n.default_locale = :zh

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.action_view.sanitized_allowed_tags = 'span', 'p', 'a', 'img', 'table', 'tr', 'td', 'li', 'ul',  'embed', 'em', 'strong', 'u'
    config.action_view.sanitized_allowed_attributes = 'id', 'href', 'src', 'height', 'width', 'class', 'style', 'align', 'target'

    # Do not swallow errors in after_commit/after_rollback callbacks.

    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        request_specs: false,
        controller_specs: false,
        routing_specs: false,
        helper_specs: false
    end
  end
end
