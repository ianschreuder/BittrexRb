module BittrexRb
  module Endpoints
    class Market < Base

      # parameter - required - description
      #   market - required - a string literal for the market (ex: BTC-LTC)
      #   quantity - required - the amount to purchase
      #   rate - required - the rate at which to place the order.
      def buylimit(pair, quantity, rate)
        res = sget("/buylimit", {market: pair, quantity: quantity, rate: rate})
        ::BittrexRb::Response::Market.new(res)
      end

      # parameter - required - description
      # market - required - a string literal for the market (ex: BTC-LTC)
      # quantity - required - the amount to purchase
      # rate - required - the rate at which to place the order
      def selllimit(pair, quantity, rate)
        res = sget("/selllimit", {market: pair, quantity: quantity, rate: rate})
        ::BittrexRb::Response::Market.new(res)
      end

      # parameter - required - description
      # uuid - required - uuid of buy or sell order
      def cancelorder(uuid)
        res = sget("/cancelorder", {uuid: uuid})
        ::BittrexRb::Response::Market.new(res)
      end

      def uri_modifier; '/market'; end

    end
  end
end
