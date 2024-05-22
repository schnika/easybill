# frozen_string_literal: true

require 'spec_helper'

describe Easybill::Api::Documents do
  describe '.done' do
    let(:id) { 1 }

    it 'sets the document to done' do
      expect(described_class).to receive(:custom).with(
        method: :put,
        path: "/rest/v1/documents/#{id}/done"
      )
      described_class.done(id)
    end
  end

  describe '.cancel' do
    let(:id) { 1 }

    it 'cancels the document' do
      expect(described_class).to receive(:custom).with(
        method: :post,
        path: "/rest/v1/documents/#{id}/cancel"
      )
      described_class.cancel(id)
    end
  end

  describe '.deliver' do
    let(:id)   { 1 }
    let(:type) { 'email' }
    let(:data) { { foo: :bar } }

    it 'delivers the document' do
      expect(described_class).to receive(:custom).with(
        method: :post,
        path: "/rest/v1/documents/#{id}/send/#{type}",
        data:
      )
      described_class.deliver(id, type, data)
    end
  end

  describe '.pdf' do
    let(:id) { 1 }

    it 'fetches the document as pdf' do
      expect(described_class).to receive(:custom).with(
        method: :get,
        path: "/rest/v1/documents/#{id}/pdf",
        headers: {
          'Content-Type' => 'application/pdf',
          'Accept' => 'application/pdf'
        },
        format: :pdf
      )
      described_class.pdf(id)
    end
  end

  describe '.resource_path' do
    it 'has the right resource_path set' do
      expect(described_class.send(:resource_path)).to eq('/rest/v1/documents')
    end
  end
end
