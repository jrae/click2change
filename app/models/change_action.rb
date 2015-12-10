class ChangeAction < ActiveRecord::Base

  belongs_to :organisation

  validates_uniqueness_of :external_id

end