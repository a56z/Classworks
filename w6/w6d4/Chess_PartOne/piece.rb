require_relative 'board'

class Piece < Board

    def initialize(board, figure)
        @board = Board.new(figure)
        @figure = figure
        @piece = board(piece)
        @null_piece = board(piece).empty?
    end

end
