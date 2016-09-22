class HanoiTowers
  attr_reader :rods

  def initialize
    @rods = [[3, 2, 1],[],[]]
  end

  def play
    until won?
      from, to = get_input
      move(from, to)
    end

    puts "Game over!!"
  end

  def move(from, to)
    raise InvalidMoveError if @rods[from].empty?
    unless @rods[to].empty?
      raise InvalidMoveError if @rods[to].last < @rods[from].last
    end
    @rods[to] << @rods[from].pop
  end

  def won?
    if @rods[0].empty? && (@rods[1] == [3,2,1] || @rods[2] == [3,2,1])
      return true
    else
      return false
    end
  end

  private

  def get_input
    puts "Enter a from rod and a to rod, separated by a space"
    gets.chomp.split(' ')
  end

end

class InvalidMoveError < StandardError
end
