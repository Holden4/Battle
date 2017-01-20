require 'game'

describe Game do

  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }


  describe '#player_1,' do
    it 'retrieves player 1 name' do
      expect(game.player_1).to eq (player_1)
    end
  end

  describe '#player_2,' do
    it 'retrieves player 2 name' do
      expect(game.player_2).to eq (player_2)
    end
  end

  it "Your are able to attack player 2" do
    expect{ $game.attack }.to change { $game.player_2.points }.by (-10)
  end

  describe '#turn_switch' do
    it 'expect current_player to #player_1' do
      expect(game.current_player).to eq player_1
    end
    it 'current_player to switch under #attack' do
          allow(player_2).to receive(:hp_deduct)
          game.attack
        expect(game.current_player).to eq player_2
    end
  end







end
