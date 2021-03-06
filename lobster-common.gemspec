# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lobster/version'

Gem::Specification.new do |spec|
  spec.name          = 'lobster-common'
  spec.version       = Lobster::VERSION
  spec.authors       = ['dotMaiku']
  spec.email         = ['dotMaiku@gmail.com']
  spec.summary       = %q{Common structures and libraries for the lobster chat system.}
  spec.description   = %q{Structures and utilities used by the lobster chat system.
This gem doesn't contain any logic.
Rather, it contains the "language" needed for clients and servers to communicate.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'factory_girl', '~> 4.0'
  spec.add_development_dependency 'reek', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.38.0'
  spec.add_development_dependency 'rubocop-checkstyle_formatter'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'yard'
end
