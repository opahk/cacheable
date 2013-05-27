# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cacheable/version'

Gem::Specification.new do |gem|
  gem.name          = "cacheable"
  gem.version       = Cacheable::VERSION
  gem.authors       = ["Frank C. Eckert"]
  gem.email         = ["frank.eckert@boost-project.com"]
  gem.description   = <<-EOF
    Cacheable is a lightweight, db-agnostic low-level caching mechanism for
    Rails.
  EOF
  gem.summary       = %q{Lightweight Low-Level Caching for Rails}
  gem.homepage      = "https://github.com/opahk/cacheable"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'json', '~> 1.7.7'
  gem.add_development_dependency 'activesupport', '~> 3.2.13'
end
