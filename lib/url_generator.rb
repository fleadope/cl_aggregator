class UrlGenerator
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

    def search_url(loc, category)
        price_str = search.min_price ? "minAsk=#{search.min_price}&maxAsk=#{search.max_price}" : nil
        cat_str = "&catAbb=#{category.abbreviation || Category.default}"
        query_str = "query=#{search.terms.to_uri}"
        "http://#{loc.name}.craigslist.org/search/?#{query_str}&#{cat_str}&#{price_str}"
    end
end
