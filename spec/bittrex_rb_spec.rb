require "spec_helper"

RSpec.describe BittrexRb do

  it "has a version number" do
    expect(BittrexRb::VERSION).not_to be nil
  end

  before :each do
    BittrexRb.configure do |config|
      config.api_key = 'xyz'
    end
  end

  it "is configured to use the given api_key" do
    client = BittrexRb::Client.new

    expect(client.config.api_key).to eq('xyz')
  end

  after :each do
    BittrexRb.reset_config
  end
end
