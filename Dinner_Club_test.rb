require_relative 'Dinner_Club'
require 'minitest/autorun'

class Dinner_Club_test < Minitest::Test
  
 
  
  def test_everything
    dc = Dinner_Club.new("person1", "person2", "person3")
    assert_kind_of(Hash, dc.members)  #tests initialize defines members correctly
    dc.new_event("place", 10, 100, "person1", "person3")
    assert_equal(["person1", "person3"], dc.event_list["place"])#test if event_list updated correctly
    assert_equal(10, dc.members["person1"])
    assert_equal(10, dc.members["person3"])
    assert_equal(0.0, dc.members["person2"])
    #test if add_check updates totals correctly
    dc.new_event("place2", 10, 100, "person4")
    assert_equal(20, dc.members["person4"]) #tests if add_check will add new members
    assert_equal(["person4"], dc.event_list["place2"])
  end
    
   def test_add_member
     dc = Dinner_Club.new("person1", "person2", "person3")
     dc.add_member("test")
     assert(dc.members.has_key?("test"))
   end
 
   def test_update_event_list
     dc = Dinner_Club.new("person1", "person2", "person3")
     dc.update_event_list("test1", "test2")
     assert(dc.event_list["test1"] =="test2")
   end
 
   def test_add_check
     dc = Dinner_Club.new("person1", "person2", "person3")
     dc.add_check(1, ["test"])
     assert(dc.members["test"] == 1)
   end
    
  def test_treat
    dc = Dinner_Club.new("person1", "person2", "person3")
    dc.treat("test", 1, 100, "person1", "person2", "person3")
    assert_equal(2, dc.members["person1"])
    assert_equal(0, dc.members["person2"])
    assert_equal(0, dc.members["person3"])
  end

end