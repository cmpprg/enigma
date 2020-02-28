require_relative "encryption"
class Enigma

  def encrypt(message, key, date)
    encrypt = Encryption.new(message, key, date)
    encrypt.encrypted_hash
  end
end
