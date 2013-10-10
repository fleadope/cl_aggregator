class SearchFetcher

    def initialize(search)
        @search = search
    end

    def fetch
        ClLocation.each do |loc|
            url = search_url(loc)
            FetchJob.new.async.perform(url, search.id)
        end
    end

    private
    def search_url(loc)
        "http://#{loc.name}.craigslist.org/search/?query=#{search.terms.to_uri}&catAbb=#{search.category.abbr}"
    end

end


