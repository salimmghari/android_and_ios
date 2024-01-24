require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Notes
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.autoload_paths << Rails.root.join('app', 'models').to_s
  end
end
