require 'spec_helper'

describe Easybill::Api::Client do
  let(:api_key)    { "my_awesome_api_token" }
  subject(:client) { Easybill::Api::Client.new api_key }

  describe "#initialize" do
    it "authenticates" do
      expect(Easybill::Api::Base).to receive(:authenticate!).with(api_key)
      subject
    end
  end

  describe "#customers" do
    it "returns a Easybill::Api::Customer instance" do
      expect(subject.customers).to be(Easybill::Api::Customers)
    end
  end
end
