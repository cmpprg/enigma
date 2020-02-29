require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "./lib/message_processor"

class MessageProcessorTest < Minitest::Test

  def setup
    @message_processor = MessageProcessor.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of MessageProcessor, @message_processor
  end

  def test_it_has_attributes
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                  "j", "k", "l", "m", "n", "o", "p", "q", "r",
                  "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @message_processor.alphabet

    expected2 = {a: 2, b: 27, c: 71, d: 15}

    assert_equal expected2, @message_processor.key_hash_values

    expected3 = {a:1, b:0, c:2, d:5}

    assert_equal expected3, @message_processor.offset_hash_values
    assert_equal "hello world", @message_processor.message
  end
end