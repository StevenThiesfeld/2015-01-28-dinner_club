require_relative 'dinner_party'
require 'minitest/autorun'

class CheckSplitterTest < Minitest::Test
  
  # def test_the_truth
#     assert true
#   end
#(diners, cost, tip)
  def test_simple_input_with_expected_integer_output
    cs = Checksplitter.new(5, 50, 10)
    assert_equal(11, cs.cost_per_person)
  end
  
  def test_valid_parameters
    cs = Checksplitter.new(10, 5, 2)
    assert_kind_of(Integer, cs.diners)
    assert_kind_of(Integer, cs.cost)
    assert_kind_of(Float, cs.tip)
    assert(cs.diners>0)
    assert(cs.tip>0)
    assert(cs.cost>0)
  end
  
  def test_proper_rounding
    cs = Checksplitter.new(50, 4, 3)
    assert(cs.total_cost==cs.total_cost.round(2))
  end
end