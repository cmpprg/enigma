require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "./lib/date_processor"

class DateProcessorTest < Minitest::Test

  def setup
    @date_processor1 = DateProcessor.new("040895")
    @date_processor2 = DateProcessor.new("211298")
  end

  def test_it_exists
    assert_instance_of DateProcessor, @date_processor1
  end

  def test_it_has_attributes
    assert_equal "040895", @date_processor1.input_date
    assert_equal "abcd", @date_processor1.offset_shift_keys
    assert_equal ({}), @date_processor1.offset_shift_values
  end

  def test_it_can_square_the_input_date
    assert_equal "1672401025", @date_processor1.square_date
    assert_equal "44646844804", @date_processor2.square_date
  end

  def test_it_can_capture_last_four_digits
    assert_equal "1025", @date_processor1.last_four_digits
    assert_equal "4804", @date_processor2.last_four_digits
  end

  def test_it_can_split_last_four_digits_into_array
    assert_equal ["1", "0", "2", "5"], @date_processor1.split_digits
    assert_equal ["4", "8", "0", "4"], @date_processor2.split_digits
  end

  def test_it_can_process_the_date_into_offset_values
    @date_processor1.process_date
    @date_processor2.process_date
    expected1 = {a:1, b:0, c:2, d:5}
    expected2 = {a:4, b:8, c:0, d:4}

    assert_equal expected1, @date_processor1.offset_shift_values
    assert_equal expected2, @date_processor2.offset_shift_values
  end

  def test_it_can_run_entire_processing_and_output_offset_values
    expected1 = {a:1, b:0, c:2, d:5}
    expected2 = {a:4, b:8, c:0, d:4}

    assert_equal expected1, @date_processor1.output_offset_values
    assert_equal expected2, @date_processor2.output_offset_values
  end
end
