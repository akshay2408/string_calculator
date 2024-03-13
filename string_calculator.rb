class StringCalculator
  def add(numbers)
    delimiters = [",", "\n"]
    invalid_pattern = [",\n", "\n,"]

    return 0 unless numbers.is_a? String
    return 0 if numbers.match?(Regexp.union(invalid_pattern))

    if numbers.start_with?("//")
      custom_delimiter, numbers = numbers.split("\n", 2)
      delimiters << custom_delimiter[2..-1]
    end
    
    negative_numbers = []

    sum = numbers.split(Regexp.union(delimiters)).sum do |number| 
      num = number.to_i
      negative_numbers << number if num.negative?
      num
    end

    raise "negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?
    
    sum
  end  
end