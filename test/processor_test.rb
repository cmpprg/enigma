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
end
