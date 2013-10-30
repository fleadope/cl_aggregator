class ClLocation < ActiveRecord::Base
    has_and_belongs_to_many :searches

    def domain
        "#{self.name}.craigslist.org"
    end
end
