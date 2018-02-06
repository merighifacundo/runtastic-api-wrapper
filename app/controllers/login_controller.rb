class LoginController < ApplicationController
  skip_before_action :authenticate_request

  # GET /
  def create
    begin
      loginInformation = LoginService.new().login(params[:username], params[:password])
    rescue RestClient::Unauthorized
      return render json: {}, status: :unauthorized
    end
    @user = UserHelper.build_or_retrieve(loginInformation)
    token = JasonWebTokenModule::encode(user_id: @user.id.to_s)
    ApplicationJob.perform_in(5, "loadinformation")
    if @user.save
      render json: {user: @user ,token: token}, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
