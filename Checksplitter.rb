# Class: Checksplitter
#
# Calculates a tip and splits a check between people
#
# Attributes:
# @diners          -Integer: the number of diners to split between
# @cost            -Float:   the cost of the meal before tip
# @tip             -Float:   the the percentage being tipped expressed 
#                            as a float
# @total_cost      -Float:   the sum of the check and tip
# @cost_per_person -Float:   the final check split evenly among diners
#
# Public Methods
# #total_cost
# #cost_per_person

class Checksplitter
  attr_reader :diners, :cost, :tip, :total_cost, :cost_per_person
   
  def initialize(diners, cost, tip)
    @diners = diners
    @cost = cost
    @tip = tip.to_f / 100
  end
  
  # Public: #total_cost
  # Calculates the total cost of the check with tip added.
  # Returns:
  # Float: The check's cost
  #
  # State Changes:
  # Sets @total_cost
  
  
  def total_cost
    @total_cost = ((cost * tip) + cost).round(2)
  end
  
  # Public: #cost_per_person
  # Splits the check between diners
  # Returns:
  # Float: the split check
  #
  # State Changes:
  # Sets @cost_per_person
  
  def cost_per_person
   @cost_per_person = (total_cost / diners).round(2)
  end
  
end
