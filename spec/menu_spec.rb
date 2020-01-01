require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do
    [
       { 'Pepperoni Pizza': 8.99 },
       { 'Vegan Spectacular Pizza': 10.99 },
       { 'Seafood Special Pizza': 10.99 },
       { 'Hawaian Pizza': 8.99 },
       { 'Margherita Pizza': 6.99 },
       { 'Meat Feast Pizza': 9.99 },
       { 'Chicken Wings': 4.99 },
       { 'Curly Fries': 3.99 },
       { 'Olives': 2.89 },
       { 'Diet Coke': 1.99 }
     ]
    end
    
  it 'has a list of dishes and their respective prices' do
    expect(menu.dishes).to eq dishes
  end 

  describe '#read_menu' do
     it 'prints a list of dishes with their respective prices' do
       list = "1. Pepperoni Pizza: £8.99\n2. Vegan Spectacular Pizza: £10.99\n3. Seafood Special Pizza: £10.99\n4. Hawaian Pizza: £8.99\n5. Margherita Pizza: £6.99\n6. Meat Feast Pizza: £9.99\n7. Chicken Wings: £4.99\n8. Curly Fries: £3.99\n9. Olives: £2.89\n10. Diet Coke: £1.99\n"
       expect{menu.read_menu}.to output(list).to_stdout
     end
 end
 

end 
