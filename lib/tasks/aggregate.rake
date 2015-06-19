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
      # gmail.mailbox('[Gmail]/All Mail') ?? possibly
      %w(us@sumofus.org no-reply@change.org action@38degrees.org.uk office@stopwar.org.uk).each do |from|
        account.inbox.find(:from => from).each do |email|
          PetitionAggregator.new.create_raw_email_from(email)
        end
      end
    end
  end
end