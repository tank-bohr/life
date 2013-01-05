# encoding: utf-8
module Life
  class Game
    attr_accessor :world, :painter

    def initialize(painter_options = {})
      self.world   = Life::World.new
      self.painter = Life::Painter.new(painter_options)
    end

    def init_world(first_generation)
      world.build(first_generation)
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