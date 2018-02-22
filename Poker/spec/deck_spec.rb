require 'deck'

describe "Deck" do
  describe "#initialize" do
    subject(:deck) {Deck.new}

    it "sets up with 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
    it "assigns values to each card" do
      expect(deck.cards.sample.value).to_not be_nil
    end
    it "assigns suits to each card" do
      expect(deck.cards.sample.suit).to_not be_nil
    end

    # it "creates 4 of each values"
    # it "creates 13 cards of each suit"
    it "creates face down cards" do
      expect(deck.cards.sample.face_up).to be false
    end
    it "shuffles cards"

  end
end
