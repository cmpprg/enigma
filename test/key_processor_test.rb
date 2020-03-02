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
  end

  def test_it_can_create_an_array_of_pairs
    assert_equal [02, 27, 71, 15], @key_processor.create_pairs
  end

  def test_it_can_create_keys
    assert_equal [:a, :b, :c, :d], @key_processor.create_keys
  end

  def test_it_can_process_key_and_output_hash
    expected = {a: 2,
                b: 27,
                c: 71,
                d: 15}

    assert_equal expected, @key_processor.output_hash
  end

end
