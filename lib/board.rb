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

  def check_for_win(square_name, player_color)
    index = get_index_from_name(square_name)
    column = index[1]
    row = index[0]
    [check_arr_for_win(column_to_arr(column), player_color),
     check_arr_for_win(@board[row], player_color),
     check_arr_for_win(diagonal_to_arr(square_name, 'up_to_left'), player_color),
     check_arr_for_win(diagonal_to_arr(square_name, 'up_to_right'), player_color)].any?(true)
  end

  private

  def check_arr_for_win(array, player_color)
    consecutive_squares = 0
    array.each do |value|
      if value == player_color
        consecutive_squares += 1
        break if consecutive_squares == 4
      else
        consecutive_squares = 0
      end
    end
    consecutive_squares == 4
  end

  def column_to_arr(column)
    row = 0
    column_array = []
    while row <= 5
      column_array << @board[row][column]
      row += 1
    end
    column_array
  end

  def diagonal_to_arr(square_name, directions)
    array = []
    temp_row = square_name[0]
    temp_col = square_name[1]
    while temp_col >= 1 && temp_row >= 1
      temp_col -= 1
      if directions == 'up_to_left'
        temp_row -= 1
      else
        temp_row += 1
      end
      array << get_value_from_name([temp_row, temp_col])
    end
    array << get_value_from_name(square_name)
    temp_row = square_name[0]
    temp_col = square_name[1]
    while temp_row <= 6 && temp_col <= 7
      temp_col += 1
      if directions == 'up_to_left'
        temp_row += 1
      else
        temp_row -= 1
      end
      array << get_value_from_name([temp_row, temp_col])
    end
    array
  end
end
