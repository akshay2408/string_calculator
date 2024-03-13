class StringCalculator
  def add(numbers)
    return 0 unless numbers.is_a? String  

    numbers.split(',').inject(0) do |sum, num|
      sum + num.to_i
    end    
  end  
end
