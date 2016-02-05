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
    0
  end
end
