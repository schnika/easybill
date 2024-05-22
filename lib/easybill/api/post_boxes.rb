# frozen_string_literal: true

module Easybill
  module Api
    class PostBoxes < Base
      def self.create(_data)
        raise Easybill::Errors::ResourceNotCreatableError, 'Post boxes cannot get created via api.'
      end

      def self.update(_id, _data)
        raise Easybill::Errors::ResourceNotUpdatableError, 'Post boxes cannot get updated via api.'
      end
    end
  end
end
