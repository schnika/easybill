module Easybill
  module Api
    class Documents < Base
      class << self
        def done(id)
          custom method: :put, path: "#{resource_path}/#{id}/done"
        end

        def cancel(id)
          custom method: :post, path: "#{resource_path}/#{id}/cancel"
        end

        def deliver(id, type, data)
          custom method: :post, path: "#{resource_path}/#{id}/send/#{type}", data: data
        end

        def pdf(id)
          custom(
            method: :get,
            path: "#{resource_path}/#{id}/pdf",
            headers: {
              "Content-Type" => "application/pdf",
              "Accept" => "application/pdf"
            },
            format: :pdf
          )
        end
      end
    end
  end
end
