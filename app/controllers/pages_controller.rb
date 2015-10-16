class PagesController < ApplicationController
  def welcome
    @emails_filter = EmailsFilter.new(emails_filter_params)
    @emails = @emails_filter.results
  end

  def emails_filter_params
    return {} unless params[:emails_filter]
    params.require(:emails_filter).permit(:petitions_filter, organisations: [])
  end
end