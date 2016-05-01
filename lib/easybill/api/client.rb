module Easybill
  module Api
    class Client
      def initialize(api_key)
        Easybill::Api::Base.authenticate api_key
      end

      def attachments
        Easybill::Api::Attachments
      end

      def contacts
        Easybill::Api::Contacts
      end

      def customer_groups
        Easybill::Api::CustomerGroups
      end

      def customers
        Easybill::Api::Customers
      end

      def document_payments
        Easybill::Api::DocumentPayments
      end

      def documents
        Easybill::Api::Documents
      end

      def position_groups
        Easybill::Api::PositionGroups
      end

      def positions
        Easybill::Api::Positions
      end

      def post_boxes
        Easybill::Api::PostBoxes
      end

      def projects
        Easybill::Api::Projects
      end

      def tasks
        Easybill::Api::Tasks
      end

      def text_templates
        Easybill::Api::TextTemplates
      end

      def time_trackings
        Easybill::Api::TimeTrackings
      end
    end
  end
end
