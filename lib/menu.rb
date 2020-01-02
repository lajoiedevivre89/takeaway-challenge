class Menu
  attr_reader :items

  def initialize(items)
    @items = items
  end 


  def print_items
    items.map { |name, price| 
    "%s £%.2f" % [name.to_s.upcase, price]}.join(", ")
  end 

  
 


end 