class EmailsFilter

  attr_reader :organisations, :petitions_filter, :emails

  def initialize(filter_params)
    @organisations = (filter_params[:organisations] || []).delete_if(&:blank?)
    @emails = RawEmail.petitions
  end

  def results
    filter_by_organisation
    @emails
  end

  def filter_by_organisation
    return if organisations.empty?
    @emails = @emails.where(organisation_id: organisations).uniq
  end

end