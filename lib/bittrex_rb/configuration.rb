module BittrexRb
  class Configuration

    attr_accessor :api_key, :api_secret, :base_uri, :api_version

    def initialize
      @api_key             = ENV['BITTREX_API_KEY'] || "default_api_key"
      @api_secret          = ENV['BITTREX_API_SECRET'] || "default_api_secret"
      @base_uri            = 'https://bittrex.com/api/'
      @api_version         = 'v1.1'
    end

  end
end
