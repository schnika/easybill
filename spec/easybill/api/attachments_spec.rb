require 'spec_helper'

describe Easybill::Api::Attachments do
  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::Attachments.send(:resource_path)).to eq("/rest/v1/attachments")
    end
  end

  describe ".content" do
    let(:id) { 1234 }

    it "returns the content of an attachment" do
      expect(Easybill::Api::Attachments).to receive(:custom).with(
        method: :get,
        path: "/rest/v1/attachments/#{id}/content"
      )
      Easybill::Api::Attachments.content(id)
    end
  end
end

