require "bittrex_rb/version"
require "bittrex_rb/configuration"
require "bittrex_rb/configurable"
require "rest-client"
require 'json'

module BittrexRb
  extend BittrexRb::Configurable

  def self.root
    File.expand_path('..', __FILE__)
  end

end

require 'bittrex_rb/client'
