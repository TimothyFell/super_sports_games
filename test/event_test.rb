require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/event'

class EventsTest < Minitest::Test
  def test_it_exists
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_instance_of Event, curling
  end

  def test_it_has_a_name
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_equal "Curling", curling.name
  end

  def test_it_has_ages
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_equal [24, 30, 18, 20, 41], curling.ages
  end

  def test_it_can_find_max_age
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_equal 41, curling.max_age
  end

  def test_it_can_find_min_age
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_equal 18, curling.min_age
  end

  def test_it_can_find_average_age
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_equal 26.6, curling.average_age
  end

  def test_it_can_find_standard_deviation
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    assert_equal 8.28, curling.standard_deviation_age
  end

  # Testing Helper Methods

  def test_sum_array
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    input = [24, 30, 18, 20, 41]
    assert_equal 133, curling.sum_array(input)
  end

  def test_minus_average
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    input1 = [24, 30, 18, 20, 41]
    input2 = 26.6
    expected = [-2.6000000000000014, 3.3999999999999986, -8.600000000000001, -6.600000000000001, 14.399999999999999]
    assert_equal expected, curling.minus_average(input1, input2)
  end

  def test_square_minus_average
    curling = Event.new("Curling", [24, 30, 18, 20, 41])
    input = [-2.6000000000000014, 3.3999999999999986, -8.600000000000001, -6.600000000000001, 14.399999999999999]
    expected = [6.760000000000008, 11.55999999999999, 73.96000000000002, 43.56000000000002, 207.35999999999996]
    assert_equal expected, curling.square_minus_average(input)
  end
end
