class Order
  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu
    @basket = {}
  end 
 
  def add(item, quantity) # adds menu item and quantities to the order 
    basket[item] = quantity
    "#{quantity} X #{item} added to your basket"
  end 
end 