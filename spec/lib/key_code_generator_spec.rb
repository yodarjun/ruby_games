require 'spec_helper'
require 'lib/key_code_generator'

describe KeyCodeGenerator, ".generate" do
  it "returns an array" do
    @reports << Benchmark.measure do
      KeyCodeGenerator.generate.should be_a_kind_of(Array)
    end
  end

  it "generates a key of length 6" do
    @reports << Benchmark.measure do
      KeyCodeGenerator.generate.map { |key_code| key_code.length.should == 6}
    end
  end

  it "doesnt include 0,1,2,o,l,z" do
    excludes = [0, 1, 2, "o", "l", "z"]
    @reports << Benchmark.measure do
      key_codes = KeyCodeGenerator.generate
      (key_codes & excludes).should be_empty
    end
  end

  it "returns an array of length 5000" do
    @reports << Benchmark.measure do
      KeyCodeGenerator.generate.length.should == 5000
    end
  end

  it "returns all unique keys" do
    @reports << Benchmark.measure do
      KeyCodeGenerator.generate.uniq!.should be_nil
    end
  end
end
