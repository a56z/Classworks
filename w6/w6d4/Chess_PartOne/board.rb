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

    def move_piece(start_pos, end_pos)
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

    #     row, col = start_pos
    #     start_pos[row, col] = @rows[start_pos]
    #     row, col = end_pos
    #     end_pos[row, col] = @rows[end_pos]
    # end

    def make_starting_grid(fill_board)
        @rows = Array.new(8) { Array.new(8, sentinel) }
        return unless fill_board
        %i(white black).each do |color|
            fill_back_row(color)
            fill_pawns_row(color)
        end
    end

end