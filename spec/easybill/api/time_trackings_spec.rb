require 'spec_helper'

describe Easybill::Api::TimeTrackings do
  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::TimeTrackings.send(:resource_path)).to eq("/rest/v1/time-trackings")
    end
  end
end
