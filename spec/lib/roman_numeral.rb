class RomanNumeral
  CHARS = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  def initialize(str)
    @roman_string = str
  end

  def as_int
    roman_string_array = @roman_string.split("")
    number = 0
    roman_string_array.each do |char|
      number += CHARS[char]
    end
    number
  end

  def self.to_roman(number)
    reverse_char_set = CHARS.invert
    divisors = CHARS.values.sort { |a,b| b <=> a }

    result_str = ""
    i = 0
    divisor = divisors[i]
    while number > 0
      if number % divisor == number
        i += 1
        divisor = divisors[i]
      else
        multiple = number / divisor
        number = number % divisor
        char = reverse_char_set[divisor]
        str = char * multiple
        result_str << str
      end
    end
    result_str
  end

  def self.add(number_str1, number_str2)
    first  = RomanNumeral.new(number_str1).as_int
    second = RomanNumeral.new(number_str2).as_int

    RomanNumeral.to_roman(first + second)
  end
end
