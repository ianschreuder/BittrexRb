module BittrexRb
  module Endpoints
    class Account < Base

      # parameter - required - description
      #   currency  - required - a string literal for the currency (ie. BTC)
      #   quantity  - required - the quantity of coins to withdraw
      #   address   - required - the address where to send the funds.
      #   paymentid - optional - used for CryptoNotes/BitShareX/Nxt optional field (memo/paymentid)
      def withdraw(currency, quantity, address)
        res = sget("/withdraw", {currency: currency, quantity: quantity, address: address})
        ::BittrexRb::Response::Account.new(res)
      end

      # parameter - required - description
      #   uuid - required - the uuid of the buy or sell order
      def getorder(uuid)
        res = sget("/getorder", {uuid: uuid})
        ::BittrexRb::Response::Account.new(res)
      end

      # Parameters - None
      def balance(coin)
        res = sget("/getbalances")
        resp = ::BittrexRb::Response::Account.new(res)
        resp.balance(coin)
      end

      # parameter - required -description
      #   market- optional - a string literal for the market (ie. BTC-LTC). If ommited, will return for all markets
      def orderhistory(market = nil)
        if market.nil?
          res = sget("/getorderhistory", {})
        else
          res = sget("/getorderhistory", {market: market})
        end
        resp = ::BittrexRb::Response::Account.new(res)
      end

      def uri_modifier; '/account'; end

    end
  end
end
