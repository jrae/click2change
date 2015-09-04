class RawEmail < ActiveRecord::Base

  validates_uniqueness_of :gmail_message_id

  scope :petitions, -> { where("body like '%Sign%'") }
end