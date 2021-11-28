# frozen_string_literal: true
class Board

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
        @board[temp_row - 1][temp_collumn - 1] = [temp_row, temp_collumn]
        temp_collumn += 1
      end
      temp_row += 1
    end
  end

  def get_index_from_name(name)
    if valid_name?(name)
      index = [name[0]-1,name[1]-1]
    end
  end

  def valid_name?(name)
    row = name[0]
    column = name[1]
    [row < 7, row > 0, column < 8, column > 0].all?(true)
  end

  def playable_square?(name)
    valid = false
    if valid_name?(name)
      index = get_index_from_name(name)
      row = index[0]
      column = index[1]
      if row >=5
        valid = true
      elsif board[row+1][column].class == Array
        valid = false
      end
    end
    valid
  end

  def set_square_to(name, value)
    if valid_name?(name) && playable_square?(name)
      square_index = get_index_from_name(name)
      @board[square_index[0]][square_index[1]] = value
    end
  end
end
