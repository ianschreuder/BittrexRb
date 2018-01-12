ruby_project_files = Dir[File.join(File.dirname(__FILE__), '**', '*.rb')]

require ::BittrexRb.root+"/bittrex_rb/endpoints/base.rb"
require ::BittrexRb.root+"/bittrex_rb/response/base.rb"
ruby_project_files.sort_by!{ |file_name| file_name.downcase }.each do |path|
  require_relative path
end

module BittrexRb
  class Client

    def initialize(params = {})
      set_config(params)
    end

    def config
      @config ||= ::BittrexRb.config.dup
    end

    def public(options = {})
      ::BittrexRb::Endpoints::Public.new(config, options)
    end

    def market(options = {})
      requires_api_keys
      ::BittrexRb::Endpoints::Market.new(config, options)
    end

    def account(options = {})
      requires_api_keys
      ::BittrexRb::Endpoints::Account.new(config, options)
    end

    private

    def requires_api_keys
      return unless api_keys_missing?

      fail BittrexRb::MissingApiKeys, 'This feature requires API credentials.'
    end

    def api_keys_missing?
      !(config.api_key && config.api_secret)
    end

    def set_config(params)
      params.each { |k, v| config.send("#{k}=", v) }
    end

  end
end
