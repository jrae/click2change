class OrganisationsController < ActionController::API

  def index
    render json: Organisation.all
  end

  def show
    render json: Organisation.find(params[:id])
  end

end