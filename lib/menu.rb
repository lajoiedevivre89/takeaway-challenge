class Menu
  attr_reader :menu_items

  def initialize(menu_items)
    @menu_items = menu_items
  end 


  def print_items
    menu_items.map { |name, price| 
    "%s £%.2f" % [name.to_s.upcase, price]}.join(", ")
  end 

  def includes_item?(item)
    !!menu_items[item]
  end 

 def price(item)
  menu_items[item]
 end 


end 