require "date"
require "./lib/message_processor"
class Enigma

  def encrypt(input_message, key = random_five, date = todays_date)
    return "Invalid Input" if !valid_inputs?(input_message, key, date)
    encrypted_message = MessageProcessor.new(input_message, key, date).encrypt
    output_hash(encrypted_message, key, date)
  end

  def decrypt(ciphertext, key, date = todays_date)
    return "Invalid Input" if !valid_inputs?(ciphertext, key, date)
    decrypted_message = MessageProcessor.new(ciphertext, key, date).decrypt
    output_hash(decrypted_message, key, date, :decryption)
  end

  def output_hash(processed_message, key, date, action = :encryption)
    Hash[action, processed_message, :key, key, :date, date]
  end

  def random_number
    [*"0".."9"].shuffle.sample
  end

  def random_five
    [*1..5].map{|num| random_number}.join
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def valid_date?(date)
    return false unless date.length == 6
    return false unless date.split("").all?{ |num| ("0".."9").include?(num)}
    Date.valid_date?("20#{date[-2,2]}".to_i,date[2,2].to_i, date[0,2].to_i)
  end

  def valid_key?(key)
    return false unless key.length == 5
    key.split("").all?{ |num| ("0".."9").include?(num)}
  end

  def valid_inputs?(message, key, date)
    message.class == String && valid_date?(date) && valid_key?(key)
  end
end
