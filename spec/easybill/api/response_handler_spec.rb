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

  context "errors" do
    let(:error_response) { double(:error_response, code: 401, body: {code: 401, message: "foobar"}.to_json) }

    it "raises an error and returns the response body" do
      expect {
        klazz.handle(error_response)
      }.to raise_error Easybill::Errors::NotAuthorizedError
    end

    it "returns the rror message" do
      begin
        klazz.handle(error_response)
      rescue Easybill::Errors::NotAuthorizedError => e
        error_message = JSON.parse(e.message)
        expect(error_message["code"]).to be 401
      end

    end

  end
end

