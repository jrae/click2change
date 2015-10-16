class EmailsFilter

  attr_reader :organisations, :petitions_filter

  def initialize(filter_params)
    @organisations = (filter_params[:organisations] || []).delete_if(&:blank?)
    @results = RawEmail.petitions
  end

  def results
    filter_by_organisation
    @results
  end

  def filter_by_organisation
    return if organisations.empty?
    @results = @results.where(organisation_id: organisations).uniq
  end

end