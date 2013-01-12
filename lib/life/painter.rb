# encoding: utf-8
module Life
  class Painter
    def draw(world)
      world.current.each do |row|
        row.each do |item|
          print item.is_alive? ? '◉' : '◌'
          print %q/ /
        end
        puts
      end
    end

    def clear
      print "\e[2J\e[H"
    end
  end
end