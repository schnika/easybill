module Easybill
  module Api
    class PostBoxes < Base
      def self.create(data)
        raise Easybill::Errors::ResourceNotCreatableError, "Post boxes cannot get created via api."
      end

      def self.update(id, data)
        raise Easybill::Errors::ResourceNotUpdatableError, "Post boxes cannot get updated via api."
      end
    end
  end
end

