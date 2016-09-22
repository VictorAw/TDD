require "rspec"
require "towers_of_hanoi"

describe "HanoiTowers" do
  subject(:game) { HanoiTowers.new }

  describe "#move" do
    it "Raise an error when moving a larger disc onto a smaller disc" do
      game.move(0, 1)
      expect{ game.move(0, 1) }.to raise_error(InvalidMoveError)
      # expect runs the code in the block, no need to rerun underneath
      # will throw an error in RSPEC
    end

    it "Moves a disc onto an empty rod" do
      game.move(0, 1)
      expect(game.rods[1]).to_not be_empty
    end

    it "raises error if you try to pull from an empty rod" do
      expect {game.move(1, 0)}.to raise_error(InvalidMoveError)
    end

    it "Moves a smaller disc onto a larger disc" do
      game.move(0, 1)
      game.move(0, 2)
      expect { game.move(1, 2) }.to_not raise_error(InvalidMoveError)
    end
  end

  describe "#won?" do
    # for future reference, check each rod individually
    it "Returns true if all discs are in the right sequence on a non-starting rod" do
      game.move(0, 1)
      game.move(0, 2)
      game.move(1, 2)
      game.move(0, 1)
      game.move(2, 0)
      game.move(2, 1)
      game.move(0, 1)
      expect(game.won?).to be_truthy
    end

    it "Returns false in all other cases" do
      expect(game.won?).to be_falsey
      game.move(0, 1)
      expect(game.won?).to be_falsey
      game.move(0, 2)
      expect(game.won?).to be_falsey
    end
  end
end
