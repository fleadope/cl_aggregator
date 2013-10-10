class SearchResult < ActiveRecord::Base
  belongs_to :search
  belongs_to :location, class_name: "ClLocation"
  validates_uniqueness_of :pid
end
