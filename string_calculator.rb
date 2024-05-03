class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      delimiter, numbers = parse_custom_delimiter(numbers)
    end

    numbers = numbers.tr("\n", delimiter)
    nums = numbers.split(delimiter).map(&:to_i)

    negatives = nums.select { |num| num < 0 }
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end

    nums.sum
  end

  private

  def parse_custom_delimiter(numbers)
    delimiter, numbers = numbers.split("\n", 2)
    [delimiter[2..], numbers]
  end
end
