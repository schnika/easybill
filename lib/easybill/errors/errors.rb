module Easybill
  module Errors
    class BaseError < StandardError; end

    class EasybillError < BaseError; end
    class RateLimitExceededError < EasybillError; end

    class ResourceNotCreatableError < BaseError; end
    class ResourceNotUpdatableError < BaseError; end
  end
end
