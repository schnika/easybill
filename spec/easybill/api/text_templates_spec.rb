require 'spec_helper'

describe Easybill::Api::TextTemplates do
  describe ".resource_path" do
    it "has the right resource_path set" do
      expect(Easybill::Api::TextTemplates.send(:resource_path)).to eq("/rest/v1/text-templates")
    end
  end
end
