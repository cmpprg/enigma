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
    assert_equal true, ("0".."9").include?(@enigma.random_number[0])
    assert_equal true, ("0".."9").include?(@enigma.random_number[1])
    assert_equal true, ("0".."9").include?(@enigma.random_number[2])
    assert_equal true, ("0".."9").include?(@enigma.random_number[3])
    assert_equal true, ("0".."9").include?(@enigma.random_number[4])
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

  def test_it_can_use_default_todays_date_for_encryption
    @enigma.stubs(:todays_date).returns("010320")

    expected = {encryption: "lib sdmcvpu", key: "02715", date: "010320"}

    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_use_default_todays_date_for_decryption
    @enigma.stubs(:todays_date).returns("010320")

    expected = {decryption: "hello world", key: "02715", date: "010320"}

    assert_equal expected, @enigma.decrypt("lib sdmcvpu", "02715")
  end

  def test_it_can_use_random_number_and_todays_date_as_defults_for_encrypt
    @enigma.stubs(:todays_date).returns("010320")
    @enigma.stubs(:random_number).returns("08351")

    expected = {encryption: "rktiyfdlarl", key: "08351", date: "010320"}

    assert_equal expected, @enigma.encrypt("hello world")
  end

end
