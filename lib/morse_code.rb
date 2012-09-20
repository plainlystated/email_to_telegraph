class MorseCode
  class Element
    def initialize(name)
      @name = name
    end

    def to_str
      @name
    end
  end

  Dot = Element.new(".")
  Dash = Element.new("-")
  ElementGap = Element.new(" ")
  LetterGap = Element.new("   ")
  WordGap = Element.new("     ")

  def self.encode(string)
    words = string.downcase.gsub(/[^a-z ]/, '').split(' ').map do |word|
      encode_word(word)
    end
    words.join(WordGap)
  end

  def self.encode_word(word)
    letters = word.split('').map do |letter|
      encode_letter(letter)
    end
    letters.join(LetterGap)
  end

  def self.encode_letter(letter)
    letter_codes = case letter
    when "a":
      [Dot, Dash]
    when "b":
      [Dash, Dot, Dot, Dot]
    when "c":
      [Dash, Dot, Dash, Dot]
    when "d":
      [Dash, Dot, Dot]
    when "e":
      [Dot]
    when "f":
      [Dot, Dot, Dash, Dot]
    when "g":
      [Dash, Dash, Dot]
    when "h":
      [Dot, Dot, Dot, Dot]
    when "i":
      [Dot, Dot]
    when "j":
      [Dot, Dash, Dash, Dash]
    when "k":
      [Dash, Dot, Dash]
    when "l":
      [Dot, Dash, Dot, Dot]
    when "m":
      [Dash, Dash]
    when "n":
      [Dash, Dot]
    when "o":
      [Dash, Dash, Dash]
    when "p":
      [Dot, Dash, Dash, Dot]
    when "q":
      [Dash, Dash, Dot, Dash]
    when "r":
      [Dot, Dash, Dot]
    when "s":
      [Dot, Dot, Dot]
    when "t":
      [Dash]
    when "u":
      [Dot, Dot, Dash]
    when "v":
      [Dot, Dot, Dot, Dash]
    when "w":
      [Dot, Dash, Dash]
    when "x":
      [Dash, Dot, Dot, Dash]
    when "y":
      [Dash, Dot, Dash, Dash]
    when "z":
      [Dash, Dash, Dot, Dot]
    end

    letter_codes.map(&:to_str).join(ElementGap)
  end
end
