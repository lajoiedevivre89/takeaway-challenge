require_relative 'menu'

  # attr_reader :menu
 class Takeaway
   
   def initialize(menu:, order: nil)
     @menu = menu
     @order = order || Order.new(menu)
   end 

   def read_menu
    menu.print_items 
   end 

   def order_food(dishes)
     dishes.each do |dish, quantity|
        order.add(dish, quantity)
        "Thank you for your order"
     end
    end


   private
  
  attr_reader :menu, :order
 end 