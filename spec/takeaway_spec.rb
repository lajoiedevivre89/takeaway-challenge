require 'takeaway'
require 'order'
require 'messenger'
require 'menu'


 describe Takeaway do
   subject(:takeaway) { described_class.new(menu, order, messenger, config: {} ) }
   let(:items_prices) { "Pepperoni Pizza: 8.99" "Vegan Spectacular Pizza: 10.99" "Seafood Special Pizza: 10.99"} # dishes with prices 
   let(:basket) { {"Pepperoni Pizza": 2, "Vegan Spectacular Pizza": 2, "Seafood Special Pizza": 1} } # dishes with quantities 
   let(:menu) { instance_double("Menu", print_items: items_prices) } # menu double
   let(:order) { instance_double("Order", total: 50.95) } #add: items_quantities) }  # order double 
   let(:messenger) { instance_double("Messenger", send_text: nil) } # instance double
  

   it 'has a list of menu items and their respective prices' do
    expect(takeaway.read_menu).to eq items_prices
   end
  
   it 'can select different quantities of dishes on the menu' do
    allow(order).to receive(:add)
    expect(order).to receive(:add).exactly(3).times  # one for each item
    takeaway.order_food(basket)
   end
   
   it 'checks the total cost of the order' do  # mock 
    allow(order).to receive(:add)
    total = takeaway.order_food(basket)
    expect(total).to eq 50.95 # 2 x pp x2 vsp 1 x ssp
   end

   # test for the wrapper object that will wrap around the Twilio API
   it 'sends a text to the user when food has been ordered' do
    allow(order).to receive(:add)
    expect(messenger).to receive(:send_text) # expect that this method will be called 
    takeaway.order_food(basket)
   end

end 

  