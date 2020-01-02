require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:ordered_food) { {"Pepperoni Pizza": 2, "Vegan Spectacular Pizza": 2, "Seafood Special Pizza": 1} }
  let(:menu) { instance_double "Menu" }

  it 'adds items and quantities to the basket' do
    order.add(:"Pepperoni Pizza", 2)
    order.add(:"Vegan Spectacular Pizza", 2)
    order.add(:"Seafood Special Pizza", 1)
    expect(order.basket).to eq ordered_food
  end 
  

end 