require 'spec_helper'
require 'lib/roman_numeral'

# Given a Roman Numeral string, compute the Roman Numeral answer.
# Hint:
# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000
describe RomanNumeral, ".add" do
  it "should compute simple arithmatic" do
    @reports << Benchmark.measure do
      RomanNumeral.add("XV", "CV").should eql("CXX")
      RomanNumeral.add("MMX", "XIV").should eql("MMXXVI")
      RomanNumeral.add("II", "II").should eql("IIII")
    end
  end
end

describe RomanNumeral, "#as_int" do
  it "returns the integer value" do
    RomanNumeral.new("MMX").as_int.should == 2010
  end
end

describe RomanNumeral, ".to_roman" do
  it "returns the string value of the number" do
    RomanNumeral.to_roman(2010).should == "MMX"
  end
end
