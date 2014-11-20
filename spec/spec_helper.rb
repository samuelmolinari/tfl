require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'tfl_api'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.syntax = :should
  end
end
