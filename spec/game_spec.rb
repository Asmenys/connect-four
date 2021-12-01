require_relative '../lib/game.rb'

describe Game do
  describe "#get_player_input" do
    subject(:game){ described_class.new("T", "E")}

    context "promts the player to make an input and returns it" do
      let (:input) = "[4,7]"
      before do
        allow(:gets).to receive(input)
      end
      it 'returns the given input' do
        result = game.get_player_input
        expect(result).to eq (input)
      end
    end
  end
end
