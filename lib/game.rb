require_relative 'player'

class Game
  attr_reader :players

  def initialize(player_count=3)
    @players = []
    player_count.times do |i|
      @players.push (Player.new)
      @players[i].name = "Player " + (i+1).to_s
    end
  end

  def run
    puts "Starting a new game with #{@players.size} players."
  end

  def score_roll(roll)
    @roll = roll
    @score = 0
    (1..6).to_a.each do |n|
      while (@roll.count n) >= 3 do
        remove_triplet(n)
        @score += (n * 100) + (n==1 ? 900 : 0) 
      end
    end
    @score += ((@roll.count 1) * 100) + ((@roll.count 5) * 50) 
    @roll.delete(1)
    @roll.delete(5)
    return :score => @score, :non_scoring_dice => @roll
  end

  def remove_triplet(num)
    3.times do
      @roll.delete_at(@roll.index(num) || @roll.length)
    end
  end


  def max_score
    top_player = @players.max_by(&:score)
    top_player.score
  end



end


