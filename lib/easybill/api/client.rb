# frozen_string_literal: true

module Easybill
  module Api
    ##
    # This class represents the client object.
    # Use this class to initialize you api client

    class Client
      ENTITIES = %i[Base Attachments Contacts Customers CustomerGroups Documents DocumentPayments
                    Positions PositionGroups PostBoxes Projects Tasks TextTemplates TimeTrackings].freeze

      ##
      # Create a new client instance with an +api_key+
      #
      # Create or use your generated easybill +api_key+ here
      # @api = Easybill::Api::Client.new("api_key")

      def initialize(api_key)
        ENTITIES.each do |entity|
          Object.const_get("Easybill::Api::#{entity}").authenticate api_key
        end
      end

      ##
      # Returns a Easybill::Api::Attachments class

      def attachments
        Easybill::Api::Attachments
      end

      ##
      # Returns a Easybill::Api::Contacts class

      def contacts
        Easybill::Api::Contacts
      end

      ##
      # Returns a Easybill::Api::CustomerGroups class

      def customer_groups
        Easybill::Api::CustomerGroups
      end

      ##
      # Returns a Easybill::Api::Customers class

      def customers
        Easybill::Api::Customers
      end

      ##
      # Returns a Easybill::Api::DocumentPayments class

      def document_payments
        Easybill::Api::DocumentPayments
      end

      ##
      # Returns a Easybill::Api::Documents class

      def documents
        Easybill::Api::Documents
      end

      ##
      # Returns a Easybill::Api::PositionGroups class

      def position_groups
        Easybill::Api::PositionGroups
      end

      ##
      # Returns a Easybill::Api::Positions class

      def positions
        Easybill::Api::Positions
      end

      ##
      # Returns a Easybill::Api::PostBoxes class

      def post_boxes
        Easybill::Api::PostBoxes
      end

      ##
      # Returns a Easybill::Api::Projects class

      def projects
        Easybill::Api::Projects
      end

      ##
      # Returns a Easybill::Api::Tasks class

      def tasks
        Easybill::Api::Tasks
      end

      ##
      # Returns a Easybill::Api::TextTemplates class

      def text_templates
        Easybill::Api::TextTemplates
      end

      ##
      # Returns a Easybill::Api::TimeTrackings class

      def time_trackings
        Easybill::Api::TimeTrackings
      end
    end
  end
end
