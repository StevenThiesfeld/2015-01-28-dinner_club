require "pry"
require_relative 'Checksplitter'
require_relative 'Dinner_Club_db.rb'

# Class: Dinner_Club
#
# Description: Keeps track of the members of a Dinner Club and how much
#              they've spent.  Keeps track of events and who attended.
#
# Attributes:
# @names       -Array:  stores the names of members as Strings
# @members     -Hash:   key is member name, value is how much they've spent
# @event_list  -Hash:   key is the name of a restraunt and value is an Array of 
#                       that attended 
# Public Methods:
# #update_event_list
# #add_member
# #add_check
# #new_event
# #treat
      
class Dinner_Club
  attr_accessor :event_list, :members
  
  def initialize(*names)
    @event_list = Hash.new
    @members = Hash.new
    names.each {|member| @members[member] = 0.0
      a = Members.new(member)
    }
  end
  
  # Public: #update_event_list
  # Adds a new key value pair to @event_list.
  #
  # Parameters:
  # name - String: the key added to Hash
  # members - Array: the Array of members set as value
  # Returns:
  # Hash: @event_list
  #
  # State Changes:
  # new key value pair in @event_list
  
  def update_event_list(name, members)
    event_list[name] = members
  end
  
  # Public: #add_member
  # Adds a new key value pair to @members.
  #
  # Parameters:
  # name - String: the new key
  #
  # Returns:
  # Hash: @members
  #
  # State Changes:
  # new key value pair in @members
  
  def add_member(name)
    @members[name] = 0.0
    a = Members.new(name)
  end 
  
 #  Public: add_check
 #  Adds a float to the values of appropriate @member keys.
 #
 #  Parameters:
 #  cost   - Float: the number being added to values
 #  diners - Array: the members who attended
 #
 #  Returns:
 #  none
 #
 #  State Changes:
 #  Sets new values in @members
  
  def add_check(cost, diners)
    diners.each do |diner|
      add_member(diner) if members.has_key?(diner) == false 
      members[diner] += cost
      Members.update(members[diner], diner)
    end
  end
  
  # Public: new_event
  # Adds new event data to storage Hashes @event_list and @members.
  #
  # Parameters:
  # place - String:  the name of the restaurant
  # cost  - Float:   the unsplit cost of check before tip
  # tip   - Integer: the amount of tip being given to check
  # diners- Array:   the names of the members who attended
  #
  # Returns:
  # none
  #
  # State Changes:
  # Runs the update_event_list and add_check methods with given parameters
  
  def new_event(place, cost, tip, *diners)
    event = Checksplitter.new(diners.length, cost, tip)
    update_event_list(place, diners)
    add_check(event.split_check, diners)
  end
  
  # Public: treat
  # Adds new event data to storage Hashes @event_list and @members without
  # splitting the check between attending members.
  #
  # Parameters:
  # place   - String:  the name of the restaurant
  # cost    - Float:   the unsplit cost of check before tip
  # tip     - Integer: the amount of tip being given to check
  # treater - String:  the name of the member paying the whole check
  # diners  - Array:   the names of the members who attended
  #
  # Returns:
  # none
  #
  # State Changes:
  # Adds the total check cost to the treater's hash in @members
  
  def treat(place, cost, tip, treater, *diners)
    event = Checksplitter.new(diners.length, cost, tip)
    update_event_list(place, diners.push(treater))
    add_member(treater) if members.has_key?(treater) == false 
    members[treater] += event.total_check
  end
        
end

# family = Dinner_Club.new('steven', 'steve', 'kim')
#
# family.new_event("Restaurant 1", 50.44, 20, 'steven', 'kim', 'kyle')
#
# family.treat('Restaurant 2', 64.39, 10, 'debbie', 'steven', 'kim', 'kyle', 'steve')

  
binding.pry