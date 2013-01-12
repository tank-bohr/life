# encoding: utf-8
module Life
  class Painter
    def initialize(options)
      @spaces, @lines = [:spaces, :lines].map { |o| options.delete(o) }
    end

    def draw(world)
      world.current.each do |row|
        row.each do |item|
          print item.is_alive? ? '◉' : '◌'
          print %q/ / * @spaces
        end
        print %Q/\n/ * @lines
      end
    end

    def clear
      print "\e[2J\e[H"
    end
  end
end