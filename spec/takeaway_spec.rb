require 'takeaway'


 describe Takeaway do
   subject(:takeaway) { described_class.new(menu) }
   let(:items2) { "Pepperoni Pizza: 8.99" "Vegan Spectacular Pizza: 10.99" "Seafood Special Pizza: 10.99"}
   let(:menu) { instance_double("Menu", print_items: items2) }

   it 'has a list of menu items and their respective prices' do
    expect(takeaway.read_menu).to eq items2
   end
  
   
  

 end