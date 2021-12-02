# frozen_string_literal: true

require_relative 'display'

class Board
  include Display
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def get_index_from_name(name)
    [name[0] - 1, name[1] - 1] if valid_name?(name)
  end

  def valid_name?(name)
    row = name[0]
    column = name[1]
    [row < 7, row.positive?, column < 8, column.positive?].all?(true)
  end

  def get_value_from_name(name)
    if valid_name?(name)
      index = get_index_from_name(name)
      @board[index[0]][index[1]]
    end
  end

  def playable_square?(name)
    result = false
    if valid_name?(name) && get_value_from_name(name).nil?
      if name[0] - 1 == 5
        result = true
      elsif get_value_from_name([name[0] + 1, name[1]]).nil? == false
        result = true
      end
    end
    result
  end

  def set_square_to(name, value)
    if valid_name?(name)
      index = get_index_from_name(name)
      board[index[0]][index[1]] = value
    end
  end
end
