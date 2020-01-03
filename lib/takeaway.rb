class Takeaway
  attr_reader :menu, :basket, :order

  def initialize(menu, order)
    @menu = menu
    @order = order
    #@basket = basket
  end 

  def read_menu
    menu.print_items
  end 
             
  def order_food(basket) 
    basket.each do |name, quantity| # iterate through  items and quantities
      order.add(name, quantity) # call the add() method from order class - which adds items and quantities to basket
      "Thank you for your order"
    end
    order.total
  end 

end 