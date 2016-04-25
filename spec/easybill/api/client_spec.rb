require 'spec_helper'

describe Easybill::Api::Client do
  let(:api_token)  { "my_awesome_api_token" }
  subject(:client) { Easybill::Api::Client.new api_token }

  describe "#initialize" do
    it "initializes a client instance with an api_key" do
      expect(subject.api_key).to eq api_token
    end
  end

  describe "#customers" do
    it "returns a Easybill::Api::Customer instance" do
      expect(subject.customers).to be(Easybill::Api::Customers)
    end
  end
end
