class EmailsController < ActionController::API

  def show
    @email = RawEmail.find(params[:id])
    render json: @email
  end

  def index
    render json: RawEmail.where(organisation_id: params[:organisation_id])
  end

end