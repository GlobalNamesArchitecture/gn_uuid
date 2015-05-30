# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gn_uuid/version'

Gem::Specification.new do |gem|
  gem.name          = "gn_uuid"
  gem.version       = GnUUID::VERSION
  gem.authors       = ["Dmitry Mozzherin"]
  gem.email         = ["dmozzherin@gmail.com"]

  gem.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  gem.description   = %q{TODO: Write a longer description or delete this line.}
  gem.homepage      = "TODO: Put your gem's website or public repo URL here."
  gem.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if gem.respond_to?(:metadata)
    gem.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  gem.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  gem.bindir        = "exe"
  gem.executables   = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.10.a"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "rspec"
end
