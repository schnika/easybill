require 'spec_helper'

describe Easybill::Api::Base do
  class TestBase < Easybill::Api::Base; end

  it "has a base_uri set" do
    expect(Easybill::Api::Base.base_uri).to eq("https://api.easybill.de")
  end

  it "has a default format set" do
    expect(Easybill::Api::Base.format).to eq(:json)
  end

  it "has the default headers set" do
    expect(Easybill::Api::Base.headers["User-Agent"]).to eq("Ruby.Easybill.Api")
    expect(Easybill::Api::Base.headers["Accept"]).to eq("application/json")
    expect(Easybill::Api::Base.headers["Content-Type"]).to eq("application/json")
  end

  describe ".authenticate!" do
    let(:api_key) { "awesomeapikey" }

    it "sets the authentication header" do
      Easybill::Api::Base.authenticate!(api_key)
      expect(Easybill::Api::Base.headers["authorization"]).to be
      expect(Easybill::Api::Base.headers["authorization"]).to eq "Bearer #{api_key}"
    end
  end

  describe ".list" do
    it "returns all entities" do
      expect(TestBase).to receive(:get).with("/rest/v1/testbase", query: {})
      TestBase.list
    end

    context "query parameters" do
      let(:query) { {foo: :bar} }

      it "adds query parameters to the url" do
        expect(TestBase).to receive(:get).with("/rest/v1/testbase", query: query)
        TestBase.list(query: query)
      end
    end
  end

  describe ".find" do
    let(:id) { 1234 }

    it "returns an entity" do
      expect(TestBase).to receive(:get).with("/rest/v1/testbase/#{id}", query: {})
      TestBase.find(id)
    end

    context "query parameters" do
      let(:query) { {foo: :bar} }

      it "adds query parameters to the url" do
        expect(TestBase).to receive(:get).with("/rest/v1/testbase/#{id}", query: query)
        TestBase.find(id, query: query)
      end
    end
  end

  describe ".create" do
    let(:data) { {foo: :bar} }

    it "creates an entity" do
      expect(TestBase).to receive(:post).with("/rest/v1/testbase", body: data.to_json)
      TestBase.create(data)
    end
  end

  describe ".destroy" do
    let(:id) { 1234 }

    it "deletes an entity" do
      expect(TestBase).to receive(:delete).with("/rest/v1/testbase/#{id}")
      TestBase.destroy(id)
    end
  end

  describe ".update" do
    let(:id)   { 1234 }
    let(:data) { {foo: :bar} }

    it "updates an entity" do
      expect(TestBase).to receive(:put).with("/rest/v1/testbase/#{id}", body: data.to_json)
      TestBase.update(id, data)
    end
  end

  describe ".custom_request" do
    let(:path) { "/rest/v1/testbase/#{id}/check" }
    let(:id)   { 1234 }

    it "performs the right request" do
      expect(TestBase).to receive(:get).with(path, {})
      TestBase.custom_request(method: :get, path: path)
    end
  end
end
