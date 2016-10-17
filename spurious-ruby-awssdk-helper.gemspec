# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spurious/ruby/awssdk/helper/version'

Gem::Specification.new do |spec|
  spec.name          = "spurious-ruby-awssdk-helper"
  spec.version       = Spurious::Ruby::Awssdk::Helper::VERSION
  spec.authors       = ["Steven Jack"]
  spec.email         = ["stevenmajack@gmail.com"]
  spec.summary       = %q{Helper gem for configuring the AWS ruby SDK with spurious details}
  spec.description   = %q{Helper gem for configuring the AWS ruby SDK with spurious details}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rake-rspec", ">= 0.0.2"

  spec.add_runtime_dependency "aws-sdk", "~> 1"
end
