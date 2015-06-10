$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'zero_captcha'

RSpec.configure do |config|
  # Only accept the new syntax of "expect" instead of "should".
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require 'yaml'
CREDENTIALS = YAML.load_file('spec/credentials.yml')
