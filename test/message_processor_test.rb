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
end
