require_relative 'Checksplitter_db'
require 'pry'
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
  attr_reader :diners, :check, :tip, :total_check, :split_check
   
  def initialize(diners, check, tip)
    @diners = diners
    @check = check
    @tip = tip.to_f / 100
    total_the_check
    split_the_check
    add_entry
  end
  
  # Public: #total_cost
  # Calculates the total cost of the check with tip added.
  # Returns:
  # Float: The check's cost
  #
  # State Changes:
  # Sets @total_cost
  
  
  def total_the_check
    @total_check = ((check * tip) + check).round(2)
  end
  # Public: #cost_per_person
  # Splits the check between diners
  # Returns:
  # Float: the split check
  #
  # State Changes:
  # Sets @cost_per_person
  
  def split_the_check
   @split_check = (total_check / diners).round(2)
  end
  private
  
  def add_entry
    a = Entry.new({check: @check, tip: @tip, diners: @diners, total_check: @total_check, split_check: @split_check})
  end
end
