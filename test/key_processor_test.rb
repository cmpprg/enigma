require "./test/test_helper"
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
    assert_equal "abcd", @key_processor.key_shift_keys
    assert_equal ({}), @key_processor.key_shift_values
  end

  def test_it_can_split_the_key_input_into_an_array
    assert_equal ["0", "2", "7", "1", "5"], @key_processor.split_input
  end

  def test_it_can_process_key
    @key_processor.process_key

    expected = {a: 2,
                b: 27,
                c: 71,
                d: 15}

    assert_equal expected, @key_processor.key_shift_values
  end

  def test_it_can_process_key_and_output_key_values
    expected = {a: 2,
                b: 27,
                c: 71,
                d: 15}

    assert_equal expected, @key_processor.output_key_values
  end
end
