# -*- encoding: utf-8 -*-
require File.expand_path('../lib/conditional_attribute_validator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Peter P."]
  gem.email         = ["pete@p373.net"]
  gem.description   = %q{This gem allows you to put a high level("global") validation on a single or multiple attributes.  Such that individual validations will only run if the condition(if/unless) you specify passes. This is meant to work with Rails 3.1.x + }
  gem.summary       = %q{This gem allows you to put a high level("global") validation on a single or multiple attributes.  Such that individual validations will only run if the condition(if/unless) you specify passes.  This is meant to work with Rails 3.1.x + }
  gem.homepage      = "https://github.com/synth/conditional_attribute_validator"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "conditional_attribute_validator"
  gem.require_paths = ["lib"]
  gem.version       = ConditionalAttributeValidator::VERSION
end
