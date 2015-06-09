# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zero_captcha/version'

Gem::Specification.new do |spec|
  spec.name          = 'zero_captcha'
  spec.version       = ZeroCaptcha::VERSION
  spec.authors       = ['Rafael Barbolo', 'Rafael Ivan Garcia']
  spec.email         = ["zerocaptcha@infosimples.com"]

  spec.summary       = %q{Ruby API for ZeroCaptcha (Captcha Solver as a Service for the Enterprise)}
  spec.description   = %q{ZeroCaptcha allows companies to solve captchas with artificial intelligence software, which is faster than humans and very accurate}
  spec.homepage      = "https://github.com/infosimples/zero_captcha"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
