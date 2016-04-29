module Easybill
  module Api
    class Attachments < Base
      def self.content(id)
        custom method: :get, path: "#{resource_path}/#{id}/content"
      end
    end
  end
end
