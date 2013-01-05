# encoding: utf-8

module Life
  class World
    attr_accessor :current

    def initialize(first_generation = nil)
      unless first_generation.nil?
        build(first_generation)
      end
    end

    def build(first_generation)
      self.current = Life::Matrix.walk(first_generation) do |i, j, elem|
        init_state = elem.respond_to?(:to_i) ? elem.to_i > 0 : elem
        Cell.new(self, i, j, init_state)
      end
    end

    def next_generation!
      self.current = Life::Matrix.walk(current) do |i, j, elem|
        Cell.new(self, i, j, elem.calc_new_state)
      end
    end

    def to_a
      Life::Matrix.walk(current){ |i, j, cell| cell.to_i }
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