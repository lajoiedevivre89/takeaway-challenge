class Takeaway
  attr_reader :menu, :items, :order

  def initialize(menu, order)
    @menu = menu
    @order = order
  end 

  def read_menu
    menu.print_items
  end 

  def order_food(items)
    items.each do |name, quantity|
      order.add(name, quantity)
    end
  end 

end 