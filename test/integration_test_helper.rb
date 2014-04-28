if ENV["RAILS_ENV"] && (ENV["RAILS_ENV"] == "test" || ENV["RAILS_ENV"] == "integration_test")
  require 'coveralls'
  Coveralls::Output.no_color = true
  Coveralls.wear!('rails')
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"

require 'capybara/rspec/matchers'
require "minitest/rails/capybara"
require "capybara/poltergeist"
require 'factory_girl_rails'
#require 'database_cleaner'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, timeout: 999999)
end

Capybara.javascript_driver = :poltergeist
Capybara.current_driver = :poltergeist
Capybara.default_wait_time = 60

Resque.inline = true

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods

  include Capybara::DSL
  include Capybara::Assertions
  include Rails.application.routes.url_helpers

  # before :each do
  #   @original_app_host = Capybara.app_host
  #   @retries = 0

  #   DatabaseCleaner.strategy = strategy
  #   DatabaseCleaner.start
  # end

  # after :each do
  #   Capybara.app_host = @original_app_host

  #   begin
  #     DatabaseCleaner.clean
  #   rescue ActiveRecord::StatementInvalid => e
  #     puts 'FAILURE DURING DatabaseCleaner.clean'
  #     puts e.message
  #     @retries += 1
  #     raise if @retries >= 5
  #     sleep 1
  #     retry
  #   end

  #end

  private

end

$LOAD_PATH << Rails.root.join(*%w[test mocks])
