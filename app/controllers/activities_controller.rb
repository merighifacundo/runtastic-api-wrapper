class ActivitiesController< ApplicationController
  # GET /records
  def index
    @logs = ActivityLog.all

    render json: @logs
  end

end
