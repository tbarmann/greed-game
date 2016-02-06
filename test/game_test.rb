gem 'minitest'
require 'minitest/autorun'
require 'pry'
 
require_relative '../lib/game'

class GameTest < Minitest::Test
  def test_game_initializes_with_a_number_of_players
    g = Game.new(2)
    assert_equal 2, g.players.size
  end

  def test_game_defaults_to_3_players
    g = Game.new
    assert_equal 3, g.players.size
  end

  def test_game_initializes_player_names
    g = Game.new(2)
    assert_equal "Player 1", g.players[0].name
    assert_equal "Player 2", g.players[1].name
  end

  def test_a_game_can_be_run
    g = Game.new(2)
    assert g.respond_to?(:run)
  end

  def test_find_max_score_of_all_players
    g = Game.new(4)
    g.players[0].set_score 1000
    g.players[1].set_score 2000
    g.players[2].set_score 300
    g.players[3].set_score 0
    assert_equal 2000, g.max_score
  end


end
