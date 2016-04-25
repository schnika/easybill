require "httparty"

module Easybill
  module Api
    class Client
      attr_reader :api_key

      def initialize(api_key)
        @api_key = api_key
        Easybill::Api::Base.authenticate! api_key
      end

      def customers
        Easybill::Api::Customers
      end
    end
  end
end
