require "minitest/autorun"
require "minitest/pride"
require "./lib/encryption"

class EncryptionTest < Minitest::Test

  def setup
    @encryption = Encryption.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encryption, encryption
  end

end
