class ActivitiesController < ApplicationController
  # GET /activities
  def index
    @logs = ActivityLog.all

    render json: @logs
  end

  # GET /activities/1
  def show
    @activity_log = ActivityLog.find(params[:id])
    render json: @activity_log
  end


end
