class LoginController < ApplicationController
  # GET /
  def index
    loginInformation = LoginService.new().login('merighifacundo@gmail.com', 'Facux2831')
    begin
      @user = User.find_by(email: "merighifacundo@gmail.com")
      puts "Not inserting"
    rescue Mongoid::Errors::DocumentNotFound
      @user = User.new({name: loginInformation[:user]['first_name'] + " " + loginInformation[:user]['last_name'], age: loginInformation[:user]['age'], email: loginInformation[:user]['email'], password: loginInformation[:password]})
      puts "Inserting"
    end
    @user[:password] = loginInformation[:password]
    @user[:runtastic_id] = loginInformation[:user]['id']


    ApplicationJob.perform_in(10, "loadinformation")
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
