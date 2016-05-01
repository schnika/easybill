require 'spec_helper'

describe Easybill::Api::Client do
  let(:api_key)    { "my_awesome_api_token" }
  subject(:client) { Easybill::Api::Client.new api_key }

  describe "#initialize" do
    it "authenticates" do
      expect(Easybill::Api::Base).to receive(:authenticate).with(api_key)
      subject
    end
  end

  describe "#attachments" do
    it "returns a Easybill::Api::Attachments instance" do
      expect(subject.attachments).to be(Easybill::Api::Attachments)
    end
  end

  describe "#contacts" do
    it "returns a Easybill::Api::Contacts instance" do
      expect(subject.contacts).to be(Easybill::Api::Contacts)
    end
  end

  describe "#customer_groups" do
    it "returns a Easybill::Api::CustomerGroups instance" do
      expect(subject.customer_groups).to be(Easybill::Api::CustomerGroups)
    end
  end

  describe "#customers" do
    it "returns a Easybill::Api::Customers instance" do
      expect(subject.customers).to be(Easybill::Api::Customers)
    end
  end

  describe "#document_payments" do
    it "returns a Easybill::Api::DocumentPayments instance" do
      expect(subject.document_payments).to be(Easybill::Api::DocumentPayments)
    end
  end

  describe "#documents" do
    it "returns a Easybill::Api::Documents instance" do
      expect(subject.documents).to be(Easybill::Api::Documents)
    end
  end

  describe "#position_groups" do
    it "returns a Easybill::Api::PositionGroups instance" do
      expect(subject.position_groups).to be(Easybill::Api::PositionGroups)
    end
  end

  describe "#positions" do
    it "returns a Easybill::Api::Positions instance" do
      expect(subject.positions).to be(Easybill::Api::Positions)
    end
  end

  describe "#post_boxes" do
    it "returns a Easybill::Api::PostBoxes instance" do
      expect(subject.post_boxes).to be(Easybill::Api::PostBoxes)
    end
  end

  describe "#projects" do
    it "returns a Easybill::Api::Pojects instance" do
      expect(subject.projects).to be(Easybill::Api::Projects)
    end
  end

  describe "#tasks" do
    it "returns a Easybill::Api::Tasks instance" do
      expect(subject.tasks).to be(Easybill::Api::Tasks)
    end
  end

  describe "#text_templates" do
    it "returns a Easybill::Api::TextTemplates instance" do
      expect(subject.text_templates).to be(Easybill::Api::TextTemplates)
    end
  end

  describe "#time_trackings" do
    it "returns a Easybill::Api::TimeTrackings instance" do
      expect(subject.time_trackings).to be(Easybill::Api::TimeTrackings)
    end
  end
end
