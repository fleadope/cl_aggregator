Fabricator(:search_result) do
  pid    "1234"
  date   Date.now
  href   "/test/abcd.html"
  text   "Cool new item"
  search nil
end
