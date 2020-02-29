require "./lib/key_processor"
require "./lib/date_processor"
class MessageProcessor

  attr_reader :alphabet, :key_shift, :offset_shift,
              :message, :is_decryption, :output_message
  def initialize(message, key, date)
    @alphabet = ("a".."z").to_a << " "
    @key_shift = KeyProcessor.new(key).key_shift_values
    @offset_shift = DateProcessor.new(date).offset_shift_values
    @message = message.downcase
    @is_decryption = false
    @output_message = ""
  end

  def process_message

    total_shift = key_shift.merge(offset_shift) do |keys, key_val, off_val|
      key_val + off_val
    end

    split_message = message.split("")

    new_message = []
    split_message.each_with_index do |letter, index|
      if @alphabet.include?(letter)
        if index % 4 == 0
          new_message << letter.tr(alphabet.to_s, alphabet.rotate(total_shift[:a]).to_s)
        elsif (index - 1) % 4 == 0
          new_message << letter.tr(alphabet.to_s, alphabet.rotate(total_shift[:b]).to_s)
        elsif (index - 2) % 4 == 0
          new_message << letter.tr(alphabet.to_s, alphabet.rotate(total_shift[:c]).to_s)
        elsif (index - 3) % 4 == 0
          new_message << letter.tr(alphabet.to_s, alphabet.rotate(total_shift[:d]).to_s)
        end
      else
        new_message << letter
      end
    end

    @output_message = new_message.join()
  end
end
