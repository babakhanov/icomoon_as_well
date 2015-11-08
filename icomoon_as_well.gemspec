# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icomoon_as_well/version'

Gem::Specification.new do |spec|
  spec.name          = "icomoon_as_well"
  spec.version       = IcomoonAsWell::VERSION
  spec.authors       = ["Alex"]
  spec.email         = ["babakhanov1@gmail.com"]

  spec.summary       = %q{Icomoon unpacker}
  spec.description   = %q{Icomoon unpacker in a best way}
  spec.homepage      = "https://github.com/babakhanov1"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*']
  spec.bindir        = "bin"
  spec.executables   = ["icomoon_as_well"]  
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rubyzip", "~> 1.1"
end
