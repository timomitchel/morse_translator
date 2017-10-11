require "minitest/autorun"
require "minitest/pride"
require "./lib/translator"

class TranslatorTest < Minitest::Test

  attr_reader :translator

  def setup
    @translator = Translator.new
  end

  def test_translator_class_exists
    assert_instance_of Translator, translator
  end

  def test_hash_works_correctly
    assert_equal ".-", translator.english_to_morse["a"]
    assert_equal ".-..", translator.english_to_morse["l"]
    assert_equal "----.", translator.english_to_morse["9"]
    assert_nil nil, translator.english_to_morse[10]
    assert_nil nil, translator.english_to_morse[['halp']]
    assert_equal " ", translator.english_to_morse[' ']
  end

  def test_hash_inverter_works_correctly
    assert_equal "4", translator.hash_inverter["....-"]
    assert_equal "t", translator.hash_inverter["-"]
    assert_equal "k", translator.hash_inverter["-.-"]
  end

  def test_eng_to_morse_can_translate_with_lowercase_letters
    actual = "......-...-..--- .-----.-..-..-.."
    expected = translator.eng_to_morse("hello world")

    assert_equal expected, actual
  end

  def test_end_to_morse_is_case_insensitive_and_does_numbers
    actual_1 = "......-...-..--- .-----.-..-..-.."
    actual_2 = "-......-.. .-.-.. ...-- ..........--...."
    expected_1 = translator.eng_to_morse("Hello World")
    expected_2 = translator.eng_to_morse("There are 3 ships")

    assert_equal expected_1, actual_1
    assert_equal expected_2, actual_2
  end

  def test_translator_can_read_from_file
    actual = ".. .--- ..-. .- ..-....-..."
    expected = translator.from_file("./lib/input.txt")

    assert_equal expected, actual
  end

  def test_morse_to_eng_can_translate_correctly
    skip
    actual = "hello world"
    expected = translator.morse_to_eng("......-...-..--- .-----.-..-..-..")

    assert_equal expected, actual
  end

end
