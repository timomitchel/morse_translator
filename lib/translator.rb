require "pry"
class Translator

  attr_reader :english_to_morse, :morse_to_eng

  def initialize
    @english_to_morse = {
  	"a" => ".-",
  	"b" => "-...",
  	"c" => "-.-.",
  	"d" => "-..",
  	"e" => ".",
  	"f" => "..-.",
  	"g" => "--.",
  	"h" => "....",
  	"i" => "..",
  	"j" => ".---",
  	"k" => "-.-",
  	"l" => ".-..",
  	"m" => "--",
  	"n" => "-.",
  	"o" => "---",
  	"p" => ".--.",
  	"q" => "--.-",
  	"r" => ".-.",
  	"s" => "...",
  	"t" => "-",
  	"u" => "..-",
  	"v" => "...-",
  	"w" => ".--",
  	"x" => "-..-",
  	"y" => "-.--",
  	"z" => "--..",
  	" " => " ",
  	"1" => ".----",
  	"2" => "..---",
  	"3" => "...--",
  	"4" => "....-",
  	"5" => ".....",
  	"6" => "-....",
  	"7" => "--...",
  	"8" => "---..",
  	"9" => "----.",
  	"0" => "-----"
  }

  end

  def hash_inverter
    @english_to_morse.invert
  end

  def eng_to_morse(input)
    input.chars.map do |character|
      english_to_morse[character.downcase]
    end.join
  end

  def from_file(file_input)
    file = File.open(file_input).readlines
    formatted_file = file[0].chomp

    eng_to_morse(formatted_file)
  end

  def morse_to_eng(morse)
    @empty = ''
    split = morse.chars
    x = hash_inverter
    split.map { |morse_code| @empty << x[morse_code] if x[morse_code]}
    @empty
  end



end
