# encoding: utf-8
module Life
  class Game
    attr_accessor :world, :painter

    def initialize(first_generation, painter_options = {})
      self.world   = Life::World.new(first_generation)
      self.painter = Life::Painter.new(painter_options)
    end

    def run
      generation = 1
      loop do
        painter.clear
        puts "Generation [#{generation}]"
        painter.draw(world)
        world.next_generation!
        generation += 1
        sleep 1
      end
    end
  end
end