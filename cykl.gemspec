# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cykl/version'

Gem::Specification.new do |spec|
  spec.name          = 'cykl'
  spec.version       = Cykl::VERSION
  spec.authors       = ['Brandon Burton']
  spec.email         = ['brandon.anthony.burton@gmail.com']

  spec.summary       = %q{View the cycle-time of your Github issues}
  spec.description   = %q{
                          Cykl uses the Github API to pull information on issues in your repo.
                          You can track the average lifetime of your issues, and so you'll be
                          able to see how long they've spent in a particular column on your
                          project board (if the board is connected to Github).
                        }
  spec.homepage      = 'https://github.com/Baron-burton/cykl'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables << 'cykl'
  spec.require_paths = ['lib']

  spec.add_dependency 'netrc', '~> 0.11'
  spec.add_dependency 'octokit', '~> 4.7'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
