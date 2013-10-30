require 'search_parser'
require 'search_mapper'

#parser = ::SearchParser.new(results)
#mapper = ::SearchMapper.new(parser)
#search = ::Search.find(search_id)
#mapper.persist_results(search)

describe SearchProcessorJob, job: true, vcr: { cassette_name: "beds" } do
  let!(:search) { Fabricate(:search) }
  let!(:generator) { UrlGenerator.new(search) }
  let!(:url) { generator.urls.first }
  let!(:response) { Faraday.get(url) }

  it "should parse the page" do
    SearchProcessorJob.new.async.perform(response.body, search.id)
  end
end
