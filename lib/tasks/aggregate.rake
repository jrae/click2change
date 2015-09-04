require 'highline/import'
require "#{Rails.root}/lib/data/petition_aggregator"

namespace :db do
  desc 'find petitions from emails'
  task :aggregate_petition_data => :environment do

    # email_addresss = ask("Enter email of account:")
    # password = ask("Enter password of account:")

    email_addresss = ENV['CLICK_2_CHANGE_EMAIL']
    password = ENV['CLICK_2_CHANGE_PASSWORD']

    # Gmail.connect!(email_addresss, password) do |account|
    #   # gmail.mailbox('[Gmail]/All Mail') ?? possibly
    #   %w(@sumofus.org @change.org @38degrees.org.uk @stopwar.org.uk @greenpeace.org.uk).each do |from|
    #     account.inbox.find(:from => from).each do |email|
    #       PetitionAggregator.new.create_raw_email_from(email)
    #     end
    #   end
    # end

    Gmail.connect!(email_addresss, password) do |account|
      # gmail.mailbox('[Gmail]/All Mail') ?? possibly
      %w(@sumofus.org @change.org @38degrees.org.uk @stopwar.org.uk @greenpeace.org.uk @australia.care2.com @avaaz.org @350.org ).each do |from|
        # email = account.inbox.find(:from => from).first
        account.inbox.find(:from => from).each do |email|
          PetitionAggregator.new.create_raw_email_from(email)
        end
      end
    end
  end
end