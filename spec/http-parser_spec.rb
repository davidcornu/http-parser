require "spec_helper"
require "http-parser"

describe "HTTPParser" do
  describe "#http_parser_version" do
    it "returns a Numeric" do
      expect(HTTPParser.http_parser_version).to be_kind_of(Numeric)
    end
  end

  describe "#http_parser_init" do
    it "correctly initializes a HTTPParser::Parser" do
      p = HTTPParser::Parser.new
      HTTPParser.http_parser_init(p, :HTTP_REQUEST)
      expect(p[:type]).to eq(:HTTP_REQUEST)
    end
  end
end
