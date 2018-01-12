module BittrexRb
  module Response
    class Public < Base

      def bids
        a = body["result"] || {}
        to_hashes(a["buy"])
      end

      def asks
        a = body["result"] || {}
        to_hashes(a["sell"])

      end

      private

      def to_hashes(result)
        return [] if result.nil?
        result.map do |hsh|
          {
            quantity: hsh["Quantity"],
            rate: hsh["Rate"]
          }
        end
      end

    end
  end
end
