class ChangeActionsController < ActionController::API

  def index
    @change_actions = ChangeAction.where(organisation_id: params[:organisation_id]).each {|ca|
      ca.external_link ||= "#/change_actions/#{ca.id}"
    }
    render json: @change_actions
  end

  def show
    @change_action = ChangeAction.find(params[:id])
    render json: @change_action
  end

end