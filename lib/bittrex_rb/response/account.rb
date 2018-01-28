module BittrexRb
  module Response
    class Account < Base

      def uuid
        a = body["result"] || {}
        a["uuid"]
      end

      def quantity
        a = body["result"] || {}
        a["Quantity"]
      end

      def remaining
        a = body["result"] || {}
        a["QuantityRemaining"]
      end

      def is_open?
        a = body["result"] || {}
        ! a["IsOpen"].nil?
      end

      def balances
        body["result"]
      end

      def orders
        body["result"]
      end

      def balance(coin)
        b = balances.detect{|h| h["Currency"] == coin.upcase}
        unless b.empty?
          b["Balance"].to_f || 0.0
        end
      end

      private


    end
  end
end
