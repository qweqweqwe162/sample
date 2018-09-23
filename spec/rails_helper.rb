require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"

# Load capybara api
require "capybara/rspec"
require "capybara/rails"
#require "capybara/webkit"

# Pretty much defaults
Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit

# Here's the meat part, we'll register our own server handler.
require "puma"
Capybara.register_server("puma") do |app, port|
  server = Puma::Server.new(app)
  server.add_tcp_listener(Capybara.server_host, port)
  server.run
end