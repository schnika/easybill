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

        def list(query: {})
          get resource_path, query: query
        end

        def find(id, query: {})
          get "#{resource_path}/#{id}", query: query
        end

        def create(data)
          post resource_path, body: data.to_json
        end

        def update(id, data)
          put "#{resource_path}/#{id}", body: data.to_json
        end

        def destroy(id)
          delete "#{resource_path}/#{id}"
        end

        def custom_request(method:, path:, query: {}, data: {})
          request_options = {}

          request_options[:body]  = data unless data.empty?
          request_options[:query] = data unless query.empty?

          public_send method, path, request_options
        end

        private

        def base_path
          "/rest/v1"
        end

        def resource_path
          "#{base_path}/#{self.name.split("::").last.downcase}"
        end
      end
    end
  end
end
