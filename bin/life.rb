#!/usr/bin/env ruby
require 'life'

template_name = 'explosion'
template_dir = File.dirname(__FILE__) + '/../templates'
template = File.open("#{template_dir}/#{template_name}.life", &:read)
first_generation = template.split(/[\r?\n]+/).map { |r| r.split(/\s+/) }

game = Life::Game.new(first_generation)
game.run()
