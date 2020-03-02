require "./lib/key_processor"
require "./lib/date_processor"
class MessageProcessor

  attr_reader :alphabet, :key_shift_values, :offset_shift_values,
              :message, :is_decryption, :output_message
  def initialize(message, key, date)
    @alphabet = ("a".."z").to_a << " "
    @key_shift_values = KeyProcessor.new(key).process_key
    @offset_shift_values = DateProcessor.new(date).process_date
    @message = message
    @is_decryption = false
    @output_message = ""
  end

  def is_decryption?
    @is_decryption
  end

  def total_shifts
    key_shift_values.merge(offset_shift_values) do |keys, key_val, offset_val|
      if is_decryption?
        (key_val + offset_val) * -1
      else
        key_val + offset_val
      end
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
    new_msg
  end

  def encrypt
    @output_message = process_message.join
  end

  def set_decryption
    @is_decryption = true
  end

  def decrypt
    set_decryption
    @output_message = process_message.join
  end
end
