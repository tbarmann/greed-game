
require_relative 'dice_set'
require 'pry'

class Player
  attr_reader :round, :score
  attr_accessor :name, :final_round

  def initialize
  	@round = @score = 0
  	@final_round = false
  end

  def set_score points
  	@score = (@score > 0 || (points >= 300)) ? @score + points : 0	
  end


  def play_turn
  	first_roll = true
  	greedy = true
  	points_this_turn = 0
  	number_of_dice = 5
  	@round += 1
  	puts "\n\n"
  	if @name
  		print "#{@name}, "
  		STDOUT.flush
  	end
  	puts "Round " + (final_round ? "FINAL:" : "#{@round}:")
  	puts "Your current score is #{@score}."
  	puts "Rolling..."
  	d = DiceSet.new
    while greedy
    	d.roll(number_of_dice)
	    print "\nYou rolled #{d.values} "
	    STDOUT.flush
		result = score_roll(d.values)
	    points_this_turn += result[:points]
	    puts "which is #{result[:points]} points"
	    puts "leaving non-scoring dice of #{result[:non_scoring_dice]}"
	    
	    if result[:points] > 0 || first_roll
	    	puts "Your points so far this turn: #{points_this_turn}"
	    	print "Do you want to be greedy? [Y/N] (Default N):"
	    	STDOUT.flush
			greedy = (gets[0].upcase == "Y") ? true : false
			number_of_dice = (result[:non_scoring_dice].size == 0) ? 5 : result[:non_scoring_dice].size
		else
			greedy = false
			if @score > 0 || points_this_turn >=300
				puts "You shouldn't have been so greedy!"
			end
			points_this_turn = 0
		end
		first_roll = false

	end
	set_score points_this_turn
	puts "Your score is now #{@score}"
  end

  def score_roll(roll)
    @roll = roll
    @points = 0
    (1..6).to_a.each do |n|
      while (@roll.count n) >= 3 do
        remove_triplet(n)
        @points += (n * 100) + (n==1 ? 900 : 0) 
      end
    end
    @points += ((@roll.count 1) * 100) + ((@roll.count 5) * 50) 
    @roll.delete(1)
    @roll.delete(5)
    return :points => @points, :non_scoring_dice => @roll
  end

  def remove_triplet(num)
    3.times do
      @roll.delete_at(@roll.index(num) || @roll.length)
    end
  end


end
 