require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "./lib/enigma"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_build_output_hash
    expected = {
                encryption: "whatever",
                key: "123456",
                date: "76543"
                }

    expected2 = {
                decryption: "whatever",
                key: "123456",
                date: "76543"
                }

    assert_equal expected, @enigma.output_hash("whatever", "123456", "76543")
    assert_equal expected2, @enigma.output_hash("whatever", "123456", "76543", :decryption)
  end

  def test_it_can_encrypt_a_message
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }

    expected2 = {
                encryption: "keder1,tzojeg!@%^&*",
                key: "02715",
                date: "040895"
                }
    encrypt = @enigma.encrypt("hello world", "02715", "040895")
    encrypt2 = @enigma.encrypt("hello1, world!@%^&*", "02715", "040895")

    assert_equal expected, encrypt
    assert_equal expected2, encrypt2
  end

  def test_it_can_decrypt_a_message
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }

    expected2 = {
                decryption: "hello1, world!@%^&*",
                key: "02715",
                date: "040895"
                }
    decrypt = @enigma.decrypt("keder ohulw", "02715", "040895")
    decrypt2 = @enigma.decrypt("keder1,tzojeg!@%^&*", "02715", "040895")

    assert_equal expected, decrypt
    assert_equal expected2, decrypt2
  end
end
