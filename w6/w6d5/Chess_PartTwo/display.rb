require 'colorize'
require_relative 'cursor'

class Display
 def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0, board])
 end



 def cursor
    @cursor = Cursor.new([0,0], board)
 end
#  def cursor_color
#     @cursor_pos.colorize(:blue) 
#  end

    def move_cursor
        render.each do |pos|
            if pos.valid_pos?
                render(pos)
            end
        end
    end

    def build_grid
        @board.rows.each_with_index do |i, j|
            build_row[i, j]
        end
    end

    def build_row(row, 1)
        row.map.each_with_index do |i, j|
            color_options = colors_for(i, j)
            piece.to_s.colorize(color, options)
        end
    end

    def render
        system("clear")
        puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
        build_grid.each { |row| puts row.join }
    end

end