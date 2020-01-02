require 'takeaway'


 describe Takeaway do
   subject(:takeaway) { described_class.new(menu, order) }
   let(:items2) { "Pepperoni Pizza: 8.99" "Vegan Spectacular Pizza: 10.99" "Seafood Special Pizza: 10.99"}
   let(:menu) { instance_double("Menu", print_items: items2) }
   let(:ordered_food) { {"Pepperoni Pizza": 2, "Vegan Spectacular Pizza": 2, "Seafood Special Pizza": 1} }
   let(:order) { instance_double("Order", add: ordered_food) }

   it 'has a list of menu items and their respective prices' do
    expect(takeaway.read_menu).to eq items2
   end
  
   it 'can select different quantities of dishes on the menu' do
    expect(takeaway.order_food(ordered_food)).to eq ordered_food
   end
   
  

 end