gem 'minitest'
require 'minitest/autorun'
 
require_relative '../lib/game'

class GameTest < Minitest::Test
  def test_game_initializes_with_a_number_of_players
    g = Game.new(2)
    result = g.score_roll([1,1,1,1,1])
    assert_equal 1200, result[:score]
    assert_equal [], result[:non_scoring_dice]

    result = g.score_roll([5,1,3,4,1])
    assert_equal 250, result[:score]
    assert_equal [3,4], result[:non_scoring_dice]
 
    result = g.score_roll([1,1,1,3,1])
    assert_equal 1100, result[:score]
    assert_equal [3], result[:non_scoring_dice]

    result = g.score_roll([2,4,4,5,4])
    assert_equal 450, result[:score]
    assert_equal [2], result[:non_scoring_dice]
  end

end

# Throw       Score
# ---------   ------------------
# 5 1 3 4 1   50 + 2 * 100 = 250
# 1 1 1 3 1   1000 + 100 = 1100
# 2 4 4 5 4   400 + 50 = 450
