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

  def decrypt(ciphertext, key, date)
    decrypted_message = MessageProcessor.new(ciphertext, key, date).decrypt

    output_hash = {
      decryption: decrypted_message,
      key: key,
      date: date
    }
  end
end
