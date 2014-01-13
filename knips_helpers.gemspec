# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "knips_helpers/version"

Gem::Specification.new do |spec|
  spec.name          = "knips_helpers"
  spec.version       = KnipsHelpers::VERSION
  spec.authors       = ["Tilo Dietrich", "Alexander Huber"]
  spec.email         = ["tilo.dietrich@knips.konsorten.de",
                        "alexander.huber@knips-konsorten.de"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{Some helper methods shared between projects}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
