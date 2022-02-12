require 'colorize'
require_relative 'cursor'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0, board])
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
    
    def colors_for(i, j)
        if cursor.cursor_pos == [i,j] && cursor.selected
            bg = :light_green
        elsif cursor.cursor_pos == [i,j]
            bg = :light_red
        elsif (i + j).odd?
            bg = :light_blue
        else
            bg = :light_yellow
        end
        { background :bg }
    end

    def render
        system("clear")
        puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
        build_grid.each { |row| puts row.join }
    end

end