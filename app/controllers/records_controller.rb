class RecordsController < ApplicationController
  # GET /records
  def index
    @records = Record.where(user_id: @current_user[:id])

    render json: @records
  end

end
