require 'minitest/autorun'

require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def test_player_has_a_score
    p = Player.new 0
    assert p.respond_to?(:score)
  end

  def test_player_score_starts_at_zero
    p = Player.new 0
    assert_equal 0, p.score
  end

  def test_player_keeps_track_of_how_many_rounds_they_have_played
    p = Player.new 0
    assert_equal 0, p.round
  end
end
