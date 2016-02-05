require 'pry'
require 'minitest/autorun'

require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def test_player_has_a_score
    with_stdin do |user|
      user.puts ""
      p = Player.new 0
      assert p.respond_to?(:score)
    end
  end

  def test_new_player_can_enter_name
    with_stdin do |user|
      user.puts "Bob"
      p = Player.new 0
      assert_equal(p.name, "Bob")
    end
  end

  def test_new_player_name_defaults_to_player_number
    with_stdin do |user|
      user.puts ""
      p = Player.new 15
      assert_equal(p.name, "Player 15")
    end
  end

   def test_player_score_starts_at_zero
     with_stdin do |user|
        user.puts ""
        p = Player.new 0
        assert_equal 0, p.score
      end
   end

   def test_player_keeps_track_of_how_many_rounds_they_have_played
     with_stdin do |user|
      user.puts ""
      p = Player.new 0
      assert_equal 0, p.round
    end
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
