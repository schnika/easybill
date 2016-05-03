require 'spec_helper'

describe Easybill::Api::Base do
  class Easybill::Api::TestBase < Easybill::Api::Base; end

  let(:response) do
    OpenStruct.new(
      :success? => true
    )
  end

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

  describe ".authenticate" do
    let(:api_key) { "awesomeapikey" }

    it "sets the authentication header" do
      Easybill::Api::Base.authenticate api_key
      expect(Easybill::Api::Base.headers["authorization"]).to be
      expect(Easybill::Api::Base.headers["authorization"]).to eq "Bearer #{api_key}"
    end
  end

  describe ".list" do
    it "returns all entities" do
      expect(Easybill::Api::TestBase).to receive(:get).with("/rest/v1/test-base", query: {}).and_return(response)
      Easybill::Api::TestBase.list
    end

    context "query parameters" do
      let(:query) { {foo: :bar} }

      it "adds query parameters to the url" do
        expect(Easybill::Api::TestBase).to receive(:get).with("/rest/v1/test-base", query: query).and_return(response)
        Easybill::Api::TestBase.list(query: query)
      end
    end
  end

  describe ".find" do
    let(:id) { 1234 }

    it "returns an entity" do
      expect(Easybill::Api::TestBase).to receive(:get).with("/rest/v1/test-base/#{id}", query: {}).and_return(response)
      Easybill::Api::TestBase.find(id)
    end

    context "query parameters" do
      let(:query) { {foo: :bar} }

      it "adds query parameters to the url" do
        expect(Easybill::Api::TestBase).to receive(:get).with("/rest/v1/test-base/#{id}", query: query).and_return(response)
        Easybill::Api::TestBase.find(id, query: query)
      end
    end
  end

  describe ".create" do
    let(:data) { {foo: :bar} }

    it "creates an entity" do
      expect(Easybill::Api::TestBase).to receive(:post).with("/rest/v1/test-base", body: data.to_json).and_return(response)
      Easybill::Api::TestBase.create(data)
    end
  end

  describe ".destroy" do
    let(:id) { 1234 }

    it "deletes an entity" do
      expect(Easybill::Api::TestBase).to receive(:delete).with("/rest/v1/test-base/#{id}").and_return(response)
      Easybill::Api::TestBase.destroy(id)
    end
  end

  describe ".update" do
    let(:id)   { 1234 }
    let(:data) { {foo: :bar} }

    it "updates an entity" do
      expect(Easybill::Api::TestBase).to receive(:put).with("/rest/v1/test-base/#{id}", body: data.to_json).and_return(response)
      Easybill::Api::TestBase.update(id, data)
    end
  end

  describe ".custom" do
    let(:path) { "/rest/v1/test-base/#{id}/check" }
    let(:id)   { 1234 }

    it "performs the right request" do
      expect(Easybill::Api::TestBase).to receive(:get).with(path, {}).and_return(response)
      Easybill::Api::TestBase.send(:custom, method: :get, path: path)
    end

    context "query params" do
      let(:query) { {foo: :bar} }

      it "sets the query params" do
        expect(Easybill::Api::TestBase).to receive(:get).with(path, query: query).and_return(response)
        Easybill::Api::TestBase.send(:custom, method: :get, path: path, query: query)
      end
    end

    context "custom data" do
      let(:data) { {foo: :bar} }

      it "sets the body" do
        expect(Easybill::Api::TestBase).to receive(:get).with(path, body: data.to_json).and_return(response)
        Easybill::Api::TestBase.send(:custom, method: :get, path: path, data: data)
      end
    end

    context "different header" do
      let(:different_header) { {"Content-Type" => "application/pdf"} }

      it "sets the right header" do
        expect(Easybill::Api::TestBase).to receive(:get).with(path, headers: different_header).and_return(response)
        Easybill::Api::TestBase.send(:custom, method: :get, path: path, headers: different_header)
      end
    end
  end

  describe ".execute" do
    it "initializes the response object" do
      expect(Easybill::Api::Base).to receive(:get).with("/rest/v1/base").and_return(response)

      Easybill::Api::TestBase.send(:execute) do
        response = Easybill::Api::Base.get("/rest/v1/base")
      end
      expect(response).to be_a(OpenStruct)
    end
  end

  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::TestBase.send(:resource_path)).to eq("/rest/v1/test-base")
    end
  end
end
