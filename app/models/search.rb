require 'url_generator'

class Search < ActiveRecord::Base
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :locations, class_name: "ClLocation"
    has_many :results, class_name: "SearchResult"

    def process
        unless failed?
            generator = UrlGenerator.new(self)
            for url in generator.urls do
                SearchFetcherJob.new.async.perform(url, self.id)
            end
        end
    end

    def mark_failed!(detail = '')
        self.failures += 1
        self.failure_detail = detail
        self.save
    end

    def failed?
        failures >= 3
    end
end
