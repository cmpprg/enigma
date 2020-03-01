require "./lib/message_processor"
class Enigma

  def encrypt(input_message, key, date)
    encrypted_message = MessageProcessor.new(input_message, key, date).encrypt

    output_hash = {
      encryption: encrypted_message,
      key: key,
      date: date
    }

  end
end
