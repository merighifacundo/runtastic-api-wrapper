class ActivitiesController < ApplicationController
  # GET /activities
  def index
    @logs = ActivityLog.where(user_id: @current_user[:id])
    render json: @logs
  end



  # GET /activities/1
  def show
    if ("latest".eql? params[:id])
      @activity_log = ActivityLog.order_by(:date => 'desc').first
    else
      @activity_log = ActivityLog.find(params[:id])
    end

    render json: @activity_log
  end




end
