class SearchFetcherJob
  include SuckerPunch::Job

  def perform(url, search_id)
    response = ::Faraday.get(url)
    if response.status == "200 OK"
      parser = ::SearchParser.new(body)
      while parser.has_more?
        SearchFetcherJob.new.async.perform(parser.next, search_id)
      end
      SearchProcessorJob.new.async.perform(response.body, search_id)
    else
      Search.find(search_id).mark_failed!
    end
  end
end

