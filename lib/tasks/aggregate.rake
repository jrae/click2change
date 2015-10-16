require 'highline/import'
require "#{Rails.root}/lib/data/petition_aggregator"

namespace :db do
  desc 'find petitions from emails'
  task :aggregate_petition_data => :environment do

    # email_addresss = ask("Enter email of account:")
    # password = ask("Enter password of account:")

    email_addresss = ENV['CLICK_2_CHANGE_EMAIL']
    password = ENV['CLICK_2_CHANGE_PASSWORD']


    Gmail.connect!(email_addresss, password) do |account|
      {
        "Sum of Us" => '@sumofus.org',
        "Change.org" => '@change.org',
        "38 degrees" => '@38degrees.org.uk',
        "Stop the war" => '@stopwar.org.uk',
        "Greenpeace" => '@greenpeace.org.uk',
        "Care2 petitions" => '@australia.care2.com',
        "Avaaz" => '@avaaz.org',
        "350" => '@350.org'
      }.each do |key, value|
        org = Organisation.find_or_create_by(name: key)
        # email = account.inbox.find(:from => from).first
        account.inbox.find(:from => value).each do |email|
          PetitionAggregator.new.create_raw_email_from(email, org)
        end
      end
    end
  end
end