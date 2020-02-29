require "./lib/key_processor"
require "./lib/date_processor"
class MessageProcessor

  attr_reader :alphabet, :key_shift_values,
              :offset_shift_values, :message
  def initialize(message, key, date)
    @alphabet = ("a".."z").to_a << " "
    @key_shift_values = KeyProcessor.new(key).key_shift_values
    @offset_shift_values = DateProcessor.new(date).offset_shift_values
    @message = message
  end
end
