class SearchProcessorJob
  include SuckerPunch::Job

  def perform(body, search_id)
    ActiveRecord::Base.connection_pool.with_connection do
      parser = ::SearchParser.new(body)
      mapper = ::SearchMapper.new(parser)
      search = ::Search.find(search_id)
      mapper.persist_results(search)
    end
  end
end

