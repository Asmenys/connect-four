require_relative 'board.rb'
require_relative 'player.rb'

class Game

    def initialize(player_one_name, player_two_name)
        @board = Board.new

        @player_one = Player.new(player_one_name, "\u26AB")
        @player_two = Player.new(player_two_name, "\u26AA")
        @turn = 1
        @max_turns = 42
    end

    def print_board
        @board.print_board
    end

    def get_player_input(message)
        p message
        input = gets.chomp
        if validate_input(input) == false
           input = get_player_input("Please enter a single integer as your input")
        end
        input.to_i
    end

    def validate_input(input)
        result = false
        if input.length == 1
            if /[1-9]/.match?(input)
                result = true
            end
        end
        result
    end

    def get_name
        row = get_player_input("Choose a row of the board")
        column = get_player_input("Choose a column of the board")
        [row, column]
    end
end