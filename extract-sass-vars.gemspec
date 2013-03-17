# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'extract-sass-vars/version'

Gem::Specification.new do |gem|
  gem.name          = "extract-sass-vars"
  gem.version       = Extract::Sass::Vars::VERSION
  gem.authors       = ["Chris Eppstein"]
  gem.email         = ["chris@eppsteins.net"]
  gem.description   = %q{Extracts global variables from a Sass file into a json object.}
  gem.summary       = %q{Extracts global variables from a Sass file into a json object.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
