require 'httparty'

module Easybill
  module Api

    ##
    # The base class for all Easybill entities.
    # Set the authorization header before using it via `.authenticate`
    #
    # Sets the default headers:
    # "User-Agent"   => "Ruby.Easybill.Api",
    # "Accept"       => "application/json",
    # "Content-Type" => "application/json"
    #
    # Provides the basic interface. Such as list, find, create, update, destroy

    class Base
      include HTTParty
      include ResponseHandler

      HEADERS = {
        "User-Agent"   => "Ruby.Easybill.Api",
        "Accept"       => "application/json",
        "Content-Type" => "application/json"
      }

      base_uri "https://api.easybill.de"
      headers HEADERS
      format :json

      class << self

        ##
        # Set the authorization header by providing your easybill +api_key+

        def authenticate(api_key)
          headers["authorization"] = "Bearer #{api_key}"
        end

        ##
        # Fetches all resources. You can set custom +query+ parameters.

        def list(query: {})
          handle(get resource_path, query: query)
        end

        ##
        # Fetches a resource by its +id+. You can set custom +query+ parameters.
        # api.find(id, query: {group: 1})

        def find(id, query: {})
          handle(get "#{resource_path}/#{id}", query: query)
        end

        ##
        # Creates a resource. Provide the +data+ as a hash.
        # e.g.
        # data = {
        #   first_name: "Lars",
        #   last_name: "Bar",
        #   ...
        # }
        # api.create(data)

        def create(data)
          handle(post resource_path, body: data.to_json)
        end

        ##
        # Updates a resource. Provide the +id+ and +data+.
        # e.g.
        # id = 123456
        # data = {
        #   first_name: "Lars",
        #   last_name: "Bar",
        #   ...
        # }
        # api.update(id, data)

        def update(id, data)
          handle(put "#{resource_path}/#{id}", body: data.to_json)
        end

        ##
        # Destroys a resource. Provide the +id+.
        # api.destroy(id)

        def destroy(id)
          handle(delete "#{resource_path}/#{id}")
        end

        protected

        def custom(method:, path:, query: {}, data: {}, headers: {})
          request_options = {}

          request_options[:body]    = data.to_json unless data.empty?
          request_options[:query]   = query unless query.empty?
          request_options[:headers] = headers unless headers.empty?

          handle(public_send method, path, request_options)
        end

        private

        def base_path
          "/rest/v1"
        end

        def resource_path
          "#{base_path}/#{dasherize(self.name.split("::").last)}"
        end

        # TODO-schnika: move this out of here Oo
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
