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
end
