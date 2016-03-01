# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "read_xls/version"

Gem::Specification.new do |spec|
  spec.name          = "read_xls"
  spec.version       = ReadXls::VERSION
  spec.authors       = ["P2Binvestor"]
  spec.email         = ["techadmin@p2bi.com"]

  spec.summary       = "Parse XLS files."
  spec.description   = ""
  spec.homepage      = "http://github.com/p2bi/read_xls"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-ole"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
