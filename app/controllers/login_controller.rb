class LoginController < ApplicationController
  # GET /
  def create
    loginInformation = LoginService.new().login(params[:username], params[:password])
    begin
      @user = User.find_by(email:loginInformation[:email])
      @user[:password] = loginInformation[:password]
      @user[:runtastic_id] = loginInformation[:user]['id']
    rescue Mongoid::Errors::DocumentNotFound
      @user = UserFactory.build(userInformation)
    end

    ApplicationJob.perform_in(5, "loadinformation")
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
