# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lulalala_presenter/version"

Gem::Specification.new do |s|
  s.name        = "lulalala_presenter"
  s.version     = LulalalaPresenter::VERSION
  s.authors     = ["lulalala", "Akira Matsuda"]
  s.email       = ["mark@goodlife.tw", "ronnie@dio.jp"]
  s.homepage    = 'https://github.com/lulalala/lulalala_presenter'
  s.summary     = %q{A simple and Rubyish view helper for Rails}
  s.description = %q{A simple and Rubyish view helper for Rails}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
