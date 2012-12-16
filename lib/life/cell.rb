# encoding: utf-8

module Life
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
end