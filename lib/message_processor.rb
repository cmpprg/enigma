require "./lib/key_processor"
require "./lib/date_processor"
class MessageProcessor

  attr_reader :alphabet, :key_shift_values, :offset_shift_values,
              :message, :is_decryption, :output_message
  def initialize(message, key, date)
    @alphabet = ("a".."z").to_a << " "
    @key_shift_values = KeyProcessor.new(key).key_shift_values
    @offset_shift_values = DateProcessor.new(date).offset_shift_values
    @message = message.downcase
    @is_decryption = false
    @output_message = ""
  end

  def total_shifts
    key_shift_values.merge(offset_shift_values) do |keys, key_val, offset_val|
      key_val + offset_val
    end
  end

  def split_message
    message.split("")
  end

  def shift_input(string, amount)
    string.tr(alphabet.to_s, alphabet.rotate(amount).to_s)
  end

  def process_message
    new_msg = []
    split_message.each_with_index do |char, index|
      if @alphabet.include?(char)
        new_msg << shift_input(char, total_shifts[:a]) if index % 4 == 0
        new_msg << shift_input(char, total_shifts[:b]) if (index - 1) % 4 == 0
        new_msg << shift_input(char, total_shifts[:c]) if (index - 2) % 4 == 0
        new_msg << shift_input(char, total_shifts[:d]) if (index - 3) % 4 == 0
      else
        new_msg << char
      end
    end
    @output_message = new_msg.join()
  end
end
