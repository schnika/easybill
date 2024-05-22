# frozen_string_literal: true

require 'spec_helper'

module Easybill
  module Api
    class TestBase < Easybill::Api::Base; end
  end
end

describe Easybill::Api::Base do
  let(:success_response) { double(:success_response, code: 200) }

  it 'has a base_uri set' do
    expect(described_class.base_uri).to eq('https://api.easybill.de')
  end

  it 'has a default format set' do
    expect(described_class.format).to eq(:json)
  end

  it 'has the default user agent header set' do
    expect(described_class.headers['User-Agent']).to eq('Ruby.Easybill.Api')
  end

  it 'has the default accept header set' do
    expect(described_class.headers['Accept']).to eq('application/json')
  end

  it 'has the default content type header set' do
    expect(described_class.headers['Content-Type']).to eq('application/json')
  end

  describe '.authenticate' do
    let(:api_key) { 'awesomeapikey' }

    it 'sets the authentication header' do
      described_class.authenticate api_key
      expect(described_class.headers['authorization']).to eq "Bearer #{api_key}"
    end
  end

  describe '.list' do
    it 'returns all entities' do
      expect(Easybill::Api::TestBase).to receive(:get).with('/rest/v1/test-base',
                                                            query: {}).and_return(success_response)
      Easybill::Api::TestBase.list
    end

    context 'with query parameters' do
      let(:query) { { foo: :bar } }

      it 'adds query parameters to the url' do
        expect(Easybill::Api::TestBase).to receive(:get).with('/rest/v1/test-base',
                                                              query:).and_return(success_response)
        Easybill::Api::TestBase.list(query:)
      end
    end
  end

  describe '.find' do
    let(:id) { 1234 }

    it 'returns an entity' do
      expect(Easybill::Api::TestBase).to receive(:get).with("/rest/v1/test-base/#{id}",
                                                            query: {}).and_return(success_response)
      Easybill::Api::TestBase.find(id)
    end

    context 'with query parameters' do
      let(:query) { { foo: :bar } }

      it 'adds query parameters to the url' do
        expect(Easybill::Api::TestBase).to receive(:get).with("/rest/v1/test-base/#{id}",
                                                              query:).and_return(success_response)
        Easybill::Api::TestBase.find(id, query:)
      end
    end
  end

  describe '.create' do
    let(:data) { { foo: :bar } }

    it 'creates an entity' do
      expect(Easybill::Api::TestBase).to receive(:post).with('/rest/v1/test-base',
                                                             body: data.to_json).and_return(success_response)
      Easybill::Api::TestBase.create(data)
    end
  end

  describe '.destroy' do
    let(:id) { 1234 }

    it 'deletes an entity' do
      expect(Easybill::Api::TestBase).to receive(:delete).with("/rest/v1/test-base/#{id}").and_return(success_response)
      Easybill::Api::TestBase.destroy(id)
    end
  end

  describe '.update' do
    let(:id)   { 1234 }
    let(:data) { { foo: :bar } }

    it 'updates an entity' do
      expect(Easybill::Api::TestBase).to receive(:put).with("/rest/v1/test-base/#{id}",
                                                            body: data.to_json).and_return(success_response)
      Easybill::Api::TestBase.update(id, data)
    end
  end

  describe '.custom' do
    let(:path) { "/rest/v1/test-base/#{id}/check" }
    let(:id)   { 1234 }

    it 'performs the right request' do
      expect(Easybill::Api::TestBase).to receive(:get).with(path, { format: :json }).and_return(success_response)
      Easybill::Api::TestBase.send(:custom, method: :get, path:)
    end

    context 'with query params' do
      let(:query) { { foo: :bar } }

      it 'sets the query params' do
        expect(Easybill::Api::TestBase).to receive(:get).with(path, { query:,
                                                                      format: :json }).and_return(success_response)
        Easybill::Api::TestBase.send(:custom, method: :get, path:, query:)
      end
    end

    context 'with custom data' do
      let(:data) { { foo: :bar } }

      it 'sets the body' do
        expect(Easybill::Api::TestBase).to receive(:get).with(path, { body: data.to_json,
                                                                      format: :json }).and_return(success_response)
        Easybill::Api::TestBase.send(:custom, method: :get, path:, data:)
      end
    end

    context 'with different header' do
      let(:different_header) { { 'Content-Type' => 'application/pdf' } }

      it 'sets the right header' do
        expect(Easybill::Api::TestBase).to receive(:get).with(path, { headers: different_header,
                                                                      format: :json }).and_return(success_response)
        Easybill::Api::TestBase.send(:custom, method: :get, path:, headers: different_header)
      end
    end
  end

  describe '.resource_path' do
    it 'has the right resource_path set' do
      expect(Easybill::Api::TestBase.send(:resource_path)).to eq('/rest/v1/test-base')
    end
  end
end
