require "httparty"

module Easybill
  module Api
    class Client
      def initialize(api_key)
        Easybill::Api::Base.authenticate! api_key
      end

      def customers
        Easybill::Api::Customers
      end
    end
  end
end
