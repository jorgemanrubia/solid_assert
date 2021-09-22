lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "solid_assert/version"

Gem::Specification.new do |spec|
  spec.name          = "solid_assert"
  spec.version       = SolidAssert::VERSION
  spec.authors       = ["Jorge Manrubia"]
  spec.email         = ["jorge.manrubia@gmail.com"]

  spec.summary       = %q{Assert utility for ruby}
  spec.description   = %q{Assert utility for ruby. It lets you code your assumptions and code invariants, so they are checked automatically. It can be deactivated, so you it doesn't affect to your program performance (for example, in production).}
  spec.homepage      = "https://github.com/jorgemanrubia/solid_assert"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.4"
end
