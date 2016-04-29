module Easybill
  module Api
    class DocumentPayments < Base
      def self.update(id, data)
        raise Easybill::Errors::ResourceNotUpdatableError, "Document payments cannot get updated via api."
      end
    end
  end
end
