require 'minitest/autorun'

require_relative '../lib/dice_set'

class DiceSetTest < Minitest::Test
  def test_can_create_a_dice_set
    d = DiceSet.new
    assert !d.nil?
  end

  def test_dice_set_responds_to_values
    d = DiceSet.new
    assert d.respond_to?(:values)
  end

  def test_dice_set_values_are_nil_until_we_roll_once
    d = DiceSet.new
    assert_nil d.values
  end

  def test_dice_set_stores_its_values
    d = DiceSet.new
    d.roll(5)
    assert d.values.is_a?(Array), "should be an array"
  end

  def test_roll_defaults_to_5_dice
    d = DiceSet.new
    d.roll

    assert_equal 5, d.values.size
  end

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    d = DiceSet.new
    d.roll(5)

    assert_equal 5, d.values.size
    d.values.each do |value|
      assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
    end
  end

  def test_dice_values_should_not_change_unless_we_roll
    d = DiceSet.new
    d.roll(5)

    first = d.values
    second = d.values
    assert_equal first, second
  end

  def test_dice_values_should_change_between_rolls
    d = DiceSet.new

    d.roll(5)
    first = d.values

    d.roll(5)
    second = d.values

    assert first != second, "Two rolls should not be equal"
  end

  def test_you_can_roll_different_numbers_of_dice
    d = DiceSet.new

    d.roll(3)
    assert_equal 3, d.values.size

    d.roll(1)
    assert_equal 1, d.values.size
  end

  def test_rolling_no_dice_doesnt_change_values
    d = DiceSet.new
    d.roll(3)
    values = d.values

    d.roll(0)
    assert_equal values, d.values
  end

end
