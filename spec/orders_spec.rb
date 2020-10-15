require './lib/orders'

describe Orders do
  let(:test_price) { described_class.new }
  let(:test_menu) { double :menu }
  let(:total_amount) { 14 }
  it 'checks if list of dishes exists' do
    expect(subject).to respond_to(:menu) 
  end

  describe '#order' do
    it { is_expected.to respond_to(:order).with(2).arguments }

    it 'checks the order method brings the key name' do
      subject.order('pepperoni', 1)
      expect(subject.items_count).to include({ "pepperoni" => 1 })
    end

    it 'fails when the item is not in menu' do
      expect { subject.order('fuggazza', 1) }.to raise_error 'The pizza is not in the menu'
    end
  end

  it 'checks that the price is correct' do
    test_price.order('pepperoni', 2)
    allow(test_menu).to receive(:menu).and_return({ "pepperoni" => 7 })
    expect(test_price.order_price).to eq(total_amount)
  end

end
