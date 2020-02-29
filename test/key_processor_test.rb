require "minitest/autorun"
require "minitest/pride"
require "./lib/key_processor"

class KeyProcessorTest < Minitest::Test
  def test_it_exists
    key_processor = KeyProcessor.new("02715")

    assert_instance_of KeyProcessor, key_processor
  end
end
