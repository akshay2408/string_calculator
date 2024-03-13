require 'test/unit'
require_relative 'string_calculator'

class TestStringCalculator < Test::Unit::TestCase
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_params
    assert_equal(0, @calculator.add(nil))
  end
end  