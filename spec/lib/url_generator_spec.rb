require 'url_generator'
require 'uri'

describe UrlGenerator do
    let(:search) { Fabricate(:search) }
    subject(:generator) { UrlGenerator.new(search) }

    it "should have a search" do
        expect(generator.search).to be_a Search
    end

    it "should generate an array" do
        expect(generator.urls).to be_an Array
    end

    describe ".results" do
        subject(:results) { generator.urls }

        it "should be an Array" do
            expect(subject).to be_an(Array)
        end

        it "should be the right url" do
            res = "http://sacramento.craigslist.org/search/?query=bed&&catAbb=sss&minAsk=1&maxAsk=100"
            expect(results.first).to eq(res)
        end
    end

    describe ".search_url" do
        let(:location) { search.locations.first }
        let(:category) { search.categories.first }
        subject(:url) { generator.search_url(location, category) }
        let(:parsed_uri) { URI.parse(url) }

        describe '.host' do
            it "should reflect the location" do
                expect(parsed_uri.host).to eq("#{location.name}.craigslist.org")
            end
        end
    end
end
