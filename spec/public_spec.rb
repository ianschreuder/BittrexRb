require "spec_helper"

RSpec.describe BittrexRb::Endpoints::Public do
  describe "#orderbook" do

    # Pull public order book
    # ::BittrexRb::Client.new.public.order_book("BTC-LTC")
    it "default value is abc" do
      VCR.use_cassette("public.orderbook", record: :none) do
        c = ::BittrexRb::Client.new
        ob = c.public.order_book("BTC-LTC")

        expect(ob.bids.first[:quantity]).to be > 0
        expect(ob.bids.first[:rate]).to be > 0
      end
    end
  end

end
