require 'takeaway'


describe Takeaway do

  describe '#read_menu' do
    
    it { is_expected.to respond_to(:read_menu) }
    
    it 'checks if read_menu prints the list' do
      expect(subject.read_menu).to eq ({ "margarita" => 6, "four_chesse" => 9, "capprese" => 8, "pepperoni" => 7 })
    end
  end

  describe '#place_order' do
    it { is_expected.to respond_to(:place_orders).with(2).arguments }

    it 'fails when the item is not in menu' do
      expect { subject.place_orders('fuggazza', 1) }.to raise_error 'The pizza is not in the menu'
    end

  end

  it 'checks the total price order' do
    subject.place_orders('four_chesse', 1)
    expect(subject.total).to eq("Your total is: £9.")
  end

end
