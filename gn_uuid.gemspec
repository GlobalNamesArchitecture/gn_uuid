# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "gn_uuid/version"

Gem::Specification.new do |gem|
  gem.name          = "gn_uuid"
  gem.version       = GnUUID::VERSION
  gem.authors       = ["Dmitry Mozzherin"]
  gem.email         = ["dmozzherin@gmail.com"]

  gem.summary       = "Creates UUID v5 with DNS:globalnames.org namespace"
  gem.description   = "Creates UUID version 5 out of scientific name " \
                      "string. It uses globalnames.org domain for DNS " \
                      "namespace. There is a 1:1 relationship between the " \
                      "string and the corresponding UUID, so it allows " \
                      "globally connect data about a name string originated " \
                      "from independent sources without a need to negotiate " \
                      "identifiers."
  gem.homepage      = "https://github.com/GlobalNamesArchitecture/gn_uuid"
  gem.license       = "MIT"
  gem.required_ruby_version = ">= 2.4"

  gem.files         = `git ls-files -z`.split("\x0").
                      reject { |f| f.match(%r{^(test|spec|features)/}) }
  gem.bindir        = "exe"
  gem.executables   = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "coveralls", "~> 0.8"
  gem.add_development_dependency "rake", "~> 12.3"
  gem.add_development_dependency "rspec", "~> 3.7"
  gem.add_development_dependency "rubocop", "~> 0.58"
end
