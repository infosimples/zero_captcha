require 'base64'
require 'json'
require 'net/http'

# The module ZeroCaptcha contains all the code for the zero_captcha gem.
# It acts as a safely namespace that isolates logic from ZeroCaptcha from any
# project that uses it.
#
module ZeroCaptcha
  # Create a ZeroCaptcha API client. This is a shortcut to
  # ZeroCaptcha::Client.new.
  #
  def self.new(*args)
    ZeroCaptcha::Client.new(*args)
  end

  # Base class of a model object returned by ZeroCaptcha API.
  #
  class Model
    def initialize(values = {})
      values.each do |key, value|
        send("#{key}=", value) if respond_to?("#{key}=")
      end
    end
  end
end

require 'zero_captcha/client'
require 'zero_captcha/errors'
require 'zero_captcha/http'
require 'zero_captcha/models/captcha'
require 'zero_captcha/version'
