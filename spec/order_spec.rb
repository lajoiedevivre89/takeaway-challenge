require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double "Menu" }
  let(:basket) do
    {
    "Pepperoni Pizza": 2, 
    "Vegan Spectacular Pizza": 2, 
    "Seafood Special Pizza": 1
  } 
  end

  it 'adds items and quantities to the basket' do
    order.add(:"Pepperoni Pizza", 2)
    order.add(:"Vegan Spectacular Pizza", 2)
    order.add(:"Seafood Special Pizza", 1)
    expect(order.basket).to eq basket
  end 

  before do
    allow(menu).to receive(:includes_item?).with(:"Pepperoni Pizza").and_return true
    allow(menu).to receive(:includes_item?).with(:"Vegan Spectacular Pizza").and_return true
    allow(menu).to receive(:includes_item?).with(:"Seafood Special Pizza").and_return true
    allow(menu).to receive(:price).with(:"Pepperoni Pizza").and_return 8.99
    allow(menu).to receive(:price).with(:"Vegan Spectacular Pizza").and_return 10.99
    allow(menu).to receive(:price).with(:"Seafood Special Pizza").and_return 10.99
  end 

  it 'raises an error if user tries to add an item that is not on menu' do
    allow(menu).to receive(:includes_item?).with(:"Kangaroo Burger").and_return false 
    expect { order.add(:"Kangaroo Burger", 2) }.to raise_error "Kangaroo Burger is not on the menu. Cannot be added to your basket"
  end 

  it 'calculates the total cost of the order' do
    order.add(:"Pepperoni Pizza", 2)
    order.add(:"Vegan Spectacular Pizza", 2)
    order.add(:"Seafood Special Pizza", 1)
    expect(order.total).to eq 50.95
  end 
  

end 