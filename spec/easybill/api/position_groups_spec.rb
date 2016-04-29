require "spec_helper"

describe Easybill::Api::PositionGroups do
  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::PositionGroups.send(:resource_path)).to eq("/rest/v1/position-groups")
    end
  end
end
