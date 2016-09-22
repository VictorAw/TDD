class Array
  def my_uniq
    uniq_array = []
    each do |el|
      uniq_array << el unless uniq_array.include?(el)
    end

    uniq_array
  end

  def two_sum
    pairs = []

    for i in 0...size - 1
      for j in i + 1...size
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end

    pairs
  end
end

def my_transpose(matrix)
  result = []

  for i in 0...matrix.size
    result << []
    for j in 0...matrix[i].size
      result[i] << matrix[j][i]
    end
  end

  result
end

def stock_picker(prices)
  buy, sell, gain = nil, nil, 0
  prices[0...-1].each_with_index do |price, day|
    profit = prices[day + 1] - price
    if profit > gain
      buy = day
      sell = day + 1
      gain = profit
    end
  end

  return [] if gain == 0
  [buy, sell]
end
