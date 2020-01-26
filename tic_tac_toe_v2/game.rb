require './board.rb'
require './human_player.rb'

class Game
    def initialize(board_size, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @current_player = @players.first
        @board = Board.new(board_size)
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Game Over!"
                puts @current_player.mark.to_s + ' HAS WON!'
                return
            else
                switch_turn
            end
        end
        puts "Game Over!"
        puts "DRAW"
    end
end