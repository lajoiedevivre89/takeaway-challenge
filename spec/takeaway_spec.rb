require 'takeaway'


 describe Takeaway do
   subject(:takeaway) { described_class.new(menu: menu, order: order) }
   let(:menu) { double(:menu, print_items: list) }
   let(:list) { 'Pepperoni Pizza: 8.99' }
   let(:dishes_quantities) {'Pepperoni Pizza: 8.99' 'Chicken Wings: 4.99'} # add some dishes with quantities 
   let(:order) { double(:order) }
   
  
   it 'shows a list of dishes and prices' do
    expect(takeaway.read_menu).to eq list
  end

  it 'can order dishes' do # user story 2
    # expect(takeaway.order_food(dishes)).to eq "The total for your order is £36.95"
    expect(order).to receive(:add).twice # expect the order double to receive the add() method twice - once for pepperoni pizza then chicken wings
    takeaway.order_food(dishes_quantities)
  end 

  

 end