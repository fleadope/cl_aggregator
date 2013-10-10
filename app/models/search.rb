class Search < ActiveRecord::Base
  has_one :category
  has_many :results, class_name: "SearchResult"
end
