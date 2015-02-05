class Entry
  def initialize(options)
    @check = options[:check]
    @tip = options[:tip]
    @diners = options[:diners]
    @total_check = options[:total_check]
    @split_check = options[:split_check]
    save
  end
  
  
  private
  
  def save
    DATABASE.execute("INSERT INTO entries ('check', 'tip', 'diners', 'total_check', 'split_check') VALUES (#{@check}, #{@tip}, #{@diners}, #{@total_check}, #{@split_check})")
  end
  
end#classend