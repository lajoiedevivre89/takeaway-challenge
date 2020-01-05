
class Takeaway
  attr_reader :menu, :basket, :order, :messenger, :config

  def initialize(menu, order, messenger, config)
    @menu = menu
    @order = order
    @messenger = messenger || Messenger.new(config)
    @basket = {}
  end 

  def read_menu
    menu.print_items
  end 
             
  def order_food(basket) 
    basket.each do |name, quantity| # iterate through  items and quantities
      order.add(name, quantity) # call the add() method from order class - which adds items and quantities to basket
      "Thank you for your order"
    end
    messenger.send_text
    order.total
  end 

end 