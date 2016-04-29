module Easybill
  module Errors
    class BaseError < StandardError; end

    class ApiError < BaseError; end
    class RateLimitExceededError < ApiError; end

    class ResourceNotCreatableError < BaseError; end
    class ResourceNotUpdatableError < BaseError; end
  end
end
