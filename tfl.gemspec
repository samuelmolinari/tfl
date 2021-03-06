# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tfl/version'

Gem::Specification.new do |spec|
  spec.name          = "tfl"
  spec.version       = Tfl::VERSION
  spec.authors       = ["Samuel Molinari"]
  spec.email         = ["samuel@molinari.me"]
  spec.description   = %q{Ruby Tfl API}
  spec.summary       = %q{Ruby interface to access most of the APIs provided by the Tfl}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_dependency "httparty"
end
