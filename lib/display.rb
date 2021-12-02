# frozen_string_literal: true

module Display
  def print_board
    row_index = 1
    numbers_horizontal = '   1   2   3   4   5   6   7  '
    line = " #{'+---' * 7}+"
    p numbers_horizontal
    @board.each do |row|
      string = ''
      row.each do |value|
        string += if value.nil?
                    '|   '
                  else
                    "|#{value}"
                  end
      end
      string += '|'
      string = row_index.to_s + string
      row_index += 1
      p line
      p string
    end
    puts "\"#{line}\""
  end
end
