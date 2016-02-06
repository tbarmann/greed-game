
require_relative 'dice_set'
require 'pry'

class Player
  attr_reader :round, :score
  attr_accessor :name

  def initialize
  	@round = @score = 0
  end

  def set_score points
  	@score = (@score > 0 || (points >= 300)) ? @score + points : 0	
  end


  def play_turn
  	@round += 1
  	if @name
  		puts @name + ": "
  	end
  	puts "Rolling..."
  	d = DiceSet.new
    d.roll(5)

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
 