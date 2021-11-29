require_relative 'board.rb'

class Game
    def initialize
        @board = initialize_board
        p 'Input the name of player 1'
        @player_one = Player.new(gets.chomp, "\u26AB")
        p 'Input the name of player 2'
        @player_two = Player.new(gets.chomp, "\u26AA")
    end

    def initialize_board
        Board.new
    end
end