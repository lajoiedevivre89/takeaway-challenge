class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end 

  def read_menu
    @dishes.each_with_index do |dish, index|
      dish.each do |name, price| 
         puts "#{index+1}. #{name}: £#{price}"
      end
    end
  end


end 