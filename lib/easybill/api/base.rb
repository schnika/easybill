require 'httparty'

module Easybill
  module Api
    class Base
      include HTTParty

      # Request headers
      HEADERS = {
        "User-Agent"    => "Ruby.Easybill.Api",
        "Accept"        => "application/json",
        "Content-Type"  => "application/json"
      }

      base_uri "https://api.easybill.de"
      headers HEADERS
      format :json

      class << self
        def authenticate!(api_key)
          headers["authorization"] = "Bearer #{api_key}"
        end

        def list
          get resource_path
        end

        def find(id)
          get "#{resource_path}/#{id}"
        end

        private

        def base_path
          "rest/v1"
        end

        def resource_path
          "/#{base_path}/#{self.name.split("::").last.downcase}"
        end
      end
    end
  end
end
