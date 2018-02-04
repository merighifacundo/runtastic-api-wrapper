class RecordsController < ApplicationController
  # GET /records
  def index
    @records = Record.all

    render json: @records
  end

end
