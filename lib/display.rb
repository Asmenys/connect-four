# frozen_string_literal: true

module Display
  def print_board
    row_index = 0
    line = "#{'+---' * 7}+"
    @board.each do |row|
      string = ''
      row.each do |value|
        string += "|#{value}"
      end
      string += '|'
      p line
      p string
    end
    puts "\"#{line}\""
  end
end
