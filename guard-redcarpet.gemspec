# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard-redcarpet/version"

Gem::Specification.new do |s|
  s.name        = "guard-redcarpet"
  s.version     = Guard::Redcarpet::VERSION
  s.authors     = ["Michael-Keith Bernard"]
  s.email       = ["mkbernard.dev@gmail.com"]
  s.homepage    = "https://github.com/SegFaultAX/guard-redcarpet"
  s.summary     = %q{Guard for Redcarpet}
  s.description = %q{Compiles file.html.md and file.html.markdown files to file.html using Redcarpet gem.}

  s.rubyforge_project = "guard-redcarpet"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "redcarpet"
end
