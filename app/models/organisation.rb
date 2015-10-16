class Organisation < ActiveRecord::Base
  has_many :raw_emails
end
