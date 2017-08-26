# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cykl/version'

Gem::Specification.new do |spec|
  spec.name          = 'cykl'
  spec.version       = Cykl::VERSION
  spec.authors       = ['Brandon Burton']
  spec.email         = ['brandon.anthony.burton@gmail.com']

  spec.description   = "Track the cycle-time of your repo's issues"
  spec.homepage      = 'https://github.com/Baron-burton/cykl'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables << 'cykl'
  spec.require_paths = ['lib']

  spec.add_dependency 'netrc', '~> 0.11'
  spec.add_dependency 'octokit', '~> 4.7'
  spec.add_dependency 'thor', '~> 0.19.1'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
