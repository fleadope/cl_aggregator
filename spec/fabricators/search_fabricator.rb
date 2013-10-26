Fabricator(:search) do
  terms     "term"
  min_price 1
  max_price 100
  categories(count: 1) { Fabricate(:category, searches: []) }
  locations(count: 1) { Fabricate(:cl_location, searches: []) }
end

