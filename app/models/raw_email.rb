class RawEmail < ActiveRecord::Base

  belongs_to :organisation

  validates_uniqueness_of :gmail_message_id

  scope :petitions, -> { where("body like '%Sign%'") }
end