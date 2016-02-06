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



  def test_player_keeps_track_of_how_many_rounds_they_have_played
    p = Player.new
    assert_equal 0, p.round
  end
end
