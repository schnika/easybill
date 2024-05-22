# frozen_string_literal: true

require 'spec_helper'

describe Easybill::Api::Attachments do
  describe '.resource_path' do
    it 'has the right resource_path set' do
      expect(described_class.send(:resource_path)).to eq('/rest/v1/attachments')
    end
  end

  describe '.content' do
    let(:id) { 1234 }

    before do
      allow(described_class).to receive(:custom).with(
        method: :get,
        path: "/rest/v1/attachments/#{id}/content"
      )
    end

    it 'returns the content of an attachment' do
      described_class.content(id)

      expect(described_class).to have_received(:custom).with(
        method: :get,
        path: "/rest/v1/attachments/#{id}/content"
      )
    end
  end
end
