require_relative "board.rb"

class Piece
    def initialize(sliding_pieces, stepping_pieces, null_pieces, pawns)
        @sliding_pieces = sliding_pieces
        @stepping_pieces = stepping_pieces
        @null_pieces = null_pieces
        @pawns = pawns
    end

    def occupied?(pos)
        return false if @board[pos[0]][pos[1]] == nil
        true
    end

    def to_s #need to use .join in another function to join when we render the board
        occupied?(pos) ? value.to_s : "P"
    end
end