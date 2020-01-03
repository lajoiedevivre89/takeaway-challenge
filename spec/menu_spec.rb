require 'menu'
   
describe Menu do

  subject(:menu) { described_class.new(menu_items) }
  let(:menu_items) do
       { 
       "Pepperoni Pizza": 8.99,
       "Vegan Spectacular Pizza": 10.99,
       "Seafood Special Pizza": 10.99,
       "Hawaian Pizza": 8.99,
       "Margherita Pizza": 6.99,
       "Meat Feast Pizza": 9.99,
       "Chicken Wings": 4.99,
       "Curly Fries": 3.99,
       "Olives": 2.89,
       "Diet Coke": 1.99 
       }
     
    end
    
  it 'has a list of dishes and their respective prices' do
    expect(menu.menu_items).to eq menu_items
  end 

  it 'prints out a list of the dishes and their respective prices' do
    expect(menu.print_items).to eq "PEPPERONI PIZZA £8.99, VEGAN SPECTACULAR PIZZA £10.99, SEAFOOD SPECIAL PIZZA £10.99, HAWAIAN PIZZA £8.99, MARGHERITA PIZZA £6.99, MEAT FEAST PIZZA £9.99, CHICKEN WINGS £4.99, CURLY FRIES £3.99, OLIVES £2.89, DIET COKE £1.99"
  end 

  it 'verifies that dish is on menu' do
    expect(menu.includes_item?(:"Olives")).to eq true
  end 
  it 'verifies that dish is not on menu' do
    expect(menu.includes_item?(:"Pigs Feet")).to eq false
  end 

  it 'returns the price of an item' do
    expect(menu.price(:"Pepperoni Pizza")).to eq(menu_items[:"Pepperoni Pizza"])  # menu_items is our list of items on menu - see top of this spec
  end 




 

end 
