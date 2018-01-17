module BittrexRb
  module Response
    class Public < Base

      def initialize(response, type=:both)
        super(response)
        @type = type
      end

      def bids
        a = body["result"]
        if a.is_a?(Hash)
          to_hashes(a["buy"])

        elsif a.is_a?(Array) && @type==:buy
          to_hashes(a)

        else
          []

        end
      end

      def asks
        a = body["result"]
        if a.is_a?(Hash)
          to_hashes(a["sell"])

        elsif a.is_a?(Array) && @type==:sell
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
