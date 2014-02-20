lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "http-parser/version"

Gem::Specification.new do |gem|
  gem.name          = "http-parser"
  gem.version       = HTTPParser::VERSION
  gem.authors       = ["David Cornu"]
  gem.email         = ["hello@davidcornu.com"]
  gem.description   = "FFI bindings for node's http-parser"
  gem.summary       = gem.description
  gem.homepage      = "http://github.com/davidcornu/http-parser"

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = []
  gem.test_files    = []
  gem.require_paths = ["lib"]
  gem.extensions    = ["ext/http-parser/Rakefile"]

  gem.add_dependency 'rake'
  gem.add_dependency 'ffi'
  gem.add_dependency 'ffi-compiler'
end
