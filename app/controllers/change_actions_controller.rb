class ChangeActionsController < ActionController::API

  def index
    render json: ChangeAction.where(organisation_id: params[:organisation_id])
  end

  def show
    @change_action = ChangeAction.find(params[:id])
    render json: @change_action
  end

end