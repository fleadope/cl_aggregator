require 'url_generator'

shared_context "setup parser" do
    let!(:search) { Fabricate(:search) }
    let!(:generator) { UrlGenerator.new(search) }
    let!(:url) { generator.generate.first }
    let(:txt) { VCR.use_cassette('beds') { Typhoeus.get(url).body }}
    let!(:parser) { described_class.new(txt) }
    let!(:results) { parser.results }
end

