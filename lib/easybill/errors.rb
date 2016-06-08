module Easybill
  module Errors
    class BaseError < StandardError; end

    class ServerError < StandardError; end

    class ClientError < BaseError; end
    class RateLimitExceededError < ClientError; end
    class ResourceNotFoundError < ClientError; end
    class BadRequestError < ClientError; end
    class NotAuthorizedError < ClientError; end

    class ResourceNotCreatableError < BaseError; end
    class ResourceNotUpdatableError < BaseError; end
  end
end
