require 'url_generator'

module SetupParser
    def setup_parser(search = Fabricate(:search))
        generator = UrlGenerator.new(search) 
        url = generator.urls.first 
        txt = VCR.use_cassette(search.terms) { Faraday.get(url).body }
        parser = described_class.new(txt) 
        results = parser.results 
        return parser, results
    end
end

