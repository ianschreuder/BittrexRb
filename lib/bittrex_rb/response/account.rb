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

      private


    end
  end
end
