require 'takeaway'
require 'order'


 describe Takeaway do
   subject(:takeaway) { described_class.new(menu, order) }
   let(:items_prices) { "Pepperoni Pizza: 8.99" "Vegan Spectacular Pizza: 10.99" "Seafood Special Pizza: 10.99"} # dishes with prices 
   let(:items_quantities) { {"Pepperoni Pizza": 2, "Vegan Spectacular Pizza": 2, "Seafood Special Pizza": 1} } # dishes with quantities 
   let(:menu) { instance_double("Menu", print_items: items_prices) } # menu double
   let(:order) { instance_double("Order", total: 50.95) } #add: items_quantities) }  # order double 
   # let(:items3) { {"Pepperoni Pizza": 2, "Vegan Spectacular Pizza": 2, "Seafood Special Pizza": 1} }

   it 'has a list of menu items and their respective prices' do
    expect(takeaway.read_menu).to eq items_prices
   end
  
   it 'can select different quantities of dishes on the menu' do
    expect(order).to receive(:add).exactly(3).times  # one for each item
    takeaway.order_food(items_quantities)
   end
   
   it 'checks the total cost of the order' do  # mock 
    allow(order).to receive(:add)
    total = takeaway.order_food(items_quantities)
    expect(total).to eq 50.95 # 2 x pp x2 vsp 1 x ssp
   end
end 

  