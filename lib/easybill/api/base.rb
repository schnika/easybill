require 'httparty'

module Easybill
  module Api
    class Base
      include HTTParty

      HEADERS = {
        "User-Agent"   => "Ruby.Easybill.Api",
        "Accept"       => "application/json",
        "Content-Type" => "application/json"
      }

      base_uri "https://api.easybill.de"
      headers HEADERS
      format :json

      class << self
        def authenticate(api_key)
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

        def custom(method:, path:, query: {}, data: {}, headers: {})
          request_options = {}

          request_options[:body]    = data.to_json unless data.empty?
          request_options[:query]   = query unless query.empty?
          request_options[:headers] = headers unless headers.empty?

          public_send method, path, request_options
        end

        private

        def base_path
          "/rest/v1"
        end

        def resource_path
          "#{base_path}/#{dasherize(self.name.split("::").last)}"
        end

        def dasherize(camel_cased_word)
          camel_cased_word.to_s.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
          gsub(/([a-z\d])([A-Z])/,'\1_\2').
          gsub("_", "-").
          downcase
        end
      end
    end
  end
end
