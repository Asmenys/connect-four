# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe 'name_the_squares' do
    subject(:board) { described_class.new.board }
    context 'assigns chess like notation to the squares of the board' do
      it 'a square with an index on [0][0] on the board returns a value of [1,1]' do
        expect(board[0][0]).to eq([1, 1])
      end
      it 'a square with an index of [5][4] on the board returns a value of [6,5]' do
        expect(board[5][4]).to eq([6,5])
      end
      it 'an index outside of the bounds of the board returns nil' do
        expect(board[8]).to eq(nil)
      end
    end
  end

  describe 'valid_index?' do
    subject(:board) { described_class.new }
    context 'this whether the given name of the square is within the bounds of the board' do
      it 'returns true when the given name is in the bounds' do
        name = [5,4]
        expect(board.valid_index?(name)).to be true
      end
      it 'returns false when the given name is not in the bounds' do
        name = [7,35]
        expect(board.valid_index?(name)).to be false
      end
    end
  end
  describe 'get_index_from_name' do
    subject(:board) { described_class.new }
    context 'returns the index of the square in the array given its name' do
      it 'when given a name thats within the bounds of the board' do
        name = [5,4]
        index = board.get_index_from_name(name)
        expect(index).to eq([4,3])
      end
    end
  end
end
