require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "./lib/date_processor"

class DateProcessorTest < Minitest::Test

  def setup
    @date_processor = DateProcessor.new("040895")
  end

  def test_it_exists
    assert_instance_of DateProcessor, @date_processor
  end

  def test_it_has_attributes
    assert_equal "040895", @date_processor.input_date
    assert_equal "abcd", @date_processor.offset_shift_keys
    assert_equal 0, @date_processor.counter
    assert_equal ({}), @date_processor.offset_shift_values
  end
end
