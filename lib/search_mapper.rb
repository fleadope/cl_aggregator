class SearchMapper

    attr_reader :parser
    def init(parser)
        @parser = parser
    end

    def persist_results(search_id)
        search = Search.find(search_id)
        parser.results.each do |found|
        to_save = search.results.find_or_create_by_pid(found.pid)
        map(found, to_save)
        to_save.save
        end
    end

    private
    def map(found, to_save)
        to_save.date = found.date
        to_save.href = found.href
        to_save.text = found.text
    end
end

