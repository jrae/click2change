class EmailsController < ApplicationController

  def show
    @email = RawEmail.find(params[:id])
  end
end