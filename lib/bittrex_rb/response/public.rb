module BittrexRb
  module Response
    class Public < Base

      def bids
        a = body["result"]
        if a.is_a?(Hash)
          to_hashes(a["buy"])

        elsif a.is_a?(Array)
          to_hashes(a)

        else
          []

        end
      end

      def asks
        a = body["result"]
        if a.is_a?(Hash)
          to_hashes(a["sell"])

        elsif a.is_a?(Array)
          to_hashes(a)

        else
          []

        end
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
