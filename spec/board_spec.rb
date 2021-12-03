# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#valid_name?' do
    subject(:board) { described_class.new }
    context 'this whether the given name of the square is within the bounds of the board' do
      it 'returns true when the given name is in the bounds' do
        name = [5, 4]
        expect(board.valid_name?(name)).to be true
      end
      it 'returns false when the given name is not in the bounds' do
        name = [7, 35]
        expect(board.valid_name?(name)).to be false
      end
    end
  end
  describe '#get_index_from_name' do
    subject(:board) { described_class.new }
    context 'returns the index of the square in the array given its name' do
      it 'when given a name thats within the bounds of the board' do
        name = [5, 4]
        index = board.get_index_from_name(name)
        expect(index).to eq([4, 3])
      end
    end
  end
  describe '#get_value_from_name' do
    subject(:board) { described_class.new }
    context 'returns the value of the square with a given name' do
      it 'when given a name of a square that contains "red"' do
        name = [5, 4]
        board.set_square_to(name, 'red')
        expect(board.get_value_from_name(name)).to eq('red')
      end
    end
  end
  describe '#playable_square?' do
    subject(:board) { described_class.new }
    context 'returns a bool based on whether or not the square is playable' do
      it 'when given a square that is outside the bounds of the board it returns false' do
        expect(board.playable_square?([5464, 45_324])).to be false
      end
      it 'when given the most bottom square it returns true' do
        expect(board.playable_square?([6, 7])).to be true
      end
      it 'when given a square below which is an occupied square returns true' do
        board.set_square_to([6, 7], 'red')
        expect(board.playable_square?([5, 7])).to be true
      end
      it 'when given a square that is not playable returns false' do
        expect(board.playable_square?([3, 5])).to be false
      end
    end
  end
  describe '#set_square_to' do
    subject(:board) { described_class.new }
    context 'sets the given squares value to provided arg' do
      it 'when given a square with valid name' do
        name = [6, 7]
        board.set_square_to(name, 'red')
        expect(board.get_value_from_name(name)).to eq('red')
      end
      it 'when given a square with invalid name' do
        name = [534, 63]
        expect(board.set_square_to(name, 'red')).to be nil
      end
    end
  end
  describe '#check_for_win' do
    subject(:board) { described_class.new }
    context 'when theres a horizontal win condition' do
      it 'returns true' do
        board.set_square_to([6, 7], 'r')
        board.set_square_to([6, 6], 'r')
        board.set_square_to([6, 5], 'r')
        board.set_square_to([6, 4], 'r')
        expect(board.check_for_win([6, 7], 'r')).to be true
      end
    end
    context 'when theres a vertical win condition' do
      it 'returns true' do
        board.set_square_to([6, 7], 'r')
        board.set_square_to([5, 7], 'r')
        board.set_square_to([4, 7], 'r')
        board.set_square_to([3, 7], 'r')
        expect(board.check_for_win([3, 7], 'r')).to be true
      end
    end
    context 'when theres a diagonal win condition' do
      it 'returns true' do
        board.set_square_to([6, 7], 'r')
        board.set_square_to([5, 6], 'r')
        board.set_square_to([4, 5], 'r')
        board.set_square_to([3, 4], 'r')
        expect(board.check_for_win([3, 4], 'r')).to be true
      end
    end
  end
end
