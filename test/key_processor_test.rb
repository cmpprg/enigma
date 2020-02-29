require "simplecov"
require "minitest/autorun"
require "minitest/pride"
require "./lib/key_processor"

class KeyProcessorTest < Minitest::Test
  def setup
    @key_processor = KeyProcessor.new("02715")
  end

  def test_it_exists
    assert_instance_of KeyProcessor, @key_processor
  end

  def test_it_has_attributes
    assert_equal "02715", @key_processor.input_key
    assert_equal "abcd", @key_processor.key_categories
  end

  def test_it_can_process_key
    expected = {a: 2,
                b: 27,
                c: 71,
                d: 15}

    assert_equal expected, @key_processor.process_key
  end
end
