class UrlGenerator
:A
    attr_reader :search

    def initialize(search)
        @search = search
    end

    def generate
        ClLocation.all.inject([]) do |results, loc|
            search.categories.each do |category|
                results << search_url(loc, category)
                results
            end
            results
        end
    end

    private
    def search_url(loc, category)
        "http://#{loc.name}.craigslist.org/search/?query=#{search.terms.to_uri}&catAbb=#{category.abbreviation}"
    end
end
