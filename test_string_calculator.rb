require 'test/unit'
require_relative 'string_calculator'

class TestStringCalculator < Test::Unit::TestCase
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_params
    assert_equal(0, @calculator.add(nil))
  end

  def test_non_string_params
    assert_equal(0, @calculator.add(1))
  end

  def test_empty_string
    assert_equal(0, @calculator.add(''))
  end

  def test_single_number_string
    assert_equal(1, @calculator.add("1"))
  end

  def test_multiple_numbers_string
    assert_equal(6, @calculator.add("1,5"))
  end

  def test_newline_delimiter
    assert_equal(6, @calculator.add("1\n2,3"))
    assert_equal(0, @calculator.add("1,\n"))
    assert_equal(0, @calculator.add("1\n,"))
  end

  def test_custom_delimiter
    assert_equal(3, @calculator.add("//;\n1;2"))
  end

  def test_negative_numbers
    exception = assert_raise(RuntimeError) { @calculator.add("-1,2,-3") }
    assert_equal("negative numbers not allowed -1,-3", exception.message)
  end  
end  