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
  end

  def test_it_can_check_if_its_decryption
    assert_equal false, @message_processor.is_decryption?
  end

  def test_it_can_calculate_total_shifts
    expected = {:a=>3, :b=>27, :c=>73, :d=>20}

    assert_equal expected, @message_processor.total_shifts
  end

  def test_it_can_calculate_negative_total_shifts_for_decrypt
    expected = {:a=>-3, :b=>-27, :c=>-73, :d=>-20}
    @message_processor.set_decryption

    assert_equal expected, @message_processor.total_shifts
  end

  def test_it_can_shift_a_string_input_by_an_amount
    assert_equal "bcd", @message_processor.shift_input("abc", 1)
    assert_equal "qrs", @message_processor.shift_input("abc", 16)
  end

  def test_it_can_encrypt_a_message
    assert_equal "keder ohulw", @message_processor.encrypt
    assert_equal "keder1,tzojeg!@%^&*", @message_processor2.encrypt
  end

  def test_it_can_set_is_decryption_to_true
    assert_equal false, @message_processor.is_decryption?

    @message_processor.set_decryption

    assert_equal true, @message_processor.is_decryption?
  end

  def test_it_can_decrypt_a_message
    message_processor = MessageProcessor.new("keder ohulw", "02715", "040895")
    message_processor2 = MessageProcessor.new("keder1,tzojeg!@%^&*", "02715", "040895")

    assert_equal "hello world", message_processor.decrypt
    assert_equal "hello1, world!@%^&*", message_processor2.decrypt
  end
end
