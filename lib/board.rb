# frozen_string_literal: true

require_relative 'display'

class Board
  include Display

  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7) }
    name_the_squares
  end

  def name_the_squares
    temp_row = 1
    while temp_row <= 6
      temp_collumn = 1
      while temp_collumn <= 7
        @board[temp_row - 1][temp_collumn - 1] = "#{temp_row},#{temp_collumn}"
        temp_collumn += 1
      end
      temp_row += 1
    end
  end

  def get_index_from_name(name)
    [name[0] - 1, name[1] - 1] if valid_name?(name)
  end

  def valid_name?(name)
    row = name[0]
    column = name[1]
    [row < 7, row.positive?, column < 8, column.positive?].all?(true)
  end

  def playable_square?(name)
    playable = false
    if valid_name?(name)
      square_index = get_index_from_name(name)
      if square_index[0].to_i == 5
        playable = true
      elsif @board[square_index[0]+1][square_index[1]] == ('red' || 'blue')
        playable = true
      end
    end
    playable
  end

  def set_square_to(name, value)
    if playable_square?(name)
      square_index = get_index_from_name(name)
      @board[square_index[0]][square_index[1]] = value
    end
  end
end
