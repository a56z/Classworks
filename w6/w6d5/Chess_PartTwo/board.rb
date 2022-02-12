class Board
    attr_reader :rows

    def initialize(fill_board = true)
        # raise ArgumentError.new("Start position can't be empty!") if move_piece(start_pos.nil?)
        # raise RuntimeError.new("Cannot move piece to desired position") if move_piece(end_pos.illegal_move?)
        @sentinel = NullPiece.instance
        make_starting_grid(fill_board)

    end

    def [](pos)
        raise 'invalid pos' unless valid_pos(pos)
       
        row, col = pos
       @rows[row, col] 
    end

    def []=(pos, piece)
        raise 'invalid pos' unless valid_pos(pos)

        row, col = pos
        @rows[row, col] = piece
    end

    def add_piece(piece, pos)
        raise 'Position not empty!' unless empty?(pos)
        self[pos] = piece
    end

    def move_piece(turn_color, start_pos, end_pos)
        raise "Start position is empty!" if empty?(start_pos)

        piece = self[start_pos]
        if piece.color != turn_color
            raise "You must move your own pieces!"
        elsif !piece.moves.include?(end_pos)
            raise "You can't make that move!"
        elsif !piece.valid_moves.include?(end_pos)
            raise "You cannot move into check!"
        end

        move_piece!(start_pos, end_pos)
    end

    #move without performing checks
    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
        raise 'Piece cannot move like that' unless move_piece.moves.include?(end_pos)

        self[end_pos] = piece
        self[start_pos] = sentinel
        piece.pos = end_pos

        nil
    end
 
    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def valid_pos?
        pos.all? { |coord| coord.between(0, 7) }
    end

    private

    attr_reader :sentinel

    def fill_black_row(color)
        back_pieces = [
            Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
        ]

        i = color == :white ? 7 : 0
        back_pieces.each_with_index do |piece_class, j|
            piece_class.new(color, self, [i, j])
        end
    end

    def fill_pawns_row(color)
        i = color == :white ? 6 : 1
        8.times { |j| Pawn.new(color, self, [i, j])}
    end

    def find_king(color)
        king_pos = pieces.find { |p| p.color == color && p.is_a?(King) }
        king_pos || (raise 'King not found?')
    end

    def make_starting_grid(fill_board)
        @rows = Array.new(8) { Array.new(8, sentinel) }
        return unless fill_board
        %i(white black).each do |color|
            fill_back_row(color)
            fill_pawns_row(color)
        end
    end

end