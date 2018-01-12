require "spec_helper"

RSpec.describe BittrexRb::Configuration do
  describe "#api_key" do
    it "default value is abc" do
      expect(::BittrexRb::Configuration.new.api_key).to eq "default_api_key"
    end
  end

  describe "#api_key=" do
    it "can set value" do
      config = ::BittrexRb::Configuration.new
      config.api_key = 'xyz'
      expect(config.api_key).to eq('xyz')
    end
  end
end
