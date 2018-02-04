class LoginController < ApplicationController
  # GET /
  def create
    begin
      loginInformation = LoginService.new().login(params[:username], params[:password])
    rescue RestClient::Unauthorized
      return render json: {}, status: :unauthorized
    end
    @user = UserFactory.build_or_retrieve(loginInformation)
    ApplicationJob.perform_in(5, "loadinformation")
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
