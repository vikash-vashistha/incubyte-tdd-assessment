require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number for a single number string" do
      calculator = StringCalculator.new
      expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum for two numbers separated by a comma" do
      calculator = StringCalculator.new
      expect(calculator.add("1,5")).to eq(6)
    end

    it "allows new line as a separator" do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiter" do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "throws an exception for negative numbers" do
      calculator = StringCalculator.new
      expect { calculator.add("-1,2,-3") }.to raise_error("negative numbers not allowed -1,-3")
    end
  end
end
