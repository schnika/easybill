# frozen_string_literal: true

module Easybill
  module Api
    class DocumentPayments < Base
      def self.update(_id, _data)
        raise Easybill::Errors::ResourceNotUpdatableError, 'Document payments cannot get updated via api.'
      end
    end
  end
end
