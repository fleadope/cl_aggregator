Fabricator(:search) do
  terms     "term 1"
  min_price 1
  max_price 100
  categories(:count => 1) 
  # locations(count: 1)
end
