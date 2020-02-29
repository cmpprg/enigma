require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "./lib/message_processor"

class MessageProcessorTest < Minitest::Test

  def setup
    @message_processor = MessageProcessor.new("hello world", "02715", "040895")
    @message_processor2 = MessageProcessor.new("hello1, world!@%^&*", "02715", "040895")
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

    assert_equal expected2, @message_processor.key_shift_values

    expected3 = {a:1, b:0, c:2, d:5}

    assert_equal expected3, @message_processor.offset_shift_values
    assert_equal "hello world", @message_processor.message
    assert_equal false, @message_processor.is_decryption
    assert_equal "", @message_processor.output_message
  end

  def test_it_can_find_total_shift_values
    expected = {:a=>3, :b=>27, :c=>73, :d=>20}

    assert_equal expected, @message_processor.total_shift_values
  end

  def test_it_can_encrypt_a_message

    @message_processor.process_message
    @message_processor2.process_message

    assert_equal "keder ohulw", @message_processor.output_message
    assert_equal "keder1,tzojeg!@%^&*", @message_processor2.output_message
  end
end
