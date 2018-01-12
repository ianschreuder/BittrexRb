module BittrexRb
  module Response
    class Market < Base

      def uuid
        a = body["result"] || {}
        a["uuid"]
      end

      private


    end
  end
end
