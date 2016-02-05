
class Player
  attr_reader :round, :score, :name

  def initialize player_number
  	@round = @score = 0
  	@player_number = player_number.to_s
  	set_player_name  
  end

  def set_player_name 
	print "Enter a name for player " + @player_number + " (Default: Player " + @player_number + "): "
	STDOUT.flush
	input = gets.chomp
	@name = input.empty? ? "Player " + @player_number : input
#	binding.pry
  end



end
 