Fabricator(:search_result) do
  pid    "1234"
  date   Time.now.to_date
  href   "/test/abcd.html"
  text   "Cool new item"
  search nil
end
