Fabricator(:category) do
  name         "sacramento"
  searches(count: 1) { Fabricate.build(:search, categories: []) }
end
