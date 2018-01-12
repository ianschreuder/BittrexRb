module BittrexRb
  module Configurable

    def config
      @config ||= ::BittrexRb::Configuration.new
    end

    def configure
      yield config if block_given?
    end

    def reset_config
      @config = Configuration.new
    end

  end
end
