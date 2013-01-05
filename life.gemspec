# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'life/version'

Gem::Specification.new do |gem|
  gem.name          = 'life'
  gem.version       = Life::VERSION
  gem.authors       = ['Alexey Nikitin']
  gem.email         = ['bohr@narod.ru']
  gem.description   = %q{Conway's Game of Life}
  gem.summary       = %q{Conway's Game of Life}
  gem.homepage      = ''

  gem.files         = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "bin/life.rb",
    "lib/life.rb",
    "lib/life/cell.rb",
    "lib/life/game.rb",
    "lib/life/matrix.rb",
    "lib/life/painter.rb",
    "lib/life/version.rb",
    "lib/life/world.rb",
    "life.gemspec"
  ]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
