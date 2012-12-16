# encoding: utf-8

module Life
  class World
    attr_accessor :current

    def build(grid)
      self.current = Life::Matrix.walk(grid) do |i, j, elem|
        init_state = elem.respond_to?(:to_i) ? elem.to_i > 0 : elem
        Cell.new(self, i, j, init_state)
      end
    end

    def next_generation
      Life::Matrix.walk(current) do |i, j, elem|
        Cell.new(self, i, j, elem.calc_new_state)
      end
    end

    def get(i, j)
      unless (i < 0) || (j < 0)
        if row = current[i]
          row[j]
        end
      end
    end
  end
end