require 'spec_helper'

describe Easybill::Api::Documents do
  describe ".done" do
    let(:id) { 1 }

    it "sets the document to done" do
      expect(Easybill::Api::Documents).to receive(:custom).with(
        method: :put,
        path: "/rest/v1/documents/#{id}/done"
      )
      Easybill::Api::Documents.done(id)
    end
  end

  describe ".cancel" do
    let(:id) { 1 }

    it "cancels the document" do
      expect(Easybill::Api::Documents).to receive(:custom).with(
        method: :post,
        path: "/rest/v1/documents/#{id}/cancel"
      )
      Easybill::Api::Documents.cancel(id)
    end
  end

  describe ".deliver" do
    let(:id)   { 1 }
    let(:type) { "email" }
    let(:data) { {foo: :bar} }

    it "delivers the document" do
      expect(Easybill::Api::Documents).to receive(:custom).with(
        method: :post,
        path: "/rest/v1/documents/#{id}/send/#{type}",
        data: data
      )
      Easybill::Api::Documents.deliver(id, type, data)
    end
  end

  describe ".pdf" do
    let(:id) { 1 }

    it "fetches the document as pdf" do
      expect(Easybill::Api::Documents).to receive(:custom).with(
        method: :get,
        path: "/rest/v1/documents/#{id}/pdf",
        headers: {"Content-Type" => "application/pdf"}
      )
      Easybill::Api::Documents.pdf(id)
    end
  end

  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::Documents.send(:resource_path)).to eq("/rest/v1/documents")
    end
  end
end
