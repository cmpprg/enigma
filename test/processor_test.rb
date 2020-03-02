require "minitest/autorun"
require "minitest/pride"
require "./lib/processor"

class ProcessorTest < Minitest::Test

  def setup
    @processor = Processor.new
  end

  def test_it_exists
    assert_instance_of Processor, @processor
  end

  def test_it_has_attributes
    alphabet = ["a", "b", "c", "d", "e", "f", "g", "h",
                "i", "j", "k", "l", "m", "n", "o", "p",
                "q", "r", "s", "t", "u", "v", "w", "x",
                "y", "z", " "]

    assert_equal alphabet, @processor.alphabet
  end

  def test_it_can_split_string_into_array
    string1 = "abcd"
    string2 = "hello, world"

    assert_equal ["a", "b", "c", "d"], @processor.split(string1)

    expected = ["h", "e", "l", "l", "o",
                ",", " ", "w", "o", "r",
                "l", "d"]

    assert_equal expected, @processor.split(string2)
  end

  def test_it_can_process_two_arrays_into_a_hash
    keys = ["a", "b", "c", "d"]
    values = [1, 2, 3, 4]
    expected =  {
                  "a" => 1,
                  "b" => 2,
                  "c" => 3,
                  "d" => 4
                  }

    assert_equal expected, @processor.process_to_hash(keys, values)
  end

  def test_it_can_create_symbolic_keys_of_a_given_quantity
    assert_equal [:a, :b, :c, :d, :e], @processor.create_sym_keys(5)
    assert_equal [:a, :b, :c, :d, :e, :f, :g], @processor.create_sym_keys(7)
  end
end
