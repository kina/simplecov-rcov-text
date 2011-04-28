# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simplecov-rcov-text/version"

Gem::Specification.new do |s|
  s.name        = "simplecov-rcov-text"
  s.version     = SimpleCov::Formatter::RcovTextFormatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["William 'Kina'"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{Just a Simplecov Formatter to cheat metric_fu}
  s.description = %q{Just a Simplecov Formatter to cheat metric_fu}

  s.rubyforge_project = "simplecov-rcov-text"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end