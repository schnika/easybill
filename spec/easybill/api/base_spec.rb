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
    it "returns all customers" do
      expect(TestBase).to receive(:get).with("/rest/v1/testbase")
      TestBase.list
    end
  end

  describe ".find" do
    let(:id) { 1234 }

    it "returns a customer" do
      expect(TestBase).to receive(:get).with("/rest/v1/testbase/#{id}")
      TestBase.find(id)
    end
  end
end
