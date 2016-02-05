gem 'minitest'
require 'minitest/autorun'
 
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

  def test_a_game_can_be_run
    g = Game.new(2)
    assert g.respond_to?(:run)
  end
end
