module Easybill
  module Api
    module ResponseHandler
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def handle(response)
          case response.code
          when 200..299
            response
          when 400
            raise Easybill::Errors::BadRequestError, response.message
          when 401
            raise Easybill::Errors::NotAuthorizedError, response.message
          when 404
            raise Easybill::Errors::ResourceNotFoundError, response.message
          when 429
            raise Easybill::Errors::RateLimitExceededError, response.message
          when 500...600
            raise Easybill::Errors::ServerError, "Failed with: #{response.code} #{response.message}"
          end
        end
      end
    end
  end
end

