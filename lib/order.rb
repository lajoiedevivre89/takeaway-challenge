class Order
  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu
    @basket = {}
  end 
 
  def add(item, quantity) # adds menu item and quantities to the order 
    fail "#{item} is not on the menu. Cannot be added to your basket" unless menu.includes_item?(item)
    basket[item] = quantity
    "#{quantity} X #{item} added to your basket"
  end 
  # @basket = {"Olives", 4}

 
    def total
      item_quantities_total.inject(:+)
    end 

    private
  
  
    def item_quantities_total
      basket.map  do |item, quantity|
        menu.price(item) * quantity
      end 
    end 
  

  
end 