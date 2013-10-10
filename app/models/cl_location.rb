class ClLocation < ActiveRecord::Base
    def domain
        "#{self.name}.craigslist.org"
    end
end
