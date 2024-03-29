lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gnar/style/version"

Gem::Specification.new do |spec|
  spec.name          = "gnar-style"
  spec.version       = Gnar::Style::VERSION
  spec.authors       = ["The Gnar Company"]
  spec.email         = ["hi@thegnar.co"]
  spec.post_install_message = ["`gnar-style` is no longer receiving updates.",
                               "Please use the styles in `.gnarrc` instead:",
                               "https://github.com/TheGnarCo/.gnarrc"].join(" ")

  spec.summary       = "[Deprecated] Style guide default configuration for The Gnar Company"
  spec.homepage      = "https://github.com/TheGnarCo/gnar-style"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop", ">= 1.0.0", "< 2.0"
  spec.add_dependency "rubocop-performance"
  spec.add_dependency "rubocop-rails", "~> 2.2.0"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.metadata["rubygems_mfa_required"] = "true"
end
