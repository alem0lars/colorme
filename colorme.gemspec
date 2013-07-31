# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'colorme/version'

Gem::Specification.new do |spec|

  spec.name          = "colorme"
  spec.summary       = spec.description
  spec.description   = "The colors management app that you're missing"
  spec.homepage      = "http://projects.molarialessandro.info/colorme"
  spec.license       = "MIT"
  spec.version       = Colorme::VERSION

  spec.authors       = ["Alessandro Molari"]
  spec.email         = ["molari.alessandro@gmail.com"]

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "trollop"

end
