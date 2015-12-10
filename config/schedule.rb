set :output, {standard: nil}

every :day, :at => '9am' do
  rake "db:scrape_gov_petitions"
end