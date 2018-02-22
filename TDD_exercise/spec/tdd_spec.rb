require 'tdd'
require 'rspec'

describe "Array" do
  describe "#my_uniq" do
    subject(:array) { [1, 2, 3, 4, 5] }

    it "returns the original array when no dups" do
      expect(array.my_uniq).to eq(array)
    end

    subject(:array2) { [1, 2, 3, 1, 5] }

    it "removes dups from an array" do
      expect(array2.my_uniq).to eq([1, 2, 3, 5])
    end

    it "returns [] when given []" do
      expect([].my_uniq).to eq([])
    end
  end

  describe "#two_sum" do
    subject(:array) { [-1, 0, 2, -3, 1] }

    it "returns a pair of indices whose elements sum to zero" do
      expect(array.two_sum).to eq([[0, 4]])
    end

    subject(:array2) { [-1, 0, 2, -2, 1] }

    it "returns multiple pairs of indices whose elements sum to zero" do
      expect(array2.two_sum).to eq([[0, 4], [2, 3]])
    end

    subject(:array3) { [1, 2, 3] }

    it "returns empty array if no elements sum to zero" do
      expect(array3.two_sum).to eq([])
    end

    it "the smaller pair of indices is returned first in the array" do
      expect(array2.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

end

describe "my_transpose" do
  subject(:array) {
    [[0, 1, 2],
     [3, 4, 5],
     [6, 7, 8]]
  }

  subject(:array2) {
    [[0, 3, 6],
     [1, 4, 7],
     [2, 5, 8]]
  }
  it "transposes a matrix" do
    expect(my_transpose(array)).to eq(array2)
  end

  it "returns [] if arument is []" do
    expect(my_transpose([])).to eq([])
  end
end

describe "stock_picker" do
  subject(:stocks) {[1, 2, 3, 4, 5]}
  subject(:stocks2) { [5, 2, 1, 3]}

  it "returns the most profitable pair of days" do
    expect(stock_picker(stocks)).to eq([0, 4])
  end

  it "doesn't travel backward in time" do
    expect(stock_picker(stocks2)).to eq([2, 3])
  end

  it "returns an empty array if stock keeps dropping or stays level" do
    expect(stock_picker(stocks.reverse)).to eq([])
  end
end


describe TowersOfHanoi do
  subject(:game) {TowersOfHanoi.new}

  describe "#initialize" do
    # it "initializes 3 towers" do
    #   expect(game.tower1).to
    # end
    it "puts three discs in tower 1" do
      expect(game.tower_one).to eq([3, 2, 1])
    end
    it "puts nothing in tower 2 or tower 3" do
      expect(game.tower_two).to eq([])
      expect(game.tower_three).to eq([])
    end
  end

  describe "#move" do
    # it "calls valid_move?" do
    #   expect(game).to receive(:valid_move)
    # end
    it "moves a disc to an empty tower" do
      game.move(0, 1)
      expect(game.tower_two).to_not be_empty
    end

    it "moves a disc to a partially full tower" do
      game.move(0, 1)
      game.move(0, 2)
      game.move(1, 2)
      expect(game.tower_three).to eq([2, 1])
    end
    # it "calls won?"
  end

  describe "#valid_move?" do

    it "returns false if from tower is empty" do
      expect(game.valid_move?(2, 1)).to be false
    end

    it "returns false if moving a large disc on top of a smaller disc" do
      game.move(0, 1)
      expect(game.valid_move?(0, 1)).to be false
    end
    it "returns true if it's a valid move" do
      expect(game.valid_move?(0, 1)).to be true
    end

  end

  # subject(:game1) { TowersOfHanoi.new([], [3, 2, 1], []) }
  # subject(:game2) { TowersOfHanoi.new([], [], [3, 2, 1]) }
  # subject(:game3) { TowersOfHanoi.new([], [3, 2], [1]) }


  describe "#won?" do
    let(:game1) { TowersOfHanoi.new([], [3, 2, 1], []) }
    let(:game2) { TowersOfHanoi.new([], [], [3, 2, 1]) }
    let(:game3) { TowersOfHanoi.new([], [3, 2], [1]) }
    it "returns true if tower_two is full" do
      expect(game1.won?).to be true
    end
    it "returns true if tower_three is full" do
      expect(game2.won?).to be true
    end
    it "returns false if tower_two or tower_three are not full" do
      expect(game3.won?).to be false
    end
  end

end
