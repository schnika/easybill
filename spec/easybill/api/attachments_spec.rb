require 'spec_helper'

describe Easybill::Api::Attachments do
  describe ".content" do
    let(:id) { 1234 }

    it "returns the content of an attachment" do
      expect(Easybill::Api::Attachments).to receive(:custom_request).with(
        method: :get,
        path: "/rest/v1/attachments/#{id}/content"
      )
      Easybill::Api::Attachments.content(id)
    end
  end
end

