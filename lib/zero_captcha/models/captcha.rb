module ZeroCaptcha
  # Model of a Captcha returned by ZeroCaptcha API.
  #
  class Captcha < ZeroCaptcha::Model
    attr_accessor :id, :text, :code, :correct, :duration_in_milliseconds,
                  :created_at

    alias_method :correct?, :correct
    alias_method :duration, :duration_in_milliseconds
  end
end
