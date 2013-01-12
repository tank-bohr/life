# encoding: utf-8
module Life
  class Game
    attr_accessor :world, :painter

    def initialize(first_generation, options)
      @delay, @verbose = [:delay, :verbose].map { |o| options.delete(o) }
      self.world   = Life::World.new(first_generation)
      self.painter = Life::Painter.new(options)
    end

    def run
      generation = 1
      loop do
        painter.clear
        puts "Generation [#{generation}]" if @verbose
        painter.draw(world)
        world.next_generation!
        generation += 1
        sleep @delay
      end
    end
  end
end