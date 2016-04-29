require 'spec_helper'

describe Easybill::Api::Customers do
  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::Customers.send(:resource_path)).to eq("/rest/v1/customers")
    end
  end
end
