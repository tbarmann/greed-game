require_relative 'player'

class Game
  attr_reader :players

  def initialize(player_count=3)
    @players = []
    player_count.times do |i|
      @players.push (Player.new i)
    end
  end

  def run
    puts "Starting a new game with #{@players.size} players."
  end

  def score_roll(roll)
    puts "#{roll}"
    @score = 0
    (1..6).to_a.each do |n|
      while roll.count n >= 3 do
        remove_triplet(roll,n)
        @score += (n * 100) + (n==1 ? 900 : 0) 
      end
    end
    @score += ((roll.count 1) * 100) + ((roll.count 5) * 50) 
    roll.delete(1)
    roll.delete(5)
    puts "Score: " + @score
    puts "Non-scoring dice: #{roll}"
  
    # Three 1's => 1000 points
    # Three 6's =>  600 points
    # Three 5's =>  500 points
    # Three 4's =>  400 points
    # Three 3's =>  300 points
    # Three 2's =>  200 points
    # One   1   =>  100 points
    # One   5   =>   50 points



  end

  def remove_triplet(arr,num)
    3.times do
      arr.delete_at(arr.index(num) || arr.length)
    end
    return arr
  end


end


