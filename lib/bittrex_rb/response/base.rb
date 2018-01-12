module BittrexRb
  module Response
    class Base

      def initialize(response)
        @raw = response
      end

      def body
        @b ||= JSON.parse(@raw.body)
      end

      def code; @raw.code; end

      def success?
        body["success"]
      end

      def message
        m = body["message"]
        (m == "") ? nil : m
      end

    end
  end
end