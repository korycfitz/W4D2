require_relative "piece.rb"

class Board ## will need board with instances of Piece in location where each piece is

    def initialize
        @rows = 
        @null_pieces = NullPiece
    end




    def populate #populates the board with the pieces
        start_pawns = [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], [6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]]
        start_rooks = [[0,0], [0,7], [7,0], [7,7]]
        start_knight = [[0,2], [0,6], [7,2], [7,6]]
        start_bishop = [[0,3], [0,5], [7,3], [7,5]]
        start_queen = [[0,4], [7,4]]
        start_king = [[0,4], [7,5]]

        start_pawns.each do |pos|
            @grid[pos[0]][pos[1]] = :P
        end
        start_rooks.each do |pos|
            @grid[pos[0]][pos[1]] = :R
        end
        start_knight.each do |pos|
            @grid[pos[0]][pos[1]] = :N
        end
        start_bishop.each do |pos|
            @grid[pos[0]][pos[1]] = :B
        end
        start_queen.each do |pos|
            @grid[pos[0]][pos[1]] = :Q
        end
        start_king.each do |pos|
            @grid[pos[0]][pos[1]] = :K
        end
    end


    def valid_start?(pos) #checks if there is a piece at a location
        return false if @grid[pos[0]][pos[1]] == nil                #######  need to also check if the piece can actually make this move and if it is on the board
        true
    end

    def valid_end?(pos) #checks if there is a piece at a location
        return true if @grid[pos[0]][pos[1]] == nil               #######  need to also check if the piece can actually make this move and if it is on the board
        false
    end

    def move_piece(start_pos, end_pos) #should update the 2d grid and move the pieces position
        start_pos = start_row, start_col
        end_pos = end_row, end_col
        if !valid_start?(start_pos) 
            raise "there is no piece at #{start_pos}" 
        elsif !valid_end?(end_pos) 
            raise "the piece cannot move to #{end_pos}" 
        else 
            @grid[end_row][end_col] = @grid[start_row][start_col] #updates the grid and moves the pieces position
            @grid[start_row][start_col] = nil 
        end
    end
end