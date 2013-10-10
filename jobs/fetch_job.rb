require 'typhoeus'
class FetchJob
    include SuckerPunch::Job

    def perform(url, search_id)
        ActiveRecord::Base.connection_pool.with_connection do
            results = Typhoeus.get(url)
            parser = SearchParser.new(results)
            mapper = SearchMapper.new(parser)
            search = Search.find(search_id)
            mapper.persist_results(search)
        end
    end
end

