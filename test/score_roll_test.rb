gem 'minitest'
require 'minitest/autorun'
 
require_relative '../lib/player'

class ScoreRollTest < Minitest::Test
  def test_scoring_works_correctly
    p = Player.new
    result = p.score_roll([1,1,1,1,1])
    assert_equal 1200, result[:points]
    assert_equal [], result[:non_scoring_dice]

    result = p.score_roll([5,1,3,4,1])
    assert_equal 250, result[:points]
    assert_equal [3,4], result[:non_scoring_dice]
 
    result = p.score_roll([1,1,1,3,1])
    assert_equal 1100, result[:points]
    assert_equal [3], result[:non_scoring_dice]

    result = p.score_roll([2,4,4,5,4])
    assert_equal 450, result[:points]
    assert_equal [2], result[:non_scoring_dice]
  end

end
