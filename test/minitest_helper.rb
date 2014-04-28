if ENV["RAILS_ENV"] && ENV["RAILS_ENV"] == "test"
  require 'coveralls'
  Coveralls::Output.no_color = true
  Coveralls.wear!('rails')
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
# require File.join(File.dirname(__FILE__), 'support', 'constructicon_test_helpers')
# require File.join(File.dirname(__FILE__), 'support', 'packet_factory')

require "minitest/rails"
MiniTest::Rails.override_testunit!
# MiniTest::Spec.register_spec_type /\AETL::Constructicon#/, ConstructiconTestHelpers

# VCR.configure do |c|
#   c.hook_into :webmock
#   c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
#   c.allow_http_connections_when_no_cassette = true
# end

class MiniTest::Spec

  include FactoryGirl::Syntax::Methods

  def run_and_clean(*args, &block)
    value = nil
    ActiveRecord::Base.transaction do
      value = run_without_timeout *args, &block
      raise ActiveRecord::Rollback
    end
    value
  end

  def run_with_timeout(*args, &block)
    Timeout.timeout(seconds_to_timeout) do
      run_and_clean *args, &block
    end
  end

  alias_method_chain :run, :timeout

  def seconds_to_timeout
    30
  end
end

$LOAD_PATH << Rails.root.join(*%w[test mocks])
