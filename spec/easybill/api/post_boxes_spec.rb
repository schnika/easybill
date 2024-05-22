# frozen_string_literal: true

require 'spec_helper'

describe Easybill::Api::PostBoxes do
  describe '.create' do
    let(:data) { { foo: :bar } }

    it 'raises an ResourceNotCreatableError' do
      expect do
        described_class.create(data)
      end.to raise_error(Easybill::Errors::ResourceNotCreatableError)
    end
  end

  describe '.update' do
    let(:id)   { 1234 }
    let(:data) { { foo: :bar } }

    it 'raises an ResourceNotUpdatableError' do
      expect do
        described_class.update(id, data)
      end.to raise_error(Easybill::Errors::ResourceNotUpdatableError)
    end
  end

  describe '.resource_path' do
    it 'has the right resource_path set' do
      expect(described_class.send(:resource_path)).to eq('/rest/v1/post-boxes')
    end
  end
end
