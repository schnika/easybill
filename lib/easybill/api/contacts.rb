# frozen_string_literal: true

module Easybill
  module Api
    class Contacts < Base
      class << self
        def list(customer_id, query: {})
          custom method: :get, path: resource_path(customer_id), query:
        end

        def find(customer_id, id, query: {})
          custom method: :get, path: "#{resource_path(customer_id)}/#{id}", query:
        end

        def create(customer_id, data)
          custom method: :post, path: resource_path(customer_id), data:
        end

        def update(customer_id, id, data)
          custom method: :put, path: "#{resource_path(customer_id)}/#{id}", data:
        end

        def destroy(customer_id, id)
          custom method: :delete, path: "#{resource_path(customer_id)}/#{id}"
        end

        private

        def resource_path(customer_id)
          "#{base_path}/customers/#{customer_id}/contacts"
        end
      end
    end
  end
end
