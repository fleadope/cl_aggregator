require 'spec_helper'
require 'search_fetcher'

describe SearchFetcher, vcr: { cassette_name: "beds" } do
  let!(:search) { Fabricate(:search) }
  let!(:generator) { UrlGenerator.new(search) }
  let!(:url) { generator.urls.first }
  let(:response) { Faraday.get(url) }

  it "should fetch" do
    expect(response.body).to be_a(String)
  end
end
