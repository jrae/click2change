class EmailsController < ActionController::API

  def show
    @email = RawEmail.find(params[:id])
    render json: @email
  end

  def index
    @emails_filter = EmailsFilter.new(emails_filter_params)
    @emails = @emails_filter.results
    render json: @emails
  end

  def emails_filter_params
    return {} unless params[:emails_filter]
    params.require(:emails_filter).permit(:petitions_filter, organisations: [])
  end

end