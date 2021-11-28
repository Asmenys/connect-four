# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#name_the_squares' do
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

  describe '#valid_name?' do
    subject(:board) { described_class.new }
    context 'this whether the given name of the square is within the bounds of the board' do
      it 'returns true when the given name is in the bounds' do
        name = [5,4]
        expect(board.valid_name?(name)).to be true
      end
      it 'returns false when the given name is not in the bounds' do
        name = [7,35]
        expect(board.valid_name?(name)).to be false
      end
    end
  end
  describe '#get_index_from_name' do
    subject(:board) { described_class.new }
    context 'returns the index of the square in the array given its name' do
      it 'when given a name thats within the bounds of the board' do
        name = [5,4]
        index = board.get_index_from_name(name)
        expect(index).to eq([4,3])
      end
    end
  end
  describe '#playable_square?' do
    subject(:board) { described_class.new }
    context 'returns a bool given a name of a square based on its surroundings' do
      it 'when given a name that is not "playable"' do
        name = [1,3]
        expect(board.playable_square?(name)).to be false
      end
      it 'when given a name that is outside of the bounds of the board' do
        name = [8,32]
        expect(board.playable_square?(name)).to be false
      end
      it 'when given a valid name' do
        name = [6,7]
        expect(board.playable_square?(name)).to be true
      end
    end
  end

  describe '#set_square_to' do
    subject(:board) { described_class.new }
    context 'sets the given square to the given value' do
      it 'when given an out-of-bounds square does nothing' do
        name = [76,23]
        value = 'man'
        expect(board.set_square_to(name, value)).to be nil
      end
      it 'when given a square that is not playable does nothing' do
        name = [3,4]
        value = 'whatever'
        expect(board.set_square_to(name, value)).to be nil
      end
      it 'when given a proper square sets it to the given value' do
        name = [6,7]
        square_index = board.get_index_from_name(name)
        value = 'woohoo'
        board.set_square_to(name, value)
        expect(board.board[square_index[0]][square_index[1]]).to eq(value)
      end
    end
  end
end
