require "minitest/autorun"
require "minitest/pride"
require "./lib/encryption"

class EncryptionTest < Minitest::Test

  def setup
    @encryption = Encryption.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption
  end

  def test_it_has_attributes
    assert_equal "hello world", @encryption.message
    assert_equal "02715", @encryption.key
    assert_equal "040895", @encryption.date
  end
end
