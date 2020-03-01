require "date"
require "./lib/message_processor"
class Enigma

  def output_hash(processed_message, key, date, action = :encryption)
    Hash[action, processed_message, :key, key, :date, date]
  end

  def random_number
    (0..9).to_a.sample(5).shuffle.join
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def encrypt(input_message, key, date = todays_date)
    encrypted_message = MessageProcessor.new(input_message, key, date).encrypt
    output_hash(encrypted_message, key, date)
  end

  def decrypt(ciphertext, key, date = todays_date)
    decrypted_message = MessageProcessor.new(ciphertext, key, date).decrypt
    output_hash(decrypted_message, key, date, :decryption)
  end
end

#Use Date.strptime("mmddyy", ("%m%d%y")) for validation
