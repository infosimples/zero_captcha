module ZeroCaptcha
  # Model of a Captcha returned by ZeroCaptcha API.
  #
  class Captcha < ZeroCaptcha::Model
    attr_accessor :id, :text, :code, :correct, :duration_in_milliseconds,
                  :created_at, :created_at_not_parsed

    alias_method :correct?, :correct
    alias_method :duration, :duration_in_milliseconds

    def created_at=(datetime)
      self.created_at_not_parsed = datetime
      @created_at = Time.parse(datetime)
    rescue
      datetime
    end
  end
end
