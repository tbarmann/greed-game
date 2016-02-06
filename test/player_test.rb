require 'minitest/autorun'

require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def test_player_has_a_score
    p = Player.new
    assert p.respond_to?(:score)
  end

  def test_player_score_starts_at_zero
    p = Player.new
    assert_equal 0, p.score
  end

  def test_player_score_stays_0_if_score_is_0_and_points_less_than_300
    p = Player.new
    p.set_score 299
    assert_equal 0, p.score
  end

  def test_player_score_counts_when_points_are_300
    p = Player.new
    p.set_score 300
    assert_equal 300, p.score
  end

  def test_player_score_when_two_turns_in_a_row_are_less_than_300
    p = Player.new
    p.set_score 200
    p.set_score 200
    assert_equal 0, p.score
  end

  def test_player_score_when_first_turn_not_less_than_than_300
    p = Player.new
    p.set_score 300
    p.set_score 200
    assert_equal 500, p.score
  end

 def test_player_score_roll_works_correctly
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

    result = p.score_roll([2,3,4,2,3])
    assert_equal 0, result[:points]
    assert_equal [2,3,4,2,3], result[:non_scoring_dice]

  end

  def test_player_keeps_track_of_how_many_rounds_they_have_played
    p = Player.new
    assert_equal 0, p.round
    
    with_stdin do |user|
      user.puts "N"           # Answer "N" to roll again
      p.play_turn
      assert_equal 1, p.round
    end

    with_stdin do |user|
      user.puts "N"           # Answer "N" to roll again
      p.play_turn
    end

    with_stdin do |user|
      user.puts "N"           # Answer "N" to roll again
      p.play_turn
      assert_equal 3, p.round
    end
  end

  def test_player_stores_if_final_round
    p = Player.new
    p.final_round = true
    assert_equal true, p.final_round
  end


  def with_stdin
    stdin = $stdin             # remember $stdin
    $stdin, write = IO.pipe    # create pipe assigning its "read end" to $stdin
    yield write                # pass pipe's "write end" to block
  ensure
    write.close                # close pipe
    $stdin = stdin             # restore $stdin
  end
end
