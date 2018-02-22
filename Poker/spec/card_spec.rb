require 'card.rb'

describe "Card" do
  subject(:card) { Card.new(:ace, :heart, false) }
  describe "#initialize" do
    it "sets value" do
      expect(card.value).to eq(:ace)
    end
    it "sets suit" do
      expect(card.suit).to eq(:heart)
    end
    it "start with face down" do
      expect(card.face_up).to be false 
    end
  end
end
