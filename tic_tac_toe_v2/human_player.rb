class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Player #{mark.to_s}, enter two numbers representing a position in the format 'row col' "
        position = gets.chomp.split(" ").map(&:to_i)
        raise "Sorry, that was not a valid position." if position.length != 2
        position
    end
end