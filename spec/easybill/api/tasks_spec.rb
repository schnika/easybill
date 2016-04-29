require 'spec_helper'

describe Easybill::Api::Tasks do
  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::Tasks.send(:resource_path)).to eq("/rest/v1/tasks")
    end
  end
end
