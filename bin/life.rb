#!/usr/bin/env ruby
require 'life'

game = Life::Game.new
game.init_world([
  [0, 0, 0, 0],
  [0, 1, 1, 1],
  [1, 1, 1, 0],
  [0, 0, 0, 0],
])
game.run()