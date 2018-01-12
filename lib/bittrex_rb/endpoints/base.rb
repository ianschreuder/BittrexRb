module BittrexRb
  module Endpoints
    class Base

      attr_accessor :config, :options

      def initialize(config, options = {})
        @config  = config
        @options = options
      end

      def get(endpoint, params = {})
        connection(endpoint, params).get
      end

      def sget(endpoint, params = {})
        secure_connection(endpoint, params).get
      end

      private

      def calc_nonce
        Time.now.to_i
      end

      def geturl(endpoint, params)
        url = @config.base_uri    +
              @config.api_version +
              uri_modifier        +
              endpoint            +
              parse_params(params)
      end

      def connection(endpoint, params)
        RestClient::Resource.new(geturl(endpoint, params))
      end

      def secure_connection(endpoint, params)
        nonce = calc_nonce
        params.merge!({nonce: nonce})
        params.merge!({apikey: @config.api_key})
        url = geturl(endpoint, params)
        headers = {apisign: signature(url, nonce)}

        RestClient::Resource.new(url, {headers: headers})
      end

      def parse_params(params)
        hash = params.dup
        frst = hash.shift
        str = "?#{frst[0]}=#{frst[1]}"
        str = hash.inject(str){|s, ary| str += "&#{ary[0]}=#{ary[1]}"; str}
        str
      end

      def uri_modifier; '/'; end

      def signature(url, nonce)
        OpenSSL::HMAC.hexdigest('sha512',
                                @config.api_secret,
                                "#{url}")
      end


    end
  end
end