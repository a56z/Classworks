require_relative 'board'

class Piece < Board

    def initialize(board, figure)
        @board = Board.new(figure)
        @figure = figure
        @piece = board(piece)
        @null_piece = board(piece).empty?
    end

    def moves
        board.each do |pos|
            valid_moves.include?(pos)
            self = pos
        end
        self
    end

end
