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
    # preliminary rounds
    puts "Starting a new game with #{@players.size} players."
    index = 0
    while max_score < 3000 do
      index = index % @players.size
      @players[index].play_turn
      index += 1
    end

    #final round
    puts "\n\nENTERING FINAL ROUND\n\n"
    for i in 0..@players.size-1
       @players[i].final_round = true
       @players[i].play_turn
    end

    end_game
  end

  def end_game
    puts "\n\nGAME OVER\n\n"
    #sort players by score
    @players.sort_by {|player| player.score}

    #display final results
    puts "Final results:"
    puts "#{@players}" 
end





  def max_score
    top_player = @players.max_by(&:score)
    top_player.score
  end



end


