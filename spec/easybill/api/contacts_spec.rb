# frozen_string_literal: true

require 'spec_helper'

describe Easybill::Api::Contacts do
  let(:customer_id) { 15 }

  describe '.list' do
    it 'fetches all contacts' do
      expect(described_class).to receive(:custom).with(
        method: :get,
        path: "/rest/v1/customers/#{customer_id}/contacts",
        query: {}
      )
      described_class.list(customer_id)
    end
  end

  describe '.find' do
    let(:id) { 1 }

    it 'fetches the contact' do
      expect(described_class).to receive(:custom).with(
        method: :get,
        path: "/rest/v1/customers/#{customer_id}/contacts/#{id}",
        query: {}
      )
      described_class.find(customer_id, id)
    end
  end

  describe '.create' do
    let(:data) { { foo: :bar } }

    it 'fetches the contact' do
      expect(described_class).to receive(:custom).with(
        method: :post,
        path: "/rest/v1/customers/#{customer_id}/contacts",
        data:
      )
      described_class.create(customer_id, data)
    end
  end

  describe '.update' do
    let(:id)   { 1 }
    let(:data) { { foo: :bar } }

    it 'fetches the contact' do
      expect(described_class).to receive(:custom).with(
        method: :put,
        path: "/rest/v1/customers/#{customer_id}/contacts/#{id}",
        data:
      )
      described_class.update(customer_id, id, data)
    end
  end

  describe '.destroy' do
    let(:id) { 1 }

    it 'destroys the contact' do
      expect(described_class).to receive(:custom).with(
        method: :delete,
        path: "/rest/v1/customers/#{customer_id}/contacts/#{id}"
      )
      described_class.destroy(customer_id, id)
    end
  end
end
