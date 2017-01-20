require 'player'

describe Player do
  subject(:player) { described_class.new("Rob") }
  describe "#name" do

    it "Returns player name" do
      expect(player.name).to eq "Rob"
    end
  end

  describe "#points" do
    it "Defaults hit points to 100" do
      expect(player.points).to eq 100
    end
    # it "Deducts hit points" do
    #   expect{player.points -= 10}.to change { player.points }.to 90
    # end
  end
end
