
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bittrex_rb/version"

Gem::Specification.new do |spec|
  spec.name          = "bittrex_rb"
  spec.version       = BittrexRb::VERSION
  spec.authors       = ["Ian Schreuder"]
  spec.email         = ["ian.schreuder@gmail.com"]

  spec.summary       = %q{Gem for connecting to bittrex API}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/ianschreuder/bittrex_rb.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rest-client", "~> 2.0"
  spec.add_development_dependency "json", "~> 2.1"
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.2"
end
