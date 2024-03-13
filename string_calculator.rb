class StringCalculator
  def add(numbers)
    return 0 unless numbers.is_a? String
    return 0 if numbers.match?(/(,\n|\n,)/)
    
    numbers.split(/[\n,]+/).sum(&:to_i) 
  end  
end
