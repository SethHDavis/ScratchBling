require_relative 'boot'

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module ScratchBling
  class Application < Rails::Application
    config.load_defaults 5.1
    config.middleware.use Rack::MethodOverride
    config.api_only = false
  end
end
