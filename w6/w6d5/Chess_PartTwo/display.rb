require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
 def initialize(board)
    @board = board
 end

 def render
    @board = Board.new
 end

 def cursor
    @cursor = Cursor.new([0,0], board)
 end
#  def cursor_color
#     @cursor_pos.colorize(:blue) 
#  end
end