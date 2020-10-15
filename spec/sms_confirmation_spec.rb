require './lib/sms_confirmation'

describe Sms
  subject(:takeaway) { described_class.new }

  before do
    allow(takeaway).to receive(:send_sms)
  end

  it 'sends a payment confirmation text message' do
      expect(takeaway).to receive(:send_sms).with("Thank you for your order: £20.93")
      takeaway.complete_order(20.93)
    end
  end
end