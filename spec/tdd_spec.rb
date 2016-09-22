require 'rspec'
require 'tdd'

describe Array do
  describe "#my_uniq" do
    subject(:arr) { [1, 2, 1, 3, 3] }

    it "Removes duplicates from the array" do
      expect(arr.my_uniq).to eq([1, 2, 3])
    end

    it "Doesn't modify the original array" do
      arr.my_uniq
      expect(arr).to eq([1, 2, 1, 3, 3])
    end
  end

  describe "#two_sum" do
    subject(:arr) { [-1, 0, 2, -2, 1] }

    it "Returns pairs of positions that sum to zero" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "Returns an empty array if no pairs are found" do
      expect([1, 2, 3].two_sum).to be_empty
    end
  end
end

describe "#my_transpose" do
  subject(:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  let(:cols) { [[0, 3, 6], [1, 4, 7], [2, 5, 8]] }

  it "Transposes the matrix" do
    expect(my_transpose(matrix)).to eq(cols)
  end

  it "Does not modify the original" do
    old_matrix = matrix.dup
    my_transpose(matrix)
    expect(matrix).to eq(old_matrix)
  end
end

describe "#stock_picker" do
  let (:good_prices) {[100, 102, 90, 180, 110, 120] }
  let (:bad_prices) { [100, 98, 96, 95, 2] }

  it "Takes an array of prices and outputs the most profitable pair" do
    expect(stock_picker(good_prices)).to eq([2, 3])
  end

  it "Should pick the larger number second in each pair" do
    days = stock_picker(good_prices)
    expect(days[0]).to be < days[1]
  end

  it "Returns an empty array if no gain is possible" do
    expect(stock_picker(bad_prices)).to be_empty
  end
end
