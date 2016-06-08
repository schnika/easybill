require 'spec_helper'

describe Easybill::Api::ResponseHandler do
  class Easybill::Api::TestResponseHandler
    include Easybill::Api::ResponseHandler
  end

  let(:klazz) { Easybill::Api::TestResponseHandler }
  let(:success_response) { double(:success_response, code: 200, message: "Ok", body: {}) }

  it "returns the response on success" do
    expect(klazz.handle(success_response)).to eq(success_response)
  end
end

