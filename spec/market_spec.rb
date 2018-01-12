require "spec_helper"

RSpec.describe BittrexRb::Endpoints::Public do
  describe "#buy" do

    # Submit limit buy
    # ::BittrexRb::Client.new.market.buylimit("BTC-LTC", 0.0001, 0.0001)
    it "default value is abc" do
      VCR.use_cassette("market.buylimit", record: :none) do

        c = ::BittrexRb::Client.new
        expect(c).to receive(:requires_api_keys).and_return true

        allow_any_instance_of(::BittrexRb::Endpoints::Market).to receive(:calc_nonce).and_return(1515650512)

        order = c.market.buylimit("BTC-NLG", 2100, 0.000023)

        expect(order.success?).to be true
        expect(order.uuid.length).to be > 0
      end
    end
  end
end
