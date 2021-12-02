# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  def initialize(player_one_name, player_two_name)
    @board = Board.new

    @player_one = Player.new(player_one_name, "\u26AB")
    @player_two = Player.new(player_two_name, "\u26AA")
    @turn = 1
    @max_turns = 42
  end

  def display_game
    p "Turn: #{@turn}"
    @board.print_board
  end

  def get_player_input
    p 'Choose a row of the board from 1-6'
    row = gets.chomp.to_i
    p 'Choose a column of the board from 1-7'
    column = gets.chomp.to_i
    name = [row, column]
    if @board.playable_square?(name) == false
      p 'Invalid input, the square is either already populated/unplayable yet, or the indexes are out of bounds'
      name = get_player_input
    end
    name
  end

  def game_turn
    system 'clear'
    display_game
    if @turn % 2 == 0
      p "#{@player_two.name}'s turn"
      temp_color = @player_two.color
    else 
      p "#{@player_one.name}'s turn"
      temp_color = @player_one.color
    end
    name = get_player_input
    @board.set_square_to(name, temp_color)
    #check for win
    @turn += 1
    game_turn
  end
end

#ze lup
#   get playerinput
#   update the board accordingly
#   check for wins
#   increment the turns by 1
#   rinse and repeat