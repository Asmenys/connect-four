require_relative '../lib/game.rb'
describe Game do
  describe '#get_player_input' do
    context 'Prompts the user to make an input and verifies it, returning the input or a message' do
      subject(:game) {described_class.new('player_one', 'player_two')}
      before do
        expect(subject).to receive(:gets).and_return('6')
        expect(subject).to receive(:gets).and_return('7')
      end
      it 'returns the given name if it is valid' do
        expect(game.get_player_input).to eq([6,7])
      end
    end
  end
end
