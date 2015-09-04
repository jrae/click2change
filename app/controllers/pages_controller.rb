class PagesController < ApplicationController
  def welcome
    if emails_filter_params[:petitions_filter] == 'yes'
      @emails = RawEmail.petitions
    else
      @emails = RawEmail.all
    end
  end

  def emails_filter_params
    return {} unless params[:emails_filter]
    params.require(:emails_filter).permit(:organisations, :petitions_filter)
  end
end