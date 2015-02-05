class Members
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.update(value, diner)
    DATABASE2.execute("UPDATE members SET spent = '#{value}' WHERE name = '#{diner}' ")
  end
  
  private
  def save
    DATABASE2.execute("INSERT INTO members (name, spent) VALUES ('#{@name}', 0)")
  end
end#classend