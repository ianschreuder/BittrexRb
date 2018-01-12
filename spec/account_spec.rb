require "spec_helper"

RSpec.describe BittrexRb::Endpoints::Account do
  describe "#transfer" do

    # Submit transfer/withdraw
    # ::BittrexRb::Client.new.account.withdraw("BTC", 0.01, '15sDGa3Tt8yhVPTNTY4Ae2mzwAwVdN9KgF')
    it "submit a transfer/withdrawal" do
      VCR.use_cassette("account.withdraw", record: :none) do

        c = ::BittrexRb::Client.new
        expect(c).to receive(:requires_api_keys).and_return true

        allow_any_instance_of(::BittrexRb::Endpoints::Account).to receive(:calc_nonce).and_return(1515731012)

        order = c.account.withdraw("BTC", 0.01, '15sDGa3Tt8yhVPTNTY4Ae2mzwAwVdN9KgF')

        expect(order.success?).to be true
        expect(order.uuid.length).to be > 0
      end
    end
  end

  describe "#check existing order" do

    # Check on status of existing order
    # ::BittrexRb::Client.new.account.getorder('xxxx')
    it "check on existing order" do
      VCR.use_cassette("account.getorder", record: :none) do

        uuid = "91e2277e-1a80-4ef5-bee2-21d22ba67558"
        c = ::BittrexRb::Client.new

        expect(c).to receive(:requires_api_keys).and_return true
        allow_any_instance_of(::BittrexRb::Endpoints::Account).to receive(:calc_nonce).and_return(1515733440)

        o = c.account.getorder(uuid)
        expect(o.is_open?).to be false
      end
    end
  end
end
