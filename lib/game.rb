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

  def play
    system 'clear'
    display_game
    if @turn.even?
      p "#{@player_two.name}'s turn"
      temp_player = @player_two
    else
      p "#{@player_one.name}'s turn"
      temp_player = @player_one
    end
    name = get_player_input
    @board.set_square_to(name, temp_player.color)
    if @board.check_for_win(name, temp_player.color) == true
      system 'clear'
      @board.print_board
      p "GG, #{temp_player.name} has won the game in #{@turn} turns!"
    else
      @turn += 1
      if @turn == @max_turns
        p 'The game is a draw'
      else
        play
      end
    end
  end
end
