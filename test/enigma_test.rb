require "./test/test_helper"
require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
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
                key: "12345",
                date: "76543"
                }

    expected2 = {
                decryption: "whatever",
                key: "12345",
                date: "76543"
                }

    assert_equal expected, @enigma.output_hash("whatever", "12345", "76543")
    assert_equal expected2, @enigma.output_hash("whatever", "12345", "76543", :decryption)
  end

  def test_it_can_generate_random_five_digit_number
    assert_equal 5, @enigma.random_number.length
    assert_instance_of String, @enigma.random_number
    assert_instance_of Integer, @enigma.random_number[0].to_i
    assert_instance_of Integer, @enigma.random_number[1].to_i
    assert_instance_of Integer, @enigma.random_number[2].to_i
    assert_instance_of Integer, @enigma.random_number[3].to_i
    assert_instance_of Integer, @enigma.random_number[4].to_i
  end

  def test_that_it_can_put_gather_todays_date_in_ddmmyy_format
    Date.stubs(:today).returns(Date.new(2020, 02, 29))
    assert_equal "290220", @enigma.todays_date
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
