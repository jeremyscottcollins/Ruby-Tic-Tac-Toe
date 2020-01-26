class Board
    def initialize
        @grid = Array.new(3) { Array.new(3, "_") }
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def valid?(position)
        row, col = position
        position.all? do |i|
            0 <= i && i < @grid.length
        end
    end

    def empty?(position)
        self[position] == "_"
    end

    def place_mark(pos, mark)
        raise 'invalid mark' if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            position = [i, i]
            self[position] == mark
        end

        right_to_left = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            position = [row, col]
            self[position] == mark
        end

        left_to_right || right_to_left
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.any? { |pos| empty?(pos) }
    end

end

