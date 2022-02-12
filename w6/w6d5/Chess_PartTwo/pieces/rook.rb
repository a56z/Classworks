class Rook < Piece
    include Stepable

    def symbol
        '♜'.colorize(color)
    end

    protected

    def move_dirs
        horizontal_and_vertical_dirs
    end
end