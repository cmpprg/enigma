require "minitest/autorun"
require "minitest/pride"
require "./lib/processor"

class ProcessorTest < Minitest::Test

  def setup
    @processor = Processor.new
  end

  def test_it_exists
    assert_instance_of Processor, @processor
  end

end
