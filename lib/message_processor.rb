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

  def total_shift_values
    key_shift_values.merge(offset_shift_values) do |keys, key_val, offset_val|
      key_val + offset_val
    end
  end

  def process_message
    split_message = message.split("")

    new_message = []
    split_message.each_with_index do |letter, index|
      if @alphabet.include?(letter)
        if index % 4 == 0
          new_message << letter.tr(alphabet.to_s, alphabet.rotate(total_shift_values[:a]).to_s)
        elsif (index - 1) % 4 == 0
          new_message << letter.tr(alphabet.to_s, alphabet.rotate(total_shift_values[:b]).to_s)
        elsif (index - 2) % 4 == 0
          new_message << letter.tr(alphabet.to_s, alphabet.rotate(total_shift_values[:c]).to_s)
        elsif (index - 3) % 4 == 0
          new_message << letter.tr(alphabet.to_s, alphabet.rotate(total_shift_values[:d]).to_s)
        end
      else
        new_message << letter
      end
    end

    @output_message = new_message.join()
  end
end
