require 'spec_helper'

describe Easybill::Api::Projects do
  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::Projects.send(:resource_path)).to eq("/rest/v1/projects")
    end
  end
end
