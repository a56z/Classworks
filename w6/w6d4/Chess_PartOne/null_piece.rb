require_relative 'board'
require 'singleton'

class NullPiece < Piece
    def initialize
        :color = :none
        :symbol = :none
    end
end