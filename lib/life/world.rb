# encoding: utf-8

module Life
  class World
    include Life::Matrix
    attr_accessor :current

    def initialize(first_generation)
      self.current = walk(first_generation) do |i, j, elem|
        init_state = elem.respond_to?(:to_i) ? elem.to_i > 0 : elem
        Cell.new(self, i, j, init_state)
      end
    end

    def next_generation!
      self.current = walk(current) do |i, j, elem|
        Cell.new(self, i, j, elem.calc_new_state)
      end
    end

    def to_a
      walk(current){ |i, j, cell| cell.to_i }
    end

    def get(i, j)
      get_element(i, j, current)
    end
  end
end
