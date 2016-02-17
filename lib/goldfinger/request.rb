require 'http'
require 'addressable'

module Goldfinger
  class Request
    def initialize(request_method, path, options = {})
      @request_method = request_method
      @uri            = Addressable::URI.parse(path)
      @options        = options
    end

    def perform
      response = http_client.request(@request_method, @uri.to_s, @options)
      [response.headers, response.body]
    end

    private

    def http_client
      HTTP
    end
  end
end
