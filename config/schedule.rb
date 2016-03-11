set :output, {standard: nil}

every :day, :at => '9am' do
  rake "db:daily_scrape_gov_petitions"
  rake "db:daily_aggregate_petition_data"
end