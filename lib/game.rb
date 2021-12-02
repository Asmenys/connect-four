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
end
