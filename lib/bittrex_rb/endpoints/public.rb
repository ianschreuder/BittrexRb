module BittrexRb
  module Endpoints
    class Public < Base

      # parameter required description
      #   market: required - a string literal for the market (ex: BTC-LTC)
      #   type: required - :buy, :sell or :both to identify the type of orderbook to return.
      def order_book(pair, type = :both)
        res = get("/getorderbook", {market: pair, type: type})
        ::BittrexRb::Response::Public.new(res)
      end

      def uri_modifier; '/public'; end

    end
  end
end
