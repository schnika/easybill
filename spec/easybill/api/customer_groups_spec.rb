require 'spec_helper'

describe Easybill::Api::CustomerGroups do
  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::CustomerGroups.send(:resource_path)).to eq("/rest/v1/customer-groups")
    end
  end
end
