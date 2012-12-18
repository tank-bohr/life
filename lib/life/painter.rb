# encoding: utf-8
module Life
  class Painter
    attr_accessor :alive, :dead, :clear_seq

    def initialize(params = {})
      self.alive     = params.fetch(:alive, '◉')
      self.dead      = params.fetch(:dead,  '◌')
      self.clear_seq = params.fetch(:clear_seq, "\e[2J\e[H")
    end

    def draw(world)
      world.current.each do |row|
        row.each do |item|
          print item.is_alive? ? alive : dead
          print "\t"
        end
        puts "\n" * 2
      end
    end

    def clear
      print clear_seq
    end
  end
end