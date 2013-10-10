require 'sucker_punch'
class SearchJob
    include SuckerPunch::Job

    def perform(search_id)
        ActiveRecord::Base.connection_pool.with_connection do
            search = Search.find(search_id)
            fetcher = SearchFetcher.new(search)
            fetcher.fetch
        end
    end
end
