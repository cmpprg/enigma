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
end
