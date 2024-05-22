# frozen_string_literal: true

require 'spec_helper'

describe Easybill::Api::Positions do
  describe '.resource_path' do
    it 'has the right resource_path set' do
      expect(described_class.send(:resource_path)).to eq('/rest/v1/positions')
    end
  end
end
