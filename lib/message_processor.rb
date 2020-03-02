require "./lib/key_processor"
require "./lib/date_processor"
require "./lib/processor"
class MessageProcessor < Processor

  attr_reader :key_shift_values, :offset_shift_values,
              :message, :is_decryption
  def initialize(message, key, date)
    @key_shift_values = KeyProcessor.new(key).output_hash
    @offset_shift_values = DateProcessor.new(date).output_hash
    @message = message
    @is_decryption = false
    super()
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

  def shift_input(string, amount)
    string.tr(alphabet.to_s, alphabet.rotate(amount).to_s)
  end

  def process_message
    split(message).each_with_index.with_object([]) do |(char, index), new_msg|
      if @alphabet.include?(char)
        new_msg << shift_input(char, total_shifts[:a]) if index % 4 == 0
        new_msg << shift_input(char, total_shifts[:b]) if index % 4 == 1
        new_msg << shift_input(char, total_shifts[:c]) if index % 4 == 2
        new_msg << shift_input(char, total_shifts[:d]) if index % 4 == 3
      else
        new_msg << char
      end
    end
  end

  def encrypt
    process_message.join
  end

  def set_decryption
    @is_decryption = true
  end

  def decrypt
    set_decryption
    process_message.join
  end
end
