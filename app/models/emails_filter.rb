class EmailsFilter

  attr_reader :emails

  def initialize(filter_params)
    debugger
    @organisation_id = filter_params[:organisation_id]
    @emails = RawEmail.petitions
  end

  def results
    filter_by_organisation
    @emails
  end

  def filter_by_organisation
    return if @organisation_id.blank?
    @emails = @emails.where(organisation_id: @organisation_id).uniq
  end

end