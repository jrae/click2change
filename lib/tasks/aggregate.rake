require 'httparty'
require "#{Rails.root}/lib/data/change_action_aggregator"

@organisations = {
      "Sum of Us" => '@sumofus.org',
      "Change.org" => '@change.org',
      "38 degrees" => '@38degrees.org.uk',
      "Stop the war" => '@stopwar.org.uk',
      "Greenpeace" => '@greenpeace.org.uk',
      "Care2 petitions" => '@australia.care2.com',
      "Avaaz" => '@avaaz.org',
      "350" => '@350.org',
      "Peta UK" => '@peta.org.uk',
      "Humane Society International" => '@hsi.org'
}

namespace :db do

  desc 'find petitions from emails'
  task :daily_aggregate_petition_data => :environment do

    # email_addresss = ask("Enter email of account:")
    # password = ask("Enter password of account:")

    email_addresss = ENV['CLICK_2_CHANGE_EMAIL']
    password = ENV['CLICK_2_CHANGE_PASSWORD']

    aggregator = ChangeActionAggregator.new

    Gmail.connect!(email_addresss, password) do |account|
      @organisations.each do |key, value|
        org = Organisation.find_or_create_by(name: key)
        # email = account.inbox.find(:from => from).first
        account.inbox.find(:from => value, :after => (Time.now - 1.day)).each do |email|
          aggregator.create_change_action_from(email, org)
        end
      end
    end
  end

  desc 'find petitions from emails'
  task :aggregate_petition_data => :environment do

    # email_addresss = ask("Enter email of account:")
    # password = ask("Enter password of account:")

    email_addresss = ENV['CLICK_2_CHANGE_EMAIL']
    password = ENV['CLICK_2_CHANGE_PASSWORD']

    aggregator = ChangeActionAggregator.new

    Gmail.connect!(email_addresss, password) do |account|
      @organisations.each do |key, value|
        org = Organisation.find_or_create_by(name: key)
        # email = account.inbox.find(:from => from).first
        account.inbox.find(:from => value, :after => Date.parse("2014-11-23")).each do |email|
          aggregator.create_change_action_from(email, org)
        end
      end
    end
  end

  desc 'find petitions from emails'
  task :daily_scrape_gov_petitions => :environment do
    org = Organisation.find_or_create_by(name: "UK Government and Parliment Petitions")
    url  = "https://petition.parliament.uk/petitions.json?state=open"
    response = HTTParty.get(url)
    data = response.parsed_response['data']
    data.each do |petition|
      ChangeAction.find_or_create_by(external_id: petition['id'].to_s, title:  petition['attributes']['action']).tap do |change_action|
        change_action.external_link =  petition['links']['self'].gsub('.json', '')
        change_action.organisation_id =  org.id
        change_action.start_date = petition['attributes']['open_at']
        #change_action.details =  petition['attributes']['background']
      end.save
    end
  end

  desc 'find petitions from emails'
  task :scrape_all_gov_petitions => :environment do
    aggregator = ChangeActionAggregator.new
    org = Organisation.find_or_create_by(name: "UK Government and Parliment Petitions")
    url  = "https://petition.parliament.uk/petitions.json?state=open"
    response = HTTParty.get(url)
    data = response.parsed_response['data']
    aggregator.petitions_from(data, org)
    while next_page = response.parsed_response['links']['next']
      puts next_page
      response = HTTParty.get(next_page)
      data = response.parsed_response['data']
      aggregator.petitions_from(data, org)
    end
  end
end

