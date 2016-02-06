
class Player
  attr_reader :round, :score
  attr_accessor :name

  def initialize
  	@round = @score = 0
  end

  def set_score points
  	@score = (@score > 0 || (points >= 300)) ? @score + points : 0
  end


end
 