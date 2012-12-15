# encoding: utf-8
require 'pp'

class World
  attr_accessor :current

  def build(grid)
    self.current = []
    grid.each_index do |i|
      row = []
      grid[i].each_index do |j|
        init_state = grid[i][j] > 0 ? true : false
        row.push Cell.new(self, i, j, init_state)
      end
      current.push(row)
    end
  end

  def next_generation
    next_generation = []
    current.each_index do |i|
      row = []
      current[i].each_index do |j|
        row.push Cell.new(self, i, j, current[i][j].calc_new_state)
      end
      next_generation.push(row)
    end
    return next_generation
  end

  def get(i, j)
    unless (i < 0) || (j < 0)
      if row = current[i]
        row[j]
      end
    end
  end

  def draw
    current.each do |row|
      row.each do |item|
        print item.is_alive? ? '◉' : '◌'
        print "\t"
      end
      puts "\n" * 2
    end
  end

  def clear
    print "\e[2J\e[H"
  end
end


class Cell
  attr_accessor :world, :i, :j, :is_alive

  def initialize(world, i, j, is_alive)
    self.world    = world
    self.i        = i
    self.j        = j
    self.is_alive = is_alive
  end

  def inspect
    "[#{ i }][#{ j }]: #{is_alive}"
  end

  alias_method :is_alive?, :is_alive

  def calc_new_state
    alive_neighbours_count = alive_neighbours.count
    # puts "#{self.inspect}: #{alive_neighbours.inspect}"
    if is_alive?
      2 == alive_neighbours_count || 3 == alive_neighbours_count
    else
      3 == alive_neighbours_count
    end
  end

  private

  def neighbours
    neighbours = []
    neighbours << world.get(i-1, j-1)
    neighbours << world.get(i-1, j  )
    neighbours << world.get(i-1, j+1)
    neighbours << world.get(i,   j-1)
    neighbours << world.get(i,   j+1)
    neighbours << world.get(i+1, j-1)
    neighbours << world.get(i+1, j  )
    neighbours << world.get(i+1, j+1)
    neighbours.compact!
    return neighbours
  end

  def alive_neighbours
    neighbours.select(&:is_alive?)
  end
end



world = World.new
world.build([
  [0, 0, 0, 0],
  [0, 1, 1, 1],
  [1, 1, 1, 0],
  [0, 0, 0, 0],
])

generation = 1
loop do
  world.clear
  puts "Generation [#{generation}]"
  world.draw
  world.current = world.next_generation
  generation += 1
  sleep 1
end