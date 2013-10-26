class Search < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :locations, class_name: "ClLocation"
  has_many :results, class_name: "SearchResult"

  def perform
      generator = UrlGenerator.new(self)
      for url in generator.urls do
          SearchProcessorJob.async.perform(url, self.id)
      end
  end
end
